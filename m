Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3AD79D582
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 18:00:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=HLP9ZPkZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlSx5302wz3cNT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 02:00:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=HLP9ZPkZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::101; helo=mout-p-101.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlSw24B2Qz3c3q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 02:00:00 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4RlSvj0FTfz9slY;
	Tue, 12 Sep 2023 17:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1694534385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vq6ha9nLpj0wss4tVyBMyDnn6EcGFc0r4X62tz0UgKw=;
	b=HLP9ZPkZRYfUFlsEh5jxIJ1eKYAjuS03iXsO6bNwHA18pr83t4exeu5/8+ITxtdEp/tsMp
	5QbBz1dtdOVoTlUXw9XsN3cJFqB2EqX4ucqlzsk09+ajqI9pPN+sTGVzGigOBHzWkBNOzP
	ZWKcBWjQ3iiKNO1lLeag8AtLXnKatNPOHj0gAnBwnZIhNQ3z3+CoEFF9YdJu9fkod4iTaS
	BenQAjxjvHaPxVySIX7EXuMBYXLbmZ/ggMLIYgHuFefQHdcMiWwGbiONaaXxJQJq4LyvH5
	bJQYVCaMgtZq23vm9vgpb9B7HPTW728LXfDDHLU2JmIlNRMiG023FnpFCnmYhw==
Date: Tue, 12 Sep 2023 17:59:41 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Message-ID: <20230912175941.0fca47bb@yea>
In-Reply-To: <22f67fc2-ae70-bbc7-ca2a-dffbf62731f3@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
	<20230813213855.794b3c8f@yea>
	<57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
	<20230814192748.56525c82@yea>
	<6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
	<20230815220156.5c234b52@yea>
	<0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
	<20230817203202.2b4c273c@yea>
	<87y1i9clf2.fsf@mail.lhotse>
	<20230818111641.7f680ce7@yea>
	<fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
	<20230818182316.79303545@yea>
	<5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
	<20230824020015.78733931@yea>
	<87jztkvfid.fsf@mail.lhotse>
	<20230828011758.3b7b9daf@yea>
	<1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
	<20230901004417.631dc019@yea>
	<b9671cd2-9cad-c5d9-dd94-8b39f67e29b4@csgroup.eu>
	<20230903230635.5751b620@yea>
	<438d8790-8a55-2f36-4ef0-2fddcb39edae@csgroup.eu>
	<c0891617-43b9-5b56-2c51-69eec81e3b48@csgroup.eu>
	<20230912021147.57c85033@yea>
	<22f67fc2-ae70-bbc7-ca2a-dffbf62731f3@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: i31t8ojt3xhrpfaa88u3yxdmupbs8q7e
