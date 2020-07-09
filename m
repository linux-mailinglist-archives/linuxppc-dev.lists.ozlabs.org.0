Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD3A21AA4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 00:09:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2r251Ps3zDqHK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 08:09:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bmeneg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=LWSfhdjn; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=LWSfhdjn; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2hst0mHfzDqCD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 02:47:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594313226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UspVOw6XAGLtilKBpYwpbaqQeMaCCmM2aVuZ489RO+o=;
 b=LWSfhdjnKyWaxIDXzJHe5txJCczeUZlpJu4HSOt/ZveqCkI6SrkOLSLd79i17J5PQ+8+SH
 3adPyEvlaCGMhNCu3de9dA8LZhKiUVerkYGwEEAxwQpP8IKHxnLMreAO3vILouoiaWCk1u
 lKbAiKyr/b1ne9H5sz8FU/mtSc2H3Zs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594313226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UspVOw6XAGLtilKBpYwpbaqQeMaCCmM2aVuZ489RO+o=;
 b=LWSfhdjnKyWaxIDXzJHe5txJCczeUZlpJu4HSOt/ZveqCkI6SrkOLSLd79i17J5PQ+8+SH
 3adPyEvlaCGMhNCu3de9dA8LZhKiUVerkYGwEEAxwQpP8IKHxnLMreAO3vILouoiaWCk1u
 lKbAiKyr/b1ne9H5sz8FU/mtSc2H3Zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-oDlM1zC6Nci7D7IE62glIQ-1; Thu, 09 Jul 2020 12:46:55 -0400
X-MC-Unique: oDlM1zC6Nci7D7IE62glIQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C8D5E918;
 Thu,  9 Jul 2020 16:46:53 +0000 (UTC)
Received: from localhost (ovpn-116-137.gru2.redhat.com [10.97.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B7085BAEA;
 Thu,  9 Jul 2020 16:46:50 +0000 (UTC)
From: Bruno Meneguele <bmeneg@redhat.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v5] ima: move APPRAISE_BOOTPARAM dependency on ARCH_POLICY to
 runtime
Date: Thu,  9 Jul 2020 13:46:47 -0300
Message-Id: <20200709164647.45153-1-bmeneg@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:07:42 +1000
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
Cc: erichte@linux.ibm.com, Bruno Meneguele <bmeneg@redhat.com>,
 nayna@linux.ibm.com, stable@vger.kernel.org, zohar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

APPRAISE_BOOTPARAM has been marked as dependent on !ARCH_POLICY in compile
time, enforcing the appraisal whenever the kernel had the arch policy option
enabled.

However it breaks systems where the option is set but the system didn't
boot in a "secure boot" platform. In this scenario, anytime an appraisal
policy (i.e. ima_policy=appraisal_tcb) is used it will be forced, without
giving the user the opportunity to label the filesystem, before enforcing
integrity.

Considering the ARCH_POLICY is only effective when secure boot is actually
enabled this patch remove the compile time dependency and move it to a
runtime decision, based on the secure boot state of that platform.

With this patch:

- x86-64 with secure boot enabled

[    0.004305] Secure boot enabled
...
[    0.015651] Kernel command line: <...> ima_policy=appraise_tcb ima_appraise=fix
[    0.015682] ima: appraise boot param ignored: secure boot enabled

- powerpc with secure boot disabled

[    0.000000] Kernel command line: <...> ima_policy=appraise_tcb ima_appraise=fix
[    0.000000] Secure boot mode disabled
...
< nothing about boot param ignored >

System working fine without secure boot and with both options set:

CONFIG_IMA_APPRAISE_BOOTPARAM=y
CONFIG_IMA_ARCH_POLICY=y

Audit logs pointing to "missing-hash" but still being able to execute due to
ima_appraise=fix:

type=INTEGRITY_DATA msg=audit(07/09/2020 12:30:27.778:1691) : pid=4976
uid=root auid=root ses=2
subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 op=appraise_data
cause=missing-hash comm=bash name=/usr/bin/evmctl dev="dm-0" ino=493150
res=no

Cc: stable@vger.kernel.org
Fixes: d958083a8f64 ("x86/ima: define arch_get_ima_policy() for x86")
Signed-off-by: Bruno Meneguele <bmeneg@redhat.com>
---
Changelog:
v5:
  - add pr_info() to inform user the ima_appraise= boot param is being
	ignored due to secure boot enabled (Nayna)
  - add some testing results to commit log
v4:
  - instead of change arch_policy loading code, check secure boot state at
	"ima_appraise=" parameter handler (Mimi)
v3:
  - extend secure boot arch checker to also consider trusted boot
  - enforce IMA appraisal when secure boot is effectively enabled (Nayna)
  - fix ima_appraise flag assignment by or'ing it (Mimi)
v2:
  - pr_info() message prefix correction

 security/integrity/ima/Kconfig        | 2 +-
 security/integrity/ima/ima_appraise.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
index edde88dbe576..62dc11a5af01 100644
--- a/security/integrity/ima/Kconfig
+++ b/security/integrity/ima/Kconfig
@@ -232,7 +232,7 @@ config IMA_APPRAISE_REQUIRE_POLICY_SIGS
 
 config IMA_APPRAISE_BOOTPARAM
 	bool "ima_appraise boot parameter"
-	depends on IMA_APPRAISE && !IMA_ARCH_POLICY
+	depends on IMA_APPRAISE
 	default y
 	help
 	  This option enables the different "ima_appraise=" modes
diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index a9649b04b9f1..884de471b38a 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -19,6 +19,11 @@
 static int __init default_appraise_setup(char *str)
 {
 #ifdef CONFIG_IMA_APPRAISE_BOOTPARAM
+	if (arch_ima_get_secureboot()) {
+		pr_info("appraise boot param ignored: secure boot enabled");
+		return 1;
+	}
+
 	if (strncmp(str, "off", 3) == 0)
 		ima_appraise = 0;
 	else if (strncmp(str, "log", 3) == 0)
-- 
2.26.2

