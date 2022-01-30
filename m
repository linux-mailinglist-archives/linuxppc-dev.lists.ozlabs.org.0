Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F64A3494
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 06:48:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmgGQ729Pz3bbW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 16:48:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NPAxCNaL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NPAxCNaL; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmgFg3ccrz2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 16:47:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1FED9B828A6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 05:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9929DC340F0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 05:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643521648;
 bh=CFf7eYVsi2vfAFWFWWepRognCnx0qrq4RXbGFOfmx9c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NPAxCNaLTo4erRllOLayMfPUYfUOW9vn8x0aWJepTSfSmFE6cR2eBffVk6qUyvNdZ
 v3wz8lOjDUgZTz25phHKEAzLGLT1NkVJp8AuWL2ej8PZnZfdv3FX2p4yUbOsNvaLc7
 ad40OrZwitXivHc3LwQ2Z7IEwtIIa8viQ4z7g/2YsK4NgOLtEh5wOFyP+H7XH8E0bH
 pTnTrhCsz05K8/+IBl0hK4EOqoejHMaIgxXuF2bpco6R1FaW174GiCmOEtCUbSh1QD
 /vc0+bphJ+UVCMo6QbiAw+ofwI5iAXuGl0/v6S7yyySZLfYvKOlRd2M4ToNLzAH7hS
 zlTbUHM35vSDw==
Received: by mail-vk1-f175.google.com with SMTP id j185so6382842vkc.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 21:47:28 -0800 (PST)
X-Gm-Message-State: AOAM532QtrkJksdHHJXIx+0dF0m6rZRopwK1+xay23iHKBo0Fk7/KliN
 CtP3IK44xrEDUv9ZyvABshCw5DyUjtY+MEdDpn4=
X-Google-Smtp-Source: ABdhPJxLWGk5CQ+MBw+7fcsDq1E1+v+xghtxN0mZV6UTIH/aZ2JMAd2qn/Emr/MxaYw7Fbc8Rg4biBjIlqvQekFa+1Q=
X-Received: by 2002:a05:6122:1306:: with SMTP id
 e6mr6299952vkp.28.1643521647659; 
 Sat, 29 Jan 2022 21:47:27 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-7-guoren@kernel.org>
 <CAK8P3a3_kVB78-26sxdsEjb3MMcco6U55tc7siCBFZbJjyH6Sw@mail.gmail.com>
In-Reply-To: <CAK8P3a3_kVB78-26sxdsEjb3MMcco6U55tc7siCBFZbJjyH6Sw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Jan 2022 13:47:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTThb8_-T0iOFVZoJrvZqeFvjfWB+AdFyOwtGhN9aG-MQQ@mail.gmail.com>
Message-ID: <CAJF2gTThb8_-T0iOFVZoJrvZqeFvjfWB+AdFyOwtGhN9aG-MQQ@mail.gmail.com>
Subject: Re: [PATCH V4 06/17] riscv: compat: Add basic compat date type
 implementation
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 gregkh <gregkh@linuxfoundation.org>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup@brainfault.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 30, 2022 at 5:56 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Jan 29, 2022 at 1:17 PM <guoren@kernel.org> wrote:
> > +
> > +#define COMPAT_RLIM_INFINITY   0x7fffffff
> >
> > +#define F_GETLK64      12
> > +#define F_SETLK64      13
> > +#define F_SETLKW64     14
>
> These now come from the generic definitions I think. The flock definitions
> are just the normal ones,
Yes, it could be removed after Christoph Hellwig's patch merged.

> and AFAICT the RLIM_INIFINITY definition here
> is actually wrong and should be the default 0xffffffffu to match the
> native (~0UL) definition.
Yes, native rv32 used ~0UL, although its task_size is only 2.4GB.

I would remove #define COMPAT_RLIM_INFINITY   0x7fffffff

>
>             Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
