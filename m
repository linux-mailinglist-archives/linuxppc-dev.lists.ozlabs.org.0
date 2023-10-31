Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC667DCEE2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 15:17:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hDQ2Nw44;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKXJf5XHJz3cWF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 01:17:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hDQ2Nw44;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3mqxbzqykdh4ugcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKXHn2RSvz2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 01:16:19 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1cc29f3afe0so27231315ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 07:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698761777; x=1699366577; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+SCWDVcx1K76tZHWI6JguONJ6NnGeKLP7+QbYfrb3Rs=;
        b=hDQ2Nw44CkM7pOrgWfRrd8G3SmGDGLyy0xsX4otPPooBXi+cpgFKr4jM1j6/KcCg/d
         Pll7huQsX7mgZommOI4dXwUkMvZdAvHO7Y9GNhkTnsTPYERevdc51hvhNg66vnIUTfNw
         yC6M2mSsYPRADxXbzAq2YHhcJGF+kilLdZAHAubNArWff4IxNLeeiIdbLbBdyew3de5a
         chJy4g/ejWTvYnLk6ZzOdeQiWPuyyJmCI8B4IZZQzcj+TwdWCCKRIc3Zrtp+1v0D45bb
         Y3Q0yxPRcsEAUJdYt7xetOpacy3L2PO9+xJGaNKHWHi2apfHKDsNVk99mqRIZv1Q8ujg
         Tblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698761777; x=1699366577;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+SCWDVcx1K76tZHWI6JguONJ6NnGeKLP7+QbYfrb3Rs=;
        b=sRf5J6ltVXpctg7fDLPnjg2ew60Oe3YsO6+a2tllw1bHPoroMarpHEaieWVUpQwn/5
         gYhJHNQub3T4+Yslu4vZa5b/7ZFqWCUxnh/bEZBWz4YoTidW5OT273o1DZdgfFE+lR70
         lFuaDCyrDCmstHeNWuM4ohW2MjGyBEsMb1QB30bjbihpfhp/BlqqTzdq6XSlflZesq8/
         7+/1B73Ru4aOQfJNCHqk7JHeYJcad7F3nEo+yI/IHXd7GBO4YIzTwAVeA+Cgh4YShzyw
         lIG/iJe8RNQKOLoI6IkcIiYA5FYOilcl8LqymLaOatPt0WaBjp23sotnEs3cULEF1Qer
         oVqw==
X-Gm-Message-State: AOJu0Yy2hOm3itWFQtAWNFGUg34udzvqyHvC4RE0bopzyaNQx3E6ozSv
	qEu0hdcOx/wkCy8SDqUrWQfCAMaRj1M=
X-Google-Smtp-Source: AGHT+IG8tFKfIuO6cbI6ukftnUzYB8muWE8fOHZgWpajrHJaT+RkL+zDaTOo8ZNIlEatfvapWXD9jFRr58g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2616:b0:1cc:2549:c281 with SMTP id
 jd22-20020a170903261600b001cc2549c281mr206233plb.13.1698761777291; Tue, 31
 Oct 2023 07:16:17 -0700 (PDT)
Date: Tue, 31 Oct 2023 07:16:15 -0700
In-Reply-To: <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
Message-ID: <ZUEML6oJXDCFJ9fg@google.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.co
 m>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 31, 2023, Xiaoyao Li wrote:
> On 10/28/2023 2:21 AM, Sean Christopherson wrote:
> > Extended guest_memfd to allow backing guest memory with transparent
> > hugepages. Require userspace to opt-in via a flag even though there's no
> > known/anticipated use case for forcing small pages as THP is optional,
> > i.e. to avoid ending up in a situation where userspace is unaware that
> > KVM can't provide hugepages.
> 
> Personally, it seems not so "transparent" if requiring userspace to opt-in.
> 
> People need to 1) check if the kernel built with TRANSPARENT_HUGEPAGE
> support, or check is the sysfs of transparent hugepage exists; 2)get the
> maximum support hugepage size 3) ensure the size satisfies the alignment;
> before opt-in it.
> 
> Even simpler, userspace can blindly try to create guest memfd with
> transparent hugapage flag. If getting error, fallback to create without the
> transparent hugepage flag.
> 
> However, it doesn't look transparent to me.

The "transparent" part is referring to the underlying kernel mechanism, it's not
saying anything about the API.  The "transparent" part of THP is that the kernel
doesn't guarantee hugepages, i.e. whether or not hugepages are actually used is
(mostly) transparent to userspace.

Paolo also isn't the biggest fan[*], but there are also downsides to always
allowing hugepages, e.g. silent failure due to lack of THP or unaligned size,
and there's precedent in the form of MADV_HUGEPAGE.

[*] https://lore.kernel.org/all/84a908ae-04c7-51c7-c9a8-119e1933a189@redhat.com