X-MBO-RS-ID: bc2bba277715bb49480
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 12 Sep 2023 07:47:50 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> I suspect something wrong when we set the BATs.
> 
> Can you try with the following additional traces:
> 
> diff --git a/arch/powerpc/mm/kasan/book3s_32.c 
> b/arch/powerpc/mm/kasan/book3s_32.c
> index 450a67ef0bbe..9954b7a3b7ae 100644
> --- a/arch/powerpc/mm/kasan/book3s_32.c
> +++ b/arch/powerpc/mm/kasan/book3s_32.c
> @@ -15,6 +15,7 @@ int __init kasan_init_region(void *start, size_t size)
>   	phys_addr_t phys;
>   	int ret;
> 
> +	pr_err("%s: %px %x %lx %lx\n", __func__, start, size, k_start, k_end);
>   	while (k_nobat < k_end) {
>   		unsigned int k_size = bat_block_size(k_nobat, k_end);
>   		int idx = find_free_bat();
> @@ -28,6 +29,7 @@ int __init kasan_init_region(void *start, size_t size)
>   		if (!phys)
>   			break;
> 
> +		pr_err("%s: setbat %d %lx %x %x\n", __func__, idx, k_nobat, phys, 
> k_size);
>   		setbat(idx, k_nobat, phys, k_size, PAGE_KERNEL);
>   		k_nobat += k_size;
>   	}
> @@ -47,6 +49,7 @@ int __init kasan_init_region(void *start, size_t size)
> 
>   	kasan_update_early_region(k_start, k_nobat, __pte(0));
> 
> +	pr_err("%s: loop %lx %lx\n", __func__, k_nobat, k_end);
>   	for (k_cur = k_nobat; k_cur < k_end; k_cur += PAGE_SIZE) {
>   		pmd_t *pmd = pmd_off_k(k_cur);
>   		pte_t pte = pfn_pte(PHYS_PFN(phys + k_cur - k_nobat), PAGE_KERNEL);
> 
> 
> You'd then get something like:
> 
> Total memory = 2048MB; using 4096kB for hash table
> Activating Kernel Userspace Access Protection
> Activating Kernel Userspace Execution Prevention
> Linux version 6.6.0-rc1+ (chleroy@PO20335.IDSI0.si.c-s.fr) 
> (powerpc64-linux-gcc (GCC) 12.2.0, GNU ld (GNU Binutils) 2.39) #461 Tue 
> Sep 12 09:37:11 CEST 2023
> kasan_init_region: c0000000 30000000 f8000000 fe000000
> kasan_init_region: setbat 3 f8000000 7c000000 4000000
> kasan_init_region: loop fc000000 fe000000
> KASAN init done

Applied this patch on top of 6.6-rc1, your old pr_info() patch and Michaels patch.

This way booting gets stuck at:
printk: bootconsole [udbg0] enabled
Total memory = 2048MB; using 4096kB for hash table
mapin_ram:125
mmu_mapin_ram:169 0 30000000 1400000 2000000
__mmu_mapin_ram:146 0 1400000
__mmu_mapin_ram:155 1400000
__mmu_mapin_ram:146 1400000 30000000
__mmu_mapin_ram:155 20000000
__mapin_ram_chunk:107 20000000 30000000
__mapin_ram_chunk:117
mapin_ram:134
btext_unmap:129

Having moved btext_unmap() after memblock_set_current_limit(lowmem_end_addr) in init_32.c I get:

printk: bootconsole [udbg0] enabled
Total memory = 2048MB; using 4096kB for hash table
mapin_ram:125
mmu_mapin_ram:169 0 30000000 1400000 2000000
__mmu_mapin_ram:146 0 1400000
__mmu_mapin_ram:155 1400000
__mmu_mapin_ram:146 1400000 30000000
__mmu_mapin_ram:155 20000000
__mapin_ram_chunk:107 20000000 30000000
__mapin_ram_chunk:117
mapin_ram:134
kasan_mmu_init:129
kasan_mmu_init:132 0
kasan_mmu_init:137
btext_unmap:129

Changing the already moved btext_unmap() to btext_map() I get:

printk: bootconsole [udbg0] enabled
Total memory = 2048MB; using 4096kB for hash table
mapin_ram:125
mmu_mapin_ram:169 0 30000000 1400000 2000000
__mmu_mapin_ram:146 0 1400000
__mmu_mapin_ram:155 1400000
__mmu_mapin_ram:146 1400000 30000000
__mmu_mapin_ram:155 20000000
__mapin_ram_chunk:107 20000000 30000000
__mapin_ram_chunk:117
mapin_ram:134
kasan_mmu_init:129
kasan_mmu_init:132 0
kasan_mmu_init:137
ioremap() called early from btext_map+0x64/0xdc. Use early_ioremap() instead
Linux version 6.6.0-rc1-PMacG4-dirty (root@T1000) (gcc (Gentoo 12.3.1_p20230526 p2) 12.3.1 20230526, GNU ld (Gentoo 2.40 p7) 2.40.0) #5 SMP Tue Sep 12 16:50:47 CEST 2023
kasan_init_region: c0000000 30000000 f8000000 fe000000
kasan_init_region: loop f8000000 fe000000


So I get no "kasan_init_region: setbat" line and don't reach "KASAN init done".

Regards,
Erhard
