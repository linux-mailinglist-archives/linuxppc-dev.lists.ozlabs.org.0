Return-Path: <linuxppc-dev+bounces-13285-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23484C06E9D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 17:17:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctRMr0vg0z3c8W;
	Sat, 25 Oct 2025 02:17:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761319032;
	cv=none; b=fhV3eolHCRHv3ZdYTU7Ax6Cvvf25D0cLctBUAsowDPGO6s+1B9PG4WJ8CcZ8zb/zTYG4pFyiA4Cpxi3bzVwl2SC0UWuSv2NXzDMfKfOoj+Praj6oB9IrVFEOq/ApPn96zAVdTvNx8MvPNrmYL7yYKVpTVHUquthuLTp5oUNs7RWULNTcqkpeEmiDG4V+qwwBMDic71fhSKK0mZzzHkx2l99hxfkDkz/c2C2Gj+Pa0bmdPSajTtlITCaFRMg35c1b1GSryeoGeD4cvJiwyofd1pnCR9JIrpdWxtNSCll8TIGLytT6jzaB5djOQIYFQ1rQXViXNNF4pIlniT03c1q5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761319032; c=relaxed/relaxed;
	bh=GlFP+E/QMyxi4Ffg6P0msiZ7Co3+zXi/ANozyDYceBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgux9LPxEK+ABLel1YadRsO2zkf6c6xLVRSSBc1pcL8QeWBzb1BUtmyE3Uso77xq0KUWaSPZ05kyy/JDUv3UJqyD4WXSMiQzP7+X1aT6Kae4/wLSDVer3IsIgO5CIhqIryImxYGdOfhVkr6qe9gN33QCo1Pw17Qgn5VSGxBeRlno7qXR/fs/SZjcJ4xXxJlfAD424dhAE9eNGTZAHlrhQOC53eEIHWlPAj7XYFh+mKxYx0qUacOljSMk9sBXNtSeuUlVz3PtdW0HC0QnSoPzQed/Cijh5CblYE9ZVOOpKsYfPmYl77EckvPP7douum1ZblHma3pepl+prxT+soie4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HcFaZIuL; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HcFaZIuL; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HcFaZIuL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HcFaZIuL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctRMq16wtz3c5y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 02:17:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761319026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GlFP+E/QMyxi4Ffg6P0msiZ7Co3+zXi/ANozyDYceBA=;
	b=HcFaZIuL2fgKpfwF1GS3ZMeTs1SeiXQQTXs88MqW2QrvbcrlEFB+vE0jE54X/9jK9t1YI/
	3eagloXsSVB0cYI7z7hPt+hMRLOLhz8HJNeJ+dKwjcK6OmncgXJDIxtj2+cLLX5gHqcF/e
	uXZXwyfhSn01iQtMRGORDQCXptpzvdw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761319026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GlFP+E/QMyxi4Ffg6P0msiZ7Co3+zXi/ANozyDYceBA=;
	b=HcFaZIuL2fgKpfwF1GS3ZMeTs1SeiXQQTXs88MqW2QrvbcrlEFB+vE0jE54X/9jK9t1YI/
	3eagloXsSVB0cYI7z7hPt+hMRLOLhz8HJNeJ+dKwjcK6OmncgXJDIxtj2+cLLX5gHqcF/e
	uXZXwyfhSn01iQtMRGORDQCXptpzvdw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-4fYOOR8qNviUIJ9JWq3hCg-1; Fri, 24 Oct 2025 11:17:01 -0400
X-MC-Unique: 4fYOOR8qNviUIJ9JWq3hCg-1
X-Mimecast-MFC-AGG-ID: 4fYOOR8qNviUIJ9JWq3hCg_1761319020
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-429893e2905so1656093f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 08:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761319020; x=1761923820;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlFP+E/QMyxi4Ffg6P0msiZ7Co3+zXi/ANozyDYceBA=;
        b=qqsIPkvSoOaKsesFR+DKcbrg3g8EWG8iUu/yHxkwst2AtZRraSv7fMHVDWsBm+co2E
         1CWVn6dWlNDeh6fasUGStHF5CQ+p0ijJprYKp7DUlmtaAnQwMWcq0ESTlaDQ0ZwMWQpn
         ltM4+Oiy2wGhv4XAfarEFqSlYe1+B9B63n+ll2X502lFN3dYeGwNqQovO60Ul8GlVS4s
         t73/m52xL6xT87wPow9jcB5Gzy5AtBSwUFP5Tt+DgIwettpd7RoPWLY71NuTTMnXs73q
         3VanZOlDbHDCeJx63oYdVHzoCrtf77Kpe7X2GfUfs8V7sbNXlqieMpgZ7dd3MM27MIXY
         PhWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjxJFQ7SyTuCMYx28MsZrb9AChrkFRW5oq6DsT4LSu0/Mid5GbK+CRIYjzqNoS/n8agNzDBamFRLr1PCo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzZVluB/VeIxvjlJBPw8b0d52Fsk8tAwLTOEx2ybfU0RJPrr4YS
	ci3F6TPh4ViKCbFpzJJapkArq9y1uHousU+cy82GoGyC0oBJW0EYgPWUzUG6FIAXO/yVdZ0FeRu
	Ruvx+IS3XKfqVgdChzpRplcOu1MB77uafUjlB9tOjcSsXVx0wYeoX4ivq8GpF5OAfVwo=
