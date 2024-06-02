Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 376328D7824
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2024 22:39:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OmJ9tdhK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vspcw2zdvz3cT8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 06:39:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OmJ9tdhK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vspc84WLgz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2024 06:39:03 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42133fbe137so53025e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Jun 2024 13:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717360736; x=1717965536; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfldORuTjlVpAnJ3Ucw4knFWPlGKfdDgSo69+8PCJyE=;
        b=OmJ9tdhKkpPebVaIqvxJcUg7fwBct+ZUb7acHVYz6UKIzAF9aYonnTBXGMLye+RUYt
         38kOFKKiM6h2WNAqulyanduEvN0Kei6FLLTmFsWaAbBm/4EhM+7NP3krvbOQ4T+UI4g6
         Zu46pVz2ZKdSDyt9WFzPsPc4Ulgy376eJBRnOd/2W6zc+SVVtwfx9Vi/RIm/rDK8DKK0
         1TTH9baSmaBTfrxVoDQkFU7c0EKXBrElGNwcKvN7DWyF2gDnd/cRA8gY8x29zxgOSYm/
         AV7cAf2kJRIKt5NrYEz93K4PBc73D22ikHKBFG8s8uUVOj8y8lc/dzk69o7iJvTV5bMa
         og0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717360736; x=1717965536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfldORuTjlVpAnJ3Ucw4knFWPlGKfdDgSo69+8PCJyE=;
        b=MFrw99wk8FVGSbSb6+GqKfro1zDjw3IFYTLe8+9iQ/eJQrUWyRrGO4VAGrtoEdWQPg
         zfo95RgngPz5wUgmEpJWfacRDurr6sc4PISYfQOb8pXaUoiIGummWzhPV956ZJcCARdp
         SnGvyZbClfgooQGp8nhNjc7LGu46VZbt4qscHoS5tYCsJCYfOAHDPFeIOiQ4/znDtoXu
         RRe7dPqhKN/vba75V36CQZyjrCcCYXyMNQWwkt70YJfPsfn09bricSAQaQnbMTnRMVSZ
         3ttavCa+vVimo4mRqEnaJH8oU/b9bTR/xWZExlcn0YeM13OtjZXlKtvOazk1tX3qPZq9
         4ndw==
X-Forwarded-Encrypted: i=1; AJvYcCXhV4IzklXwBgXfGiI6cU1h9C/54iZC/YLU9mBO6RBs8v3DktAA26p3xWW11ErN9ZmECL5X4WrW2Sn/B5B5CS+tOZ2WjFS/gQ3JjqMKsg==
X-Gm-Message-State: AOJu0YxY5kHlO2G7kS9W0J34PFFXHOdqkifwB/D7ubqIbETbE0OnO2k1
	He4rAnkz1LqGrJNu/KQqpNJg0l0JOWJru8lQqKJUOdPj/hneJR4Hhq27zku34AHXXuOIacVIH2F
	f5KTYjqvwhz32mIlOkfBMxDw99Ntj9w8GRL7GR2Bnut4yC7QFjMQuuOE=
X-Google-Smtp-Source: AGHT+IFFroboW96WPdvdwnL4DyxgbhQ5ulmPuS+yGKYAppow/rIDCpVjA8jHAiaBb0HM8OYqH+auJiagPkOKXUL7hhs=
X-Received: by 2002:a05:600c:1d27:b0:421:328e:99db with SMTP id
 5b1f17b1804b1-421358b2ea5mr2182435e9.1.1717360735443; Sun, 02 Jun 2024
 13:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com> <20240602200332.3e531ff1@yea>
