Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8E4767950
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 02:04:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Zp0GOXqU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCPrD6dL5z3cWq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 10:04:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Zp0GOXqU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3vlfezaykdemxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCPqJ185Pz2yDy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 10:03:37 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1bb962ada0dso17078825ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 17:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690589015; x=1691193815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJg9MbukUkeAf25VcBnSvGPEfaUIyqqF94QJU8orhSY=;
        b=Zp0GOXqU9vAtanM7byzLEY1ZTAuQCQrnfrak1thKcFFHMBCZO/N4KqKDBd5I3kJffW
         Vh8ovzLtMVpv7R9tgjnJuitRPz0iowTqbSccpqb9sCrit8s8jZkHgE3EKWmaz9/YJybN
         uhR+1LBQ/EGKFm12kofvmo1N8Or8Mhd5I9QIxgAZxJjUnAncn/OfNQ+xg9V9rSfFrTW5
         6+gyXWvxsDfod0XUAEoSS/aCS0HqakbjGuI1/I8BU2Uy6FDW2YJ6LrCVt60GU5GehRX5
         3Ug/sPFW2Iawha4cKCkpfEtG9Mwjo7aL2M8Rz65tztUDm7ObzFqkZ6ozvUAWJtziwaLO
         +gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690589015; x=1691193815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJg9MbukUkeAf25VcBnSvGPEfaUIyqqF94QJU8orhSY=;
        b=Bc6tNL5hkO3nK5xTuYezBRcn+CJnvP9HN8NqfzUCZz2/GHEAMScJ7jPD2alf1mX+RM
         Y17zZYLu9GCBTtyfoktqD9BQuVjBPSg2m82HOiLqB8kKF6SM4l1QDpbBscxk5VrntSAI
         y6SI0xve/pZlIGZGpaRoPLAz4s7HSD0t6vNPDi2W1ZGrJTH/3uYNLtlY8+UevHW/E5VN
         d/Iz20RqqvaUPf3dW9AT8uLpR5RfkomVK4X2a/fdc2ttwr5cLobYXSukvi0JVxz52Owm
         KpFnBAx1AhlIG16MEHd1MOcgIQjRz9dk6LoXYyerfEbOGjnjrRfvbkjuIq45DDAMpnxt
         OtNQ==
X-Gm-Message-State: ABy/qLacrJ0kk472TJ/vZY5KysmIWTTLCS0ljpnMKUcWLh3dLn7IXQHg
	c+WQxwsxY3fbeRtNr45uye4v1ez1WDw=
X-Google-Smtp-Source: APBJJlGy4rMQGFiWHQC+IuRONPQH0HvvNAt7asJXiFk+bZ/uVjfNOjPYVgrOl+x+eQJGyA+j61wbqvGP0DI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c951:b0:1ae:6895:cb96 with SMTP id
 i17-20020a170902c95100b001ae6895cb96mr12864pla.5.1690589014804; Fri, 28 Jul
 2023 17:03:34 -0700 (PDT)
Date: Fri, 28 Jul 2023 17:03:33 -0700
In-Reply-To: <ZMOJgnyzzUNIx+Tn@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-7-seanjc@google.com>
 <ZMOJgnyzzUNIx+Tn@google.com>
Message-ID: <ZMRXVZYaJ9wojGtS@google.com>
Subject: Re: [RFC PATCH v11 06/29] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
From: Sean Christopherson <seanjc@google.com>
To: Quentin Perret <qperret@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linu
 x-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 28, 2023, Quentin Perret wrote:
> On Tuesday 18 Jul 2023 at 16:44:49 (-0700), Sean Christopherson wrote:
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -95,6 +95,16 @@ struct kvm_userspace_memory_region {
> >  	__u64 userspace_addr; /* start of the userspace allocated memory */
> >  };
> >  
> > +/* for KVM_SET_USER_MEMORY_REGION2 */
> > +struct kvm_userspace_memory_region2 {
> > +	__u32 slot;
> > +	__u32 flags;
> > +	__u64 guest_phys_addr;
> > +	__u64 memory_size;
> > +	__u64 userspace_addr;
> > +	__u64 pad[16];
> 
> Should we replace that pad[16] with:
> 
> 	__u64 size;
> 
> where 'size' is the size of the structure as seen by userspace? This is
> used in other UAPIs (see struct sched_attr for example) and is a bit
> more robust for future extensions (e.g. an 'old' kernel can correctly
> reject a newer version of the struct with additional fields it doesn't
> know about if that makes sense, etc).

"flags" serves that purpose, i.e. allows userspace to opt-in to having KVM actually
consume what is currently just padding.

The padding is there mainly to simplify kernel/KVM code, e.g. the number of bytes
that KVM needs to copy in is static.

But now that I think more on this, I don't know why we didn't just unconditionally
bump the size of kvm_userspace_memory_region.  We tried to play games with unions
and overlays, but that was a mess[*].

KVM would need to do multiple uaccess reads, but that's not a big deal.  Am I
missing something, or did past us just get too clever and miss the obvious solution?

[*] https://lkml.kernel.org/r/Y7xrtf9FCuYRYm1q%40google.com