X-Gm-Gg: ASbGncs69gMYO4SnUjlf8PVSzwfDnFyjYu75Nm8t2vRIrORPu0gXFxzamW0PxSKcBaf
	ZwB90RQkedQ7lv7IuvJ0wPKwdHeSGiHxKAeslpsjeTME9TzOK5Q3FBGvfi28i9EJFaHa+iKF0OK
	x7GumF73QVsuFyI/OEMgw0nUzBn1+GDsbztY7z66uhKQuCYyIFF9IYeRrYU4h2R27/YC7jjN9I0
	88TNLmZbAj+jjhYFItk4uYoS3L5ICrC8l6AqpVx2PE1xctEN39COTdbdLM3dcKZ+I61TDo3tjsH
	uot+dLFPNqiPWwmLEO8YlGRyKWoczIxmNPnLH2XocDNqSrWKE7MLMLGcqvo2uZqzEwfsDKK/dfT
	D+60mIf2LfHEu5S3qC68Tn3dZJ+I1b0pThZDKqA0Na5FDz8AjoEuqi1Au9KhXPZh6dxC6zad8mn
	XDh51UF7DE2ukqw3fmv9JY10tOOhk=
X-Received: by 2002:a05:6000:2383:b0:3eb:7f7d:aefb with SMTP id ffacd0b85a97d-42704dc3748mr22122786f8f.53.1761319020046;
        Fri, 24 Oct 2025 08:17:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtnwuBHyt8rK4Gm7hxH2zJL+lCurT6SdXrynTA2FlfcUyPVPmZWy8oSZeIJ0KwzcUvqy9foQ==
X-Received: by 2002:a05:6000:2383:b0:3eb:7f7d:aefb with SMTP id ffacd0b85a97d-42704dc3748mr22122761f8f.53.1761319019571;
        Fri, 24 Oct 2025 08:16:59 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caf15498sm112647435e9.12.2025.10.24.08.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 08:16:59 -0700 (PDT)
Message-ID: <1f81548e-18f2-49bf-82bc-e0dc667b78fd@redhat.com>
Date: Fri, 24 Oct 2025 17:16:56 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: David Woodhouse <dwmw2@infradead.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
 <cbe0d305cce6d76e00b64e7209f15b4645c15033.camel@infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <cbe0d305cce6d76e00b64e7209f15b4645c15033.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FTbQHcht9ps8weLkjxJrv0ojVKF9Ri2PUKaexzyQP2E_1761319020
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24.10.25 17:13, David Woodhouse wrote:
> On Fri, 2025-10-24 at 16:51 +0200, David Hildenbrand wrote:
>> On 24.10.25 16:47, David Woodhouse wrote:
>>> On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>> We currently set a TIF flag when scheduling out a task that is in
>>>>> lazy MMU mode, in order to restore it when the task is scheduled
>>>>> again.
>>>>>
>>>>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>>>>> mode in task_struct::lazy_mmu_state. We can therefore check that
>>>>> state when switching to the new task, instead of using a separate
>>>>> TIF flag.
>>>>>
>>>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>>>> ---
>>>>
>>>>
>>>> Looks ok to me, but I hope we get some confirmation from x86 / xen
>>>> folks.
>>>
>>>
>>> I know tglx has shouted at me in the past for precisely this reminder,
>>> but you know you can test Xen guests under QEMU/KVM now and don't need
>>> to actually run Xen? Has this been boot tested?
>>
>> And after that, boot-testing sparc as well? :D
> 
> Also not that hard in QEMU, I believe. Although I do have some SPARC
> boxes in the shed...

Yeah, I once went through the pain of getting a sparc64 system booting 
in QEMU with a distro (was it debian?) that was 7 years old or so.

Fantastic experience.

Only took me 2 days IIRC. Absolutely worth it to not break upstream 
kernels on a museum piece.

-- 
Cheers

David / dhildenb


