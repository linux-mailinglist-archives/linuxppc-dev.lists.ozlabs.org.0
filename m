Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF4648A6DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 05:38:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXycP54xJz30NZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 15:38:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fr0OK1Pm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Fr0OK1Pm; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXybg6vVrz2yRf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 15:37:33 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 g11-20020a17090a7d0b00b001b2c12c7273so1087321pjl.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 20:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=wqBJsdI9GVnbAZsR64vukangM6ZJA+b32vA9RU1IroQ=;
 b=Fr0OK1Pm/9oN9HtZ+jHwKQ5JxujZCue3hxCfqzruyxZTYHMa4lqxP8sA7GkVsEq9xX
 3IxTRRjmgWxmHHzWWl7fu89z6Qy/OuIsWLDIV7l4Qc/avGq4AIBtb6aH6zF113B0UB5K
 /nfdJ+F+nbA4kRDBcrt+6WNXYL9kEW+Pr/oFT3OAABluZ1zrXtydTOCYpP4yfAV9iNE5
 jOVA5ENx9FQIwaNrBjBdC+rx6c9w9wGaWyJLGafC400Cxi5nONx/ahS2iFW83eo1jt3C
 JGhG+jiywmgSepl5/0T7ZvMCA9i7jQBPGAXdv72oOGx2o10t10lcXgbJgzgsztTjukH9
 IpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=wqBJsdI9GVnbAZsR64vukangM6ZJA+b32vA9RU1IroQ=;
 b=T8Kz9d1hizu2Tmatg6im0H4IdyrKipEmrEmmp604IRprYREPjx32LSWzcNILRGSkuN
 nz85o+Y9g6kjlD9jy1vq4lQTcIFThFey3+1FVv0+krEPWSmkQOUW0qm8R1L1vHfpEdJe
 xx5glrsHHoFGbr5z8lk5O0uOqMYGkHlzUz03UDsz4r4fNBJbeHxvx5grL3KVG2txTEhj
 kkYPk8Mg2KcxuwRYIxfjxNBejHdYjghbh1IxBrjHG2Wv4LuIz3kmwf02BLuWGnZqCIDA
 CuP1YApBmdrerqDrjIznCOtVQwPr3VdfcgXxjiXTNfJqx9xaMiO8bYLzcAFhW0YPEEY4
 DtAg==
X-Gm-Message-State: AOAM532Ht46L7JEA1hhkEAKqaGM9TZc7dGKqcD8m+zqf5Jt9OcWHCwHn
 tbZyKs8noa10hJEOhztDb6U=
X-Google-Smtp-Source: ABdhPJwnUmrQV3BpUodFd57dY5gBefMKn5WCiUXYD2qYhM1RI3u8Bkuv2mk5olrZDWNe5Hlrx7fbjQ==
X-Received: by 2002:a17:902:bd44:b0:14a:2c66:a06c with SMTP id
 b4-20020a170902bd4400b0014a2c66a06cmr2801512plx.152.1641875850892; 
 Mon, 10 Jan 2022 20:37:30 -0800 (PST)
Received: from localhost (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id bo15sm563973pjb.16.2022.01.10.20.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 20:37:30 -0800 (PST)
Date: Tue, 11 Jan 2022 14:37:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc: Fix virt_addr_valid() check
To: Andrew Morton <akpm@linux-foundation.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Kees Cook <keescook@chromium.org>, Laura Abbott
 <labbott@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
References: <20211225120621.13908-1-wangkefeng.wang@huawei.com>
 <20211225120621.13908-2-wangkefeng.wang@huawei.com>
 <09ed46a5-6df3-ffc0-8243-61612c06153a@huawei.com>
In-Reply-To: <09ed46a5-6df3-ffc0-8243-61612c06153a@huawei.com>
MIME-Version: 1.0
Message-Id: <1641871726.fshx7g5r92.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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

Excerpts from Kefeng Wang's message of January 8, 2022 9:58 pm:
> Hi PPC maintainers=EF=BC=8C ping..

Hmm. I might have confused myself about this. I'm going back and
trying to work out what I was thinking when I suggested it. This
works on 64e because vmalloc space is below the kernel linear map,
right?

On 64s it is the other way around and it is still possible to enable=20
flatmem on 64s. Altough we might just not hit the problem there because=20
__pa() will not mask away the vmalloc offset for 64s so it will still=20
return something that's outside the pfn_valid range for flatmem. That's=20
very subtle though.

The checks added to __pa actually don't prevent vmalloc memory from
being passed to it either on 64s, only a more basic test.

I think 64s wants (addr >=3D PAGE_OFFSET && addr < KERN_VIRT_START) as
the condition.  Could possibly add that check to __pa as well to
catch vmalloc addresses.

Thanks,
Nick

>=20
> On 2021/12/25 20:06, Kefeng Wang wrote:
>> When run ethtool eth0, the BUG occurred,
>>
>>    usercopy: Kernel memory exposure attempt detected from SLUB object no=
t in SLUB page?! (offset 0, size 1048)!
>>    kernel BUG at mm/usercopy.c:99
>>    ...
>>    usercopy_abort+0x64/0xa0 (unreliable)
>>    __check_heap_object+0x168/0x190
>>    __check_object_size+0x1a0/0x200
>>    dev_ethtool+0x2494/0x2b20
>>    dev_ioctl+0x5d0/0x770
>>    sock_do_ioctl+0xf0/0x1d0
>>    sock_ioctl+0x3ec/0x5a0
>>    __se_sys_ioctl+0xf0/0x160
>>    system_call_exception+0xfc/0x1f0
>>    system_call_common+0xf8/0x200
>>
>> The code shows below,
>>
>>    data =3D vzalloc(array_size(gstrings.len, ETH_GSTRING_LEN));
>>    copy_to_user(useraddr, data, gstrings.len * ETH_GSTRING_LEN))
>>
>> The data is alloced by vmalloc(), virt_addr_valid(ptr) will return true
>> on PowerPC64, which leads to the panic.
>>
>> As commit 4dd7554a6456 ("powerpc/64: Add VIRTUAL_BUG_ON checks for __va
>> and __pa addresses") does, make sure the virt addr above PAGE_OFFSET in
>> the virt_addr_valid().
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   arch/powerpc/include/asm/page.h | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/=
page.h
>> index 254687258f42..300d4c105a3a 100644
>> --- a/arch/powerpc/include/asm/page.h
>> +++ b/arch/powerpc/include/asm/page.h
>> @@ -132,7 +132,10 @@ static inline bool pfn_valid(unsigned long pfn)
>>   #define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
>>   #define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
>>  =20
>> -#define virt_addr_valid(kaddr)	pfn_valid(virt_to_pfn(kaddr))
>> +#define virt_addr_valid(vaddr)	({						\
>> +	unsigned long _addr =3D (unsigned long)vaddr;				\
>> +	(unsigned long)(_addr) >=3D PAGE_OFFSET && pfn_valid(virt_to_pfn(_addr=
));	\
>> +})
>>  =20
>>   /*
>>    * On Book-E parts we need __va to parse the device tree and we can't
>=20
