Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FDE15F14F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 19:03:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K1T54bkFzDq5b
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 05:03:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=d3RsoiO1; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jyyk6y3vzDqRF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 03:10:22 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D7092468C;
 Fri, 14 Feb 2020 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696620;
 bh=PNI4J4LnI5EeNudriscWBtbKyV+GK1O1DWXIYeyYIG4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d3RsoiO1odi/4ciPuWPSQjJdTlvjAhcfPcepIKrUrdG7DtKIEZDKjCLsc2+W0YtYr
 Wnp3SH6PC5fHI5mY81beOfmAiFRm0iGCHAV3omk9gFbB2nOBs5IB0daAuvO1ZX3WNn
 bbjD55PivlvG7sneDl0KOUEEdUECpLhVgRpNlTYo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 401/459] selftests/eeh: Bump EEH wait time to 60s
Date: Fri, 14 Feb 2020 11:00:51 -0500
Message-Id: <20200214160149.11681-401-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Steve Best <sbest@redhat.com>,
 Oliver O'Halloran <oohall@gmail.com>, Douglas Miller <dougmill@us.ibm.com>,
 linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Oliver O'Halloran <oohall@gmail.com>

[ Upstream commit 414f50434aa2463202a5b35e844f4125dd1a7101 ]

Some newer cards supported by aacraid can take up to 40s to recover
after an EEH event. This causes spurious failures in the basic EEH
self-test since the current maximim timeout is only 30s.

Fix the immediate issue by bumping the timeout to a default of 60s,
and allow the wait time to be specified via an environmental variable
(EEH_MAX_WAIT).

Reported-by: Steve Best <sbest@redhat.com>
Suggested-by: Douglas Miller <dougmill@us.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200122031125.25991-1-oohall@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/powerpc/eeh/eeh-functions.sh | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
index 26112ab5cdf42..f52ed92b53e74 100755
--- a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
+++ b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
@@ -53,9 +53,13 @@ eeh_one_dev() {
 	# is a no-op.
 	echo $dev >/sys/kernel/debug/powerpc/eeh_dev_check
 
-	# Enforce a 30s timeout for recovery. Even the IPR, which is infamously
-	# slow to reset, should recover within 30s.
-	max_wait=30
+	# Default to a 60s timeout when waiting for a device to recover. This
+	# is an arbitrary default which can be overridden by setting the
+	# EEH_MAX_WAIT environmental variable when required.
+
+	# The current record holder for longest recovery time is:
+	#  "Adaptec Series 8 12G SAS/PCIe 3" at 39 seconds
+	max_wait=${EEH_MAX_WAIT:=60}
 
 	for i in `seq 0 ${max_wait}` ; do
 		if pe_ok $dev ; then
-- 
2.20.1

