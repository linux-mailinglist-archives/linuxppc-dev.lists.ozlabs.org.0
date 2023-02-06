Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 391E268C65D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 20:02:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9bGz053mz3fVp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 06:02:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MfpVM3Nr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MfpVM3Nr;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9b5y3sVkz3cHF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 05:54:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7209EB815D1;
	Mon,  6 Feb 2023 18:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2503BC433D2;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675709665;
	bh=UQjctR6kXdByIcypvhbUMOS/4kr/migmys1Em3Evst8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MfpVM3NrjsNzPtP3F9etnSioqVapx6/xd7/Ke8rToZUyr6vh85MoFNJTppzZmLWkG
	 f//DF85aqnFGex27fY987BBJqKNoScFg65sIM23JjsuSEjOG5NE1e95FinkbQrGyeH
	 YcfG9zNpRIquJsOlSIeYg9C39l98O5hF0OQhCKkKl+r8aYK8E6BD+tRTD7sGKQa0WO
	 M1lZz06PVGbumZKD117YHnjf2JwRgDc2OS5YzUFDGv0/b3bcUNsl4kO0PKwjxxk0Li
	 bgt+LmvMVbGqUrVfA7CWWsGocDyTXp5sKA099KmpUxqZQlm7Gt/u48S15+zrCNwTcn
	 fU2sFaX9Rabrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07301C05027;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Feb 2023 12:54:17 -0600
Subject: [PATCH v2 01/19] powerpc/rtas: handle extended delays safely in
 early boot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v2-1-9aa6bd058063@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675709663; l=3779;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=pLkh3/obNWVA07fMBbNuF95oFvgPYtA8yiTJ8EjahUk=;
 b=s+khifzqEVF1RwfURHFHOqye8hBqeNSzTN5qy++G9PFN1j17oMOQlNhAkHMtp6F5KrgqUJPdl
 wgOaYZOOwMLDzuvlIOMLOLBddAFzLSLzxdzSfkUF8GW7VNPCJSgtXnB
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Submission Endpoint for nathanl@linux.ibm.com/20230206 with auth_id=27
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Some code that runs early in boot calls RTAS functions that can return
-2 or 990x statuses, which mean the caller should retry. An example is
pSeries_cmo_feature_init(), which invokes ibm,get-system-parameter but
treats these benign statuses as errors instead of retrying.

pSeries_cmo_feature_init() and similar code should be made to retry
until they succeed or receive a real error, using the usual pattern:

	do {
		rc = rtas_call(token, etc...);
	} while (rtas_busy_delay(rc));

But rtas_busy_delay() will perform a timed sleep on any 990x
status. This isn't safe so early in boot, before the CPU scheduler and
timer subsystem have initialized.

The -2 RTAS status is much more likely to occur during single-threaded
boot than 990x in practice, at least on PowerVM. This is because -2
usually means that RTAS made progress but exhausted its self-imposed
timeslice, while 990x is associated with concurrent requests from the
OS causing internal contention. Regardless, according to the language
in PAPR, the OS should be prepared to handle either type of status at
any time.

Add a fallback path to rtas_busy_delay() to handle this as safely as
possible, performing a small delay on 990x. Include a counter to
detect retry loops that aren't making progress and bail out.

This was found by inspection and I'm not aware of any real
failures. However, the implementation of rtas_busy_delay() before
commit 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
was not susceptible to this problem, so let's treat this as a
regression.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
---
 arch/powerpc/kernel/rtas.c | 48 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 795225d7f138..ec2df09a70cf 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -606,6 +606,46 @@ unsigned int rtas_busy_delay_time(int status)
 	return ms;
 }
 
+/*
+ * Early boot fallback for rtas_busy_delay().
+ */
+static bool __init rtas_busy_delay_early(int status)
+{
+	static size_t successive_ext_delays __initdata;
+	bool ret;
+
+	switch (status) {
+	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
+		/*
+		 * In the unlikely case that we receive an extended
+		 * delay status in early boot, the OS is probably not
+		 * the cause, and there's nothing we can do to clear
+		 * the condition. Best we can do is delay for a bit
+		 * and hope it's transient. Lie to the caller if it
+		 * seems like we're stuck in a retry loop.
+		 */
+		mdelay(1);
+		ret = true;
+		successive_ext_delays += 1;
+		if (successive_ext_delays > 1000) {
+			pr_err("too many extended delays, giving up\n");
+			dump_stack();
+			ret = false;
+		}
+		break;
+	case RTAS_BUSY:
+		ret = true;
+		successive_ext_delays = 0;
+		break;
+	default:
+		ret = false;
+		successive_ext_delays = 0;
+		break;
+	}
+
+	return ret;
+}
+
 /**
  * rtas_busy_delay() - helper for RTAS busy and extended delay statuses
  *
@@ -624,11 +664,17 @@ unsigned int rtas_busy_delay_time(int status)
  * * false - @status is not @RTAS_BUSY nor an extended delay hint. The
  *           caller is responsible for handling @status.
  */
-bool rtas_busy_delay(int status)
+bool __ref rtas_busy_delay(int status)
 {
 	unsigned int ms;
 	bool ret;
 
+	/*
+	 * Can't do timed sleeps before timekeeping is up.
+	 */
+	if (system_state < SYSTEM_SCHEDULING)
+		return rtas_busy_delay_early(status);
+
 	switch (status) {
 	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
 		ret = true;

-- 
2.39.1

