Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338F8FF9DC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 04:04:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h0Y81llp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwPdp376Wz3cmg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 12:04:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h0Y81llp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com; envelope-from=flintglass@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw9t86cShz3fRK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 03:14:23 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6f938a7f492so613838a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2024 10:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717694059; x=1718298859; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/1l2hgdu4GOtQ+Ob2oTmSMpsc9q1e6vX4IAFQSksuY=;
        b=h0Y81llpVMlohfEE/lYbvUsY7476g3YDqO5IBkU3L2fc2sWzMK5xm6MmyOK+ohcnHB
         SquBFBiiK4NUviSKqiuLi5dvKOXpsMKUyFVUlKtlrnFLUIO3c1c1kulBsLlLIycU0arF
         jdox7vWwjvFb25iak1d+m09fE2wllTP8RAVTQlP/ptYlGAz4e7GVF3oOZ13X30n5xwJt
         DXLlZOPVamRweh3Z3100XVNHUQXWorfy9y/QuGoCG659+zTmV43i5l8uA60eqzCZxD0w
         SaKIaaf5MeJ7rwN7h5IWiuESMpwJfTVQVHvHk1bX07XMUx26xjUgmfHJX4HUzJeJiMkE
         Y6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717694059; x=1718298859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/1l2hgdu4GOtQ+Ob2oTmSMpsc9q1e6vX4IAFQSksuY=;
        b=iondr4F3uyEoqPIQSHcoYyLBXYQlkGHUDMNN4S0+xCDtk2m9hExqr9F/e1jpu1UImf
         AJfoLCyhtjFlvKSkEdQCXi7+1tFgSQ51GI9TJYgg0ql/+Z4bh/LmEUdRxV1fapWx6z0Y
         S82mSsyYVIXvpo4H7eQf3nU782WSxX/QbW0ocFvET2sMUzgP6267flA9jr2swNv5s5HQ
         rnj3SCeqREwpMMhh8zOcWUPrKA3eDr8ote0aO9c7OXmDOfeDWO/omwuonmdp8rDdO9Ab
         nWf65ixDvyaTy5YvluASB+1/wdx/4TQoF+AaRlkuClFMG0Jo1BVU8i3azUDRI8ldRdRe
         AMXA==
X-Forwarded-Encrypted: i=1; AJvYcCVUZCW7RQc7OSHNomE31ZeFWZ/9Gkpghj9Eb+0mShxqD3t3rHIpWuLrKnleaW/MyjPqYTf7RGcweUwddD1+lgFDuz8ECq3m1sL9nK/pfA==
X-Gm-Message-State: AOJu0Yy31OB1AiC/37cx58uP3DljGFrgcTaGxnn6FMq9SJzfSLgD1EIs
	N/SsUkgEVwzWZ5miAvDz5xa4GAzDHOLMa6Ni2tmEO5EevsJiE1mFzHj+HDr2Lc5kgHMKD1rA167
	ZcYyO6fS5NTRtbPb8o2AsNvq+EQI=
X-Google-Smtp-Source: AGHT+IFWj6gKymPuX65qB3SLiTcr/L24kWgHP0A2qAXzrNU1UqM44JmLCxgMounxH46aeClTSRC9dMKKMGyWy81enQM=
X-Received: by 2002:a05:6808:618:b0:3d1:e059:fec6 with SMTP id
 5614622812f47-3d210d2b29emr63262b6e.3.1717694059455; Thu, 06 Jun 2024
 10:14:19 -0700 (PDT)
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
In-Reply-To: <CAJD7tkbhWYzx=6YmzAh0F+cK-_Bn8mPOH7gMbQS7YVXmaFSgFg@mail.gmail.com>
From: Takero Funaki <flintglass@gmail.com>
Date: Fri, 7 Jun 2024 02:14:07 +0900
Message-ID: <CAPpoddc2vOLdQJ7HwG7x+=oZsTz221+YJcNbUtKvPjA9AyeY2w@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 07 Jun 2024 12:03:56 +1000
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Nhat Pham <nphamcs@gmail.com>, Yu Zhao <yuzhao@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org, "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

2024=E5=B9=B46=E6=9C=886=E6=97=A5(=E6=9C=A8) 8:42 Yosry Ahmed <yosryahmed@g=
oogle.com>:

> I think there are multiple ways to go forward here:
> (a) Make the number of zpools a config option, leave the default as
> 32, but allow special use cases to set it to 1 or similar. This is
> probably not preferable because it is not clear to users how to set
> it, but the idea is that no one will have to set it except special use
> cases such as Erhard's (who will want to set it to 1 in this case).
>
> (b) Make the number of zpools scale linearly with the number of CPUs.
> Maybe something like nr_cpus/4 or nr_cpus/8. The problem with this
> approach is that with a large number of CPUs, too many zpools will
> start having diminishing returns. Fragmentation will keep increasing,
> while the scalability/concurrency gains will diminish.
>
> (c) Make the number of zpools scale logarithmically with the number of
> CPUs. Maybe something like 4log2(nr_cpus). This will keep the number
> of zpools from increasing too much and close to the status quo. The
> problem is that at a small number of CPUs (e.g. 2), 4log2(nr_cpus)
> will actually give a nr_zpools > nr_cpus. So we will need to come up
> with a more fancy magic equation (e.g. 4log2(nr_cpus/4)).
>

I just posted a patch to limit the number of zpools, with some
theoretical background explained in the code comments. I believe that
2 * CPU linearly is sufficient to reduce contention, but the scale can
be reduced further. All CPUs are trying to allocate/free zswap is
unlikely to happen.
 How many concurrent accesses were the original 32 zpools supposed to
handle? I think it was for 16 cpu or more. or nr_cpus/4 would be
enough?

--=20

<flintglass@gmail.com>
