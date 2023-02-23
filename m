Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1D16A0F2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 19:09:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN1Jd40Lzz3ccw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 05:09:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=T5IJAdz1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e34; helo=mail-vs1-xe34.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=T5IJAdz1;
	dkim-atps=neutral
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN1Hk0K5sz3bgj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 05:09:04 +1100 (AEDT)
Received: by mail-vs1-xe34.google.com with SMTP id g12so18714017vsf.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 10:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFS2s1TR/3Kjk49puEHZLo8Qp1XbI3IEgMXOzJt184k=;
        b=T5IJAdz1LLwq9Wpe/lYsePig5wU3ht7E3XBfh+hgfH9QST0GfyYIgBlwgpI5O4mani
         rZIblgtTc6rbIYvr29cW1lsZGQDsNNjbLJmM9HYUEKikey9Qql1PRkJPgYlaRmFu5e2N
         LGj2FMYFaOEkWL8mGYvTQ3Vn7z0ODfq96Tsg1YXvbb5WVEEyoz5Sfs0JGBUwPeZzM21h
         27AMPaY+3E8diGs3Qq+0UvjwD32cBcn5tHRKFEFz4XJWCYmEnw744gDyE01cZp3Q9MRJ
         C7l0NSF4td3tovqrUj6grQE1k5M5JoTxHepZybKKiQDz154BjPBgwzQNflKkDkbRn1Fi
         zNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFS2s1TR/3Kjk49puEHZLo8Qp1XbI3IEgMXOzJt184k=;
        b=lW0+giaLiigHbSFWCNiDy/Dnkp3VYTt5lh8ulqhDsu9r5SxNGOiTv2rr1WlR50na7o
         bTn/lf+zAtfTx5T/2HRolNBB655fA4L3Bx6dvPX3qymY4mFG+AOAKt4n2+gLNnGxl/A7
         VLewCFBR13VZi2WPvfeJQhUP5333IEumG874GFChUQpukaRAZoes4ODi3by5+odcsob6
         KnCI4E407fZvrqHwxZaXd2Lgsl/fL162DJZ3YDBNGYa8UvcUvvg3G+UISN+J+b29F05n
         DluLLpWdX7RPbcjhcRRvPWcLF3Fb75Yptth0rA+fCx+2wbUZs7DKGBJSu+1Tr7s6U4tv
         220g==
X-Gm-Message-State: AO0yUKXmtaJ7EFO6OaMQUQibR9sYzDVWzCghh+8FNL0ObpGxBuV/SP1S
	wIJhmlR2Voke66QYXDTSaCXAaIARtQKE62CjZ/WjrA==
X-Google-Smtp-Source: AK7set/BLzsOKlrQCPCfz1/Srjggdbaz1bD3yeHmhdVN17JBRgqFpgtS/JiELfEpEe2qyTgQFGrUqdU1JBFociC1vOk=
X-Received: by 2002:a05:6102:22c2:b0:414:d29b:497c with SMTP id
 a2-20020a05610222c200b00414d29b497cmr479716vsh.6.1677175740528; Thu, 23 Feb
 2023 10:09:00 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-6-yuzhao@google.com>
 <Y/elw7CTvVWt0Js6@google.com>
In-Reply-To: <Y/elw7CTvVWt0Js6@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 23 Feb 2023 11:08:21 -0700
Message-ID: <CAOUHufbAKpv95k6rVedstjD_7JzP0RrbOD652gyZh2vbAjGPOg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 5/5] mm: multi-gen LRU: use mmu_notifier_test_clear_young()
To: Sean Christopherson <seanjc@google.com>
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023 at 10:43=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Thu, Feb 16, 2023, Yu Zhao wrote:
> > An existing selftest can quickly demonstrate the effectiveness of this
> > patch. On a generic workstation equipped with 128 CPUs and 256GB DRAM:
>
> Not my area of maintenance, but a non-existent changelog (for all intents=
 and
> purposes) for a change of this size and complexity is not acceptable.

Will fix.

> >   $ sudo max_guest_memory_test -c 64 -m 250 -s 250
> >
> >   MGLRU      run2
> >   ---------------
> >   Before    ~600s
> >   After      ~50s
> >   Off       ~250s
> >
> >   kswapd (MGLRU before)
> >     100.00%  balance_pgdat
> >       100.00%  shrink_node
> >         100.00%  shrink_one
> >           99.97%  try_to_shrink_lruvec
> >             99.06%  evict_folios
> >               97.41%  shrink_folio_list
> >                 31.33%  folio_referenced
> >                   31.06%  rmap_walk_file
> >                     30.89%  folio_referenced_one
> >                       20.83%  __mmu_notifier_clear_flush_young
> >                         20.54%  kvm_mmu_notifier_clear_flush_young
> >   =3D>                      19.34%  _raw_write_lock
> >
> >   kswapd (MGLRU after)
> >     100.00%  balance_pgdat
> >       100.00%  shrink_node
> >         100.00%  shrink_one
> >           99.97%  try_to_shrink_lruvec
> >             99.51%  evict_folios
> >               71.70%  shrink_folio_list
> >                 7.08%  folio_referenced
> >                   6.78%  rmap_walk_file
> >                     6.72%  folio_referenced_one
> >                       5.60%  lru_gen_look_around
> >   =3D>                    1.53%  __mmu_notifier_test_clear_young
>
> Do you happen to know how much of the improvement is due to batching, and=
 how
> much is due to using a walkless walk?

No. I have three benchmarks running at the moment:
1. Windows SQL server guest on x86 host,
2. Apache Spark guest on arm64 host, and
3. Memcached guest on ppc64 host.

If you are really interested in that, I can reprioritize -- I need to
stop 1) and use that machine to get the number for you.

> > @@ -5699,6 +5797,9 @@ static ssize_t show_enabled(struct kobject *kobj,=
 struct kobj_attribute *attr, c
> >       if (arch_has_hw_nonleaf_pmd_young() && get_cap(LRU_GEN_NONLEAF_YO=
UNG))
> >               caps |=3D BIT(LRU_GEN_NONLEAF_YOUNG);
> >
> > +     if (kvm_arch_has_test_clear_young() && get_cap(LRU_GEN_SPTE_WALK)=
)
> > +             caps |=3D BIT(LRU_GEN_SPTE_WALK);
>
> As alluded to in patch 1, unless batching the walks even if KVM does _not=
_ support
> a lockless walk is somehow _worse_ than using the existing mmu_notifier_c=
lear_flush_young(),
> I think batching the calls should be conditional only on LRU_GEN_SPTE_WAL=
K.  Or
> if we want to avoid batching when there are no mmu_notifier listeners, pr=
obe
> mmu_notifiers.  But don't call into KVM directly.

I'm not sure I fully understand. Let's present the problem on the MM
side: assuming KVM supports lockless walks, batching can still be
worse (very unlikely), because GFNs can exhibit no memory locality at
all. So this option allows userspace to disable batching.

I fully understand why you don't want MM to call into KVM directly. No
acceptable ways to set up a clear interface between MM and KVM other
than the MMU notifier?
