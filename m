Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D13A7A952C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 16:25:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uypvPAE1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RryNc26Fjz3cLN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 00:25:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uypvPAE1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3h1imzqykdcqseanjcgoogle.comlinuxppc-devlists.ozlabs.org@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RryMk50c7z2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 00:24:33 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c448ba292dso8362645ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 07:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695306271; x=1695911071; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFujV55InQpfIcmwhWIdcFo9LOSK6bP3ULKilR3pEPA=;
        b=uypvPAE1wk2nXrdiF0mhMLNGyVezcJH9t+2HVkPSf1DJx7PD0jrNqwKxPDyQypGwZk
         n4YEsfM9fc33Nt8kMhTl2H0rg1O8e9D4CM3W5V7Q/f2+qgm313gC/23N0SKiI4T/G6qS
         UJKPTwd+1RR/LNKpxtrXnsJbE5ssBvNvILMkKegtPGEeD70c19HDAuc+tsCmKKy9kmih
         UTbhTF15ocbnwbOgoflDwslUOaQxixQK5xd6nAMn/x2iE7yBp2NQ9Y3pZzF4iEd3z3yy
         n/RAkgOcUkTzH7pTwSkGKsbB58niOeHdL5LRmSqEIzPI75GcB6sei4tdVAGGr00YV6y2
         xvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306271; x=1695911071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFujV55InQpfIcmwhWIdcFo9LOSK6bP3ULKilR3pEPA=;
        b=EvmgdB/hpVh2GwRZpEu8Gw7lQsV4R+4sbxhqBqVzckDpibxan91Ys0PWmAdplDCrg+
         hVv0E9vsSEuyQ/Nx+Pu8kk7LiLmJoIcAMBI4u0pyilnzhXc37XNqHluonoYakcsGL6G8
         0kI8I3gVx7s3R2NBOvIHoDDW8wDwDEKuQn1MYy0UHpbBe2IVRuGs43NXkSJd2GCrkDI4
         j0yO72OLW/5aVPHTVm5czYY0qtXmBRohd4ufFxe9YEO31c9cajv0UszqMOiQZCYm2gga
         Jancj9a9+NxvP9PoMAD7tcxDq3bzUF7c3WBG8wwKdds2LMpKmHx1ox15mIP3woidTPLu
         48CA==
X-Gm-Message-State: AOJu0Yzb2gudBmpyCQ6ue7s8Z8aOAopnJcO+q/wWXSOw3Rkea86fm+hU
	Z0X0QDPZx2cYF30m3QPueT5YkBwSkhY=
X-Google-Smtp-Source: AGHT+IGn6bxt0aytyfRrQvdNGXaSXeT8sIcIptWMB2qfEas65NY2TcrLdWuDyigFBOjNZ28AUG3erUeC33s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ce86:b0:1c3:c127:558 with SMTP id
 f6-20020a170902ce8600b001c3c1270558mr71199plg.0.1695306271120; Thu, 21 Sep
 2023 07:24:31 -0700 (PDT)
Date: Thu, 21 Sep 2023 07:24:29 -0700
In-Reply-To: <ZQus1v3AvEZjuat9@yilunxu-OptiPlex-7050>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-3-seanjc@google.com>
 <ZQqMBEL61p739dpF@yilunxu-OptiPlex-7050> <ZQr5uXhV6Cnx4DYT@google.com> <ZQus1v3AvEZjuat9@yilunxu-OptiPlex-7050>
Message-ID: <ZQxSHXIGdWXy+zDU@google.com>
Subject: Re: [RFC PATCH v12 02/33] KVM: Use gfn instead of hva for mmu_notifier_retry
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@intel.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@orac
 le.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023, Xu Yilun wrote:
> When the invalidation acrosses multiple slots, I'm not sure if the
> contiguous HVA range must correspond to contiguous GFN range. If not,
> are we producing a larger range than required?

Multiple invalidations are all but guaranteed to yield a range that covers addresses
that aren't actually being invalidated.  This is true today.

> And when the invalidation acrosses multiple address space, I'm almost
> sure it is wrong to merge GFN ranges from different address spaces. 

It's not "wrong" in the sense that false positives do not cause functional
problems, at worst a false positive can unnecessarily stall a vCPU until the
unrelated invalidations complete.

Multiple concurrent invalidations are not common, and if they do happen, they are
likely related and will have spacial locality in both host virtual address space
and guest physical address space.  Given that, we chose for the simple (and fast!)
approach of maintaining a single all-encompassing range.
