Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED25316B213
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 22:21:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RFP116JvzDq7h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 08:21:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=joe.lawrence@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=TZT0s7mT; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RFLM1z7YzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 08:19:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582579141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qrH5Jc70aO0WisbCbbQEGrRbQOapxoaiM1vz6NJ9qXs=;
 b=TZT0s7mT7EaGUTc3fNPP4CRwk7cr/74b/sBFONkgUYj6W5vG6NrcykYotjysjXxdMWPv8L
 Flxerjg3S8JwI5z5vcPOuHS8cQ2R+dm8F5queyek84Y23DgXXXFN7xBFYprEdJ2FxVJ6RG
 YvC4Qod+0VN8Xh0vRPXS1z0LIWSkjf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-ZHb5GfhaPhK5PfQTqCoD4w-1; Mon, 24 Feb 2020 16:18:54 -0500
X-MC-Unique: ZHb5GfhaPhK5PfQTqCoD4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86DC1184B120;
 Mon, 24 Feb 2020 21:18:53 +0000 (UTC)
Received: from jlaw-desktop.bos.redhat.com (dhcp-17-119.bos.redhat.com
 [10.18.17.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A19F8B774;
 Mon, 24 Feb 2020 21:18:50 +0000 (UTC)
From: Joe Lawrence <joe.lawrence@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/vdso: remove deprecated VDS64_HAS_DESCRIPTORS
 references
Date: Mon, 24 Feb 2020 16:18:48 -0500
Message-Id: <20200224211848.26087-1-joe.lawrence@redhat.com>
In-Reply-To: <2df70550695143a9b62c0146e8e3e17ac91c1863.camel@kernel.crashing.org>
References: <2df70550695143a9b62c0146e8e3e17ac91c1863.camel@kernel.crashing.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The original 2005 patch that introduced the powerpc vdso, pre-git
("ppc64: Implement a vDSO and use it for signal trampoline") notes that:

  ... symbols exposed by the vDSO aren't "normal" function symbols, apps
  can't be expected to link against them directly, the vDSO's are both
  seen as if they were linked at 0 and the symbols just contain offsets
  to the various functions.  This is done on purpose to avoid a
  relocation step (ppc64 functions normally have descriptors with abs
  addresses in them).  When glibc uses those functions, it's expected to
  use it's own trampolines that know how to reach them.

Despite that explanation, there remains dead #ifdef
VDS64_HAS_DESCRIPTORS code-blocks that provide alternate function
definitions that setup function descriptors.

Since VDS64_HAS_DESCRIPTORS has been unused for all these years, we
might as well finally remove it from the codebase.

Link: https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-February/204430.=
html
Link: https://lore.kernel.org/lkml/1108002773.7733.196.camel@gaston/
Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
---
 arch/powerpc/include/asm/vdso.h | 24 ------------------------
 arch/powerpc/kernel/vdso.c      |  5 -----
 2 files changed, 29 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vds=
o.h
index b5e1f8f8a05c..2ff884853f97 100644
--- a/arch/powerpc/include/asm/vdso.h
+++ b/arch/powerpc/include/asm/vdso.h
@@ -13,9 +13,6 @@
=20
 #define VDSO_VERSION_STRING=09LINUX_2.6.15
=20
-/* Define if 64 bits VDSO has procedure descriptors */
-#undef VDS64_HAS_DESCRIPTORS
-
 #ifndef __ASSEMBLY__
=20
 /* Offsets relative to thread->vdso_base */
@@ -28,25 +25,6 @@ int vdso_getcpu_init(void);
 #else /* __ASSEMBLY__ */
=20
 #ifdef __VDSO64__
-#ifdef VDS64_HAS_DESCRIPTORS
-#define V_FUNCTION_BEGIN(name)=09=09\
-=09.globl name;=09=09=09\
-        .section ".opd","a";=09=09\
-        .align 3;=09=09=09\
-=09name:=09=09=09=09\
-=09.quad .name,.TOC.@tocbase,0;=09\
-=09.previous;=09=09=09\
-=09.globl .name;=09=09=09\
-=09.type .name,@function; =09=09\
-=09.name:=09=09=09=09\
-
-#define V_FUNCTION_END(name)=09=09\
-=09.size .name,.-.name;
-
-#define V_LOCAL_FUNC(name) (.name)
-
-#else /* VDS64_HAS_DESCRIPTORS */
-
 #define V_FUNCTION_BEGIN(name)=09=09\
 =09.globl name;=09=09=09\
 =09name:=09=09=09=09\
@@ -55,8 +33,6 @@ int vdso_getcpu_init(void);
 =09.size name,.-name;
=20
 #define V_LOCAL_FUNC(name) (name)
-
-#endif /* VDS64_HAS_DESCRIPTORS */
 #endif /* __VDSO64__ */
=20
 #ifdef __VDSO32__
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index b9a108411c0d..d3b77c15f9ce 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -391,12 +391,7 @@ static unsigned long __init find_function64(struct lib=
64_elfinfo *lib,
 =09=09       symname);
 =09=09return 0;
 =09}
-#ifdef VDS64_HAS_DESCRIPTORS
-=09return *((u64 *)(vdso64_kbase + sym->st_value - VDSO64_LBASE)) -
-=09=09VDSO64_LBASE;
-#else
 =09return sym->st_value - VDSO64_LBASE;
-#endif
 }
=20
 static int __init vdso_do_func_patch64(struct lib32_elfinfo *v32,
--=20
2.21.1

