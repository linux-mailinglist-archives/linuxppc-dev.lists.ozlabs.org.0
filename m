Return-Path: <linuxppc-dev+bounces-4092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 886189F0638
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 09:20:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8j2C0yZYz30jV;
	Fri, 13 Dec 2024 19:20:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734078019;
	cv=none; b=e8B96ggyUN3G4HEJFuLulxtMja/UEybZF/pfrCGUruJx1dA0tqnyWBwHkHP+iKKybqPFyZT0YUSbNmKzL7GJRDMecHCDftr1OyUycjhZ8VEoo3qTbCIvKSi5BGz74SBes/1R+wsJCmuE93D2xq/OUsmeRDxOoerUrC9Yo/CA8fm4dIB1JwF3eNOLNylp64xCr/FOpPfvMqmFbFxCj2teqXqmKRNF0rstBX/02FFidiVExAUwzfQtv7cNiLmIlI0+j7P7SkLeIiz6rP9Bl9X5LH6qC4T3nGtliP4AG+KkRnWaB4ufWW71Nwj0EFbL666GNB0HLsqhHAizV3WpFyGKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734078019; c=relaxed/relaxed;
	bh=UV1wwUvDbgVjftsKa9dU87wk1sPiYCmEM4UeAtv1RqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEnG4BjL/yGz1kC9GbrZKTHVDCvZ+TsYTPe9XUy+9SP1pRWqCUyvy/iDnXD5kOUElesEh2U0vtUGBfA2VcWZeqEpX/fQPxWAozwAAO4kIL8KYFRaf1gBbKsLyLIhn+J1Dm+jmJPilF0pIqKZiYDa0Vsm7mlhUFmK7+e/shzzk34k3VsKDKyff/Yl4TDG0lH3jOEHg433wY0k6c6Oq+ptNcloslhaoVKCUhxmUyldrXu/WRHNxrTih2dyVgHnSZBPH+RJo/quHtvF/QQfFU5K5PAOQqY2lza3agq9682sV65i4l0z1YP7/Er0MJZqVTsrwyK4kXpxj92kKA+l3OdDMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GXvilEp7; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BWpvevPw; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GXvilEp7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BWpvevPw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8j295Nhkz30gd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 19:20:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734078011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UV1wwUvDbgVjftsKa9dU87wk1sPiYCmEM4UeAtv1RqI=;
	b=GXvilEp7JoxI9OBm9dTTOnRQEWeFGOwr5iv8dPr0Fsxf4GcvdPnzlGzKAWJ0WFOjtpJIC5
	p1+J3nVyp9n0QCT8mESe9Y4j3hkxNKJQe1pBtOAFbNBbwkMj8lBgPNgYV7pyHY3hNOXWlU
	xAtCeX/aNwmbtpvRDkHDq/wO/p//hRw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734078012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UV1wwUvDbgVjftsKa9dU87wk1sPiYCmEM4UeAtv1RqI=;
	b=BWpvevPw18OkrYmM6d8fRjR7uQMdoVAiJ84dnUJ4OOdCHmZ8G6livuMPnvxPiabfmebmdn
	168l6GHOENoEWUf/kkw6G5usuCtPF6rJDFJGpziJeKIH1bekjO9mzGcuYN1v1w7qBPtxrs
	xaSwyTY+LNzKLPG2QxuoZ4Gmf+2Lviw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-dW-qNwhNMoSI0H0FIGtiIQ-1; Fri, 13 Dec 2024 03:20:10 -0500
X-MC-Unique: dW-qNwhNMoSI0H0FIGtiIQ-1
X-Mimecast-MFC-AGG-ID: dW-qNwhNMoSI0H0FIGtiIQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3862be3bfc9so754900f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 00:20:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734078009; x=1734682809;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UV1wwUvDbgVjftsKa9dU87wk1sPiYCmEM4UeAtv1RqI=;
        b=qaIprUv5fVsZv2p9FVGD8nYG6lOvyyvk+3rNZKezu9JfgJEKaxwbbwlWCZOocLpoLZ
         ktB1tNc+0g7BN7iUv4fmz3/z0gRhTUaE7ETqfATUWWy14P/PfciRd+5OsAmcV4iAhFF0
         z8c6xVzrfctSl7NPApBWBO+sqorYgtq72t89pU7/r8+aF74OeSlo7Fam+rJyj3u8xPZI
         puOdLU8/juuCr+UPUGOMHsVj9xQy42lOIL7weloIOlyLsIcJJNSYwr1Xe5+XGx+pLWpt
         tvSFx9GOQEcP3qgD6YL6VwNivrIgdMjbPmOK5KvHHCGxib3NiMhSFITJbe/I370DF+3z
         +8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9HEQF/aRjSomp0lSUveK1H1b7uwkFv/+WfR+N5ijKVVRO8mFpkx8kWHVRZh5IjmX/XX0JtX5H1xsF9KQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1wDHXu9zQsTgMIOC1fjKrjVtINEY8lNlswf6BhJduEfUDLoxv
	lvHUVyVo/i8rYCkzSLf19gp0WBVjotWEcFK9kMLRESJpdPj/am0o3O8gvoZotoaTlWDqPnNiKr5
	xkhkuUbB+oBWVRk24Lmh6+rnx45CbyYNIBeZ8AetndqPrNdqEor1Tle+cPdFAm9Q=
