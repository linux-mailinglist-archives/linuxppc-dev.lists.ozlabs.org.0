Return-Path: <linuxppc-dev+bounces-1620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 939BA986F2E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 10:47:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDnK41s8Gz2y89;
	Thu, 26 Sep 2024 18:47:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727340424;
	cv=none; b=YOSUgL++DtgxtgGE0FVG1nYwGSPAuJAM6sgymXP6u4EN4m2kNN1ndCtXD2Q7ddlhS8LfvCojF+BLiS20FA7cakDYGPIH3n/NjePHrjVQ+qO+pLKpjyaGbmBny70eoAKUheOpdtnemiQkAkJ39yYOY+DJtG8UCw7SZyPposrubiNY2FjJ6YhF6xcf5qxG3TWuHSeliFQ3Ou5S4QoMQxOXu4FtWEuqa3MEP5KFTNXO9qDb+RGuqTv8jiSfg79gTRdNO0RtEdIQs2roD6GxJwE8vT/natMrFX1R4pejB85CsSo0vG2LgDU9zTyWMSWXfNajF25DsdQ1l7LYsTp09hNayg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727340424; c=relaxed/relaxed;
	bh=dcdT+Y+JTqgEdFx8AuCpVRjLlJoZMsxN/9BPx+44vCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1znTSr9hFxeoDb9WQyHm2Zy4V/u3WKiwmfCeN4NrTcbUMnGkxUKF/LBU/coh5peCZMwkCxfn+YY7hiBnGw89u0r1FQPyn5mP9y6CcHpXoqXCV+f5884Z56DIbkgsXIox3UKz+J1ZAYRu6wDn27UQc/X9YJrm5PyGF+2GGm/dUd/4GD/uPw1uMG/SixHRuFOBQTwBWmXgZXpWGAsCnvJVIQ1Qibv8MU8ndDISHXOGXKUgdwakUayOYIqJShe+XYxljRYk5eFN27d9SG4j8NherUnM6xUSpIMYbz9jTfkKu6bNrZb2p0R/R5CVI8aONx8C+9JemR3Sakbpz60lUZbIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b2R010Cd; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b2R010Cd; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b2R010Cd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b2R010Cd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDnK33w4xz2xrM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 18:47:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727340417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dcdT+Y+JTqgEdFx8AuCpVRjLlJoZMsxN/9BPx+44vCo=;
	b=b2R010CdmuI448+ZEeEbtzcxWGrIw1lWsFPsOdz2KRHY+Pq6vosutUC9lPCfh2Wkot5/vW
	rTBX4Z2fgaPhTKhyDQtOMbwJcieNvQ3c8nyvkqAmWSo1+xtsDzkJcQNpt2vZ7HzCC4wrda
	EEjDF7mg7SMfiRwXGdlpmIhKE/OIjeU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727340417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dcdT+Y+JTqgEdFx8AuCpVRjLlJoZMsxN/9BPx+44vCo=;
	b=b2R010CdmuI448+ZEeEbtzcxWGrIw1lWsFPsOdz2KRHY+Pq6vosutUC9lPCfh2Wkot5/vW
	rTBX4Z2fgaPhTKhyDQtOMbwJcieNvQ3c8nyvkqAmWSo1+xtsDzkJcQNpt2vZ7HzCC4wrda
	EEjDF7mg7SMfiRwXGdlpmIhKE/OIjeU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-xiUddJKRODiE41YULjWUTA-1; Thu, 26 Sep 2024 04:46:55 -0400
X-MC-Unique: xiUddJKRODiE41YULjWUTA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37cd19d0e83so104788f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 01:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727340415; x=1727945215;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dcdT+Y+JTqgEdFx8AuCpVRjLlJoZMsxN/9BPx+44vCo=;
        b=GALUZHHorogKqMrvV7VgzbOLlOaIwJ+/sQT2wBQd30+75UgmHYwHFBNmCbNNk/TYdB
         rFmOOkL9PJjX6TxxM8sEPU712wVH8gw6nuRSPLKxKYveTwiz/Ak24WqmGqLVQifjKSTP
         n0VlEKj7VyChXNk+o6dll7vTOK/ABjiBSdETdaM9y+1PcjlWvxKbMXW4YBc89Noof+hj
         ML6Wzgtn+g+hocq1oKDDBNzI7+prDW6AidK86aE9+kVu0DWbb/+RQXdfSNujKxfKasFT
         t6Ey8W1Y2l/58tZtEU67cAxvw0ECVyY5PmKb4cWRmSKaEIDexiQ4PzKMuCqVRksZp++P
         CAcg==
