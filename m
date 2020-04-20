Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AE91B001B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 05:07:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495BSz53rbzDqg8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 13:07:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495BPZ6l89zDqdp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 13:04:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Gdf0lZfu; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 495BPY1B6Sz9sR4;
 Mon, 20 Apr 2020 13:04:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587351874;
 bh=zqFglfs+OWwiFYdz+pg3YEVVbd/md31jahle7Ih0HU4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Gdf0lZfuhRtXWn9XYKXxepVVuDOfiv59WFv1PTE2PQfslSmIGkxjwQqS9XEdGF7W9
 QR/uesda+C73aEg+f1PQ+m8355evDSUOoxV8DIjYahUJ/ZYQoCoT7hZ6Kg8Z31hF6+
 a3OMF1pX9eZYurylCG6+u9z7sGwffoOz+sSLn2vWw1d0FhMaaZZwrfWj4M9iTioCqO
 eIyWKkGK0p+b6Gp3XRrE7PVPdFEtB9hRR1eHqWZe+iumg9WDjt+PNlyFLyJlYQ4aqQ
 kVs9kfQiA99CtIFHnF9vJVqVq4HwpVWdAfLTptcbYjkqt05vc2TSg9wVf6+7hu/A91
 DCnoO0yM3nxiQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu: spapr_tce: Disable compile testing to fix build on
 book3s_32 config
In-Reply-To: <a99ee461-664c-51ae-cb3a-cf5d87048d86@c-s.fr>
References: <20200414142630.21153-1-krzk@kernel.org>
 <a99ee461-664c-51ae-cb3a-cf5d87048d86@c-s.fr>
Date: Mon, 20 Apr 2020 13:04:47 +1000
Message-ID: <874ktej1rk.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> On 04/14/2020 02:26 PM, Krzysztof Kozlowski wrote:
>> Although SPAPR_TCE_IOMMU itself can be compile tested on certain PowerPC
>> configurations, its presence makes arch/powerpc/kvm/Makefile to select
>> modules which do not build in such configuration.
>> 
>> The arch/powerpc/kvm/ modules use kvm_arch.spapr_tce_tables which exists
>> only with CONFIG_PPC_BOOK3S_64.  However these modules are selected when
>> COMPILE_TEST and SPAPR_TCE_IOMMU are chosen leading to build failures:
>> 
>>      In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:0,
>>                       from arch/powerpc/kvm/book3s_64_vio_hv.c:22:
>>      arch/powerpc/include/asm/book3s/64/pgtable.h:17:0: error: "_PAGE_EXEC" redefined [-Werror]
>>       #define _PAGE_EXEC  0x00001 /* execute permission */
>> 
>>      In file included from arch/powerpc/include/asm/book3s/32/pgtable.h:8:0,
>>                       from arch/powerpc/include/asm/book3s/pgtable.h:8,
>>                       from arch/powerpc/include/asm/pgtable.h:18,
>>                       from include/linux/mm.h:95,
>>                       from arch/powerpc/include/asm/io.h:29,
>>                       from include/linux/io.h:13,
>>                       from include/linux/irq.h:20,
>>                       from arch/powerpc/include/asm/hardirq.h:6,
>>                       from include/linux/hardirq.h:9,
>>                       from include/linux/kvm_host.h:7,
>>                       from arch/powerpc/kvm/book3s_64_vio_hv.c:12:
>>      arch/powerpc/include/asm/book3s/32/hash.h:29:0: note: this is the location of the previous definition
>>       #define _PAGE_EXEC 0x200 /* software: exec allowed */
>> 
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Fixes: e93a1695d7fb ("iommu: Enable compile testing for some of drivers")
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> ---
>>   drivers/iommu/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
>> index 58b4a4dbfc78..3532b1ead19d 100644
>> --- a/drivers/iommu/Kconfig
>> +++ b/drivers/iommu/Kconfig
>> @@ -362,7 +362,7 @@ config IPMMU_VMSA
>>   
>>   config SPAPR_TCE_IOMMU
>>   	bool "sPAPR TCE IOMMU Support"
>> -	depends on PPC_POWERNV || PPC_PSERIES || (PPC && COMPILE_TEST)
>> +	depends on PPC_POWERNV || PPC_PSERIES
>>   	select IOMMU_API
>>   	help
>>   	  Enables bits of IOMMU API required by VFIO. The iommu_ops
>> 
>
> Should it be fixed the other way round, something like:

That doesn't actually fix this specific issue, the code will build but
then not link:

  ld: arch/powerpc/../../virt/kvm/vfio.o: in function `.kvm_spapr_tce_release_vfio_group':
  vfio.c:(.text.kvm_spapr_tce_release_vfio_group+0xb0): undefined reference to `.kvm_spapr_tce_release_iommu_group'
  ld: arch/powerpc/../../virt/kvm/vfio.o: in function `.kvm_vfio_set_group':
  vfio.c:(.text.kvm_vfio_set_group+0x7f4): undefined reference to `.kvm_spapr_tce_attach_iommu_group'
  ld: arch/powerpc/kvm/powerpc.o: in function `.kvm_arch_vm_ioctl':
  (.text.kvm_arch_vm_ioctl+0x1a4): undefined reference to `.kvm_vm_ioctl_create_spapr_tce'
  ld: (.text.kvm_arch_vm_ioctl+0x230): undefined reference to `.kvm_vm_ioctl_create_spapr_tce'
  make[1]: *** [/home/michael/linux/Makefile:1106: vmlinux] Error 1

> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
> index 2bfeaa13befb..906707d15810 100644
> --- a/arch/powerpc/kvm/Makefile
> +++ b/arch/powerpc/kvm/Makefile
> @@ -135,4 +135,4 @@ obj-$(CONFIG_KVM_BOOK3S_32) += kvm.o
>   obj-$(CONFIG_KVM_BOOK3S_64_PR) += kvm-pr.o
>   obj-$(CONFIG_KVM_BOOK3S_64_HV) += kvm-hv.o
>
> -obj-y += $(kvm-book3s_64-builtin-objs-y)
> +obj-$(CONFIG_KVM_BOOK3S_64) += $(kvm-book3s_64-builtin-objs-y)

But this is probably still a good thing to do, as it would have made the
error messages clearer in this case I think.

cheers
