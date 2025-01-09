Return-Path: <linuxppc-dev+bounces-4891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5782A06D94
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 06:29:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTCyg3P85z30fm;
	Thu,  9 Jan 2025 16:29:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736400571;
	cv=none; b=X5iEU0USvfe3XRtzb3R9rIKXQ0wOxJH/S/AAdp4mRFI3k35tcmEJHIzUXhkTNfCYRoDHVW7RgEEU/+bnac/QrBxC+0qMTYC3rVfOUnE1AGtgSVwWEnfQccKr61oQDp/YbGxouCyeR/UpqyDHfEoxF3JyzF1PS6bfYInMDx3pVOBg/xFjxZb279NcRwXkgwdrZf/higtfZn8r8GP5BEEabC4PJHA0FT/YpNSQ72N+LjU0aVGMQGlCy2HnVsRhJDCBkHsOBUCihy0U7Tqab3kvvfHgUSy+Qqkjaw6DpPFuENKozAyQHTZVjbgfP8260F4V5CPWysGJT1bN7LCKo97SgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736400571; c=relaxed/relaxed;
	bh=XMJt/YhwUnBzvs59wX/sgUOAGddtx1maXOTnOv1QH5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H38RKRCUW4WMJZGgl0pSeAUf8RoNyA1Dc79Vnhs/M3ONvSY9+rGgMpGC1EFP787cC+k4lGAOonM0URpvy7UL1tplHrKXXJWCa+LyifjQepDSVWSwjG2N+VeGEavqQ1x+1HHXt/3OJXlAKm62MEX4Lj+NKWfRV/zQ2VXquEnviUCwvKS1ShAA1a5zOBbHzrbr1EMhq+u9t+UqHHeQeliB/7j3u0UUSYxDeS9dFdCPWjkQKlQo0mPcMk4nuOVKQM3ouhZLOazlBs2P9dM3OoRTGDES9RNLj8QW93tYXzSbtq+qEiBitCNJxx2N/Wr2Xy42s8jf+H6M1VkqjBabNBfxkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QPjBC0at; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QPjBC0at;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTCyd1qV6z30W0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 16:29:28 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21675fd60feso9866245ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2025 21:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736400566; x=1737005366; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XMJt/YhwUnBzvs59wX/sgUOAGddtx1maXOTnOv1QH5s=;
        b=QPjBC0atOmQ36TvylYwDOhhPfzzen4iXvRXhaLJDs1xmc0HFRDJtGruHjyiE/c29ul
         EGGtjHSQo3rh6HDGOZ5qRLGVHaoTUmWsE4tnQfaZ+cD6aiw81oB/6QHhyfxaMfCV0VkY
         /bzu3OYLH6r7jwUsN54qLU+3MLzQ1uF2btnhAtANBt5UARWxODeLg6uAV5+ywA6DTDkJ
         Io24cc0l/SEuenuP4mkt1S6Lb+iyz8dc4cBX616k0LSVen+9yQBBTp0UYL+t2p5Qc6Dd
         wfd1JayDY0o6Wc5HaMS2Mj+WekaLdwS8Sq+E7h9bCGlZ31Cp9tSCfMfL23ZsEVvhrRLV
         AaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736400566; x=1737005366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMJt/YhwUnBzvs59wX/sgUOAGddtx1maXOTnOv1QH5s=;
        b=KGGp0SfNYyH2PjP/yEIIONpVnru7CZUlOcrzR1ggVF09oGcdHMjPbKCONFZ99NQSmW
         fz1gzL/9038TAuKUSAyscBG1/6+tXgU19UKYm3/b3adVSYjqzpf50RdBme4Rm/cQYwVe
         3eFI8CkWdxWQk9hdW+LV83MDaNQ5M00hpjcfUIUjtAaJyAamV5e66Qke9Kbj1AfB5skd
         FBQo7+ttcF4q6YV2H3kY88CMejzaIpLldRyAXk86IVrdJvvQ7f1BlHepm7q1X7BMJK1a
         MPlgHPxqsyR/kOq77JpA506XMjOB0LsBDqNj/Ub+iqQ9AcRHgWRZz+36mon8ULkrwIQ9
         KYhg==
