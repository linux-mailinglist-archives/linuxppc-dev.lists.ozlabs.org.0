Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611BE12D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 09:10:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yhN93yTjzDqN8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 18:10:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="D/CIKos7"; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yhLD4nNszDqDN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 18:08:35 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id z12so15118938lfj.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 00:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=myl9hp8GAdZ10Vh56qyy6JaHhxuDJ9OqLHFd3viE44w=;
 b=D/CIKos7wpo0yugt6OSXX7bSNd0uG+7P8UyKC6tUPLOGlg3lpLAmJCUCqZRgkpJSmQ
 /ua9qSJgNrl1LsDsy10IsXdPlR6Fv1rZxxYSOM/ZcCJ0mDG8jrtIdD8yFOK61FPzQ90u
 hFpSSl11Te5wvXzmj7gDzCd2zmJkM16v/LNQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=myl9hp8GAdZ10Vh56qyy6JaHhxuDJ9OqLHFd3viE44w=;
 b=HZPkwYUPCf5QUbJ7Tk5Sr2nlxc0C+EbNy9Ekf+l4KD0zrZbBdLehDW/VKZaXqOxf1Q
 xMWc0fchC1ZBhwFDL+1ESOUSsAyn17nxHcw8Zs6N/Kw96mbe86DWK53ivaSA8zzOtNrn
 OPcu0WLOTLa98aleO7RtKmPtjCFloK8/xwzVCXb8dcwvAK2ClUCUdau6WK4nNzbsIppy
 gwT2h2uVfhiKpyFWWLDr0ltHyadeiGFEOJSeMtZItZjrhIZ4qzCm7/uXyFTy0AIwJGfD
 p2+XHoqUXA78Jax93bhY7W/oV3uuQQeXizDijXeap0uxHGn8lzwOO8UMpk8PxUJkVtyX
 UGjA==
X-Gm-Message-State: APjAAAUgaHzP/vbNJPXcNZdNPvLzY+vsiCAN2xLBKFBqXsNBSHTvnHFp
 mD1cHTXT27eIO8T87ZqLqqypmA==
X-Google-Smtp-Source: APXvYqwRZFXEAB1sX7Quxj/Hpyb451DS8Gl1oBwoo5NLaCgiUg7xN2GoprYTPQVnWp6BHkMtcSr9Mg==
X-Received: by 2002:a19:c354:: with SMTP id t81mr13587917lff.179.1571814509700; 
 Wed, 23 Oct 2019 00:08:29 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id r6sm9908883ljr.77.2019.10.23.00.08.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Oct 2019 00:08:29 -0700 (PDT)
Subject: Re: [PATCH 3/7] soc: fsl: qe: avoid ppc-specific io accessors
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191018125234.21825-4-linux@rasmusvillemoes.dk>
 <6ee121cf-0e3d-4aa0-2593-fcb00995e429@c-s.fr>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <47d45f33-d5aa-b4b5-9b5f-2e86e309a206@rasmusvillemoes.dk>
Date: Wed, 23 Oct 2019 09:08:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6ee121cf-0e3d-4aa0-2593-fcb00995e429@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/10/2019 17.01, Christophe Leroy wrote:
> 
> 
> On 10/18/2019 12:52 PM, Rasmus Villemoes wrote:
>> In preparation for allowing to build QE support for architectures
>> other than PPC, replace the ppc-specific io accessors. Done via
>>
> 
> This patch is not transparent in terms of performance, functions get
> changed significantly.
> 
> Before the patch:
> 
> 00000330 <ucc_fast_enable>:
>  330:    81 43 00 04     lwz     r10,4(r3)
>  334:    7c 00 04 ac     hwsync
>  338:    81 2a 00 00     lwz     r9,0(r10)
>  33c:    0c 09 00 00     twi     0,r9,0
>  340:    4c 00 01 2c     isync
>  344:    70 88 00 02     andi.   r8,r4,2
>  348:    41 82 00 10     beq     358 <ucc_fast_enable+0x28>
>  34c:    39 00 00 01     li      r8,1
>  350:    91 03 00 10     stw     r8,16(r3)
>  354:    61 29 00 10     ori     r9,r9,16
>  358:    70 88 00 01     andi.   r8,r4,1
>  35c:    41 82 00 10     beq     36c <ucc_fast_enable+0x3c>
>  360:    39 00 00 01     li      r8,1
>  364:    91 03 00 14     stw     r8,20(r3)
>  368:    61 29 00 20     ori     r9,r9,32
>  36c:    7c 00 04 ac     hwsync
>  370:    91 2a 00 00     stw     r9,0(r10)
>  374:    4e 80 00 20     blr
> 
> After the patch:
> 
> 0000030c <ucc_fast_enable>:
>  30c:    94 21 ff e0     stwu    r1,-32(r1)
>  310:    7c 08 02 a6     mflr    r0
>  314:    bf a1 00 14     stmw    r29,20(r1)
>  318:    7c 9f 23 78     mr      r31,r4
>  31c:    90 01 00 24     stw     r0,36(r1)
>  320:    7c 7e 1b 78     mr      r30,r3
>  324:    83 a3 00 04     lwz     r29,4(r3)
>  328:    7f a3 eb 78     mr      r3,r29
>  32c:    48 00 00 01     bl      32c <ucc_fast_enable+0x20>
>             32c: R_PPC_REL24    ioread32be
>  330:    73 e9 00 02     andi.   r9,r31,2
>  334:    41 82 00 10     beq     344 <ucc_fast_enable+0x38>
>  338:    39 20 00 01     li      r9,1
>  33c:    91 3e 00 10     stw     r9,16(r30)
>  340:    60 63 00 10     ori     r3,r3,16
>  344:    73 e9 00 01     andi.   r9,r31,1
>  348:    41 82 00 10     beq     358 <ucc_fast_enable+0x4c>
>  34c:    39 20 00 01     li      r9,1
>  350:    91 3e 00 14     stw     r9,20(r30)
>  354:    60 63 00 20     ori     r3,r3,32
>  358:    80 01 00 24     lwz     r0,36(r1)
>  35c:    7f a4 eb 78     mr      r4,r29
>  360:    bb a1 00 14     lmw     r29,20(r1)
>  364:    7c 08 03 a6     mtlr    r0
>  368:    38 21 00 20     addi    r1,r1,32
>  36c:    48 00 00 00     b       36c <ucc_fast_enable+0x60>
>             36c: R_PPC_REL24    iowrite32be

True. Do you know why powerpc uses out-of-line versions of these
accessors when !PPC_INDIRECT_PIO, i.e. at least all of PPC32? It's quite
a bit beyond the scope of this series, but I'd expect moving most if not
all of arch/powerpc/kernel/iomap.c into asm/io.h (guarded by
!defined(CONFIG_PPC_INDIRECT_PIO) of course) as static inlines would
benefit all ppc32 users of iowrite32 and friends.

Is there some other primitive available that (a) is defined on all
architectures (or at least both ppc and arm) and (b) expands to good
code in both/all cases?

Note that a few uses of the the iowrite32be accessors has already
appeared in the qe code with the introduction of the qe_clrsetbits()
helpers in bb8b2062af.

Rasmus
