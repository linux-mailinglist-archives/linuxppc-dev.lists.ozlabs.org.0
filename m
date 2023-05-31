Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D657A718F0A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 01:24:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWlhM3XH4z3fGj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 09:24:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lyfbrHT4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::15; helo=out-21.mta1.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lyfbrHT4;
	dkim-atps=neutral
Received: from out-21.mta1.migadu.com (out-21.mta1.migadu.com [IPv6:2001:41d0:203:375::15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWlgV2FKvz3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 09:23:16 +1000 (AEST)
Date: Wed, 31 May 2023 23:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1685575383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXIoTlecMC6VxxSME1sHTXGjADcYTmN1y7mvnJvjlhM=;
	b=lyfbrHT4Q4zo1L0ArqeQIdJoep5zRjHJ2OLTTh3iRuaDrDCmyrt6ZdUnmT8D0VRFrnKrfd
	Fay41KvYXJP8CWHfKOE6M8su7vw1n8IEhIPvIvj0EphIHYOG0Ve9WKW9yduPpl6rDOCxtx
	CeLsU8HW8TNpYdjp9DmTE9Euk9lTN+Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH mm-unstable v2 04/10] kvm/arm64: make stage2 page tables
 RCU safe
Message-ID: <ZHfWzX04GlcNngdU@linux.dev>
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-5-yuzhao@google.com>
 <ZHJHJPBF6euzOFdw@linux.dev>
 <CAOUHufa74CufHziHSquO5bZwbFXz2MNssBzW+AH7=Xo5RCnQ0A@mail.gmail.com>
 <ZHZQdQAApIrw6fBu@linux.dev>
 <CAOUHufZOkBmZJgCU2xW2B8S3P3TWERHezy0xKWY9_TeyV9K7Rg@mail.gmail.com>
 <ZHef0VsZvZ1Vnz0u@linux.dev>
 <CAOUHufZrfnfcbrqSzmHkejR5MA2gmGKZ3LMRhbLHV+1427z=Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOUHufZrfnfcbrqSzmHkejR5MA2gmGKZ3LMRhbLHV+1427z=Tw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fab
 iano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 31, 2023 at 05:10:52PM -0600, Yu Zhao wrote:
> On Wed, May 31, 2023 at 1:28 PM Oliver Upton <oliver.upton@linux.dev> wrote:
> > On Tue, May 30, 2023 at 02:06:55PM -0600, Yu Zhao wrote:
> > > On Tue, May 30, 2023 at 1:37 PM Oliver Upton <oliver.upton@linux.dev> wrote:
> > > > As it is currently implemented, yes. But, there's potential to fast-path
> > > > the implementation by checking page_count() before starting the walk.
> > >
> > > Do you mind posting another patch? I'd be happy to ack it, as well as
> > > the one you suggested above.
> >
> > I'd rather not take such a patch independent of the test_clear_young
> > series if you're OK with that. Do you mind implementing something
> > similar to the above patch w/ the proposed optimization if you need it?
> 
> No worries. I can take the above together with the following, which
> would form a new series with its own merits, since apparently you
> think the !AF case is important.

Sorry if my suggestion was unclear.

I thought we were talking about ->free_removed_table() being called from
the stage-2 unmap path, in which case we wind up unnecessarily visiting
PTEs on a table known to be empty. You could fast-path that by only
initiating a walk if  page_count() > 1:

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 95dae02ccc2e..766563dc465c 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1331,7 +1331,8 @@ void kvm_pgtable_stage2_free_removed(struct kvm_pgtable_mm_ops *mm_ops, void *pg
 		.end	= kvm_granule_size(level),
 	};
 
-	WARN_ON(__kvm_pgtable_walk(&data, mm_ops, ptep, level + 1));
+	if (mm_ops->page_count(pgtable) > 1)
+		WARN_ON(__kvm_pgtable_walk(&data, mm_ops, ptep, level + 1));
 
 	WARN_ON(mm_ops->page_count(pgtable) != 1);
 	mm_ops->put_page(pgtable);


A lock-free access fault walker is interesting, but in my testing it hasn't
led to any significant improvements over acquiring the MMU lock for
read. Because of that I hadn't bothered with posting the series upstream.

-- 
Thanks,
Oliver
