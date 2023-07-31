Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6400B7691C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 11:31:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=guIUa9Tp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDtKs38NTz309D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 19:31:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=guIUa9Tp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=qperret@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RDtJt5SQvz2ykW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 19:30:53 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52227884855so6799870a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 02:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690795847; x=1691400647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ziEHdMiDKlKGEA4myzpOfHCTiCmmAiAT9VETtxXexS8=;
        b=guIUa9TpRYBjI0stX0rR0q2KYRVdgo42Rwix6s3W6cxhGOSx6PVyCTdA5g/AS2h33d
         qccXGdTTxsaL3dKPpzdUGCwz9sOnNjZP2QZ+IRlflzPGUckJBW/eFq4DipVJqbUG5NQ/
         5teoOLbLNLvidR0nDX0dInMVzU60IzUEZpiCJ78DCgLwH4VDVpyvS+PFDJmp2H2Cqsaq
         ckd8/Aqk96/l2tM08ubMYTGsra64KF4plRKJW4CV/d6dRMYvZWy3I0q2vTBh3JUMjdY2
         e0xEUNA9wJufu3+8SkFanLOhloqOVlBS3eZCjfmk+1nbmTk3VOjLRNz4/M5kaTwNZDzq
         GaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690795847; x=1691400647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziEHdMiDKlKGEA4myzpOfHCTiCmmAiAT9VETtxXexS8=;
        b=igtZ7ImUF04fhlFbJtjyMWb7ofEch7hFuZScPLHa7Y3p/gXHyoTYU1twlvDY4Kibtm
         ta3Mo0iNbaB2I4uTlgB4HLbYkoWY8a8GKvaIp9oR395pnq21Xv1KDXJXWILo62l3p73E
         p86JJgfETenS7lsropaXIG+pGff6CeuVgCAVAY2QVSW9JXdG5AwTcJMNYQXnbf0l2Uvd
         Ogx4gzRc7pqIzSpXmWsCiRgjKUbXidneZG2poRioDU6JKQn/FW/OVFW3MNbDzEp+BVwa
         lcH8vKYTEQSUAt09u+lyADtjZRTheYOwDUV96ceHp6AKcUHe+hMPno5DFEJpBeFrEdDh
         8V4Q==
X-Gm-Message-State: ABy/qLYVu9HxstqWHiVuz8q4WstFZqETZ0Vc5rMnNmsVqGK9rpEw84i1
	//1OhDcR02+ii6H3999DMpmfrA==
X-Google-Smtp-Source: APBJJlH9uJ20HU/xu6w4BzlZ8VKOTZ9pA8N8iNM1wVNpNPl9nuSdUi/k4VZmc0YpyQk9a9eYCl1pHA==
X-Received: by 2002:aa7:c554:0:b0:522:40dd:74f3 with SMTP id s20-20020aa7c554000000b0052240dd74f3mr9248786edr.39.1690795847077;
        Mon, 31 Jul 2023 02:30:47 -0700 (PDT)
Received: from google.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id q20-20020aa7da94000000b005228c045515sm5165439eds.14.2023.07.31.02.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:30:46 -0700 (PDT)
Date: Mon, 31 Jul 2023 09:30:43 +0000
From: Quentin Perret <qperret@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC PATCH v11 06/29] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
Message-ID: <ZMd/Q4fytFhinDDj@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-7-seanjc@google.com>
 <ZMOJgnyzzUNIx+Tn@google.com>
 <ZMRXVZYaJ9wojGtS@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMRXVZYaJ9wojGtS@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linu
 x-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 28 Jul 2023 at 17:03:33 (-0700), Sean Christopherson wrote:
> On Fri, Jul 28, 2023, Quentin Perret wrote:
> > On Tuesday 18 Jul 2023 at 16:44:49 (-0700), Sean Christopherson wrote:
> > > --- a/include/uapi/linux/kvm.h
> > > +++ b/include/uapi/linux/kvm.h
> > > @@ -95,6 +95,16 @@ struct kvm_userspace_memory_region {
> > >  	__u64 userspace_addr; /* start of the userspace allocated memory */
> > >  };
> > >  
> > > +/* for KVM_SET_USER_MEMORY_REGION2 */
> > > +struct kvm_userspace_memory_region2 {
> > > +	__u32 slot;
> > > +	__u32 flags;
> > > +	__u64 guest_phys_addr;
> > > +	__u64 memory_size;
> > > +	__u64 userspace_addr;
> > > +	__u64 pad[16];
> > 
> > Should we replace that pad[16] with:
> > 
> > 	__u64 size;
> > 
> > where 'size' is the size of the structure as seen by userspace? This is
> > used in other UAPIs (see struct sched_attr for example) and is a bit
> > more robust for future extensions (e.g. an 'old' kernel can correctly
> > reject a newer version of the struct with additional fields it doesn't
> > know about if that makes sense, etc).
> 
> "flags" serves that purpose, i.e. allows userspace to opt-in to having KVM actually
> consume what is currently just padding.

Sure, I've just grown to dislike static padding of that type -- it ends
up being either a waste a space, or is too small, while the 'superior'
alternative (having a 'size' member) doesn't cost much and avoids those
problems.

But no strong opinion really, this struct really shouldn't grow much,
so I'm sure that'll be fine in practice.

> The padding is there mainly to simplify kernel/KVM code, e.g. the number of bytes
> that KVM needs to copy in is static.
> 
> But now that I think more on this, I don't know why we didn't just unconditionally
> bump the size of kvm_userspace_memory_region.  We tried to play games with unions
> and overlays, but that was a mess[*].
> 
> KVM would need to do multiple uaccess reads, but that's not a big deal.  Am I
> missing something, or did past us just get too clever and miss the obvious solution?
> 
> [*] https://lkml.kernel.org/r/Y7xrtf9FCuYRYm1q%40google.com

Right, so the first uaccess would get_user() the flags, based on that
we'd figure out the size of the struct, copy_from_user() what we need,
and then sanity check the flags are the same from both reads, or
something along those lines?

That doesn't sound too complicated to me, and as long as every extension
to the struct does come with a new flag I can't immediately see what
would go wrong.
