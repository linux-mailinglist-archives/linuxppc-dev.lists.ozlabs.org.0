Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C918D22900D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 07:48:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBPdZ74cqzDqjg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 15:48:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20150623.gappssmtp.com
 header.i=@dabbelt-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=fCuEEXu+; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBPbl4X6PzDqgL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 15:46:43 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id a24so585256pfc.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 22:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=c3WKCCywdgvLGCz57S7am54sr0h7w7V/JrEMUHUMU/o=;
 b=fCuEEXu++BATZZEgu63jyhgE+Y1XNFfh/hfRTuYGDp7tRoc6LbkGOtZmRlJEX0Q4mc
 58Wx5DrHLgqWGA15ODfmp4BD+A6kqkaXmwBVAcQy7tZT4nC6LrgGJ3lzv06Ej9jur88k
 XGQBpKOytzyljGp9JTo/2ytrZBP2jJniHbB1MwjDRZhque2NwdZ0aWGsgryRqU+3DE9U
 m+vgwzNJSvheMii7MxNhJxPUYaZbP4XIj428wVkVonkWkFnWlNi3Hd/UlX/sByadTgHP
 sXR0VV6uQ74NOk6fTFxzR7f22jvf+xzhKswTeZHjL411qPbZeON+M2WgzsdrCjh868sb
 i6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=c3WKCCywdgvLGCz57S7am54sr0h7w7V/JrEMUHUMU/o=;
 b=P6G0IT5yATjRRyhYgrbTbq1bzz9fwB6QmcUtUkaYx2WFGHQKblchzHzHeq+wVLMx6h
 7ua9ZFSX/+SwMarNihFOBXMAhQjK3zajkRWLNZ8Zvhv5K4xrP133XKkm3a3QuRgq/Gca
 4ReQ48HYgAHLiq1q4/ukK0qnvAh2Pu5xzeFTB1a1bzW3zJ2WnMls2Vo/sVotrShq7b/c
 QMIM58mQf92zDg1l2Mp6LYyXsZY23oH3axLfHMj/HonnMwpyP3JebKYXDH2JP6OGLs2M
 UiuHWfh55lJNXf5A0JG2zd+6CCrEd9d84Sq827LrUVn1ZgBhgAm79JUfh2JEDk/HSew2
 sHRA==
X-Gm-Message-State: AOAM531JHB0XB/8yWN/6o1dJL5fLu7fmh2MgXkeO+rvRFbNDmSQZklT+
 vHipNs11lmKJ18pDo/F4TbKoqg==
X-Google-Smtp-Source: ABdhPJwR06FNegYVsAU8o74hwv373Yq9KlDunC4jItd8mIVMPn3zgJSHBlM3MLtzBDjvCEtSQnV5Fg==
X-Received: by 2002:a62:7505:: with SMTP id q5mr25490271pfc.262.1595396799507; 
 Tue, 21 Jul 2020 22:46:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r16sm22153983pfh.64.2020.07.21.22.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 22:46:38 -0700 (PDT)
Date: Tue, 21 Jul 2020 22:46:38 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Jul 2020 22:46:37 PDT (-0700)
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
In-Reply-To: <87sgdkqhjx.fsf@mpe.ellerman.id.au>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mpe@ellerman.id.au
Message-ID: <mhng-378c6e4e-9eba-4bfd-89d6-b4d2549ff3a1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, linux-mm@kvack.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, paulus@samba.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Jul 2020 21:50:42 PDT (-0700), mpe@ellerman.id.au wrote:
> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
>> On Tue, 2020-07-21 at 16:48 -0700, Palmer Dabbelt wrote:
>>> > Why ? Branch distance limits ? You can't use trampolines ?
>>>
>>> Nothing fundamental, it's just that we don't have a large code model in the C
>>> compiler.  As a result all the global symbols are resolved as 32-bit
>>> PC-relative accesses.  We could fix this with a fast large code model, but then
>>> the kernel would need to relax global symbol references in modules and we don't
>>> even do that for the simple code models we have now.  FWIW, some of the
>>> proposed large code models are essentially just split-PLT/GOT and therefor
>>> don't require relaxation, but at that point we're essentially PIC until we
>>> have more that 2GiB of kernel text -- and even then, we keep all the
>>> performance issues.
>>
>> My memory might be out of date but I *think* we do it on powerpc
>> without going to a large code model, but just having the in-kernel
>> linker insert trampolines.
>
> We build modules with the large code model, and always have AFAIK:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/Makefile?commit=4fa640dc52302b5e62b01b05c755b055549633ae#n129
>
>   # -mcmodel=medium breaks modules because it uses 32bit offsets from
>   # the TOC pointer to create pointers where possible. Pointers into the
>   # percpu data area are created by this method.
>   #
>   # The kernel module loader relocates the percpu data section from the
>   # original location (starting with 0xd...) to somewhere in the base
>   # kernel percpu data space (starting with 0xc...). We need a full
>   # 64bit relocation for this to work, hence -mcmodel=large.
>   KBUILD_CFLAGS_MODULE += -mcmodel=large

Well, a fast large code model would solve a lot of problems :).  Unfortunately
we just don't have enough people working on this stuff to do that.  It's a
somewhat tricky thing to do on RISC-V as there aren't any quick sequences for
long addresses, but I don't think we're that much worse off than everyone else.
At some point I had a bunch of designs written up, but they probably went along
with my SiFive computer.  I think we ended up decided that the best bet would
be to distribute constant tables throughout the text such that they're
accessible via the 32-bit PC-relative loads at any point -- essentially the
multi-GOT stuff that MIPS used for big objects.  Doing that well is a lot of
work and doing it poorly is just as slow as PIC, so we never got around to it.

> We also insert trampolines for branches, but IIUC that's a separate
> issue.

"PowerPC branch trampolines" points me here
https://sourceware.org/binutils/docs-2.20/ld/PowerPC-ELF32.html .  That sounds
like what we're doing already in the medium code models: we have short and
medium control transfer sequences, linker relaxation optimizes them when
possible.  Since we rely on linker relaxation pretty heavily we just don't
bother with the smaller code model: it'd be a 12-bit address space for data and
a 21-bit address space for text (with 13-bit maximum function size).  Instead
of building out such a small code model we just spent time improving the linker.
