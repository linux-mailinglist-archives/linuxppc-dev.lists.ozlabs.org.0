Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A58FDD90
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 05:39:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=S8KKg8Qy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvqnw0bWSz3cXM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 13:39:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=S8KKg8Qy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvqn74JbWz2yvf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 13:38:50 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42152bb7b81so41325e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 20:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717645122; x=1718249922; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+sCN4gd5xRSv8MbZzfOM4BQL071QPAHGQYJsY8mOBI=;
        b=S8KKg8QyyQK2xtGzDeoIbrE6ZPdHWBiQm+0JiFnF83WBe2zAEVzGh/8m3t5qsbyeLv
         SDK58Y0YC8dU0iWKovV0IDDToSdwfER/yBEuIL30wv3ojvxX5/hQA2Gx0D1CnbKeY+nN
         Sc5Q9UADcFnnkwHlNLcyoRJuIXTGpmNbtsvP6SQpJtnYu3ZjXKZYjmu77MeupLBYcQL7
         F2Yh21ncjNz6AtfAiiqfjfB111WFWjOVn4+KaNo+b7xOCeKwpGc6rtDaxLb7StBeJm4w
         v3cR5F2hPKA/hcrcjWFE0wKvv2VD2lvZEr/dmYdoM1Ok0EjwRNouztYZN5kUhc1IjI13
         st1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717645122; x=1718249922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+sCN4gd5xRSv8MbZzfOM4BQL071QPAHGQYJsY8mOBI=;
        b=D1XDYy16YQu1Zs6iIMHJzrv0b0HyWXJuuN3q6/Pywgw+LwomdsyClRywCE9iLiqU2u
         vg1gq/UUCChwJaTbYwGG+IXz1njh7TsOIjEY5ejSMc0sEHdk46Gx7BldpgkKLo+mMfT9
         uggMgBMIwUgbNZOrcddNfUDfcdblNaZN/B6RdM+a7XtYfrnUX7CUq+W+udQ7WPP0OtnR
         uyDqa4DH+wh+pYvmNEacc3PjnDATNReFYhNeF0Nhq/cpni68aucu5YeQgTe3AUMuLIlk
         sqvOXbOKy+6j7aS8URZiCasaljwPNvsnbTKcPSOJruTgupPEeooOL5fTbcp3Sz+7ACoD
         JhMA==
X-Forwarded-Encrypted: i=1; AJvYcCUUZ1LxhrZHr1eJ/VZYFf61UQeZB/yprEq61rpHr1UlppkZtDDhCpAfg5IjmVW/mJBrpYpQVF/uYeDca9VcnJeYQil9FyHcxa4ReUieyQ==
X-Gm-Message-State: AOJu0YwfAG3Ek3mQAXsfPnBDK1uihNFW+2UcTIIuxgK3u8bN2rcS20lM
	RZieA6zhhKY9zCYbsoY4eWj67he5b/FyDWfwH9qYDi5vzO6DpsrOU2LeM8YcSLJfB9CbsD9hv9z
	vCdUqdAkzlOHSu/OQjLsoH3DmZiwnhspuxiC6
X-Google-Smtp-Source: AGHT+IED6sI5jxhMT1wmnXVkKvgDEwPtPXeaSABuPbsUuWB+6ngoSn1LlcVFANBPnv+O+WxbFbVMvWEPm1NPGNA5yhc=
X-Received: by 2002:a05:600c:1c09:b0:41a:444b:e1d9 with SMTP id
 5b1f17b1804b1-4215b7a0ae5mr1228175e9.4.1717645121762; Wed, 05 Jun 2024
 20:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <45fc081c-ee8d-4774-a597-708d2924f812@redhat.com> <87tti6pxxc.fsf@mail.lhotse>
In-Reply-To: <87tti6pxxc.fsf@mail.lhotse>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 5 Jun 2024 21:38:04 -0600
Message-ID: <CAOUHufacbbpS3ghEwsQ-pObttnQk__xo0vjpGWXNq1i-bsuiGw@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Michael Ellerman <mpe@ellerman.id.au>, Erhard Furtner <erhard_f@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 5, 2024 at 9:12=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.au=
> wrote:
>
> David Hildenbrand <david@redhat.com> writes:
> > On 01.06.24 08:01, Yu Zhao wrote:
> >> On Wed, May 15, 2024 at 4:06=E2=80=AFPM Yu Zhao <yuzhao@google.com> wr=
ote:
> ...
> >>
> >> Your system has 2GB memory and it uses zswap with zsmalloc (which is
> >> good since it can allocate from the highmem zone) and zstd/lzo (which
> >> doesn't matter much). Somehow -- I couldn't figure out why -- it
> >> splits the 2GB into a 0.25GB DMA zone and a 1.75GB highmem zone:
> >>
> >> [    0.000000] Zone ranges:
> >> [    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffffff]
> >> [    0.000000]   Normal   empty
> >> [    0.000000]   HighMem  [mem 0x0000000030000000-0x000000007fffffff]
> >
> > That's really odd. But we are messing with "PowerMac3,6", so I don't
> > really know what's right or wrong ...
>
> The DMA zone exists because 9739ab7eda45 ("powerpc: enable a 30-bit
> ZONE_DMA for 32-bit pmac") selects it.
>
> It's 768MB (not 0.25GB) because it's clamped at max_low_pfn:

Right. (I meant 0.75GB.)

> #ifdef CONFIG_ZONE_DMA
>         max_zone_pfns[ZONE_DMA] =3D min(max_low_pfn,
>                                       1UL << (zone_dma_bits - PAGE_SHIFT)=
);
> #endif
>
> Which comes eventually from CONFIG_LOWMEM_SIZE, which defaults to 768MB.

I see. I grep'ed VMSPLIT which is used on x86 and arm but apparently
not on powerpc.

> I think it's 768MB because the user:kernel split is 3G:1G, and then the
> kernel needs some of that 1G virtual space for vmalloc/ioremap/highmem,
> so it splits it 768M:256M.
>
> Then ZONE_NORMAL is empty because it is also limited to max_low_pfn:
>
>         max_zone_pfns[ZONE_NORMAL] =3D max_low_pfn;
>
> The rest of RAM is highmem.
>
> So I think that's all behaving as expected, but I don't know 32-bit /
> highmem stuff that well so I could be wrong.

Yes, the three zones work as intended.

Erhard,

Since your system only has 2GB memory, I'd try the 2G:2G split, which
would in theory allow both the kernel and userspace to all memory.

CONFIG_LOWMEM_SIZE_BOOL=3Dy
CONFIG_LOWMEM_SIZE=3D0x7000000

(Michael, please correct me if the above wouldn't work.)
