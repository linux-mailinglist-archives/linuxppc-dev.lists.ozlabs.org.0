Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4CC4A48C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 14:53:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnV0C3zn2z3cD3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 00:53:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tE6Azk07;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tE6Azk07; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnTzZ4Q2lz2xMQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 00:53:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30EF6B82B29
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 13:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B0DC340EF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 13:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643637190;
 bh=ubnmPmWzE8WZHK6ZDIgiYDZ8V5Auo9sjXu6gY0DackM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tE6Azk07ef7p3PyY9nPWsvB4UG0ym7aIa7c0/Aq4ps9A01ne0MZvdOrWsFqal0AiU
 0P7V4TI/ZhF33PhVXme354y8saJj86gikF7RnUZvdvua8uDRQHsud7M0acourjCUn9
 zdR16D1WrF68aNJlsNa9P3qBuqWtesfv8rw5IF2hNE5wWlmhVz2+xC6JL/7OFxTrUu
 iYRe6d4g7Gbq/Qos37N0Q1pmKEbdxburfCFLWH+4ZWaTzMUR00B3+zFQtir0xTCFaf
 b1l+X6y8wEge0g7mMXhya3HjmyH2u/XnQNDpSggCfTYPXq4wmSCGpISV7WE9u1iTrZ
 WZsj7ejW6v9Gw==
Received: by mail-vs1-f47.google.com with SMTP id f6so11854900vsa.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 05:53:09 -0800 (PST)
X-Gm-Message-State: AOAM530ks/40+iA8qG/wSmEwbv1Od2494CHAf0KuuOgdHuZHvg42+5kl
 4UNlmoVXUu1EH74ZikbXnSMNflrZD27yPuamPP4=
X-Google-Smtp-Source: ABdhPJwJr063nx9nXXC4e7XbyWpioW1G/tD5r4ayyBqg50Z49dU59MzIv8eNccq661nAVS/wEBLJ08MiD/T+S+t5NT0=
X-Received: by 2002:a67:e947:: with SMTP id p7mr7925194vso.59.1643637189058;
 Mon, 31 Jan 2022 05:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-4-guoren@kernel.org>
 <YffURrqD0pfXnEkV@infradead.org>
In-Reply-To: <YffURrqD0pfXnEkV@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 31 Jan 2022 21:52:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSQafQxzAyaD90n-O6pPo22RCDXdsrOn=csUJBur0u-Ew@mail.gmail.com>
Message-ID: <CAJF2gTSQafQxzAyaD90n-O6pPo22RCDXdsrOn=csUJBur0u-Ew@mail.gmail.com>
Subject: Re: [PATCH V4 03/17] asm-generic: compat: Cleanup duplicate
 definitions
To: Christoph Hellwig <hch@infradead.org>
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
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 31, 2022 at 8:21 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sat, Jan 29, 2022 at 08:17:14PM +0800, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > There are 7 64bit architectures that support Linux COMPAT mode to
> > run 32bit applications. A lot of definitions are duplicate:
> >  - COMPAT_USER_HZ
> >  - COMPAT_RLIM_INFINITY
> >  - COMPAT_OFF_T_MAX
> >  - __compat_uid_t, __compat_uid_t
> >  - compat_dev_t
> >  - compat_ipc_pid_t
> >  - struct compat_flock
> >  - struct compat_flock64
> >  - struct compat_statfs
> >  - struct compat_ipc64_perm, compat_semid64_ds,
> >         compat_msqid64_ds, compat_shmid64_ds
> >
> > Cleanup duplicate definitions and merge them into asm-generic.
>
> The flock part seems to clash with the general compat_flock
> consolidation.  Otherwise this looks like a good idea.
Okay, In the next version, I would rebase on general compat_flock
consolidation v4.



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
