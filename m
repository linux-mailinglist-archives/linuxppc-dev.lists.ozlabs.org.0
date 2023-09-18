Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842A7A4DF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 18:04:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=fEa5iDqP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rq8jx5lPCz3cWp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 02:04:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=fEa5iDqP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rq8j4222dz30f9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 02:03:18 +1000 (AEST)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-65631aa8b93so21218506d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 09:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1695052995; x=1695657795; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1AtaBW2SsBllDiJ99v10Ny7HNDE5iUEtI8mOBYM/rVQ=;
        b=fEa5iDqPg5Uw3Rv1t7np19+/Oj7ZnluwU1MW3uVcYwKDyMiQ4tVP9oSV3LPvrpXa7A
         M+LlmCaRqX0tlPTLFeG6oetDeybXE7dHXEkPy7sVTcOu3k+HVyTjbUQmjNQvG27sRiO4
         vudfKGZ8ikV+uRS0O5mCkQ2xzz25KjY/NRiUEs6AA2OlQytGoA34hddNuZKEHxd24yui
         HlNP8FoWCTPkgwOtc6UqRdmCO6/Z4Na5LHZNpVdfGNfK4mJiIimiGwkEaNR6bG4U3FE/
         BKeeG90D03924bj3P3WCNnluyA9FwdFRbJrom2KwOCWsRofpBZxZ9u78XQrv5PtWlr8j
         j1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052995; x=1695657795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AtaBW2SsBllDiJ99v10Ny7HNDE5iUEtI8mOBYM/rVQ=;
        b=Okm5swuPetXePVmDqL4jZQ0MmpaWaDoRu6cjfDdW1qMoR7MI5Vi7cg9HKYYd0SFktg
         q3OB9nKXcvhoEzlrAqEfx2LKP8MlB+jmWUc4UoCzQWudegn4DLt02IBIgNzwIp/qGF/e
         Xzpp5e2yF7nusgTyzDjC8id2SpAyJ/+7cnZPsh5JbVHKxNj7ulv1r7p7eYjx0aj6WKY/
         PG+tjLr1SBARVXLShvugF7CxGwYzVI9EkMqxcwzL+UlfrFQaxjtZxyY5Y1RbTjUs5Fzh
         2qTYHiXfiU882xPKeP3VP9C4G2a2yPic21/KIelRE7fhVWogu0hA6/7ik21I5JU58LNa
         3O1Q==
X-Gm-Message-State: AOJu0YxBrJehUeUudluKUDj2UYz0ITlmLtfGt6FYSL+eQF9AbTfdb9g7
	gOzy1MM6ouYqOQkohRATDWmoDw==
X-Google-Smtp-Source: AGHT+IH/YnREI891cZLYoBidRStzCIsQeTayS2VX/iNCJzxAWIRbDBhzALGmOqWbEj1DKL9seHAlIw==
X-Received: by 2002:a0c:eacf:0:b0:655:78f5:bef7 with SMTP id y15-20020a0ceacf000000b0065578f5bef7mr9471806qvp.21.1695052995341;
        Mon, 18 Sep 2023 09:03:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id u20-20020a0cdd14000000b006581e82a628sm989437qvk.134.2023.09.18.09.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 09:03:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qiGiA-0005k6-DG;
	Mon, 18 Sep 2023 13:02:58 -0300
Date: Mon, 18 Sep 2023 13:02:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
Message-ID: <20230918160258.GL13795@ziepe.ca>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-6-seanjc@google.com>
 <20230918152110.GI13795@ziepe.ca>
 <ZQhxpesyXeG+qbS6@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQhxpesyXeG+qbS6@google.com>
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
Cc: x86@kernel.org, kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, Andrew Thornton <andrewth@google.com>, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Venkatesh Srinivas <venkateshs@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>, And
 y Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Krowiak <akrowiak@linux.ibm.com>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023 at 08:49:57AM -0700, Sean Christopherson wrote:
> On Mon, Sep 18, 2023, Jason Gunthorpe wrote:
> > On Fri, Sep 15, 2023 at 05:30:57PM -0700, Sean Christopherson wrote:
> > > Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
> > > VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
> > > KVM and VFIO do symbol lookups increases the overall complexity and places
> > > an unnecessary dependency on KVM (from VFIO) without adding any value.
> > > 
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  drivers/vfio/vfio.h      |  2 ++
> > >  drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
> > >  include/linux/vfio.h     |  4 ++-
> > >  virt/kvm/vfio.c          |  9 +++--
> > >  4 files changed, 47 insertions(+), 42 deletions(-)
> > 
> > I don't mind this, but Christoph had disliked my prior attempt to do
> > this with function pointers..
> > 
> > The get can be inlined, IIRC, what about putting a pointer to the put
> > inside the kvm struct?
> 
> That wouldn't allow us to achieve our goal, which is to hide the details of
> "struct kvm" from VFIO (and the rest of the kernel).

> What's the objection to handing VFIO a function pointer?

Hmm, looks like it was this thread:

 https://lore.kernel.org/r/0-v1-33906a626da1+16b0-vfio_kvm_no_group_jgg@nvidia.com

Your rational looks a little better to me.

> > The the normal kvm get/put don't have to exported symbols at all?
> 
> The export of kvm_get_kvm_safe() can go away (I forgot to do that in this series),
> but kvm_get_kvm() will hang around as it's needed by KVM sub-modules (PPC and x86),
> KVMGT (x86), and drivers/s390/crypto/vfio_ap_ops.c (no idea what to call that beast).

My thought would be to keep it as an inline, there should be some way
to do that without breaking your desire to hide the bulk of the kvm
struct content. Like put the refcount as the first element in the
struct and just don't ifdef it away?.

Jason
