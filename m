Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF69523082F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 12:55:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGD931QwVzDqH6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 20:55:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LOlyux90; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGD722WcRzDqnF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 20:53:33 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id c6so4722957pje.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 03:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=agRMqGGlf6WEhzng1JHJTfSL3lgFlGnxzJ0Cav+bYwY=;
 b=LOlyux900DwySJrPY4APfRX1lil/nI28/QfYF1AYlmE+78dPK5RYl6rQ+sD5+x5MA7
 playMugBZGJPi4cNxmeP+cB0atQX1/GTXF03Pb/x2CQuKNPkiq1Waz1Ky+uypI3zPBSW
 YxU5r/gfiPvvENminX12cG6746FlKyqgYVwOqF0W5IlOPxW4T/F2yNlR2vFRm8/RzuPL
 P1B0c7lbUooXxICuyibePBquJuQisL8LvIEyaJISfFRcWpoYQESGRDwq8TevCKApJ6e/
 fJla/uli1Og8SbOWaKOadogeThM5RYLbSZ5LSpD9XEG3FW2zmhtctXWhQqI+shiRcdy8
 7X2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=agRMqGGlf6WEhzng1JHJTfSL3lgFlGnxzJ0Cav+bYwY=;
 b=Q16e0phO8gWuyYJSOdcZEbXQltKqRtN34Bt3FwDmwCzgIAh07upff0pgWdkC7i7nxE
 zEuyiWFasm2rIhCJcSFfbUvyXyutvBbBmUFd2CCl+5mfp5gMD+b6Yg1LnJTB//itts4V
 +Bpr7VZ76xYEE+cpohfMuARsKFCbGnUiRO7kwabmc1N2HK8oUrCU0aBjgNc1P76cJRVR
 ZBcKrjc1QuyrolvqwV3WGM1TsV4/I2Z1aQGAZUVmbF6OBA3W9LpEq+zXmjikB7sCqzWA
 quTWhCD66LgrhnW5Wse0j4gHMnDnkHcfkYCYL4/heMSb2kf31sO2oCUmsnbpZoPSlMy6
 lJHw==
X-Gm-Message-State: AOAM532lbtgaAVlSNG3k2hVeApgSvlumuocXBCgUiD5qPBAu9Ad5D8pF
 VmeLuWZfzvIOWWdGWq/xz/o=
X-Google-Smtp-Source: ABdhPJzDyUiZdoRIhWil/eQB9vL3D+ZkGma3UEEEz2L1OSFLOod9x5RLtms6ZoVyeVTnVsDId/pLZw==
X-Received: by 2002:a17:902:fe10:: with SMTP id
 g16mr955299plj.227.1595933609963; 
 Tue, 28 Jul 2020 03:53:29 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id z11sm17894138pfk.46.2020.07.28.03.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 03:53:29 -0700 (PDT)
Date: Tue, 28 Jul 2020 20:53:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [patch 01/15] mm/memory.c: avoid access flag update TLB flush for
 retried page fault
To: linux-arch <linux-arch@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Yang Shi <yang.shi@linux.alibaba.com>
References: <20200723211432.b31831a0df3bc2cbdae31b40@linux-foundation.org>
 <20200724041508.QlTbrHnfh%akpm@linux-foundation.org>
 <CAHk-=wguPA=pDskR-eMMjwR5LDEaMXrqbmDbrKr0u=wV1LE4rg@mail.gmail.com>
 <CAHk-=wh4kmU5FdT=Yy7N9wA=se=ALbrquCrOkjCMhiQnOBLvDA@mail.gmail.com>
 <0323de82-cfbd-8506-fa9c-a702703dd654@linux.alibaba.com>
 <20200727110512.GB25400@gaia>
 <39560818-463f-da3a-fc9e-3a4a0a082f61@linux.alibaba.com>
 <eb1f5cb4-7c3d-df42-f4aa-804e12df45e2@linux.alibaba.com>
 <CAHk-=wha6f0gF1SJg96R77h0oTuc_oO7-37wD=mYGy6TyJOwbQ@mail.gmail.com>
In-Reply-To: <CAHk-=wha6f0gF1SJg96R77h0oTuc_oO7-37wD=mYGy6TyJOwbQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1595932767.wga6c4yy6a.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Hillf Danton <hdanton@sina.com>, mm-commits@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Hugh Dickins <hughd@google.com>,
 Josef Bacik <josef@toxicpanda.com>, Will Deacon <will.deacon@arm.com>,
 Linux-MM <linux-mm@kvack.org>, Matthew Wilcox <willy@infradead.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Yu Xu <xuyu@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Linus Torvalds's message of July 28, 2020 4:37 am:
> [ Adding linux-arch, just to make other architectures aware of this issue=
 too.
>=20
>   We have a "flush_tlb_fix_spurious_fault()" thing to take care of the
> "TLB may contain stale entries, we can't take the same fault over and
> over again" situation.
>=20
>   On x86, it's a no-op, because x86 doesn't do that. x86 will re-walk
> the page tables - or possibly just always invalidate the faulting TLB
> entry - before taking a fault, so there can be no long-term stale
> TLB's.

[snip]

>   It looks like powerpc people at least thought about this, and only
> do it if there is a coprocessor. Which sounds a bit confused, but I
> don't know the rules.

I'm not sure about ppc32 and 64e, I'm almost certain they should do a=20
local flush if anyting, and someone with a good understanding of the=20
ISAs and CPUs might be able to nop it entirely. I agree global can't=20
ever really make sense (except as a default because we have no generic=20
local flush).

powerpc/64s reloads translations after taking a fault, so it's fine with=20
a nop here.

The quirk is a problem with coprocessor where it's supposed to=20
invalidate the translation after a fault but it doesn't, so we can get a=20
read-only TLB stuck after something else does a RO->RW upgrade on the=20
TLB. Something like that IIRC.  Coprocessors have their own MMU which=20
lives in the nest not the core, so you need a global TLB flush to
invalidate that thing.

Thanks,
Nick
