Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E3D79D9E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 22:10:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=PPR3Ahs7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlZSw4qcJz3dTV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 06:10:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=PPR3Ahs7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::202; helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050:0:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlZS30p7Xz3cN6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 06:09:35 +1000 (AEST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4RlZRm1yq8z9spL;
	Tue, 12 Sep 2023 22:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1694549364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5CTaseLYOsDjBEddHRSS1kLR/MtlG0vJlK7mZIYlxMk=;
	b=PPR3Ahs7fgYzEWryZmgagw7s7mLptcmMjGoVq22Ezcl83SPOjapP8y9UMN309tY7DYZool
	WotDqKJzxnRlA5A8uWplR5vN/Kjdj3WQn+23Aa9tFuCrBBG14HjSdhgkSwz6deK5z1u2iH
	MCpYl3E8WIFBrUXm9v5cQuxLu6mP86MarUbCB7+Pjtn6HLtTteTvqJ+tyCH4T3Xv5Ee2Tr
	C0TbPe05VHCNGh/q3FzMfW3ud1pvV4X7gvj8JwhNVpIE3jjd9Kz9wti/DjVDv8FLWwD0gJ
	QqYqv7B9rFdthY+upXNshBbPNe5iLFceaR+fM6zuLMHq1wnJ1FQ1zxn3PuiE5w==
Date: Tue, 12 Sep 2023 22:09:20 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Message-ID: <20230912220920.64a9ac3c@yea>
In-Reply-To: <453090a5-0d01-40ee-50a5-794c8f0f1f95@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
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
	<20230912175941.0fca47bb@yea>
	<453090a5-0d01-40ee-50a5-794c8f0f1f95@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 636a533f3eb030c4528
X-MBO-RS-META: yd7wong3i1uxkxwaxsdjkw75mjr6ruxx
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

On Tue, 12 Sep 2023 17:39:10 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Ah ok, maybe your CPU only has 4 BATs and they are all used, following 
> change would tell us.
> 
> diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
> index 850783cfa9c7..bd26767edce7 100644
> --- a/arch/powerpc/mm/book3s32/mmu.c
> +++ b/arch/powerpc/mm/book3s32/mmu.c
> @@ -86,6 +86,7 @@ int __init find_free_bat(void)
>   		if (!(bat[1].batu & 3))
>   			return b;
>   	}
> +	pr_err("NO FREE BAT (%d)\n", n);
>   	return -1;
>   }
> 
> Or you have 8 BATs in which case it's an alignment problem, you need to 
> increase CONFIG_DATA_SHIFT to 23, for that you need CONFIG_ADVANCED and 
> CONFIG_DATA_SHIFT_BOOL

Applied all your patches. According to the output my G4 DP seems to have 8 BATs. Now I get the following output on screen before the freeze:

printk: bootconsole [udbg0] enabled
Total memory = 2048MB; using 4096kB for hash table
mapin_ram:125
mmu_mapin_ram:170 0 30000000 1400000 2000000
__mmu_mapin_ram:147 0 1400000
__mmu_mapin_ram:156 1400000
__mmu_mapin_ram:147 1400000 30000000
NO FREE BAT (8)
__mmu_mapin_ram:156 20000000
__mapin_ram_chunk:107 20000000 30000000
__mapin_ram_chunk:117
mapin_ram:134
kasan_mmu_init:132
kasan_mmu_init:135 0
kasan_mmu_init:140
ioremap() called early from btext_map+0x64/0xdc. Use early_ioremap() instead
Linux version 6.6.0-rc1-PMacG4-dirty (root@T1000) (gcc (Gentoo 12.3.1_p20230526 p2) 12.3.1 20230526, GNU ld (Gentoo 2.40 p7) 2.40.0) #5 SMP Tue Sep 12 16:50:47 CEST 2023
kasan_init_region: c0000000 30000000 f8000000 fe000000
NO FREE BAT (8)
kasan_init_region: loop f8000000 fe000000


So I set CONFIG_DATA_SHIFT=23 as suggested but then I only get:

printk: bootconsole [udbg0] enabled
Total memory = 2048MB; using 4096kB for hash table
mapin_ram:125
mmu_mapin_ram:170 0 30000000 1400000 2000000
__mmu_mapin_ram:147 0 1400000
__mmu_mapin_ram:156 1400000
__mmu_mapin_ram:147 1400000 30000000
NO FREE BAT (8)
__mmu_mapin_ram:156 20000000
__mapin_ram_chunk:107 20000000 30000000
__mapin_ram_chunk:117
mapin_ram:134
kasan_mmu_init:132
kasan_mmu_init:135 0
kasan_mmu_init:140


With btext_unmap() left in place in init_32.c I only get:

printk: bootconsole [udbg0] enabled
Total memory = 2048MB; using 4096kB for hash table
mapin_ram:125
mmu_mapin_ram:170 0 30000000 1400000 2000000
__mmu_mapin_ram:147 0 1400000
__mmu_mapin_ram:156 1400000
__mmu_mapin_ram:147 1400000 30000000
NO FREE BAT (8)
__mmu_mapin_ram:156 20000000
__mapin_ram_chunk:107 20000000 30000000
__mapin_ram_chunk:117
mapin_ram:134
btext_unmap:129

Hope the output sheds at least some light on what's going wrong!

Regards,
Erhard
