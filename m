Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3136423121E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 21:04:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGR172M5DzDqyB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 05:04:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=AJA0ly/Z; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGQzK6pRMzDqxL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 05:02:34 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id q7so22354789ljm.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 12:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p5wY8dZVxLVDVtXV0Fno8TPWZHbBOBFdSVrj3/KpG98=;
 b=AJA0ly/Zta9n3Y6hwB1XZB7k4bPFf2Zn/XboyPgtxJYz8WbIUbemvozhjISY4XlOzG
 JexmZnEhqI4D5U5maVR0XCMxSJjPMspx4qGCGNITUi21GtMvpfMhxkKF+XW60bxsVjFL
 gcqEYLwZg3eqggW9txrqGfEFleISyfIQRk9aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p5wY8dZVxLVDVtXV0Fno8TPWZHbBOBFdSVrj3/KpG98=;
 b=YT55gvQ7/wg7glsOBHysoZXgOM4et/Ia1EiBP7v8lAmVQlo1HNnY/vMhgTK+m3yPte
 hPDY9d8wZmV9QvTue4Ry1zh7yqEykkMd1fq8Jj19qLNRUYH/9cTk1y1JydT6IOXj2nHR
 O/zoPWsEsYsvNuChLN7etgaSdx1j1yOH3FLd3dDR85Wh46x+PnSb/yJlBUMB8w4/xZyF
 PPRIm8PhYwRHV9Am+Z9kOsNUIl8eOKnx/2momKvAjNgRkR217qiS7uKGuAyDc1jljP70
 PR6vYyKDS77ciV7FXPEwJT+DQT/DCPkuGwisw1t93WQGVPYzl/S50hgZJmCwKF4ZnG9B
 wlbg==
X-Gm-Message-State: AOAM533VFEScJwyTNpwJszaKGpGxoWO5/mtGyCqcPI+iUPiCtfCfYpZj
 73Sw0Me1v5dcGOD6GLng+H3BtgzhCxU=
X-Google-Smtp-Source: ABdhPJx3FZizPpldSmVxHZw9PDR5IA7hgjWrMPUn/YasZbxs8RblhFx4SmMNEHxwnjVuQLt+OD74Uw==
X-Received: by 2002:a2e:1641:: with SMTP id 1mr12483081ljw.73.1595962947292;
 Tue, 28 Jul 2020 12:02:27 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id y26sm567305ljm.132.2020.07.28.12.02.25
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 12:02:25 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id s9so11619145lfs.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 12:02:25 -0700 (PDT)
X-Received: by 2002:a05:6512:2082:: with SMTP id
 t2mr15641334lfr.142.1595962944925; 
 Tue, 28 Jul 2020 12:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200723211432.b31831a0df3bc2cbdae31b40@linux-foundation.org>
 <20200724041508.QlTbrHnfh%akpm@linux-foundation.org>
 <CAHk-=wguPA=pDskR-eMMjwR5LDEaMXrqbmDbrKr0u=wV1LE4rg@mail.gmail.com>
 <CAHk-=wh4kmU5FdT=Yy7N9wA=se=ALbrquCrOkjCMhiQnOBLvDA@mail.gmail.com>
 <0323de82-cfbd-8506-fa9c-a702703dd654@linux.alibaba.com>
 <20200727110512.GB25400@gaia>
 <39560818-463f-da3a-fc9e-3a4a0a082f61@linux.alibaba.com>
 <eb1f5cb4-7c3d-df42-f4aa-804e12df45e2@linux.alibaba.com>
 <CAHk-=wha6f0gF1SJg96R77h0oTuc_oO7-37wD=mYGy6TyJOwbQ@mail.gmail.com>
 <1595932767.wga6c4yy6a.astroid@bobo.none>
In-Reply-To: <1595932767.wga6c4yy6a.astroid@bobo.none>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 28 Jul 2020 12:02:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgrgRqeEo-YUgec7yQNkN+_+sHBP-NtCnfktCFEuPHTDQ@mail.gmail.com>
Message-ID: <CAHk-=wgrgRqeEo-YUgec7yQNkN+_+sHBP-NtCnfktCFEuPHTDQ@mail.gmail.com>
Subject: Re: [patch 01/15] mm/memory.c: avoid access flag update TLB flush for
 retried page fault
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Hillf Danton <hdanton@sina.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Yu Xu <xuyu@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Hugh Dickins <hughd@google.com>,
 Josef Bacik <josef@toxicpanda.com>, Will Deacon <will.deacon@arm.com>,
 Linux-MM <linux-mm@kvack.org>, Matthew Wilcox <willy@infradead.org>,
 Johannes Weiner <hannes@cmpxchg.org>, mm-commits@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 28, 2020 at 3:53 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> The quirk is a problem with coprocessor where it's supposed to
> invalidate the translation after a fault but it doesn't, so we can get a
> read-only TLB stuck after something else does a RO->RW upgrade on the
> TLB. Something like that IIRC.  Coprocessors have their own MMU which
> lives in the nest not the core, so you need a global TLB flush to
> invalidate that thing.

So I assumed, but it does seem confused.

Why? Because if there are stale translations on the co-processor,
there's no guarantee that one of the CPU's will have them and take a
fault.

So I'm not seeing why a core CPU doing spurious TLB invalidation would
follow from "stale TLB in the Nest".

If anything, I think "we have a coprocessor that needs to never have
stale TLB entries" would impact the _regular_ TLB invalidates (by
update_mmu_cache()) and perhaps make those more aggressive, exactly
because the coprocessor may not handle the fault as gracefully.

I dunno. I don't know the coprocessor side well enough to judge, I'm
just looking at it from a conceptual standpoint.

          Linus
