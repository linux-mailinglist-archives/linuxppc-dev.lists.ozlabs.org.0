Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC5D364D34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 23:40:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPKx93X85z2xy7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 07:40:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=FirAgyY6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=FirAgyY6; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPKwj0l3Hz2xZJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 07:39:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=E/xf1ymngxrR9B9vXqBprFs35Mu6lZQnfAEYqkVQYPc=; b=FirAgyY6nuc4InDydB9E9sc58r
 op6kCcejmQYjEO2jMO7A7HEHM9UaD1jqKnL5lUi3j1iBDOc4GfYNTW2+CR31/zRrAiMSEFjIBkJRp
 vhVp0FQ0gygcWaNu6cQSVc0DtzZo0krKQusU8JjgA1tbZxHPGKCjrR35w5SRkIUQkYck9yFA+q4PT
 /Kj7bfoNiw3Yj8XRjkbzno9sTq0tP0POrp+F5qXfis3jDl5VBOnqX93cPrwn/h53BXye+1VQiDtdx
 IXHeGcJQZVj1CfeeX1kA4o3q2ZxO/UyOoWAisE/jLl3KrCjb3eswVSCtgLkLklUshPCCbmiifQFwl
 Jw7B4bag==;
Received: from [2601:1c0:6280:3f0::df68]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lYbcB-00EJua-P4; Mon, 19 Apr 2021 21:39:42 +0000
Subject: Re: PPC_FPU, ALTIVEC: enable_kernel_fp, put_vr, get_vr
To: Michael Ellerman <mpe@ellerman.id.au>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <7107fcae-5c7a-ac94-8d89-326f2cd4cd33@infradead.org>
 <8b1cb0a2-ed3a-7da0-a73a-febbda528703@csgroup.eu>
 <20210418174648.GN26583@gate.crashing.org>
 <bf119bfe-7db1-e7f3-d837-f910635eeebb@infradead.org>
 <87sg3mct3x.fsf@mpe.ellerman.id.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bd83b06d-ed36-e600-e988-c1e0014fb9cf@infradead.org>
Date: Mon, 19 Apr 2021 14:39:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87sg3mct3x.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/19/21 6:16 AM, Michael Ellerman wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:

>> Sure.  I'll post them later today.
>> They keep FPU and ALTIVEC as independent (build) features.
> 
> Those patches look OK.
> 
> But I don't think it makes sense to support that configuration, FPU=n
> ALTVEC=y. No one is ever going to make a CPU like that. We have enough
> testing surface due to configuration options, without adding artificial
> combinations that no one is ever going to use.
> 
> IMHO :)
> 
> So I'd rather we just make ALTIVEC depend on FPU.

That's rather simple. See below.
I'm doing a bunch of randconfig builds with it now.

---
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] powerpc: make ALTIVEC depend PPC_FPU

On a kernel config with ALTIVEC=y and PPC_FPU not set/enabled,
there are build errors:

drivers/cpufreq/pmac32-cpufreq.c:262:2: error: implicit declaration of function 'enable_kernel_fp' [-Werror,-Wimplicit-function-declaration]
           enable_kernel_fp();
../arch/powerpc/lib/sstep.c: In function 'do_vec_load':
../arch/powerpc/lib/sstep.c:637:3: error: implicit declaration of function 'put_vr' [-Werror=implicit-function-declaration]
  637 |   put_vr(rn, &u.v);
      |   ^~~~~~
../arch/powerpc/lib/sstep.c: In function 'do_vec_store':
../arch/powerpc/lib/sstep.c:660:3: error: implicit declaration of function 'get_vr'; did you mean 'get_oc'? [-Werror=implicit-function-declaration]
  660 |   get_vr(rn, &u.v);
      |   ^~~~~~

In theory ALTIVEC is independent of PPC_FPU but in practice nobody
is going to build such a machine, so make ALTIVEC require PPC_FPU
by depending on PPC_FPU.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: lkp@intel.com
---
 arch/powerpc/platforms/86xx/Kconfig    |    1 +
 arch/powerpc/platforms/Kconfig.cputype |    2 ++
 2 files changed, 3 insertions(+)

--- linux-next-20210416.orig/arch/powerpc/platforms/86xx/Kconfig
+++ linux-next-20210416/arch/powerpc/platforms/86xx/Kconfig
@@ -4,6 +4,7 @@ menuconfig PPC_86xx
 	bool "86xx-based boards"
 	depends on PPC_BOOK3S_32
 	select FSL_SOC
+	select PPC_FPU
 	select ALTIVEC
 	help
 	  The Freescale E600 SoCs have 74xx cores.
--- linux-next-20210416.orig/arch/powerpc/platforms/Kconfig.cputype
+++ linux-next-20210416/arch/powerpc/platforms/Kconfig.cputype
@@ -186,6 +186,7 @@ config E300C3_CPU
 config G4_CPU
 	bool "G4 (74xx)"
 	depends on PPC_BOOK3S_32
+	select PPC_FPU
 	select ALTIVEC
 
 endchoice
@@ -309,6 +310,7 @@ config PHYS_64BIT
 
 config ALTIVEC
 	bool "AltiVec Support"
+	depends on PPC_FPU
 	depends on PPC_BOOK3S_32 || PPC_BOOK3S_64 || (PPC_E500MC && PPC64)
 	help
 	  This option enables kernel support for the Altivec extensions to the
