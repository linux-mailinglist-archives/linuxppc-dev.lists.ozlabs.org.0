Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 581E2366179
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 23:21:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPxSK1qk5z302y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 07:21:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vAe8p2Dz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vAe8p2Dz; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPxRq6pt2z2xZn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 07:20:39 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E520F613FA
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 21:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618953636;
 bh=D/HoBu+aWo6sy7+88V9ZJnpot0ZpiBRBCM4AzeXp6I8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vAe8p2Dzo0p/1DzAvmk3xA9uTkzgCZz+eSqDOB/ryS0GOOeapQ5uE8I65EWIWYBE4
 IMFGcCAqURUY6psWn70FWpbxr9lKHhXPGbHiwVaAbAFYomKE7vRVb0IMZ+jpLt4XPN
 yTq7Kb2AJ3ZEgheK0Rn91W5gF/PwoZiOD67xuJ/FVe6l9LjYWMmiwT13tL3545+OqE
 o2wDlVYDVO8kqeTNxUaYQboz5d2iZbekWPSw3gtZR04LPxTyRIgU+qddOr8dwJxn/J
 zgmXNsjS4fMh02jRkrdeGbCTBBrvvOFpsPQwG3DILsTQJDgInlZZQZxj7TfUlhxtbJ
 fhQUjN7vwSorg==
Received: by mail-wm1-f48.google.com with SMTP id n127so9224242wmb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 14:20:36 -0700 (PDT)
X-Gm-Message-State: AOAM532GrZNti/GPUUZpPAHoDn3l6TCU9J7e71sUndYYcb0PHyr1p35a
 PSGe8Fj988CfD1gOixJd2nUA2OQ7hhJ+Ggp2+Ns=
X-Google-Smtp-Source: ABdhPJwrEit0y72qRaTuoH/3wg/uStL6F0tnFo57QDj1Zmqkrq7O3+IN+SwFnfTQrVplKgk1AFIl7KVtwhj1AIi6XmY=
X-Received: by 2002:a05:600c:4149:: with SMTP id
 h9mr6135531wmm.43.1618953635407; 
 Tue, 20 Apr 2021 14:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <9f99b0a0-f1c1-f3b0-5f84-3a4bfc711725@synopsys.com>
 <20210420031029.GI2531743@casper.infradead.org>
 <CAK8P3a0KUwf1Z0bHiUaHC2nHztevkxg5_FBSzHddNeSsBayWUA@mail.gmail.com>
 <8d0fce1c-be7c-1c9b-bf5c-0c531db496ac@synopsys.com>
In-Reply-To: <8d0fce1c-be7c-1c9b-bf5c-0c531db496ac@synopsys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 20 Apr 2021 23:20:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3rzz1gfNLoGC8aZJiAC-tgZYD6P8pQsoEfgCAmQK=FAw@mail.gmail.com>
Message-ID: <CAK8P3a3rzz1gfNLoGC8aZJiAC-tgZYD6P8pQsoEfgCAmQK=FAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
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
Cc: "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "mgorman@suse.de" <mgorman@suse.de>,
 "brouer@redhat.com" <brouer@redhat.com>,
 "mcroce@linux.microsoft.com" <mcroce@linux.microsoft.com>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hch@lst.de" <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 20, 2021 at 11:14 PM Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
> On 4/20/21 12:07 AM, Arnd Bergmann wrote:

> >
> > which means that half the 32-bit architectures do this. This may
> > cause more problems when arc and/or microblaze want to support
> > 64-bit kernels and compat mode in the future on their latest hardware,
> > as that means duplicating the x86 specific hacks we have for compat.
> >
> > What is alignof(u64) on 64-bit arc?
>
> $ echo 'int a = __alignof__(long long);' | arc64-linux-gnu-gcc -xc -
> -Wall -S -o - | grep -A1 a: | tail -n 1 | cut -f 3
> 8

Ok, good.

> Yeah ARCv2 alignment of 4 for 64-bit data was a bit of surprise finding
> for me as well. When 64-bit load/stores were initially targeted by the
> internal Metaware compiler (llvm based) they decided to keep alignment
> to 4 still (granted hardware allowed this) and then gcc guys decided to
> follow the same ABI. I only found this by accident :-)
>
> Can you point me to some specifics on the compat issue. For better of
> worse, arc64 does''t have a compat 32-bit mode, so everything is
> 64-on-64 or 32-on-32 (ARC32 flavor of ARCv3)

In that case, there should be no problem for you.

The main issue is with system calls and ioctls that contain a misaligned
struct member like

struct s {
       u32 a;
       u64 b;
};

Passing this structure by reference from a 32-bit user space application
to a 64-bit kernel with different alignment constraints means that the
kernel has to convert the structure layout. See
compat_ioctl_preallocate() in fs/ioctl.c for one such example.

       Arnd
