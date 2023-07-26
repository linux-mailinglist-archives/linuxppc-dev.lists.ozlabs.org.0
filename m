Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 231B0763902
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 16:25:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=KwMaCkiB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9x5Z0Nv5z3cNN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 00:25:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=KwMaCkiB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3vszbzaykdeg2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9x4h62yLz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 00:25:06 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-583fe0f84a5so35465347b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 07:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690381501; x=1690986301;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mt8/YY3u8LjsBjr8d6/ke2ZW25YHueLUKLJjDJYMc8s=;
        b=KwMaCkiB4xAqGBUh9OF2kV0ZTXZJ9t/BQNvELYTboh2nFXRCb/O6mzI5Rf4+JkOSUf
         GbfKDvzjuzeoTYk+8UzFDnEFGCf4Xp/4j132VlBFiOap0dqwF0d+IWavL7GkLuWIPxaf
         FtFh1NcigPTHGOQymzspNYZcGJWMeYjGrAKFBYQg3vkICZKAIWBqnifvNeqq77Udkh7Z
         xGehHXpHV6lJVR2/PB6tUzMEDhiwA5lq38Ga3ndr8/43j3+UY7kRIeUxbAwefFFreB6b
         OU07H0FnfDMXq+of8q/ygEkV9SZmVl7edMM6TzYoGxGd/1xqW6Xr5wUrtaTzZVCwe9dk
         Dlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690381501; x=1690986301;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mt8/YY3u8LjsBjr8d6/ke2ZW25YHueLUKLJjDJYMc8s=;
        b=UhRo5updCsj0k6I2kDkia2+rU1srZKD6gbjGDlzc/NVXOUfN1zpTc0XSk9kT8Pt3Bw
         HDg5QcQ3/PZNbEP+kZ3DSeDbiNeSZCOpN+8J3+r4SB8f5z6ANqZZkFpIntjatWQ8RgJX
         ZEeIAywMS04lrNaWDac5SeKnsiAOFrHrq31md3Isx7ecoStf/MPZz0k58iXLMZas0Q+e
         HH1H5uPmf+HK81Xrqv/8m5ZJ8H20ikZgv9EqI7yFydFcTa82uK+2tJyLFOvxOl+jq74Z
         xsFFsYe7eCafjgsZ0qGID9TwZEQLPejKd48WgZcsqM80PmioYIVWKPFeRAXwNyJU/ofL
         Khvg==
X-Gm-Message-State: ABy/qLYTX870UGG30KsnC3FRc5ik8Vr5OakU2NbidAge/yybPzdNa5sx
	3xXK6fWf3hLisZasB0Q0vraaNnuDpLI=
X-Google-Smtp-Source: APBJJlHpunM1lrfEfJpa6UtG2AaqQE17ubaKuYzputooU8ueGDVFO/y80053uMgFIUrJA+dTGv8yhoGEgv0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ac60:0:b0:576:de5f:95e1 with SMTP id
 z32-20020a81ac60000000b00576de5f95e1mr20181ywj.1.1690381501073; Wed, 26 Jul
 2023 07:25:01 -0700 (PDT)
Date: Wed, 26 Jul 2023 07:24:59 -0700
In-Reply-To: <2f98a32c-bd3d-4890-b757-4d2f67a3b1a7@amd.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <110f1aa0-7fcd-1287-701a-89c2203f0ac2@amd.com>
 <ZL6uMk/8UeuGj8CP@google.com> <2f98a32c-bd3d-4890-b757-4d2f67a3b1a7@amd.com>
Message-ID: <ZMEsuyqHhp1DAVdR@google.com>
Subject: Re: [RFC PATCH v11 00/29] KVM: guest_memfd() and per-page attributes
From: Sean Christopherson <seanjc@google.com>
To: "Nikunj A. Dadhania" <nikunj@amd.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver
  Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 26, 2023, Nikunj A. Dadhania wrote:
> Hi Sean,
> 
> On 7/24/2023 10:30 PM, Sean Christopherson wrote:
> >>   Starting an SNP guest with 40G memory with memory interleave between
> >>   Node2 and Node3
> >>
> >>   $ numactl -i 2,3 ./bootg_snp.sh
> >>
> >>     PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
> >>  242179 root      20   0   40.4g  99580  51676 S  78.0   0.0   0:56.58 qemu-system-x86
> >>
> >>   -> Incorrect process resident memory and shared memory is reported
> > 
> > I don't know that I would call these "incorrect".  Shared memory definitely is
> > correct, because by definition guest_memfd isn't shared.  RSS is less clear cut;
> > gmem memory is resident in RAM, but if we show gmem in RSS then we'll end up with
> > scenarios where RSS > VIRT, which will be quite confusing for unaware users (I'm
> > assuming the 40g of VIRT here comes from QEMU mapping the shared half of gmem
> > memslots).
> 
> I am not sure why will RSS exceed the VIRT, it should be at max 40G (assuming all the
> memory is private)

And also assuming that (a) userspace mmap()'d the shared side of things 1:1 with
private memory and (b) that the shared mappings have not been populated.   Those
assumptions will mostly probably hold true for QEMU, but kernel correctness
shouldn't depend on assumptions about one specific userspace application.

> >>   /proc/<qemu pid>/smaps
> >>   7f528be00000-7f5c8be00000 rw-p 00000000 00:01 26629                      /memfd:memory-backend-memfd-shared (deleted)
> >>   7f5c90200000-7f5c90220000 rw-s 00000000 00:01 44033                      /memfd:rom-backend-memfd-shared (deleted)
> >>   7f5c90400000-7f5c90420000 rw-s 00000000 00:01 44032                      /memfd:rom-backend-memfd-shared (deleted)
> >>   7f5c90800000-7f5c90b7c000 rw-s 00000000 00:01 1025                       /memfd:rom-backend-memfd-shared (deleted)
> > 
> > This is all expected, and IMO correct.  There are no userspace mappings, and so
> > not accounting anything is working as intended.
> Doesn't sound that correct, if 10 SNP guests are running each using 10GB, how
> would we know who is using 100GB of memory?

It's correct with respect to what the interfaces show, which is how much memory
is *mapped* into userspace.

As I said (or at least tried to say) in my first reply, I am not against exposing
memory usage to userspace via stats, only that it's not obvious to me that the
existing VMA-based stats are the most appropriate way to surface this information.
