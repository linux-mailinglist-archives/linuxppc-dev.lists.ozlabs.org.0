Return-Path: <linuxppc-dev+bounces-6060-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A70A2F940
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 20:46:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsFSd6Rf3z30W5;
	Tue, 11 Feb 2025 06:46:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739216785;
	cv=none; b=An+XVQYyhe3xN6LMyWi/cXaeRmMNOPaLTGchNU9VZqGbJz7Ss1tRUw6TJcmdvv7vGdkS6Dn0LC2S+ST7xJdRpgfMf7WoGKGGuAA7trUqcy3G9qWFgOp0RYP/j4SirfVJN4ips9a5Yf5WK8Dj3YpyHHoMgj3LeC92DvIJ3TIbBqHBQPSVBgKYNJDXEhX+5q5yhx3Pf5pqmtjf6QeYT4iWTyhTSrC4NbGA42iMSmMNHWR6qG2LfZdG6PUc0QiJNpf/WK3ouQyc2Sqv+h7BjMDNxuhWR00lsYv2TXeRxQtKBgjkqrektocLVaV9fVMOHqdr6qDbbD4m/EMuw8s+dEJ7iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739216785; c=relaxed/relaxed;
	bh=uJ3dn2m14q3JZC0SZ/m8U9BYHLX1xfnAh1A/zsPGM6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7kw+q+QDbJIeIiGcCRBKa3c8iu3HkEklt8RxsAQuWSc+wddRpx+VQRM5IieGV8Hiy3Eofz7L7VGWJf2nYtaCIQnH4AWghHBThPO6fEx5KKnLJjFoW8/563ONDussBt2TJP1dEJIwE3rA1K4OQw51Uob6L+HuL15UBgdWayomyg7BccWPgat98eU9td5iLNOSfxXFCBdR7xk0algzTeE5UjGx0ZXX7MK4VURmPlG7uUsgdMxQDw/GynW3oXwBgZ5fVsCOHfn1Ra0HYT4vUZgMK7/5wSudOiauoLG7x/sjperOo6XOvocklUCHI6ghr4NajFpgffxUdwPgZMJX3HAjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WXK+SST5; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WXK+SST5; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WXK+SST5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WXK+SST5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsFSc73Skz30W4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 06:46:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739216781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uJ3dn2m14q3JZC0SZ/m8U9BYHLX1xfnAh1A/zsPGM6o=;
	b=WXK+SST5RJyCqhSXN0gUFoDUTU6ko1eTBZvfKsLv9u/Agb5ZCQ2LSjDvKLU+cpzOk7x5NU
	XqSzeGjAyax+5ezcJ4uokbR+UMJgZRpJOv+VE/ExKuXk6d1qnSTkm423W2YBke8G//bogl
	003LUJDnuT3Xl1NSfCjXKyGO47YD+qE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739216781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uJ3dn2m14q3JZC0SZ/m8U9BYHLX1xfnAh1A/zsPGM6o=;
	b=WXK+SST5RJyCqhSXN0gUFoDUTU6ko1eTBZvfKsLv9u/Agb5ZCQ2LSjDvKLU+cpzOk7x5NU
	XqSzeGjAyax+5ezcJ4uokbR+UMJgZRpJOv+VE/ExKuXk6d1qnSTkm423W2YBke8G//bogl
	003LUJDnuT3Xl1NSfCjXKyGO47YD+qE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-GvJeiRQ-NaG7Zb5L_N87BQ-1; Mon, 10 Feb 2025 14:46:19 -0500
X-MC-Unique: GvJeiRQ-NaG7Zb5L_N87BQ-1
X-Mimecast-MFC-AGG-ID: GvJeiRQ-NaG7Zb5L_N87BQ
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4392fc6bd21so9796245e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 11:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216778; x=1739821578;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uJ3dn2m14q3JZC0SZ/m8U9BYHLX1xfnAh1A/zsPGM6o=;
        b=g+3LQKP2wVtENGv8o9VIwcqXFflZvtINDDW0z9iUPy8Xu+ROw8iOTMXt464ZeXzPxi
         yYypOxsvEz8/fHcljBVnDVFIFEdPyhAwZ1UjAnwmciASnHt7ZoJ95Ou40WiUeqm4N94N
         BB0iVvCzkCztgxbSU1AR3lL+5x/6TxT3xrjAtGedKPU0AClHycDmhyHqafqz+kGXx1Ib
         mxeRInCOpFkxEhCLUDCntJDFLgj/hQjdx8+S2mS26+AOdC+QD5VQ0og4k3DsPxP8CRmf
         6pE/CG8Ov6Lz0E6SLL6ANwHGVwdL4lPLGhGUHx+VtoGWKcUw89uuBSU3miq3WDyW/dlz
         6vcg==
