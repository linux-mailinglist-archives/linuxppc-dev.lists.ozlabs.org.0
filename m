Return-Path: <linuxppc-dev+bounces-10501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BCCB17E1C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 10:20:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btf5j65cfz3bkg;
	Fri,  1 Aug 2025 18:20:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754036425;
	cv=none; b=FVGeE4KMFtagh3Vl3qrGz7bvij4abWkDX211FNNQ5YgQwe3L2mpaPppVKid+eLqxqDiLFjGsC1/E7k24TGR0bT+I+xhk77FeK6pdlcQ7ZW4AqgFVS5zsOOsYvtTWstS6XP2mNY54TrR35H43GGu8fjgYNMsdooSmYe/RMG3800r2opb/QR6+nlO3QbRPMHDM47HnyTvNHRjMF3FU40nl+dovrfVJL9dATw7RKukr3ssttCkxtZtaOSwEuIy3BQgiim+2su4BzKnFkSfp1BTF+pZy3wgMv/gF7FRbhZRfxWDakpX4wgXasqZtdnqNkp0CzeZ06MlU879xVQ8Z2NbSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754036425; c=relaxed/relaxed;
	bh=gWQhtP12MeNr0dILWoc51TUT95//3bChXiCig9X7yoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRIpaGsqPxonDN3U6X1wxnnEJg/PE1789y+9lMX/JEVOBaIWWF5zE0kYeOdjQruEwGRZHnOTlF7T9q6CXhOZKNPYipdFbnbCXLS1KxM+zQya2VLWzHHrWWivnrIYE4YlZAdPGDV4vpAppwLztR55BDu+34wjqWXvn4q7OHOMiuJAHqDyIhy/rkGTuzH8cDcHD/F4ZZcBcnQTDwsnbxwLcW9A908NUWNrLt0evFLogBd/kca9dhREfc+Pfh4LPykYx6VKKbJq1BRracMEmngqppQD/xxUjgH4kLB97aeflAPTpADtx6fbYc02dfLMzqwHafkb8RWKdKxUgAH0mPC2TQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KQLhEs8W; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LIoyr0Cz; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KQLhEs8W;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LIoyr0Cz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btf5h53Wcz2ymc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 18:20:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754036420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWQhtP12MeNr0dILWoc51TUT95//3bChXiCig9X7yoU=;
	b=KQLhEs8WvXr00lQ0b+TxP2tI16/crASGfvnySjJEyvfB9PdMHhDemdaPUbE3h4eOrb2yC3
	ehumlPzQPImKs7/PLoNvZxbYyd3nT9I+5Z13vhXXWdbsonJl9asgbuVKhOjgJrhVdZCEGh
	EpLj4ykcm71GzAiqK7JcpAtHH10jClY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754036421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWQhtP12MeNr0dILWoc51TUT95//3bChXiCig9X7yoU=;
	b=LIoyr0CzrKtmsGu/Uwn8tf5HLkh/P80we/24VVDb83qVqio+nTAtJ36EDPg6mwuBN57rL5
	GWSWt3CvUxXt5XMV3J7ZGDfzmn3a5ok+He6TxD76X/F2nTWqds+78wyTPGkbNVZq7KNBXy
	YFGRqlXdPSEAfKdAov0y9zSUhDEkwD0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-445-L7fWMev8NVWa3QSMQ-0ZXA-1; Fri,
 01 Aug 2025 04:20:17 -0400
X-MC-Unique: L7fWMev8NVWa3QSMQ-0ZXA-1
X-Mimecast-MFC-AGG-ID: L7fWMev8NVWa3QSMQ-0ZXA_1754036416
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B4C841956089;
	Fri,  1 Aug 2025 08:20:15 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.225.137])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 419791800D8D;
	Fri,  1 Aug 2025 08:20:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Date: Fri,  1 Aug 2025 10:20:06 +0200
Message-ID: <20250801082007.32904-2-thuth@redhat.com>
In-Reply-To: <20250801082007.32904-1-thuth@redhat.com>
References: <20250801082007.32904-1-thuth@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thomas Huth <thuth@redhat.com>

__ASSEMBLY__ is only defined by the Makefile of the kernel, so
this is not really useful for uapi headers (unless the userspace
Makefile defines it, too). Let's switch to __ASSEMBLER__ which
gets set automatically by the compiler when compiling assembler
code.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/powerpc/include/uapi/asm/opal-prd.h |  4 ++--
 arch/powerpc/include/uapi/asm/ptrace.h   | 12 ++++++------
 arch/powerpc/include/uapi/asm/types.h    |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/opal-prd.h b/arch/powerpc/include/uapi/asm/opal-prd.h
index 1869cf83a870e..11abcf0192ca1 100644
--- a/arch/powerpc/include/uapi/asm/opal-prd.h
+++ b/arch/powerpc/include/uapi/asm/opal-prd.h
@@ -40,7 +40,7 @@
 #define OPAL_PRD_SCOM_READ		_IOR('o', 0x02, struct opal_prd_scom)
 #define OPAL_PRD_SCOM_WRITE		_IOW('o', 0x03, struct opal_prd_scom)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct opal_prd_info {
 	__u64	version;
@@ -54,6 +54,6 @@ struct opal_prd_scom {
 	__s64	rc;
 };
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _UAPI_ASM_POWERPC_OPAL_PRD_H */
diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
index 7004cfea3f5ff..01e630149d48e 100644
--- a/arch/powerpc/include/uapi/asm/ptrace.h
+++ b/arch/powerpc/include/uapi/asm/ptrace.h
@@ -27,7 +27,7 @@
 
 #include <linux/types.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #ifdef __KERNEL__
 struct user_pt_regs
@@ -57,7 +57,7 @@ struct pt_regs
 	unsigned long result;		/* Result of a system call */
 };
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 
 /*
@@ -200,7 +200,7 @@ struct pt_regs
 #define PPC_PTRACE_SETHWDEBUG	0x88
 #define PPC_PTRACE_DELHWDEBUG	0x87
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct ppc_debug_info {
 	__u32 version;			/* Only version 1 exists to date */
@@ -212,7 +212,7 @@ struct ppc_debug_info {
 	__u64 features;
 };
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /*
  * features will have bits indication whether there is support for:
@@ -224,7 +224,7 @@ struct ppc_debug_info {
 #define PPC_DEBUG_FEATURE_DATA_BP_DAWR		0x0000000000000010
 #define PPC_DEBUG_FEATURE_DATA_BP_ARCH_31	0x0000000000000020
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct ppc_hw_breakpoint {
 	__u32 version;		/* currently, version must be 1 */
@@ -236,7 +236,7 @@ struct ppc_hw_breakpoint {
 	__u64 condition_value;	/* contents of the DVC register */
 };
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /*
  * Trigger Type
diff --git a/arch/powerpc/include/uapi/asm/types.h b/arch/powerpc/include/uapi/asm/types.h
index 327616fb70e44..9dbf55e38ea58 100644
--- a/arch/powerpc/include/uapi/asm/types.h
+++ b/arch/powerpc/include/uapi/asm/types.h
@@ -28,14 +28,14 @@
 # include <asm-generic/int-ll64.h>
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 
 typedef struct {
 	__u32 u[4];
 } __attribute__((aligned(16))) __vector128;
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 
 #endif /* _UAPI_ASM_POWERPC_TYPES_H */
-- 
2.50.1


