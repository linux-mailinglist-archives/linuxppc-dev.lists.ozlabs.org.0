Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 322D175D0E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 19:50:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lZQ3ytVA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6xtS1RDXz3cT1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 03:50:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lZQ3ytVA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3t8w6zaykdpakwsfbuyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6xsb56knz2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 03:50:09 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d00a63fcdefso1479678276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 10:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689961807; x=1690566607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cGq520d0DqyrCnCF7s5Hdb0rD6NYwtkYzvVScy9HYVY=;
        b=lZQ3ytVABaMbgeRDyRyj2Y4aroG9rwZE4tos1KIi9+yVur8kHjUJfNDjBsWbA5klWv
         TLcM88saeccS8fNt+F3rMDPeeLUphdScBaSRyrIwijc1R9havyOwlUNE/IQcuJNK+B8L
         fg4nRh9mVWUewpR8WoS4y2UShReGqGQI/p2sPXI0/xi9S/4bLyRSoR+wjHm8ngFldPX/
         svRbdc4YBfOK5kZ24vC9n3F8L7Li2/2X6A5zsHfs5DeCFBQGgpDd6R/Lv+3ONLhdKh+D
         zucg4UeBA4sEAN2XLHlR2RolIKqE8NS9aws4SoQANyJbQckavpkDoby1VzLjItanYN4z
         z0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689961807; x=1690566607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGq520d0DqyrCnCF7s5Hdb0rD6NYwtkYzvVScy9HYVY=;
        b=IGbnBXwZ/UvD8FrRGQ2nMha+UwCPuOlNImPLtkDaJ4qMPRpoU5Ok+la16+0Mkvs2ls
         FBGOt6YF+i6w60bDHmTf1ebwGGiWtVKFOrrW/BYv5FCo5Ik2a2W8Uxir0jVHZE19wX0v
         pE3je55hmR+gLvsJrgHFTYrDmC3314MYl0cciDSuJvn2OuPLnsZ3WW9u0fyJLykLHs+H
         +edoASQXzr1DNqjQQOBwiBvE3Fm444hIAIsEElzJI2a+S81h1NrGEgq4s1ldJt3pXQ4p
         9pO1HyP6c7l0EcX1mh1ra+8fnMLX+AioOviRxG2r4hD5MGN2AEeLHdNHB7oHYQqXXId9
         tzAw==
X-Gm-Message-State: ABy/qLZSTLeO83GuRhSwiS1my3+YTiACKr3V0+SOSGVXMMW1my3b41+q
	46IAwC/hKANdiDmuhtyNUVQE27jYYhM=
X-Google-Smtp-Source: APBJJlGQVjm5RzrpH36bdluvnqR1OmovIF/Mv2HtKZQ0PUD+Zj6xyTxIa85gQ91Vm5Bag6YHDA7hXUEb4so=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:10cd:b0:c1c:df23:44ee with SMTP id
 w13-20020a05690210cd00b00c1cdf2344eemr19769ybu.0.1689961807734; Fri, 21 Jul
 2023 10:50:07 -0700 (PDT)
Date: Fri, 21 Jul 2023 10:50:06 -0700
In-Reply-To: <8ad7a846-64e9-a3f1-4bf1-731a994d62cb@redhat.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <8ad7a846-64e9-a3f1-4bf1-731a994d62cb@redhat.com>
Message-ID: <ZLrFTq2f1NXtlJWd@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-s
 ecurity-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 21, 2023, Paolo Bonzini wrote:
> On 7/19/23 01:44, Sean Christopherson wrote:
> > +	inode = alloc_anon_inode(mnt->mnt_sb);
> > +	if (IS_ERR(inode))
> > +		return PTR_ERR(inode);
> > +
> > +	err = security_inode_init_security_anon(inode, &qname, NULL);
> > +	if (err)
> > +		goto err_inode;
> > +
> 
> I don't understand the need to have a separate filesystem.  If it is to
> fully setup the inode before it's given a struct file, why not just export
> anon_inode_make_secure_inode instead of security_inode_init_security_anon?

Ugh, this is why comments are important, I can't remember either.

I suspect I implemented a dedicated filesystem to kinda sorta show that we could
allow userspace to provide the mount point with e.g. NUMA hints[*].  But my
preference would be to not support a userspace provided mount and instead implement
fbind() to let userspace control NUMA and whatnot.

[*] https://lore.kernel.org/all/ef48935e5e6f947f6f0c6d748232b14ef5d5ad70.1681176340.git.ackerleytng@google.com