X-Forwarded-Encrypted: i=1; AJvYcCUX3NYJBQBDifhH47BVPTMnsgWoK4LXdgg8GFbiMlTXQCGgK+aYnj0oTOtp7nZdOFKdmJlYYB3Co/lsnt4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysMEzFXXs+ZPPV5O/WK0aBanSHEBkTZDJ+9Yq64XPZHE5lOK7v
	l4cjReh3SbxMcIrFjS+ksSBVRmteAkyd3ZY+PxSKH2NbammSe5b5vPv/ylw6IoKLPjIY/IFD32f
	Otq8hsTe1eEq0KJ3UzEoYZncETKRlaZyn2WX1zTtjYSIgrcYcbD0XJCnZlAZKerc=
X-Gm-Gg: ASbGncvIRCZXtG/M4u9QuC0LPG0CZDqB3GUYU4xccgqitYUzat6BxTjg1dY0a1H8AuX
	CNv2q2iZ5atKdHpFGk9OvFumUWvnWgb5kSHh9gvUM5RokcskN9ZgGST/SNWX5CWk9zfcFQylmv9
	/SWmHBCNAT/cwgOHUmc/fUe2OokWB3d5kfi0HTU9S75DBEZt0ulQU+o4WAm634tHdlm77AIpY+Q
	7+EfNTHbgW3jvhPrwV7kx44Pp0Tbb5WaqL7NGwpxFpdEF4Swdwz6kG4LeFyMJuDIlmI38PsPD4k
	DLkTU2rcm9k+n2UQO6xhj5dNtRYfEz3D5hNpwipYKEU8FgW1xdA6T6w5dltyrv2O9GC+Jz47nCt
	gJ9wnweT92ZdUrWs3+rKa+LmxDY0aJ9wz
X-Received: by 2002:a05:600c:a0d:b0:439:4355:2f69 with SMTP id 5b1f17b1804b1-4394355322dmr52600695e9.6.1739216778688;
        Mon, 10 Feb 2025 11:46:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCZVh/MEtqHC+Z/EILrF/9sgQe7D5pYK8P8qD6dHN0xGfT768AmNEonlQrcYjmGWj/KHPJeQ==
X-Received: by 2002:a05:600c:a0d:b0:439:4355:2f69 with SMTP id 5b1f17b1804b1-4394355322dmr52600495e9.6.1739216778239;
        Mon, 10 Feb 2025 11:46:18 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:b800:12c4:65cd:348a:aee6? (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da965b3sm159736065e9.5.2025.02.10.11.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:46:17 -0800 (PST)
Message-ID: <8b4bb4f0-37fc-4215-a3a9-3771394f065f@redhat.com>
Date: Mon, 10 Feb 2025 20:46:14 +0100
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
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
To: John Hubbard <jhubbard@nvidia.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Yury Norov <yury.norov@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, David Gow <davidgow@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Shuah Khan <shuah@kernel.org>,
 Kees Cook <kees@kernel.org>, Muhammad Usama Anjum
 <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, Brad Figg <bfigg@nvidia.com>,
 Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Nico Pache <npache@redhat.com>
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad>
 <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 08s5cjcb9hl--LSHCsQ_dMtaCCBjc9wC9qkXD9ZlUJw_1739216779
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 10.02.25 20:35, John Hubbard wrote:
> On 2/9/25 11:54 PM, Geert Uytterhoeven wrote:
>> On Sat, 8 Feb 2025 at 18:53, Yury Norov <yury.norov@gmail.com> wrote:
>>> On Fri, Feb 07, 2025 at 03:14:01PM -0500, Tamir Duberstein wrote:
>>>> On 7/27/24 12:35 AM, Shuah Khan wrote:
> ...
>>>> The crux of the argument seems to be that the config help text is taken
>>>> to describe the author's intent with the fragment "at boot". I think
>>
>> IMO, "at boot" is a misnomer, as most tests can be either builtin
>> or modular.
> 
> Right.
> 
>>
>>> KUNIT is disabled in defconfig, at least on x86_64. It is also disabled
>>> on my Ubuntu 24.04 machine. If I take your patches, I'll be unable to
> 
> OK so I just bought a shiny new test machine, and installed one of the
> big name distros on it, hoping they've moved ahead and bought into the kunit
> story...
> 
> $ grep KUNIT /boot/config-6.8.0-52-generic
> # CONFIG_KUNIT is not set
> 
> ...gagghh! No such luck. One more data point, in support of Yuri's complaint. :)
> 
>>
>> I think distros should start setting CONFIG_KUNIT=m.
> 
> Yes they should! kunit really does have important advantages for many use
> cases, including bitmaps here, and "CONFIG_KUNIT is not set" is the main
> obstacle.
 > > Let me add a few people to Cc who might be able to influence some 
distros.
> 
> thanks,


Fedora has it.

CS-10 has it (-> RHEL-10):
redhat/configs/common/generic/CONFIG_KUNIT:CONFIG_KUNIT=m

https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-10/-/blob/main/redhat/configs/common/generic/CONFIG_KUNIT?ref_type=heads

CS-9 has it (-> RHEL-9):
redhat/configs/common/generic/CONFIG_KUNIT:CONFIG_KUNIT=m

https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-9/-/blob/main/redhat/configs/common/generic/CONFIG_KUNIT?ref_type=heads

So I think from the RH side everything is properly set?

Let me CC Nico, he did some KUNIT work in the past.


-- 
Cheers,

David / dhildenb


