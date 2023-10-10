Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A447C414A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 22:33:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u3BP37hg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4nfr2q32z2ygX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 07:33:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u3BP37hg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4ndz4s5Bz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 07:32:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1701DCE20F4;
	Tue, 10 Oct 2023 20:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A8AC433C7;
	Tue, 10 Oct 2023 20:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696969971;
	bh=hq+lAC9aHGR9lwOmWbeBkHbds2JgCNJWhr+zVJ8l2Uw=;
	h=From:Date:Subject:To:Cc:From;
	b=u3BP37hgP/SnJDK5AnP14YulTGVK8usLMuN/mWe5jiJWNpA84BZVXG177VX/ArJD9
	 BlC7MdeLI5Jm555PinRzZpItd3/M6XZ9LzNYOmoqGGV/Yh9DYX/V8nC+pzdn54u3pK
	 25KGz7az//HjOr+An9sl5w/wBiKkz6y1E8EAjYcsUVg9cYE0musDBr5/dBPIlICfTQ
	 b5M+TTOSgHy55npJT6IjtS+HGfBIS7GH0Wr1Y4hkDICi5/Fkt2idTMdQJj0YN8FCa3
	 38aYYa8IDRbi0wnQTt4ezKCLaf4IlfZgqhu0oFbZ3rf0KBVwqzYTYmV+BnVvzUZH79
	 57QBRha6dRr4g==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 10 Oct 2023 13:32:37 -0700
Subject: [PATCH] scsi: ibmvfc: Use 'unsigned int' for single-bit bitfields
 in 'struct ibmvfc_host'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231010-ibmvfc-fix-bitfields-type-v1-1-37e95b5a60e5@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOS0JWUC/x2MWwqAIBAArxL73YJWJHWV6ENtrYVeaEQh3j3pc
 2BmIgTyTAH6IoKnmwMfewZZFmAXvc+EPGWGSlS1FFIgm+12Fh0/aPhyTOsU8HpPwk5JLZRtG7I
 t5P70lK3/PYwpfWHBbSRrAAAA
To: tyreld@linux.ibm.com, martin.petersen@oracle.com
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012; i=nathan@kernel.org;
 h=from:subject:message-id; bh=hq+lAC9aHGR9lwOmWbeBkHbds2JgCNJWhr+zVJ8l2Uw=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDKmqWz6ZpPaX7+8KSv70iDvklOHB9wmO1lGmTe87p4THr
 N+/aeK7jlIWBjEOBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRiwsYGc5crNG58fq0+xPF
 AyynVrAvEnRYtCg6S0Hn1sdS4aqJ//4xMvzrFDP/b2ankzzhhaK0VY9cwtU7Cw3MY1aF6PJX7Oq
 u4QAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: linux-scsi@vger.kernel.org, trix@redhat.com, jejb@linux.ibm.com, llvm@lists.linux.dev, ndesaulniers@google.com, patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang warns (or errors with CONFIG_WERROR=y) several times along the
lines of:

  drivers/scsi/ibmvscsi/ibmvfc.c:650:17: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    650 |                 vhost->reinit = 1;
        |                               ^ ~

A single-bit signed integer bitfield only has possible values of -1 and
0, not 0 and 1 like an unsigned one would. No context appears to check
the actual value of these bitfields, just whether or not it is zero.
However, it is easy enough to change the type of the fields to 'unsigned
int', which keeps the same size in memory and resolves the warning.

Fixes: 5144905884e2 ("scsi: ibmvfc: Use a bitfield for boolean flags")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/scsi/ibmvscsi/ibmvfc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 331ecf8254be..745ad5ac7251 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -892,15 +892,15 @@ struct ibmvfc_host {
 	int init_retries;
 	int discovery_threads;
 	int abort_threads;
-	int client_migrated:1;
-	int reinit:1;
-	int delay_init:1;
-	int logged_in:1;
-	int mq_enabled:1;
-	int using_channels:1;
-	int do_enquiry:1;
-	int aborting_passthru:1;
-	int scan_complete:1;
+	unsigned int client_migrated:1;
+	unsigned int reinit:1;
+	unsigned int delay_init:1;
+	unsigned int logged_in:1;
+	unsigned int mq_enabled:1;
+	unsigned int using_channels:1;
+	unsigned int do_enquiry:1;
+	unsigned int aborting_passthru:1;
+	unsigned int scan_complete:1;
 	int scan_timeout;
 	int events_to_log;
 #define IBMVFC_AE_LINKUP	0x0001

---
base-commit: b6f2e063017b92491976a40c32a0e4b3c13e7d2f
change-id: 20231010-ibmvfc-fix-bitfields-type-971a07c64ec6

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