X-Forwarded-Encrypted: i=1; AJvYcCWlAv3sYHqDrqcq3f29kMhXjvkMAK60quMGwzUCk2xGypGNlhOBoP80WNH2hJAUQsJNNlQd8ctKXNDV20c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzl7nlniHF3Q/YBNBBo34uYJz5kouIlWzzHXXQSXY3dLLTMDbAX
	EVd7eVXD4TIvG5OiZ4xHO6wVyN/77CEMXWOmmdgVJWxQseW+PGdONsstXVN8vGI=
X-Gm-Gg: ASbGnctMCwRVDkkvw6GedWV+x/kvCk8NZ9LA8yOpB9SL92V0OQLvj8tARAOE3famdGb
	9r42F5sPlSj24jNmVuioB/dxbw6Cr7O5CuuA8FkVwH7WeUaXo5JSFf0EfkTX4Oz5FDZBHTndIE9
	CtM0P3+QwNNefqf5lQdqDyp4gC3lO1n2D3/Zh6zpelYgu9OvZdSavNFagZjyjcl9z8Di9i6BoJv
	Rc8bVn9L0filCFOK3IH4afrFGj+niA7VgkEj8UQdrnAvQdnAp/9dmrIIcdf8u0NbcQ=
X-Google-Smtp-Source: AGHT+IHb0FVyvp1dm7B/1h/x9uzjYQ//zMkoJ4qWj36+ahLI4sk0W30C74Z9uJRWuq6gqr8rh892HA==
X-Received: by 2002:a17:902:f681:b0:215:e98c:c5bc with SMTP id d9443c01a7336-21a840094b7mr86342285ad.48.1736400565988;
        Wed, 08 Jan 2025 21:29:25 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a91744580sm3702405ad.84.2025.01.08.21.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 21:29:25 -0800 (PST)
Message-ID: <2ad7234d-bfc5-49e3-abe6-7a85d992329d@daynix.com>
Date: Thu, 9 Jan 2025 14:29:19 +0900
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] s390/crash: Use note name macros
To: Dave Martin <Dave.Martin@arm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Brown <broonie@kernel.org>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 kexec@lists.infradead.org, binutils@sourceware.org, devel@daynix.com
References: <20250107-elf-v3-0-99cb505b1ab2@daynix.com>
 <20250107-elf-v3-5-99cb505b1ab2@daynix.com>
 <Z31Tp0nMhb/ntUW0@e133380.arm.com>
 <965b73e7-d0a3-4fae-b0ec-70b5497cb6c4@daynix.com>
 <Z36Cljsz2p0hYsFd@e133380.arm.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <Z36Cljsz2p0hYsFd@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025/01/08 22:50, Dave Martin wrote:
> On Wed, Jan 08, 2025 at 01:53:51PM +0900, Akihiko Odaki wrote:
>> On 2025/01/08 1:17, Dave Martin wrote:
>>> Hi,
>>>
>>> On Tue, Jan 07, 2025 at 09:45:56PM +0900, Akihiko Odaki wrote:
>>>> Use note name macros to match with the userspace's expectation.
>>>>
>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> ---
>>>>    arch/s390/kernel/crash_dump.c | 62 ++++++++++++++++---------------------------
>>>>    1 file changed, 23 insertions(+), 39 deletions(-)
>>>>
>>>> diff --git a/arch/s390/kernel/crash_dump.c b/arch/s390/kernel/crash_dump.c
>>>
>>> [...]
> 
>>>> +#define NT_INIT(buf, type, desc) \
>>>> +	(nt_init_name((buf), NT_ ## type, &(desc), sizeof(desc), NN_ ## type))
> 
> [...]
> 
>>> (Note also, the outer parentheses and the parentheses around (buf)
>>> appear redundant -- although harmless?)
>>
>> They only make a difference in trivial corner cases and may look needlessly
>> verbose.
> 
> (In case there was a misunderstanding here, I meant that some
> parentheses can be removed without affecting correctness:
> 
> #define NT_INIT(buf, type, desc) \
> 	nt_init_name(buf, NT_ ## type, &(desc), sizeof(desc), NN_ ## type))
> 
> It still doesn't matter though -- and some people do prefer to be
> defensive anyway and err on the side of having too many parentheses
> rather than too few.)

Well, being very pedantic, there are some cases where these parentheses 
have some effect.

If you omit the outer parentheses, the following code will have 
different consequences:
a->NT_INIT(buf, PRSTATUS, desc)

The parentheses around buf will make difference for the following code:
#define COMMA ,
NT_INIT(NULL COMMA buf, PRSTATUS, desc)

But nobody will write such code.

Regards,
Akihiko Odaki

