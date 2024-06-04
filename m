Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E208FBDA3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 22:57:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sva5a+xD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv2w9134Qz3ckl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 06:57:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sva5a+xD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv2vQ4GwPz3cXt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 06:56:33 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4213b94b8b5so25924665e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 13:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717534587; x=1718139387; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/2NrBR2dMh4jxaJHvIIkbx6ft/lfiJX+xOAj1QR9Ns=;
        b=sva5a+xDjQIYyVkDxrUi4zLvZUBVYrlDWbtvriwxOf1YI3eboZQa5wIGhP9pT1M0CM
         3TtI27wAWujQuN9xcsFWJXvt8UBAK6Du8BAaBj4In4LRa4UKrFfsEeta4vgC5ze1P0D5
         4Md0TA59r11w97INFHrI3nJRkbAXp0M75LbGiN3a9kguPwTEmWdaHHB4ZhkPahPus5tk
         gLxD+/bqKKMPNeOLuE9n4vaQCqOmBeR7qEh9+hVxSjzIxAPZ0ymXRDN34wa1QP9QPZo9
         DfTm5UpWsV6Col6xlniTE7nlN+qGRO95IEDsstUek1M7d/o3nCPwEmdcq7e86wkaG197
         VFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717534587; x=1718139387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/2NrBR2dMh4jxaJHvIIkbx6ft/lfiJX+xOAj1QR9Ns=;
        b=rQZxVuP5/Bw33rqSWj9sFTY66d8kVSzlQgwnkQrFDgXalDfwNT0z4q4mYkCVxS71y9
         VYJKA5HUnGbziPAT7Xf6uoAGWugklAaYeDdRZh0Y9is+AwHuIOSWTRYx/Y+KmHQrdCQX
         QCNYYhEHEy9dcVTVGYTDaPs4RCMZNUkIRyR52BjwrlgltaCe+sD5eOmo8AzLfu7aAmn9
         2BgzmcwfSIgBwx+WekVEwzgo5yEkqr3AQGBqL0ZOOLsYgr9MDEoNHmjwsYY9acRlZjgi
         8Afj8EcPXCVASTt/UqFe1kuEPJVQjVEHqND55xu/xvaFKXYDKiMl8YQPanLSxr4mnsjI
         J5Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXln9Dxl6hH4v2t9HDq3FmXnUvsQdPPtFTDlI6F4WbbbnhgvAufkF34lauK+Y/PfyIMaChbBbpVoMslEE/PAeSOo6X6O13taBkOXEvw0w==
X-Gm-Message-State: AOJu0YwiXYo098VfuG9IKLVd7SyYnuaa12IIX6r320hafdynFG9+7YZJ
	jsgwIxpTIWl2PpHcJDxDQ9guKDtcWNuKKJy006I9FKkiTuwM87l8FxAXToVQYuC8IjiWXsnPFbX
	YSEBW9OKyhXMAugMWD9uwuCumewVdoD0RxMlL
X-Google-Smtp-Source: AGHT+IE6JmQAll+GNDs0FWYMgmBviEFJQQ7PiqrGzd9Dp0vvE7AUoPNGThQbFCpeMIguYSHNdWujsqidz+e0T1ALypc=
X-Received: by 2002:adf:f6c8:0:b0:355:41b:d391 with SMTP id
 ffacd0b85a97d-35e8ef93cc6mr429509f8f.65.1717534586541; Tue, 04 Jun 2024
 13:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
 <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com> <5c69cee6-f101-4c86-b38a-7c5c8679ea9b@kernel.org>
