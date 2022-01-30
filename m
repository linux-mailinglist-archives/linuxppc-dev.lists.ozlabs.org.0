Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4373C4A3713
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 15:58:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmvSr0QsSz3cN1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 01:58:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kos3V8Vk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Kos3V8Vk; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmvS71dhcz304w
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 01:57:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C0E48B80ADA
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 14:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDBBC340F0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 14:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643554641;
 bh=JxoHCxPtVM6TBwNWYVTkv4xgv4xXqSSrocAD8RhKPvQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Kos3V8Vk5hA0UEtlbCmKfvDbCn6hgvFJPW0hutP471S22DT8zQZjqZYl8oPtPERRN
 mHTKJGaAu0B69fJNmAFmItV05nnqnnpRKb/kYsBaVswrhiA3ecXak702UJ1xD+aRyO
 Cyu417cH+tx6RjZLY1F4C0+gldC8KeEtNsbWOyaylils+pWq32+O/qNqqF6K8vS+Qa
 DU2SBhQ6eWn63e/dlaU9XUJXP5eg51s3F1n6055BcvsAgOgE2YRIXu5gQZ14MzwtZF
 RJhpqwiYSrbL56M0Y1luR1ep1hIfdzFS7gAvAKX1Hfe2YnV2vSbhGb9SEapKZC8pBf
 gYvL1GNaKIrpg==
Received: by mail-vk1-f177.google.com with SMTP id u25so3436790vkk.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 06:57:21 -0800 (PST)
X-Gm-Message-State: AOAM531zpUhRNaC+phh5nSPTw9eXRDzo3tNI6FHeOSoNMZ28QH2tVCsF
 xbOJTkC25UOJGGX8JBsVtxs2CPoe0vLt0hl+drI=
X-Google-Smtp-Source: ABdhPJwXaD5cftVV1gTUpOLnxRw19SJ6xh2ZrT8jBGfIh39KXnRkloqQEHlrygYgN8HHE2HZ4UXsJQOHGX4lm9oymh8=
X-Received: by 2002:a05:6122:1c5:: with SMTP id h5mr6907805vko.2.1643554640709; 
 Sun, 30 Jan 2022 06:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-9-guoren@kernel.org>
 <CAK8P3a3JGP6fLVOyLgdNw2YpRSmArbEX8orUhRrN=GHmcdk=1g@mail.gmail.com>
 <CAJF2gTQQnrUFNQ85vvoMkpxnCWuMw8iXtPZOJwWGaEA9f+rTwA@mail.gmail.com>
 <CAK8P3a12CygLFT7qoQ9K=sowvTgNpeRej6Zh6Pv2PL_e2zMhMQ@mail.gmail.com>
In-Reply-To: <CAK8P3a12CygLFT7qoQ9K=sowvTgNpeRej6Zh6Pv2PL_e2zMhMQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Jan 2022 22:57:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSULHYYvAjfDvHiD-rJFsOy0-x58AKcD2upzpxaVf5sZQ@mail.gmail.com>
Message-ID: <CAJF2gTSULHYYvAjfDvHiD-rJFsOy0-x58AKcD2upzpxaVf5sZQ@mail.gmail.com>
Subject: Re: [PATCH V4 08/17] riscv: compat: syscall: Add compat_sys_call_table
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

On Sun, Jan 30, 2022 at 7:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sun, Jan 30, 2022 at 6:54 AM Guo Ren <guoren@kernel.org> wrote:
> > On Sun, Jan 30, 2022 at 6:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > I would make these endian-specific, and reverse them on big-endian
> > > architectures. That way it
> > > should be possible to share them across all compat architectures
> > > without needing the override
> > > option.
> > I hope it could be another patch. Because it's not clear to
> > _LITTLE_ENDIAN definition in archs.
> >
> > eg: Names could be __ORDER_LITTLE_ENDIAN__ CPU_LITTLE_ENDIAN
> > SYS_SUPPORTS_LITTLE_ENDIAN __LITTLE_ENDIAN
> >
> > riscv is little-endian, but no any LITTLE_ENDIAN definition.
> >
> > So let's keep them in the patch, first, Thx
>
> The correct way to do it is to check for CONFIG_CPU_BIG_ENDIAN,
> which works on all architectures. Since nothing else selects the
> __ARCH_WANT_COMPAT_* symbols, there is also no risk for
> regressions, so just use this and leave the #ifndef compat_arg_u64
> check in place.
Okay, got it.

>
>       Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
