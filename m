Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4382FF20E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 18:36:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM8h74LL1zDrSg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 04:36:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=ei/uUMtO; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DM8Xz3Sh7zDr55
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 04:30:10 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id AB70B20B7192;
 Thu, 21 Jan 2021 09:30:08 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AB70B20B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1611250208;
 bh=YiTmzmg5J73novUtm6vEd4VPk53XO64N4ccc6961PuA=;
 h=From:To:Cc:Subject:Date:From;
 b=ei/uUMtO1yzKPHNhK4bGp7mmR5GayhbwKrS3EaQbHeXn60i6nEtntPd7qCfgf2cdf
 pgwGNK3FoG1agO97qcOj4fU3AF9pbBG0E5h2BxOmGKSa9UVTaO22SVQv8T4uCfmWo5
 rR2i6wJylWw54R2/jOZYCiHov1HvoIsBhM8ymxEU=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, dmitry.kasatkin@gmail.com,
 ebiederm@xmission.com, gregkh@linuxfoundation.org, sashal@kernel.org,
 tyhicks@linux.microsoft.com
Subject: [PATCH 1/2] ima: Free IMA measurement buffer on error
Date: Thu, 21 Jan 2021 09:30:02 -0800
Message-Id: <20210121173003.18324-1-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

IMA allocates kernel virtual memory to carry forward the measurement
list, from the current kernel to the next kernel on kexec system call,
in ima_add_kexec_buffer() function.  In error code paths this memory
is not freed resulting in memory leak.

Free the memory allocated for the IMA measurement list in
the error code paths in ima_add_kexec_buffer() function.

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Tyler Hicks <tyhicks@linux.microsoft.com>
Fixes: 7b8589cc29e7 ("ima: on soft reboot, save the measurement list")
---
 security/integrity/ima/ima_kexec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/integrity/ima/ima_kexec.c b/security/integrity/ima/ima_kexec.c
index 121de3e04af2..212145008a01 100644
--- a/security/integrity/ima/ima_kexec.c
+++ b/security/integrity/ima/ima_kexec.c
@@ -119,12 +119,14 @@ void ima_add_kexec_buffer(struct kimage *image)
 	ret = kexec_add_buffer(&kbuf);
 	if (ret) {
 		pr_err("Error passing over kexec measurement buffer.\n");
+		vfree(kexec_buffer);
 		return;
 	}
 
 	ret = arch_ima_add_kexec_buffer(image, kbuf.mem, kexec_segment_size);
 	if (ret) {
 		pr_err("Error passing over kexec measurement buffer.\n");
+		vfree(kexec_buffer);
 		return;
 	}
 
-- 
2.30.0

