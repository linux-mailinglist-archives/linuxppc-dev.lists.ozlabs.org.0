Return-Path: <linuxppc-dev+bounces-9280-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D8AD4AD5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 08:11:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHFfb329Rz309v;
	Wed, 11 Jun 2025 16:11:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622295;
	cv=none; b=U4uSoPPwcOb61eBZ4PNeARGEpdoQMhXhTNj0XRnAQXoYz9cwiWaHCuM4I6l6wMFbxpU+FViDXFfxvDZ5rWnP+mr1fekUaaynYIM9KHpZpyFx8WHDINDDDlt2ywqf7Wh6aI1e7PrVUAOuk3YCpGLTzriSaJEZdyAy4aJl5NRhlJ2PRESjHo9bHDskM2cVssm7rLXeby8Z8xu6v6yilCETn9JN8Yqhgd5ncpRpWwEwpOhgJbZ7GswJOTrsFjVOos4sJNU+KORL4/zhHFD3/v2Y8G0L+gOoV3M8CGfP7w60fF/wQVlT6tjRL9+yGbAN+tuNZm3DADeZx8L2q+ABhjnzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622295; c=relaxed/relaxed;
	bh=myWzW0vGEkYskFqwtdGHwmHFMtZoZQ56CZllsdYrHmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=lIx/wGi+s/vWpWUmKKhNdaKP8rEmiEzJDkiJ3yqUQffMCWCrz4kZwpr0ti3hVLeaBuP9pjykuDy5cXq71Dmq2SSLFAXrhDMaiypFFI/AUsilYHAyBnzhb+MOXX8G9H9vAKjCjQAn0SvQhF+0e2/pn8MSwcxrLNOXoVHFgjjIh8yvcZdjVLDwtMwFAm8ikZFhamTa44tlD2KEUdsU7oOeXd4ARJMyH+xdJznaGW/REuiyAwaAxfU5AEJPdPWaoR4+Xt201oKfZCIsD5C1v61gAfsFaCHAX+y2vRMtxP/VbupoiZBDJf4+IjB9OATWtZn9D5DjzXNciropBuvPFi1RlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XU3Hzy1z; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XU3Hzy1z; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XU3Hzy1z;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XU3Hzy1z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFfZ46sVz2xbX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 16:11:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749622291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=myWzW0vGEkYskFqwtdGHwmHFMtZoZQ56CZllsdYrHmI=;
	b=XU3Hzy1zARx+GBlS407y9yvIL0o7BdhWT/6zGBFuY6HNElFrGpxQ1EW0t9EUOlQgLEpVFV
	yII+6fIGjqZ2h6s3eyViUoqvy6FzBZLnpXIc3T7mxt+3xoFAdd54ux+UcfGjeCIvpQpUOd
	GD4LCMVRS9VQGehv6FeARhX7AkVAjPM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749622291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=myWzW0vGEkYskFqwtdGHwmHFMtZoZQ56CZllsdYrHmI=;
	b=XU3Hzy1zARx+GBlS407y9yvIL0o7BdhWT/6zGBFuY6HNElFrGpxQ1EW0t9EUOlQgLEpVFV
	yII+6fIGjqZ2h6s3eyViUoqvy6FzBZLnpXIc3T7mxt+3xoFAdd54ux+UcfGjeCIvpQpUOd
	GD4LCMVRS9VQGehv6FeARhX7AkVAjPM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-DRgZwyEpNGeP6bvFzBaCvA-1; Wed,
 11 Jun 2025 02:11:28 -0400
X-MC-Unique: DRgZwyEpNGeP6bvFzBaCvA-1
X-Mimecast-MFC-AGG-ID: DRgZwyEpNGeP6bvFzBaCvA_1749622286
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D114219560A2;
	Wed, 11 Jun 2025 06:11:25 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.174])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 71C8D195608D;
	Wed, 11 Jun 2025 06:11:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	Naveen N Rao <naveen@kernel.org>,
	Segher Boessenkool <segher@kernel.crashing.org>
Subject: [PATCH v3 1/2] powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Date: Wed, 11 Jun 2025 08:11:14 +0200
Message-ID: <20250611061115.81437-2-thuth@redhat.com>
In-Reply-To: <20250611061115.81437-1-thuth@redhat.com>
References: <20250611061115.81437-1-thuth@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8auVXkQ_XWhOUWvGnvDaerwZnsqrhw6ngkozplhz9Pk_1749622286
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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
2.49.0


