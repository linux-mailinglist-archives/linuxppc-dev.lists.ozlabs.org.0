Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E23CA1A7524
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 09:47:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491cyl1VqNzDqdp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:47:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491cfl5z09zDqVb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 17:33:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NBRHikNC; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 491cfl01C5z9sSG;
 Tue, 14 Apr 2020 17:33:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1586849615;
 bh=Nd1Ptgw+YshFLhZf0IQKeulFP5vcPk5iOFH6dv3O7HA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NBRHikNCCGThtcOT8ET6ZqyFqFuCe3efKP22YkR2t8T+lrM+Yeh56YmZtQfLKUMNs
 cLe29kLTqp96q977QfaeiAeeRkV2cmj9Zoh7GMN73vtQEBMJ6oI8bqRrUZPrfqjyAb
 PndJvlq6Hr/juQQpc2qbXlCez8Low9ITfRz8uA3YuPn1s343rGuBCKgllVimOiy9Kv
 5T0eIjvFZZTD6IR0e08Sd2mFb8LonD93cj2yTWFf9ggKEMap3ZI1Qnd+1WLqVOotiL
 8E9l/yGhD08Rk3WTS97u19gC+0rFz4ZdBNGsUya2+DAsSCH9t4dBvyWA7HS2O4BF9X
 tikvFUVnNmP0A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 clang-built-linux@googlegroups.com
Subject: Re: -Wincompatible-pointer-types in
 arch/powerpc/platforms/embedded6xx/mvme5100.c
In-Reply-To: <20200413201034.GA18373@ubuntu-s3-xlarge-x86>
References: <20200413201034.GA18373@ubuntu-s3-xlarge-x86>
Date: Tue, 14 Apr 2020 17:33:45 +1000
Message-ID: <87eesqjzc6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Scott Wood <oss@buserror.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,

Thanks for the report.

Nathan Chancellor <natechancellor@gmail.com> writes:
> Hi all,
>
> 0day reported a build error in arch/powerpc/platforms/embedded6xx/mvme5100.c
> when building with clang [1]. This is not a clang specific issue since
> it also happens with gcc:
>
> $ curl -LSs https://lore.kernel.org/lkml/202004131704.6MH1jcq3%25lkp@intel.com/2-a.bin | gzip -d > .config
> $ make -j$(nproc) -s ARCH=powerpc CROSS_COMPILE=powerpc-linux- olddefconfig arch/powerpc/platforms/embedded6xx/mvme5100.o
> arch/powerpc/platforms/embedded6xx/mvme5100.c: In function 'mvme5100_add_bridge':
> arch/powerpc/platforms/embedded6xx/mvme5100.c:135:58: error: passing argument 5 of 'early_read_config_dword' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   135 |  early_read_config_dword(hose, 0, 0, PCI_BASE_ADDRESS_1, &pci_membase);
>       |                                                          ^~~~~~~~~~~~
>       |                                                          |
>       |                                                          phys_addr_t * {aka long long unsigned int *}


Yuck.

> ...
> I am not sure how exactly this should be fixed. Should this driver just
> not be selectable when CONFIG_PHYS_ADDR_T_64BIT is selected or is there
> something else that I am missing?

I'm not sure TBH. This is all ancient history as far as I can tell, none
of it's been touched for ~7 years.

Your config has:

CONFIG_EMBEDDED6xx=y
CONFIG_PPC_BOOK3S_32=y
CONFIG_PPC_BOOK3S_6xx=y
CONFIG_PPC_MPC52xx=y
CONFIG_PPC_86xx=y


Which I'm not sure really makes sense at all, ie. it's trying to build a
kernel for multiple platforms at once (EMBEDDED6xx, MPC52xx, 86xx), but
the Kconfig doesn't exclude that so I guess we have to live with it for
now.

Then Kconfig has:

config PHYS_64BIT
	bool 'Large physical address support' if E500 || PPC_86xx
	depends on (44x || E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx
	select PHYS_ADDR_T_64BIT


So it's PPC_86xx that allows 64-bit phys_addr_t.

That was added in:

  4ee7084eb11e ("POWERPC: Allow 32-bit hashed pgtable code to support 36-bit physical")

Which did:

config PHYS_64BIT
-	bool 'Large physical address support' if E500
-	depends on 44x || E500
+	bool 'Large physical address support' if E500 || PPC_86xx
+	depends on (44x || E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx


ie. it wanted to add support for PPC_86xx but had to deliberately
exclude some of the other BOOK3S_32 based platforms.

So I'm going to guess it should have also excluded embedded6xx, and this
seems to fix it:

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 0c3c1902135c..134fc383daf7 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -278,7 +278,7 @@ config PTE_64BIT
 
 config PHYS_64BIT
 	bool 'Large physical address support' if E500 || PPC_86xx
-	depends on (44x || E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx
+	depends on (44x || E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx && !EMBEDDED6xx
 	select PHYS_ADDR_T_64BIT
 	---help---
 	  This option enables kernel support for larger than 32-bit physical


So unless anyone can tell me otherwise I'm inclined to commit that ^

cheers
