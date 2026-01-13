Return-Path: <linuxppc-dev+bounces-15612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD16D16E76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 07:51:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr0KT00yjz2xWJ;
	Tue, 13 Jan 2026 17:51:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768287116;
	cv=none; b=n775V9JnWleIe6xgU8eyIsKxt5RerW/BasI+BYC0zSPjp1vj6BzJc8ouv68Tlpkp7q1byc6FRAUhzP5WgmHfxvTDzHIqS28rT7emrS/gmxstizR4T59dNjf6iUpPyBADvUV+pvyESeLijFbibdfqvcNTuwW2lO57Eu1f7HcapNNV+E95EQpUHy4heh8ygfnVuEGZYdtBVCRF68XTYM7AQ27eyLo6BQTctTHdxHeek50+OeBSjA81GRSwHrJLBBud/c4py1brjaoub4VZ6/LsVPgwDBzpFhwErpdlUW4lTy/ilL9lKY+uxESdw00rMqq1pCewEGH2cFzbWoFRYY/uZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768287116; c=relaxed/relaxed;
	bh=vX59/flKMUDb8zjb/CqTAfKlTuGyJwgf2lJ9POWv81Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5lSvqeK81YIxi5RAi8jpaIa8Rmetr4O/8mtuyV5wstG2SNfDxKo3YS8kab1WhqSttGnGvQhc/aIzwTII5CQArtkL84WrM/tclZITcuNJ93ReVTiJPBIHpSbuQuI4M8nMQvt8fgBO5Fc0FExPC8Nvwrj0w5XVl4F6NeQyOumJBlMoDPG8PYhAV7DqNhDBmZ515ndaIpcnVE6fn+A/4KKguqKstIu7T3qhFOTb15Bg1EDFfeebIm9CSao9mlJoO/B0kYl124dA36pP+K5HsgILV4DF50ogI9Z4XyKPn/w8pgzRcD3pM12+eOSwT4Jc2BzLI1Guqtn2k8vDlYkw8CCgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fk/gbY/C; dkim-atps=neutral; spf=pass (client-ip=209.85.219.43; helo=mail-qv1-f43.google.com; envelope-from=kaleposti@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fk/gbY/C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.43; helo=mail-qv1-f43.google.com; envelope-from=kaleposti@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr0KR0Dbnz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 17:51:54 +1100 (AEDT)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88fcc71dbf4so45770776d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 22:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768287051; x=1768891851; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vX59/flKMUDb8zjb/CqTAfKlTuGyJwgf2lJ9POWv81Y=;
        b=fk/gbY/CrtIhLdBWy0ey/Wdpcm40BHhrXnrfctGQvJkOdQf1UCmrBpYfvZUQ52sMEf
         6DUquMmn0/nr8frjLq9NtCxfq87mMLk1hoKoCP2CKLJ4kS6C+bU9KfpBHiiOyHK0LysZ
         74XmNtEdrQKnl9UsiqlJc2M9VSncS+C9nRw+9x+Zu0D7rOCUm50LaTURyhzCLGS0y8yt
         gC1ZgypRQUz3NNqlieEcssczPm8ybtDyRpXklFj/acltN5UiPOjdg0ZPuyhYvktnP+t0
         He4aHhUG97Dz2sQUY5T+jbJrqILq7pK4lGqM6iBpJvsOdUUvJvW3HiriiIGnMnX/K7Ax
         B8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768287051; x=1768891851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vX59/flKMUDb8zjb/CqTAfKlTuGyJwgf2lJ9POWv81Y=;
        b=w+YJjPEbRgy53cu/VVn099QQhpCJdjJ2fg+vLTfegBqpM6JIQ7f98EiIr6D+U/+jI/
         qeCfXuCS3UnuJTlvhli8hBb02npdjUtdowFgR6FPLz/8lOAlD16bX4u1QWdGLTmWxsv8
         P6U++QPKQGwv9GgaO5qIyUvhx/fhLRCa+lUgAKKfRqP5MnyzwA6kmdgAwWtLzzYx04Sj
         /zHyu53KyNtnY61BQGCpookwyIX//gYXNvIWLxTdj8b1S9OiFLicOeYE4VEYY5ewVtUM
         6c2Hwp6ulCXYAMyNtGAmdaM7c2Jj+mjvbHVvmFtETITUFtD6McWmfG4Mx0wg+pU8kmdo
         kdvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTDcu05hdY8tJrHTafNhValZbiQ/jGxwtN9RU9Lywlhc6CbzrdKQhu4mQpCu1xEoCAs8YpqA96cc+j7cg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2nNFhybHkT48mKfNk3TXAwFhVOgfRa/AQYfUNuBCq2GQbZW5f
	lKfWXZiv5H3YfQvOYac5NVxkMEChRvwvORuYQoEfbYJKv+aFPXvVf8FP
X-Gm-Gg: AY/fxX459P/0bHSopdyLiKKKrGM0YmSi/O+T6RwqSamMwyjmNrFYECg9VvgflaYIyVl
	45mN0zFM+pL08tdtWsi8fLSzMxxu3y+SIcsaOf28fioLbVAOUG4xMKGPhNmo/Ulvfile62CyGUl
	GVf9pJzmhghDmBCWO3NsV/R3i4tXZqU5LJd1rk4gU0vwW7VSc2CnAOjlUYo3dGNRI5l+miLBNSa
	AECSC6M3K04LbHL0ki/8z8WfXet7D0L8f6d21zEcCaU1TUFL6bm1zzZD31FNiqemwpYKwjs9jjk
	uSkJ9k+b8OiJcAtnm6T6468t4j2rMqpSLEC4M9L13r5W5PI2Dhx3J0syE+BeF9rAhhAmd6Nl3FA
	PAX2OrvcZlMFW+X4wUaoiOpgEfhqyd84z39UkyRTpv9yKgEB7LfqoR1GRfYAjCKD424shSIJrcU
	34lk4XAmCHJVgK6atF9SdOKVIGpu+8gUxq9JxjwwidxvwcBh/rwjRJmlRrGA==
X-Google-Smtp-Source: AGHT+IFA85MjM1cnTGL5nks8UTBaUTRvSeGOw/MqVWENdA/8we2okwkLgNeF33lCoaLlOIlw7RP7mg==
X-Received: by 2002:a05:6214:4291:b0:888:81f1:a05e with SMTP id 6a1803df08f44-890842d1be9mr273660036d6.60.1768287051243;
        Mon, 12 Jan 2026 22:50:51 -0800 (PST)
Received: from [172.20.10.9] (mobile-access-c1d2ca-216.dhcp.inet.fi. [193.210.202.216])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cdfb0sm152433806d6.6.2026.01.12.22.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 22:50:50 -0800 (PST)
Message-ID: <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Date: Tue, 13 Jan 2026 08:50:33 +0200
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
Subject: Re: [PATCH v3 00/29] arch, mm: consolidate hugetlb early reservation
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Ritesh Harjani <ritesh.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260112142323.495fc43e662e7d276b0fa371@linux-foundation.org>
Content-Language: en-US
From: Kalle Niemi <kaleposti@gmail.com>
In-Reply-To: <20260112142323.495fc43e662e7d276b0fa371@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/13/26 00:23, Andrew Morton wrote:
> On Sun, 11 Jan 2026 10:20:34 +0200 Mike Rapoport <rppt@kernel.org> wrote:
> 
>> v3 changes:
>> * fix empty_zero_page initialization on arm
>> * fix ZONE_DMA limit calculation on powerpc
>> * add Acks
> 
> updated, thanks.  I'll suppress the ensuing email flood.
> 
> Kalle, can you please retest sometime, see if the BeagleBone Black boot
> failure was fixed?
> 
> Seems we haven't heard back from rmk regarding
> https://lkml.kernel.org/r/aVrUDeSkqqY9ZCtS@shell.armlinux.org.uk.

Hello!

I will test this v3 patch ASAP and reply results here.
Collective sorry for the delay; I have been busy!

BR
Kalle