In-Reply-To: <20240602200332.3e531ff1@yea>
From: Yu Zhao <yuzhao@google.com>
Date: Sun, 2 Jun 2024 14:38:18 -0600
Message-ID: <CAOUHufY=pTHTkz1acsvo-Ox-xVR7_3gaCDftVWj6bz1kzW=v=w@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Erhard Furtner <erhard_f@mailbox.org>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 2, 2024 at 12:03=E2=80=AFPM Erhard Furtner <erhard_f@mailbox.or=
g> wrote:
>
> On Sat, 1 Jun 2024 00:01:48 -0600
> Yu Zhao <yuzhao@google.com> wrote:
>
> > Hi Erhard,
> >
> > The OOM kills on both kernel versions seem to be reasonable to me.
> >
> > Your system has 2GB memory and it uses zswap with zsmalloc (which is
> > good since it can allocate from the highmem zone) and zstd/lzo (which
> > doesn't matter much). Somehow -- I couldn't figure out why -- it
> > splits the 2GB into a 0.25GB DMA zone and a 1.75GB highmem zone:
> >
> > [    0.000000] Zone ranges:
> > [    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffffff]
> > [    0.000000]   Normal   empty
> > [    0.000000]   HighMem  [mem 0x0000000030000000-0x000000007fffffff]
> >
> > The kernel can't allocate from the highmem zone -- only userspace and
> > zsmalloc can. OOM kills were due to the low memory conditions in the
> > DMA zone where the kernel itself failed to allocate from.
> >
> > Do you know a kernel version that doesn't have OOM kills while running
> > the same workload? If so, could you send that .config to me? If not,
> > could you try disabling CONFIG_HIGHMEM? (It might not help but I'm out
> > of ideas at the moment.)
> >
> > Thanks!
>
> Hi Yu!
>
> Thanks for looking into this.
>
> The reason for this 0.25GB DMA / 1.75GB highmem split is beyond my knowle=
dge. I can only tell this much that it's like this at least since kernel v4=
.14.x (dmesg of an old bugreport of mine at https://bugzilla.kernel.org/sho=
w_bug.cgi?id=3D201723), I guess earlier kernel versions too.
>
> Without CONFIG_HIGHMEM the memory layout looks like this:
>
> Total memory =3D 768MB; using 2048kB for hash table
> [...]
> Top of RAM: 0x30000000, Total RAM: 0x30000000
> Memory hole size: 0MB
> Zone ranges:
>   DMA      [mem 0x0000000000000000-0x000000002fffffff]
>   Normal   empty
> Movable zone start for each node
> Early memory node ranges
>   node   0: [mem 0x0000000000000000-0x000000002fffffff]
> Initmem setup node 0 [mem 0x0000000000000000-0x000000002fffffff]
> percpu: Embedded 29 pages/cpu s28448 r8192 d82144 u118784
> pcpu-alloc: s28448 r8192 d82144 u118784 alloc=3D29*4096
> pcpu-alloc: [0] 0 [0] 1
> Kernel command line: ro root=3D/dev/sda5 slub_debug=3DFZP page_poison=3D1=
 netconsole=3D6666@192.168.2.8/eth0,6666@192.168.2.3/A8:A1:59:16:4F:EA debu=
g
> Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
> Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
> Built 1 zonelists, mobility grouping on.  Total pages: 194880
> mem auto-init: stack:all(pattern), heap alloc:off, heap free:off
> Kernel virtual memory layout:
>   * 0xffbdf000..0xfffff000  : fixmap
>   * 0xff8f4000..0xffbdf000  : early ioremap
>   * 0xf1000000..0xff8f4000  : vmalloc & ioremap
>   * 0xb0000000..0xc0000000  : modules
> Memory: 761868K/786432K available (7760K kernel code, 524K rwdata, 4528K =
rodata, 1100K init, 253K bss, 24564K reserved, 0K cma-reserved)
> [...]
>
> With only 768 MB RAM and 2048K hashtable I get pretty much the same "kswa=
pd0: page allocation failure: order:0, mode:0xcc0(GFP_KERNEL),nodemask=3D(n=
ull),cpuset=3D/,mems_allowed=3D0" as with the HIGHMEM enabled kernel at
> running "stress-ng --vm 2 --vm-bytes 1930M --verify -v".
>
> I tried the workload on v6.6.32 LTS where the issue shows up too. But v6.=
1.92 LTS seems ok! Triple checked v6.1.92 to be sure.
>
> Attached please find kernel v6.9.3 dmesg (without HIGHMEM) and kernel v6.=
1.92 .config.

Thanks.

I compared the .config between v6.8.9 (you attached previously) and
v6.1.92 -- I didn't see any major differences (both have ZONE_DMA,
HIGHMEM, MGLRU and zswap/zsmalloc). Either there is something broken
between v6.1.92 and v6.6.32 (as you mentioned above), or it's just a
kernel allocation bloat which puts the DMA zone (0.25GB) under too
heavy pressure. The latter isn't uncommon when upgrading to a newer
version of the kernel.

Could you please attach the dmesg from v6.1.92? I want to compare the
dmegs between the two kernel versions as well -- that might provide
some hints.
