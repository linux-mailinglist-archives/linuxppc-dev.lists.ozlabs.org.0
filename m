Return-Path: <linuxppc-dev+bounces-1770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B68D991ACF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Oct 2024 23:27:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XLdlm24svz2xqc;
	Sun,  6 Oct 2024 08:27:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728148514;
	cv=none; b=eNnofRYdiuFp7VUKBeaRic/uZjms+eNQh0nqwt3EIPDL6hrZFQ1RcSnZLULiBJpQX+10UxtgNxTNi0qFUBBEjqwzTT18A0q4Rxa6WRV7RqZQB9K4uvBc+Hmc1Joren0Pu663Hrum1OTshU5A9Xjbmo/EStBiyEAA5hgKBPZHK15zgaSTJVeErzbyUAUWxwtEeJWLKVj/ekG3UdfaWgqvos2BzFU3YywEB1NwvwGzCKe864gb8C/fadYzXPBWwugH5yQaWRvYjZ9yhtXdqytN1JZIWzZIjNoNxhU8BstAKaFBubm5w2iycTsmczWkJufVEJTW2i5ZN5qVRKs1rilX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728148514; c=relaxed/relaxed;
	bh=lsW7EQNzqFODn0fjV/O1dRd6PWZq45kEsuDrh2KXW2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZV+YsqGPDKiTZkcGKUp9DVWiSxjf/x3EsKokCBLtEkwk59Hwc24zvJJ25ooKaxVN/p1mFg/47LNxPvZULA+uINdXdYYlrufX+iAgGwfCz7pHyr9jyOAyOqj7rOLHmrFpavwTspIxvsReYN3AdeFlyEYtyTkHrmVN9UYkzLmGutIUy+zgnVFee03scIKLYVz+vcRsXXblUsQV5Bs+lu85Qmn7xD/PbBX15ryuZNxs3BWsd7tEYq4hDuHg0+PxSSyIDogB0lh0lNSPBVF2k84KuK/Wump+3Xei7Cq4aN7t1rzoc8K656ezS7F1+Fe9QJXlr8WybZWxzOXRlg0jiDbCCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wlo7wDjI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=richard.henderson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wlo7wDjI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=richard.henderson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XLX9F1QcTz2xks
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Oct 2024 04:15:13 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20b5fb2e89dso24232255ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Oct 2024 10:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728148510; x=1728753310; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsW7EQNzqFODn0fjV/O1dRd6PWZq45kEsuDrh2KXW2Y=;
        b=Wlo7wDjI710i4m7CCQeZibIYQtyH8XeKJWIkSEOoQobl3rOwShDS94HbmvURAGF6wB
         PPhhuUvfOUcctVqiHGyQ/Z3B45XjW0x17iHQ32HDGGEmtkQthKbX7aJb0NrMuHcwlt8M
         g+jRwVJUtYq3URR8D2Wu33jRW+BhCf5KE1Ok73CoIZI05FozZGomLnk4oeG9DWQ7Kr8x
         c0e5MPYA5jf53+bRD1i6CpYn06fTPoCasLqG8iLxF49Sfi/ar9sjWKKbL7ErfPF8c9Mf
         b54OUT62M25hP8DOO+OP+O24USbAkYyKFHLK52z9/Z2BusJeF48o/n2UECgyno1cIRVK
         wVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728148510; x=1728753310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lsW7EQNzqFODn0fjV/O1dRd6PWZq45kEsuDrh2KXW2Y=;
        b=KGvmZIn0ywylLFZ/yW1eSri7hnccr0IkDe522aOITCVU+3Jex7LMU2CUWu60dITBbm
         bd3FRcAuAIeJp9jVtoCAN1JiQTjcmw+E3P6VXHpI18qbXGTJZsPZZssAxNX7ORizI7yY
         N8cVB24RQCq4PbHW/ufyHI/q749e/tfE3Ro3RY9B3HRXgEupNOUCI9d38xoCdDJSrfEZ
         1YXXh3bUMxh7Z4grV9e8wVPtKZ4ehKBb6EcR6w3juPCmzsVaeBqpvCVLvH+/yq4T9NHr
         VuTbE3M4AQMg3aqWqiqNzYkFLttb13DCKFesx7oYiWI6SRi4D07vvLoG81t0Xhu6s7hL
         rbOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgUlUMhU6UIbDzBK/LOcsTxTM8HokuBusjIlQAFQ3uYbLtMjE4JMQzy92QzaY1ZYHTzCpgm4mKOBWfmco=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyRPmy2BmmSUw4G7x0LPaUYULG8chvD5TjwPhxzQpd/6cl/3z04
	wp89Z4zr0jPKPM5Zoy8ovHarp1WYK70z40wm+3Ow0sZOEIpjP7OcLoVtpO3yT5w=
X-Google-Smtp-Source: AGHT+IENbFDG/A+fVoOl/3+aASUI1BapHoAWqdH3kxJgz5oqEs9gbrypUJkbtSsFqXqIWpDd5XosEA==
X-Received: by 2002:a17:902:fc46:b0:20b:8bd0:7387 with SMTP id d9443c01a7336-20bff1ca475mr95440335ad.52.1728148510524;
        Sat, 05 Oct 2024 10:15:10 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c139317desm15149965ad.125.2024.10.05.10.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 10:15:10 -0700 (PDT)
Message-ID: <99346751-30b3-4245-974b-94be618cf5bd@linaro.org>
Date: Sat, 5 Oct 2024 10:15:06 -0700
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
Subject: Re: [PATCH 4/5] asm-generic: use asm-generic/mman-common.h on parisc
 and alpha
To: Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Damien Le Moal <dlemoal@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Helge Deller <deller@gmx.de>,
 Kees Cook <kees@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org
References: <20240925210615.2572360-1-arnd@kernel.org>
 <20240925210615.2572360-5-arnd@kernel.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240925210615.2572360-5-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 9/25/24 14:06, Arnd Bergmann wrote:
> From: Arnd Bergmann<arnd@arndb.de>
> 
> These two architectures each have their own set of MAP_* flags, like
> powerpc, mips and others do. In addition, the msync() flags are also
> different, here both define the same flags but in a different order.
> Finally, alpha also has a custom MADV_DONTNEED flag for madvise.
> 
> Make the generic MADV_DONTNEED and MS_* definitions conditional on
> them already being defined and then include the common header
> header from both architectures, to remove the bulk of the contents.
> 
> Signed-off-by: Arnd Bergmann<arnd@arndb.de>
> ---
>   arch/alpha/include/uapi/asm/mman.h     | 68 +++-----------------------
>   arch/parisc/include/uapi/asm/mman.h    | 66 +------------------------
>   include/uapi/asm-generic/mman-common.h |  5 ++
>   3 files changed, 13 insertions(+), 126 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