In-Reply-To: <5c69cee6-f101-4c86-b38a-7c5c8679ea9b@kernel.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 4 Jun 2024 13:55:47 -0700
Message-ID: <CAJD7tkZx-hzVg=TttC7hNSzUXPTMzi+EjUrdO8BdnswyDVEnxA@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org, Yu Zhao <yuzhao@google.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2024 at 1:52=E2=80=AFPM Vlastimil Babka (SUSE) <vbabka@kerne=
l.org> wrote:
>
> On 6/4/24 1:24 AM, Yosry Ahmed wrote:
> > On Mon, Jun 3, 2024 at 3:13=E2=80=AFPM Erhard Furtner <erhard_f@mailbox=
.org> wrote:
> >>
> >> On Sun, 2 Jun 2024 20:03:32 +0200
> >> Erhard Furtner <erhard_f@mailbox.org> wrote:
> >>
> >> > On Sat, 1 Jun 2024 00:01:48 -0600
> >> > Yu Zhao <yuzhao@google.com> wrote:
> >> >
> >> > > The OOM kills on both kernel versions seem to be reasonable to me.
> >> > >
> >> > > Your system has 2GB memory and it uses zswap with zsmalloc (which =
is
> >> > > good since it can allocate from the highmem zone) and zstd/lzo (wh=
ich
> >> > > doesn't matter much). Somehow -- I couldn't figure out why -- it
> >> > > splits the 2GB into a 0.25GB DMA zone and a 1.75GB highmem zone:
> >> > >
> >> > > [    0.000000] Zone ranges:
> >> > > [    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffff=
ff]
> >> > > [    0.000000]   Normal   empty
> >> > > [    0.000000]   HighMem  [mem 0x0000000030000000-0x000000007fffff=
ff]
> >> > >
> >> > > The kernel can't allocate from the highmem zone -- only userspace =
and
> >> > > zsmalloc can. OOM kills were due to the low memory conditions in t=
he
> >> > > DMA zone where the kernel itself failed to allocate from.
> >> > >
> >> > > Do you know a kernel version that doesn't have OOM kills while run=
ning
> >> > > the same workload? If so, could you send that .config to me? If no=
t,
> >> > > could you try disabling CONFIG_HIGHMEM? (It might not help but I'm=
 out
> >> > > of ideas at the moment.)
> >>
> >> Ok, the bisect I did actually revealed something meaningful:
> >>
> >>  # git bisect good
> >> b8cf32dc6e8c75b712cbf638e0fd210101c22f17 is the first bad commit
> >> commit b8cf32dc6e8c75b712cbf638e0fd210101c22f17
> >> Author: Yosry Ahmed <yosryahmed@google.com>
> >> Date:   Tue Jun 20 19:46:44 2023 +0000
> >>
> >>     mm: zswap: multiple zpools support
> >
> > Thanks for bisecting. Taking a look at the thread, it seems like you
> > have a very limited area of memory to allocate kernel memory from. One
> > possible reason why that commit can cause an issue is because we will
> > have multiple instances of the zsmalloc slab caches 'zspage' and
> > 'zs_handle', which may contribute to fragmentation in slab memory.
> >
> > Do you have /proc/slabinfo from a good and a bad run by any chance?
> >
> > Also, could you check if the attached patch helps? It makes sure that
> > even when we use multiple zsmalloc zpools, we will use a single slab
> > cache of each type.
>
> As for reducing slab fragmentation/footprint, I would also recommend thes=
e
> changes to .config:
>
> CONFIG_SLAB_MERGE_DEFAULT=3Dy - this will unify the separate zpool caches=
 as
> well (but the patch still makes sense), but also many others
> CONFIG_RANDOM_KMALLOC_CACHES=3Dn - no 16 separate copies of kmalloc cache=
s

Yeah, I did send that patch separately, but I think the problem here
is probably fragmentation in the zsmalloc pools themselves, not the
slab caches used by them.

>
> although the slabinfo output doesn't seem to show
> CONFIG_RANDOM_KMALLOC_CACHES in action, weirdly. It was enabled in the
> config attached to the first mail.
>
> Both these changes mean giving up some mitigation against potentai
> lvulnerabilities. But it's not perfect anyway and the memory seems really
> tight here.

I think we may be able to fix the problem here if we address the
zsmalloc fragmentation. In regards to slab caches, the patch proposed
above should avoid the replication without enabling slab cache merging
in general.

Thanks for chiming in!
