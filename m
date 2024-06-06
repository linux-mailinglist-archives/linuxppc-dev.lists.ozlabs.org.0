Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBFF8FF427
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 19:56:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YXD83bcl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwBpb6Bkjz3frD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 03:56:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YXD83bcl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwBnq0kxrz3fn4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 03:55:42 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4215b888eabso7125e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2024 10:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717696539; x=1718301339; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70T0ZceHUGMDadFXNyVFFMOsXxBYbdVP4L874egq+7s=;
        b=YXD83bclBtsG/WBFTAuRSKqUQ6VfBTwaIL3+3238fzmCnOUb+9W8t8R30j+TS0Ezcy
         +c7B0GqxxYa9I9fz2wzIH5pfjrcl0b/qr7u/7ZtvRZW9IcPdFiSrkDL/B1MUqrGpg2SU
         zYi/1M4yaNO6cfDdaUPm027F5T70b3kpmnOc/nmFO4P90R0/X7fGa/wFZzqeOKHmoqz/
         GdU3LUP6RfVvjlJ2bYOj5nAnzdWKuFET+/mN2vhYa84sh/jazRcozq5+0RHsZ5p1+XHb
         UnAAVQlq+L1S2K7pQMfEulgfATY+5ANccRBIzN2qyrqAYA+5PqCZmQmWcn43cJZZRQA1
         pJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717696539; x=1718301339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70T0ZceHUGMDadFXNyVFFMOsXxBYbdVP4L874egq+7s=;
        b=piSeT1nPhNymKoH/6I6fM3yJUdniflbNv13xRV28PSydgWLEfSzeGelW8nNERdEkL8
         TqHDY9JOhKEFRS8m53p3mFPqEQDyMmRcCAbACtEoYBtrXOTKZ5kL/lMH6+qAwcDDtxSS
         ImG/67ohLnCUDdxoQr9HcRwXl10z8YwcQaMyXBdjqjy2QQ7qj31aip3B3gAilGEl4bPt
         99dGzVXqs2AGmlv5Gp2o45rU62Ls16lSz7RUA7MNh/q1wz5CQzOuLWNmLfOXVSNV2YOw
         JQubiWAx9Ice4HyprJrCy0RCw3B3H/J/lk5UJIAf8QhMSQx8R2fKRhUho+HSt+vpWQkY
         b/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWX4gfh9B3OwKaBGiYFB1HVfHtrOkc5U205AwzA4lW97TDfVSLI+CxgiTpzkDdmysjMcqMYH2anyFTtzWLAIk942ut5bb6QB2bxw4/GxQ==
X-Gm-Message-State: AOJu0YxQCs66/DhaDEWGK04Y8fIdYhgJpwQf7HW/80C3/22Ji/iiDw9x
	deU9LdjmmTEyj2eAhRUTpX2zmmwGyQg8aIYOCHPO1ax9okI5TH3DzsfUxG0RDgLkxgCLR8uRuVN
	T+/jczyNFjKepr/neR3Gckjde+ZvsYRXk85Ye
X-Google-Smtp-Source: AGHT+IFZtJxK7Ij2aoXQ49eZ6ipGl1snqySio37b8bnykUERrojlAvUSBz+QPxv9HYNFs66SlKfYn193ri6nP3w5/YA=
X-Received: by 2002:a05:600c:1c90:b0:421:5288:8360 with SMTP id
 5b1f17b1804b1-4215b327e13mr2782465e9.0.1717696538477; Thu, 06 Jun 2024
 10:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
 <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
 <20240604134458.3ae4396a@yea> <CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
 <CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com>
 <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
 <CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
 <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
 <20240604231019.18e2f373@yea> <CAJD7tkYq5u7B+0UH2XKpeWJnUxoO2kJ1_XZ2JOgYpyNEVR7u0g@mail.gmail.com>
 <20240606010431.2b33318c@yea> <CAJD7tkbhWYzx=6YmzAh0F+cK-_Bn8mPOH7gMbQS7YVXmaFSgFg@mail.gmail.com>
 <CAPpoddc2vOLdQJ7HwG7x+=oZsTz221+YJcNbUtKvPjA9AyeY2w@mail.gmail.com> <CAJD7tkb2b0+4_m0gb8DKSTtRwtC2GMa9NF5RuGKhXJARYHK0gw@mail.gmail.com>
In-Reply-To: <CAJD7tkb2b0+4_m0gb8DKSTtRwtC2GMa9NF5RuGKhXJARYHK0gw@mail.gmail.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 6 Jun 2024 11:55:00 -0600
Message-ID: <CAOUHufZ_dKpts4uW4Xg3jVYnX5Z5MN9U9icxhP0Nmz7QnqurBQ@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Yosry Ahmed <yosryahmed@google.com>, Takero Funaki <flintglass@gmail.com>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Nhat Pham <nphamcs@gmail.com>, "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 6, 2024 at 11:42=E2=80=AFAM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
>
> On Thu, Jun 6, 2024 at 10:14=E2=80=AFAM Takero Funaki <flintglass@gmail.c=
om> wrote:
> >
> > 2024=E5=B9=B46=E6=9C=886=E6=97=A5(=E6=9C=A8) 8:42 Yosry Ahmed <yosryahm=
ed@google.com>:
> >
> > > I think there are multiple ways to go forward here:
> > > (a) Make the number of zpools a config option, leave the default as
> > > 32, but allow special use cases to set it to 1 or similar. This is
> > > probably not preferable because it is not clear to users how to set
> > > it, but the idea is that no one will have to set it except special us=
e
> > > cases such as Erhard's (who will want to set it to 1 in this case).
> > >
> > > (b) Make the number of zpools scale linearly with the number of CPUs.
> > > Maybe something like nr_cpus/4 or nr_cpus/8. The problem with this
> > > approach is that with a large number of CPUs, too many zpools will
> > > start having diminishing returns. Fragmentation will keep increasing,
> > > while the scalability/concurrency gains will diminish.
> > >
> > > (c) Make the number of zpools scale logarithmically with the number o=
f
> > > CPUs. Maybe something like 4log2(nr_cpus). This will keep the number
> > > of zpools from increasing too much and close to the status quo. The
> > > problem is that at a small number of CPUs (e.g. 2), 4log2(nr_cpus)
> > > will actually give a nr_zpools > nr_cpus. So we will need to come up
> > > with a more fancy magic equation (e.g. 4log2(nr_cpus/4)).
> > >
> >
> > I just posted a patch to limit the number of zpools, with some
> > theoretical background explained in the code comments. I believe that
> > 2 * CPU linearly is sufficient to reduce contention, but the scale can
> > be reduced further. All CPUs are trying to allocate/free zswap is
> > unlikely to happen.
> >  How many concurrent accesses were the original 32 zpools supposed to
> > handle? I think it was for 16 cpu or more. or nr_cpus/4 would be
> > enough?
>
> We use 32 zpools on machines with 100s of CPUs. Two zpools per CPU is
> an overkill imo.

Not to choose a camp; just a friendly note on why I strongly disagree
with the N zpools per CPU approach:
1. It is fundamentally flawed to assume the system is linear;
2. Nonlinear systems usually have diminishing returns.

For Google data centers, using nr_cpus as the scaling factor had long
passed the acceptable ROI threshold. Per-CPU data, especially when
compounded per memcg or even per process, is probably the number-one
overhead in terms of DRAM efficiency.



> I have further comments that I will leave on the patch, but I mainly
> think this should be driven by real data, not theoretical possibility
> of lock contention.