X-Forwarded-Encrypted: i=1; AJvYcCXQltw9yPpWyU59y44K80JwKiVk0KF/JUmnoSnzZ77DLqwJSPRZ0wxqOqG42Cg8w+IZk3t9eh/ZrGDtZmA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyv+Ex76zJ9xyZiz3G+4uCAT20qDamW7GAXKdBriGheQKMqJsEA
	1XT0fdntUJqD1Oy4qgOm85shJS7m5rDCZv1UyXkxo8NlnL32j/YM76VqXp/61+kuNKoKvmCJ0qz
	GBi2wUZxnGNIFLVA/OO+j9ejHuYLbsyupn8zTp42qZy8vaBrpLPBrfNpjWOaG4ic=
X-Received: by 2002:a5d:4642:0:b0:374:c07c:a49 with SMTP id ffacd0b85a97d-37cc248b745mr3395750f8f.28.1727340414660;
        Thu, 26 Sep 2024 01:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8YDSVOdNq1/t7E3SyZWe5lFPiCsLTZcolGEYAEKQa215yfM+Vw1+QC4KOFxSiwJu3877rJg==
X-Received: by 2002:a5d:4642:0:b0:374:c07c:a49 with SMTP id ffacd0b85a97d-37cc248b745mr3395735f8f.28.1727340414264;
        Thu, 26 Sep 2024 01:46:54 -0700 (PDT)
Received: from ?IPV6:2003:cb:c744:ac00:ef5c:b66d:1075:254a? (p200300cbc744ac00ef5cb66d1075254a.dip0.t-ipconnect.de. [2003:cb:c744:ac00:ef5c:b66d:1075:254a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ffa22sm40374455e9.25.2024.09.26.01.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 01:46:53 -0700 (PDT)
Message-ID: <b7f7f849-00d1-49e5-8455-94eb9b45e273@redhat.com>
Date: Thu, 26 Sep 2024 10:46:50 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] [RFC] mm: Remove MAP_UNINITIALIZED support
To: Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Damien Le Moal <dlemoal@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Helge Deller <deller@gmx.de>, Kees Cook <kees@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org
References: <20240925210615.2572360-1-arnd@kernel.org>
 <20240925210615.2572360-6-arnd@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240925210615.2572360-6-arnd@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.09.24 23:06, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> MAP_UNINITIALIZED was added back in 2009 for NOMMU kernels, specifically
> for blackfin, which is long gone. MAP_HUGE_SHIFT/MAP_HUGE_MASK were
> added in 2012 for architectures supporting hugepages, which at the time
> did not overlap with the ones supporting NOMMU.
> 
> Adding the macro under an #ifdef was obviously a mistake, which
> Christoph Hellwig tried to address by making it unconditionally defined
> to 0x4000000 as part of the series to support RISC-V NOMMU kernels. At
> this point linux/mman.h contained two conflicting definitions for bit 26,
> though the two are still mutually exclusive at runtime in all supported
> configurations.
> 
> According to the commit 854e9ed09ded ("mm: support madvise(MADV_FREE)")
> description, it was previously used internally by facebook, which
> would have resulted in MAP_HUGE_1MB turning into MAP_HUGE_2MB
> with MAP_UNINITIALIZED enabled, and every other page size implying
> MAP_UNINITIALIZED. I assume there are no remaining out of tree users
> on MMU-enabled kernels today.
> 
> I do not see any sensible way to redefine the macros for the ABI in
> a way avoids breaking something. The only ideas so far are:
> 
>   - do nothing, try to document the bug, hope for the best
> 
>   - remove the kernel implementation and redefine MAP_UNINITIALIZED to
>     zero in the header to silently turn it off for everyone. There are
>     few NOMMU users left, and the ones that do use NOMMU usually turn
>     off MMAP_ALLOW_UNINITIALIZED, as it still has the potential to cause
>     bugs and even security issues on systems with a memory protection
>     unit.
> 
>   - remove both the implementation and the macro to force a build
>     failure for anyone trying to use the feature. This way we can
>     see who complains and whether we need to put it back in some
>     form or change the userspace sources to no longer pass the flag.
> 

The first, uncontroversial step could indeed be to make 
MAP_UNINITIALIZED a nop, but still leave the definitions in mman.h etc 
around.

This is the same we did with MAP_DENYWRITE. There might be some weird 
user out there, and carelessly reusing the bit could result in trouble. 
(people might argue that they are not using it with MAP_HUGETLB, so it 
would work)

Going forward and removing MAP_UNINITIALIZED is a bit more 
controversial, but maybe there really isn't any other user around. 
Software that is not getting recompiled cannot be really identified by 
letting it rest in -next only.

My take would be to leave MAP_UNINITIALIZED in the headers in some form 
for documentation purposes.

-- 
Cheers,

David / dhildenb


