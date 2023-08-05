Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CAF770FAD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 14:42:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pz2IPiZI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RJ2KQ06mwz3cT8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 22:42:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pz2IPiZI;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJ2JQ5nw2z2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 22:41:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1691239286;
	bh=U7xpB8WP9+c+u0pETmyJj6pivsKVWoPB3NMLS1v07KM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pz2IPiZI5tkIO4C9Az380sa4qaqxLBHJHfOtAYQ6ANM86aEMLMqVUWxTGCC4RZQqW
	 zU4BZ8anjDIGrb0dHAU2i4nf4B1NzMn1G48UkMFWmwzumqBPwxUlU/Vp5PpFzSAuoB
	 PrTn5iAqixO3nsXQ74SrFsc26peUhF2gFcCM7KUB5Sj9WTVmev7UxJEBEr6bpIZZPe
	 En3P2DpCj0tmc2btK72pALbRr0QN0jd/DAJ9YxWFrxfHZ9A6WMW9n/xRF1xIL0Pa8B
	 0WPWj2KjCDO9w/d/WwrcPVpT6vOvRbJxRDVP1W6SEz87xBKzbpgOwDdkqZYXmbj2kQ
	 SaaIkKhDbPB/w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RJ2JQ2TF7z4wqW;
	Sat,  5 Aug 2023 22:41:25 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/mm: Reinstate ARCH_FORCE_MAX_ORDER ranges
In-Reply-To: <8011d806-5b30-bf26-2bfe-a08c39d57e20@csgroup.eu>
References: <20230519113806.370635-1-mpe@ellerman.id.au>
 <8011d806-5b30-bf26-2bfe-a08c39d57e20@csgroup.eu>
Date: Sat, 05 Aug 2023 22:41:24 +1000
Message-ID: <87v8dt4q6j.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "rppt@kernel.org" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 19/05/2023 =C3=A0 13:38, Michael Ellerman a =C3=A9crit=C2=A0:
>> Commit 1e8fed873e74 ("powerpc: drop ranges for definition of
>> ARCH_FORCE_MAX_ORDER") removed the limits on the possible values for
>> ARCH_FORCE_MAX_ORDER.
>>
>> However removing the ranges entirely causes some common work flows to
>> break. For example building a defconfig (which uses 64K pages), changing
>> the page size to 4K, and rebuilding used to work, because
>> ARCH_FORCE_MAX_ORDER would be clamped to 12 by the ranges.
>>
>> With the ranges removed it creates a kernel that builds but crashes at
>> boot:
>>    kernel BUG at mm/huge_memory.c:470!
>>    Oops: Exception in kernel mode, sig: 5 [#1]
>>    ...
>>    NIP hugepage_init+0x9c/0x278
>>    LR  do_one_initcall+0x80/0x320
>>    Call Trace:
>>      do_one_initcall+0x80/0x320
>>      kernel_init_freeable+0x304/0x3ac
>>      kernel_init+0x30/0x1a0
>>      ret_from_kernel_user_thread+0x14/0x1c
>>
>> The reasoning for removing the ranges was that some of the values were
>> too large. So take that into account and limit the maximums to 10 which
>> is the default max, except for the 4K case which uses 12.
>
> There is something wrong:
>
> ~# echo 1 > /sys/kernel/mm/hugepages/hugepages-8192kB/nr_hugepages
> sh: write error: Invalid argument
>
> $ grep -e MAX_ORDER -e K_PAGES .config
> CONFIG_PPC_4K_PAGES=3Dy
> # CONFIG_PPC_16K_PAGES is not set
> CONFIG_ARCH_FORCE_MAX_ORDER=3D10

That's 32-bit I guess?

So you're hitting the default case, ie. range 10 10.

I see we have:

  arch/powerpc/configs/fsl-emb-nonhw.config:CONFIG_ARCH_FORCE_MAX_ORDER=3D12

And that config fragment is included by:
  mpc85xx_defconfig
  mpc85xx_smp_defconfig
  corenet32_smp_defconfig
  corenet64_smp_defconfig
  mpc86xx_defconfig
  mpc86xx_smp_defconfig

So for a lot of platforms the "default" was actually 12 in the past,
despite what it says in Kconfig.

> In the past MAX_ORDER used to be 12 but now it is force to 10.

This should fix it?

cheers


diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0b1172cbeccb..b3fdb3d26836 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -917,7 +917,7 @@ config ARCH_FORCE_MAX_ORDER
 	default "6" if PPC32 && PPC_64K_PAGES
 	range 4 10 if PPC32 && PPC_256K_PAGES
 	default "4" if PPC32 && PPC_256K_PAGES
-	range 10 10
+	range 10 12
 	default "10"
 	help
 	  The kernel page allocator limits the size of maximal physically
