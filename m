Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6542315CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 00:56:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGX8Y14zrzDqdW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 08:55:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QExR6mpM; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGX6F5P1fzDr0X
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 08:53:56 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id d4so13120855pgk.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 15:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=rPvaIJsTa7QSmRB4+FT0JDT+3QUcTGNjyK9hLtnp7AU=;
 b=QExR6mpMbjP7XxA3L2xB6bq4pO236SDcrkAaxFk5fn86QrCqF6W1qk5/151cAo7V3P
 sGZlbna3+j7DcK3CfTT49Zku7t6rGQbpLcoMzA053Dax/Dtx7UCd/3KoB/jURMdtjptV
 82vUyunZkhhrS4N59MqKVfBjh7pkG+Hb1iaHEnp9dcCQZdotOs4yQTT9PxqbponSCsf0
 G/GzBXaWL8jPJ0knf1uYWf0IqaTmCtZA4w9AmRFMxU4HAxAqe55LNQsmmXlDLsFlnDhK
 j319sO0DQtYrYjpvlyNu5Kk8u3nQMIsGiC2VwQzpPJ5mHt+0SfP1aY5bkK+byinvA9Ly
 7VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=rPvaIJsTa7QSmRB4+FT0JDT+3QUcTGNjyK9hLtnp7AU=;
 b=b0FJTd8sFm3RlqbF4nsyLBx7t9P86WXWfOPuWlELzCpMH2sJmplnTs7aUxl/mkjxr/
 /lKrgpqLlOxOCuedInHH7S1CYgaW8tLsHt5SfKQdFy7Sz8OCl+hf+rKtpoV42WozFqvD
 8PfkzoDxK+Bd2ozcUimL/+WfLLj4I9MEK/dqYnM+2NzFeyhlXFTqPNc6dpwh9VC+kU+j
 DxdWHRv0kuy1J3qKxLAr4pAf7R2G8KIfjGc5xdqWu3ee66kSMrZRoXmiUD+dnkeY4Ixx
 SjSLODraTM9anmJ5LWHapgMob4XplylOoHUnMcUOCaYhVhv+CZDHUtQbDyT8jFpkWebP
 6rbw==
X-Gm-Message-State: AOAM531DLx4ItTQBDiAekVjApolBue3maqngs2PwkY1aeSFIwuJioi9H
 3KYmfmirzsPS4WQE/QOtE1w=
X-Google-Smtp-Source: ABdhPJw3KYFXS84ZjA9RZ8Qv+fooBrBV7ia4wIB8LUR60cvWjrKrS+q6E7HwTnn772TYIUQAr8b67g==
X-Received: by 2002:a63:3541:: with SMTP id c62mr3719887pga.127.1595976834443; 
 Tue, 28 Jul 2020 15:53:54 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id g6sm99671pfr.129.2020.07.28.15.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 15:53:53 -0700 (PDT)
Date: Wed, 29 Jul 2020 08:53:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [patch 01/15] mm/memory.c: avoid access flag update TLB flush for
 retried page fault
To: Linus Torvalds <torvalds@linux-foundation.org>
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
 <CAHk-=wgrgRqeEo-YUgec7yQNkN+_+sHBP-NtCnfktCFEuPHTDQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgrgRqeEo-YUgec7yQNkN+_+sHBP-NtCnfktCFEuPHTDQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1595974242.esf9644sf3.astroid@bobo.none>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Hillf Danton <hdanton@sina.com>,
 mm-commits@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Hugh Dickins <hughd@google.com>, Josef Bacik <josef@toxicpanda.com>,
 Will Deacon <will.deacon@arm.com>, Linux-MM <linux-mm@kvack.org>,
 Matthew Wilcox <willy@infradead.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Yu Xu <xuyu@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Yang Shi <yang.shi@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Linus Torvalds's message of July 29, 2020 5:02 am:
> On Tue, Jul 28, 2020 at 3:53 AM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> The quirk is a problem with coprocessor where it's supposed to
>> invalidate the translation after a fault but it doesn't, so we can get a
>> read-only TLB stuck after something else does a RO->RW upgrade on the
>> TLB. Something like that IIRC.  Coprocessors have their own MMU which
>> lives in the nest not the core, so you need a global TLB flush to
>> invalidate that thing.
>=20
> So I assumed, but it does seem confused.
>=20
> Why? Because if there are stale translations on the co-processor,
> there's no guarantee that one of the CPU's will have them and take a
> fault.
>=20
> So I'm not seeing why a core CPU doing spurious TLB invalidation would
> follow from "stale TLB in the Nest".

If the nest MMU access faults, it sends an interrupt to the CPU and
the driver tries to handle the page fault for it (I think that's how
it works).

> If anything, I think "we have a coprocessor that needs to never have
> stale TLB entries" would impact the _regular_ TLB invalidates (by
> update_mmu_cache()) and perhaps make those more aggressive, exactly
> because the coprocessor may not handle the fault as gracefully.

It could be done that way... Hmm although we do have something similar=20
also in radix__ptep_set_access_flags for the relaxing permissions case
so maybe this is required for not-present faults as well? I'm not=20
actually sure now.

But it's a bit weird and awkward because it's working around quirks in
the hardware which aren't regular, not because we're _completely_=20
confused (I hope).

Thanks,
Nick