X-Gm-Gg: ASbGnctMM6k6uTvl+XnRH5Mhij96vcGkTCiT8bPwCTJE6uo6MqPcKSDm01CLpGGecue
	byrpN5PpUtQ65FPzhwmRq5TSymPr1aitT7JVOLJMyC4sFYbqNx/HzWySEkYVIdZ1KERSRTH1hcR
	2cMt/U82X+9a/IBxCv0glKKYxU05ksY2pgL7XwSzHqT/AYJ8MAcfKqlR77M9oqlTYgiaTtl6WrK
	Fc7oxjzoZKATms8zS0rPHO85BDHyyNGwid8jXhN2yBY0EF7d0pl3fQNH9U=
X-Received: by 2002:a05:6000:1a8e:b0:386:32ea:e70d with SMTP id ffacd0b85a97d-3888e0ba2f4mr910623f8f.50.1734078009106;
        Fri, 13 Dec 2024 00:20:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrCHiXBGnM5x0F9+IJDtAVhPlkiWHtx4O9ovcSIL7K/Npye3omEspq5dEzagyGc9xjVrwPFg==
X-Received: by 2002:a05:6000:1a8e:b0:386:32ea:e70d with SMTP id ffacd0b85a97d-3888e0ba2f4mr910591f8f.50.1734078008749;
        Fri, 13 Dec 2024 00:20:08 -0800 (PST)
Received: from [192.168.10.3] ([151.81.118.45])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4362559ed8dsm42786805e9.23.2024.12.13.00.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 00:20:08 -0800 (PST)
Message-ID: <79b9abfe-cfb8-4ef0-8a4b-7b87787e6549@redhat.com>
Date: Fri, 13 Dec 2024 09:20:05 +0100
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
Subject: Re: [RFC 0/5] KVM: drop 32-bit host support on all architectures
To: Arnd Bergmann <arnd@arndb.de>, "A. Wilcox" <AWilcox@wilcox-tech.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: kvm@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20241212125516.467123-1-arnd@kernel.org>
 <35E5C2A3-94AC-446B-A0A1-84B043DBC890@Wilcox-Tech.com>
 <6e971322-8b21-4d73-922c-a6032c6fe9bd@app.fastmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <6e971322-8b21-4d73-922c-a6032c6fe9bd@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gs-bqNaAsgAY5fQrS6sOVhnKQDaVS6VEmVUvhcEJib4_1734078009
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/13/24 09:03, Arnd Bergmann wrote:
> On Fri, Dec 13, 2024, at 04:51, A. Wilcox wrote:
>> On Dec 12, 2024, at 6:55 AM, Arnd Bergmann <arnd@kernel.org> wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> I submitted a patch to remove KVM support for x86-32 hosts earlier
>>> this month, but there were still concerns that this might be useful for
>>> testing 32-bit host in general, as that remains supported on three other
>>> architectures. I have gone through those three now and prepared similar
>>> patches, as all of them seem to be equally obsolete.
>>>
>>> Support for 32-bit KVM host on Arm hardware was dropped back in 2020
>>> because of lack of users, despite Cortex-A7/A15/A17 based SoCs being
>>> much more widely deployed than the other virtualization capable 32-bit
>>> CPUs (Intel Core Duo/Silverthorne, PowerPC e300/e500/e600, MIPS P5600)
>>> combined.
>>
>>
>> I do use 32-bit KVM on a Core Duo “Yonah” and a Power Mac G4 (MDD), for
>> purposes of bisecting kernel issues without having to reboot the host
>> machine (when it can be duplicated in a KVM environment).
>>
>> I suppose it would still be possible to run the hosts on 6.12 LTS for
>> some time with newer guests, but it would be unfortunate.
> 
> Would it be an option for you to just test those kernels on 64-bit
> machines? I assume you prefer to do native builds on 32-bit hardware
> because that fits your workflow, but once you get into debugging
> in a virtual machine, the results should generally be the same when
> building and running on a 64-bit host for both x86-32 and ppc32-classic,
> right?

Certainly for x86-32; ppc32 should be able to use PR-state (aka trap and 
emulate) KVM on a 64-bit host but it's a bit more picky.  Another 
possibility for ppc32 is just emulation with QEMU.

Paolo


