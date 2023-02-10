Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60969259C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:45:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD2jt3LGVz3fG9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:45:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RwnNYmcR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RwnNYmcR;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2dt72vgz3f33
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 05:42:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA53E61E8C;
	Fri, 10 Feb 2023 18:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC394C433EF;
	Fri, 10 Feb 2023 18:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676054527;
	bh=shJoairWVFLQKBQrEpRuKciszM9ydwkXlhw+wrA1zrI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RwnNYmcRrhWy9PpjYstBEskqG8tTniWgDvHx3zyJ/ODCvSPXrRUnNQ0ChDbEiVpe9
	 xpJG/JLDyLRYdB64/TcXi18wrAXaVWW5+MYLbTcGot0D95OGWo/RHtNTS1Irb4B1GI
	 9bietb/aBoUmBhb2jpP0hxrDaUu3tXX7YBkV9qBJIw2ngEY4FtdonxStgLoib0KPo6
	 jWeGeE7on+BbGKcmjTqELbJoUXHhrScbyZd5rjUxUgTU0JQ15b7eiUP90OQJRgrri7
	 3X598IGsdnG7dtCtLMX4XdZigO5BOvWoHFR0Uk+Y3iomV/C1FUZOgIxIre3S9IhQON
	 azw4seyADhopw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4D7C05027;
	Fri, 10 Feb 2023 18:42:07 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 10 Feb 2023 12:41:49 -0600
Subject: [PATCH v3 01/20] powerpc/rtas: handle extended delays safely in
 early boot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v3-1-26929c8cce78@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676054526; l=3909;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=9gDQs52Jdbl5Q8ejsQ3R7Z9dMEMYUiKd7ui9/VE7//I=;
 b=4S2h5WSevGb6QZFN5JCYlV07EtqsPcI8j3ob3sehGqrEpQB6qPks53jCumbafzU4M4jqZzb2s
 RRtakc0mDKsDuPk57izzXAi4eeXyQ1xof5nDb73tKF8b8QgDnj/J6ch
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
detect retry loops that aren't making progress and bail out. Add __ref
to rtas_busy_delay() since it now conditionally calls an __init
function.

This was found by inspection and I'm not aware of any real
failures. However, the implementation of rtas_busy_delay() before
commit 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
was not susceptible to this problem, so let's treat this as a
regression.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
---
 arch/powerpc/kernel/rtas.c | 49 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 795225d7f138..86aff1cb8a0d 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -606,6 +606,47 @@ unsigned int rtas_busy_delay_time(int status)
 	return ms;
 }
 
+/*
+ * Early boot fallback for rtas_busy_delay().
+ */
+static bool __init rtas_busy_delay_early(int status)
+{
+	static size_t successive_ext_delays __initdata;
+	bool retry;
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
+		retry = true;
+		successive_ext_delays += 1;
+		if (successive_ext_delays > 1000) {
+			pr_err("too many extended delays, giving up\n");
+			dump_stack();
+			retry = false;
+			successive_ext_delays = 0;
+		}
+		break;
+	case RTAS_BUSY:
+		retry = true;
+		successive_ext_delays = 0;
+		break;
+	default:
+		retry = false;
+		successive_ext_delays = 0;
+		break;
+	}
+
+	return retry;
+}
+
 /**
  * rtas_busy_delay() - helper for RTAS busy and extended delay statuses
  *
@@ -624,11 +665,17 @@ unsigned int rtas_busy_delay_time(int status)
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

