Return-Path: <linuxppc-dev+bounces-2775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 521E89BA1A5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2024 18:22:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xgl0C6X9rz2xl6;
	Sun,  3 Nov 2024 04:22:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730568123;
	cv=none; b=O2Lz8+p2RHpOTDoqhTfo2yEOPyzQCCNijtM07fsu6zCgxh9cIeJmU4hIkIpdditE2aDlSjji12MSRmpxwoYMk6ammHLJPm0nW2zaJk2up8rzN768VSpJhIqH8WuOT1anxBbLdowgLIvMT8aFVJajkWB95M6tA9JPwM5j+oF+5E0dQsJzqsVDapaNVLzmi9O5ZdS/SOSWXO53WgkfGDdvGx7nAAIz1TBnQbGQywP624mkEo8sARNyEvwf8LObMyyQ+UO0rZVWbLW/+ym/go9Mzt/RT3/50Wgik1JVzUdYUEu2usEdV22l5TNPMhd6xcn3ADkL8O9clNa7c+PP6wQHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730568123; c=relaxed/relaxed;
	bh=8t9oRS8jqFz7JqVHrKzcZwls154V3gx6wMcbOAYsmHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=boSucCRbiBnvdAmnecNAdAqSRi4pzFdxkq6VBaTBk5YOVMimp0V2iLkcqNAVOxj74w0G26lUkrjyrYbddan2eotO1gDTRS5uAvjuhnX49XTOX0ZSfLNLTRSyjkUbMKE4eUPWfk5FClzHFdllpwIIok8sSIb/UMFhUS6hXvU7EfuslEaMNHYmU7LdHvwHapBn5hEjcyQXSMFH2UUq924s1+0EUjkfD99b+fVpGvcs1Ifd86zEw3t0gIknguT2SMcgBeOe5EqfYIjsYUMm29A3zknK7itWdUo1/p0elYIMiSPPybGx88XikOyUdjvP10LNwkbHrlGOX0hGzw63sJYPsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=En5erwzb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=gmazyland@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=En5erwzb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=gmazyland@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xgl0970p1z2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Nov 2024 04:22:01 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d63a79bb6so1914110f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Nov 2024 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730568112; x=1731172912; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8t9oRS8jqFz7JqVHrKzcZwls154V3gx6wMcbOAYsmHY=;
        b=En5erwzb3L19LUxSzC0Koa35HjF50pgN0HiwO/pVT6NLMHB0C06nUA/dhu8qE1wmLB
         XdDu8qqMSCHeTyPua+5mNyfw5xXnFwMTsb/aSCUKChmeoDDZtShGep3D/zXW52t7TagT
         WPs1YE/ybCqGosrb39Q8u1an+k2cdQ+4KpNAjGVjX6KIrK1+LHeypJJe4qy+c/OTmoPS
         Xq07k/afSDYopYxm1/vsO7Bq5AOnLBV6U2PkzZYf0CmSnZRYprEG/KP3eVUwG7f5yFLn
         xjZWY1Reu1RMJX9AYljpQuQn2dPw/DN7rvB8NyCSl+08nF8BDSL/Dt2qhyFkjo1DGXB1
         Li5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730568112; x=1731172912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8t9oRS8jqFz7JqVHrKzcZwls154V3gx6wMcbOAYsmHY=;
        b=IxoTHXdBnuYtJJXwFiqLDhIQ2g+yfxs7RDNdK+BmwnVccltqAlF6JNRVDueDrZ82/e
         3pZULFkuQN5PDFaJ5g/FDJUCRYEKlkMkQSMlbn+liCucm1b2EEm9LsmgJaimibJm9zo0
         qMIkPj3w0zb8WTqQCQRd7oHCnS0KNpdFIilNltiaGQ3ou2GFUocXghcGP8OI9fzfnr/5
         sv406YWFyq2At4gQiN0czhA4aG/w1I+XyXAKImkp4q+0VfviCMPUH8kxktVocZCZS7CY
         I3InSg2Rb0wkywoOG96AAip1N8yu+vw3shCEQ4pv7OCx2BxSK0NrYXp8bP0WacHwac+t
         uPiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1n150o5+tNS31sudMwB0V5xbkzkD4+OLGE8Vv1aFYFZiUkEVp8uO7l1KLg1PR16n8PLmNeoOv8Y0fJmo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzc1pMtG1cyUd609YDXPJ1k3weHtYApQxPwdVMz32EsHwYxCOoR
	HScXhrITmKL5ZH902kzMJtnzbCy+kDXP8DV+86Zzy5EyMswgn53r
X-Google-Smtp-Source: AGHT+IGi2uIS+syMjf4Zb3uVjiFcNrb793MRtp10AmIBh8gU8g/TTGAjyc3KAIibvpjiJFec6IflZQ==
X-Received: by 2002:a5d:5f96:0:b0:37d:324f:d3a9 with SMTP id ffacd0b85a97d-381be7add20mr8712682f8f.9.1730568111468;
        Sat, 02 Nov 2024 10:21:51 -0700 (PDT)
Received: from [192.168.8.100] (89-24-32-122.nat.epc.tmcz.cz. [89.24.32.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7b80sm8686121f8f.10.2024.11.02.10.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 10:21:50 -0700 (PDT)
Message-ID: <8784622f-ccdc-4086-83f7-50462d6369df@gmail.com>
Date: Sat, 2 Nov 2024 18:21:48 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Eric Biggers <ebiggers@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
References: <20241026040958.GA34351@sol.localdomain>
 <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
 <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
 <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
 <ZyYIO6RpjTFteaxH@gondor.apana.org.au>
 <20241102163605.GA28213@sol.localdomain>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <20241102163605.GA28213@sol.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11/2/24 5:36 PM, Eric Biggers wrote:
> On Sat, Nov 02, 2024 at 07:08:43PM +0800, Herbert Xu wrote:
>> On Sat, Nov 02, 2024 at 12:05:01PM +0100, Ard Biesheuvel wrote:
>>>
>>> The only issue resulting from *not* taking this patch is that btrfs
>>> may misidentify the CRC32 implementation as being 'slow' and take an
>>> alternative code path, which does not necessarily result in worse
>>> performance.
>>
>> If we were removing crc32* (or at least crc32*-arch) from the Crypto
>> API then these patches would be redundant.  But if we're keeping them
>> because btrfs uses them then we should definitely make crc32*-arch
>> do the right thing.  IOW they should not be registered if they're
>> the same as crc32*-generic.
>>
>> Thanks,
> 
> I would like to eventually remove crc32 and crc32c from the crypto API, but it
> will take some time to get all the users converted.  If there are AF_ALG users
> it could even be impossible, though the usual culprit, iwd, doesn't appear to
> use any CRCs, so hopefully we are fine there.

Hi,

Please do not forget about dm-integrity, it can use crc32/crc32c for non-cryptographic
integrity through crypto API.
To test it, cryptsetup testsuite should cover these variants (integrity-compat-test).

Also, libcryptsetup can be compiled with userspace kernel crypto (AF_ALG) as a crypto backend.
At least, I think we never used CRC32 though AF_ALG from userspace there...

Thanks,
Milan


