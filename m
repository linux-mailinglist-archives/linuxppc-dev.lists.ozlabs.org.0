Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B58E4363785
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 22:18:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNh905B8nz3c6l
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:18:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Jdn0fsuK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=Jdn0fsuK; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNh870828z301C
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 06:17:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ZoCnMOrcVwYTr+T34fAQN0TEpMaEy135rwW1aCvDb2w=; b=Jdn0fsuKVwU/ZfN2cVmvlJ/03+
 XYed+3wEPzmzNL40eHN1q2GsEuoPXJQsC08HmQDorSmxe+yHQttF/Fup246Vh1x+akqMQXs+GmvRc
 265SLdaJrvdU3jVbJU6S6Ea6/E5lp5m5j6VVYs3ne5QMSNzkZgqMskzIPOx5xr3v4rYcOJk5p6Ppl
 +AqaZyy582yuElaVhgL09qOXDDGjlxwoKwAOWFg6vFVVouRZf71H1FiyIpbBF04ONOIJit9kyuqkC
 /s5Jl+mKn5HwPPaSACh7JCXhXWuYc+QxhKZd2dE4VzgubyCC76KgLcVoEBmLIHtG/VbNn/RsWqjoI
 81NgrqUA==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lYDrJ-008WMz-0t; Sun, 18 Apr 2021 20:17:34 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] powerpc: add ALTIVEC support to lib/ when PPC_FPU not set
Date: Sun, 18 Apr 2021 13:17:26 -0700
Message-Id: <20210418201726.32130-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210418201726.32130-1-rdunlap@infradead.org>
References: <20210418201726.32130-1-rdunlap@infradead.org>
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
Cc: kernel test robot <lkp@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When PPC_FPU is not set and ALTIVEC=y, arch/powerpc/lib/ldstfp.c is not
being built, but it is also needed when ALTIVEC=y for get_vr() and
put_vr().

../arch/powerpc/lib/sstep.c: In function 'do_vec_load':
../arch/powerpc/lib/sstep.c:637:3: error: implicit declaration of function 'put_vr' [-Werror=implicit-function-declaration]
  637 |   put_vr(rn, &u.v);
      |   ^~~~~~
../arch/powerpc/lib/sstep.c: In function 'do_vec_store':
../arch/powerpc/lib/sstep.c:660:3: error: implicit declaration of function 'get_vr'; did you mean 'get_oc'? [-Werror=implicit-function-declaration]
  660 |   get_vr(rn, &u.v);
      |   ^~~~~~


Add ldstfp.o to the Makefile for CONFIG_ALTIVEC and add
externs for get_vr() and put_vr() in lib/sstep.c to fix the
build errors.

This was seen in a kernel config from kernel test robot <lkp@intel.com>
that reported a different build issue (for pmac32-cpufreq.c).

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: lkp@intel.com
---
 arch/powerpc/lib/Makefile |    1 +
 arch/powerpc/lib/sstep.c  |    5 +++++
 2 files changed, 6 insertions(+)

--- linux-next-20210416.orig/arch/powerpc/lib/Makefile
+++ linux-next-20210416/arch/powerpc/lib/Makefile
@@ -54,6 +54,7 @@ obj-y			+= checksum_$(BITS).o checksum_w
 
 obj-y			+= sstep.o
 obj-$(CONFIG_PPC_FPU)	+= ldstfp.o
+obj-$(CONFIG_ALTIVEC)	+= ldstfp.o
 obj64-y			+= quad.o
 
 obj-$(CONFIG_PPC_LIB_RHEAP) += rheap.o
--- linux-next-20210416.orig/arch/powerpc/lib/sstep.c
+++ linux-next-20210416/arch/powerpc/lib/sstep.c
@@ -50,6 +50,11 @@ extern void conv_sp_to_dp(const float *s
 extern void conv_dp_to_sp(const double *dp, float *sp);
 #endif
 
+#ifdef CONFIG_ALTIVEC
+extern void get_vr(int rn, __vector128 *p);
+extern void put_vr(int rn, __vector128 *p);
+#endif /* CONFIG_ALTIVEC */
+
 #ifdef __powerpc64__
 /*
  * Functions in quad.S
