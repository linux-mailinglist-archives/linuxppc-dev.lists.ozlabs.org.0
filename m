Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A08C8CB84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 08:07:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467fJ26pn0zDqdk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 16:07:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467fGC5HvRzDqVQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 16:05:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="idIoTCYl"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 467fGC3wb9z9sDQ; Wed, 14 Aug 2019 16:05:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 467fGC3B5jz9sN1; Wed, 14 Aug 2019 16:05:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1565762755; bh=YCkXcmC5Gsb762TGg9wJ63z1nfs5Twv2q5POXiB4PoE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=idIoTCYld2PtIDlihu7HiUCqhxl9LN2erk0m4g4ujaio5FWKqGaTm84CO4YZM1/PN
 psPOyN9aQBKbhzSnPhrqVNddZBZjxCg7AM5YJc9rmD4zr62pbVBi+0rxfnLrd+0LeE
 cphbdnEWVY/n94T7/hZdclGGP55HHt9gaOAHn/kPmWAIhKwyTCi5aKXicY5OyeW442
 2hHfYwylJHbatRCdn9OA92ytnvLODcynsJcN1Z7UbhxCYbZb5WlpZgEywcpCJ2M6yq
 LnUolWMsHxh4HDJvQMzhbQOi0wghqJgC2+JAvm4wd+Ut7+G/LQrzpg+ENRv2QRtwVY
 QyF00GLqNyuMQ==
Date: Wed, 14 Aug 2019 16:05:52 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: PPC: Book3S HV: Fix race in re-enabling XIVE
 escalation interrupts
Message-ID: <20190814060552.kh2gnfmnbmmtixvh@oak.ozlabs.ibm.com>
References: <20190813095845.GA9567@blackberry>
 <20190813100349.GD9567@blackberry>
 <53a17acd0330bc38190ab36625e48d1727a16fa4.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53a17acd0330bc38190ab36625e48d1727a16fa4.camel@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: linuxppc-dev@ozlabs.org, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 14, 2019 at 02:46:38PM +1000, Jordan Niethe wrote:
> On Tue, 2019-08-13 at 20:03 +1000, Paul Mackerras wrote:

[snip]
> > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > index 337e644..2e7e788 100644
> > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > @@ -2831,29 +2831,39 @@ kvm_cede_prodded:
> >  kvm_cede_exit:
> >  	ld	r9, HSTATE_KVM_VCPU(r13)
> >  #ifdef CONFIG_KVM_XICS
> > -	/* Abort if we still have a pending escalation */
> > +	/* are we using XIVE with single escalation? */
> > +	ld	r10, VCPU_XIVE_ESC_VADDR(r9)
> > +	cmpdi	r10, 0
> > +	beq	3f
> > +	li	r6, XIVE_ESB_SET_PQ_00
> Would it make sense to put the above instruction down into the 4: label
> instead? If we do not branch to 4, r6 is overwriten anyway. 

Right.

> I think that would save a load when we do not branch to 4. Also it

Well, li is a load immediate rather than a load ("load" would normally
imply a load from memory).  Load-immediate instructions are
essentially free since they can easily be executed in parallel with
other instructions and execute in a single cycle.

> would mean that you could use r5 everywhere instead of changing it to
> r6? 

Yes.  If I have to respin the patch for other reasons then I will
rearrange things as you suggest.  I don't think it's worth respinning
just for this change -- it won't reduce the total number of
instructions, and I strongly doubt there would be any measurable
performance difference.

> > +	/*
> > +	 * If we still have a pending escalation, abort the cede,
> > +	 * and we must set PQ to 10 rather than 00 so that we don't
> > +	 * potentially end up with two entries for the escalation
> > +	 * interrupt in the XIVE interrupt queue.  In that case
> > +	 * we also don't want to set xive_esc_on to 1 here in
> > +	 * case we race with xive_esc_irq().
> > +	 */
> >  	lbz	r5, VCPU_XIVE_ESC_ON(r9)
> >  	cmpwi	r5, 0
> > -	beq	1f
> > +	beq	4f
> >  	li	r0, 0
> >  	stb	r0, VCPU_CEDED(r9)
> > -1:	/* Enable XIVE escalation */
> > -	li	r5, XIVE_ESB_SET_PQ_00
> > +	li	r6, XIVE_ESB_SET_PQ_10
> > +	b	5f
> > +4:	li	r0, 1
> > +	stb	r0, VCPU_XIVE_ESC_ON(r9)
> > +	/* make sure store to xive_esc_on is seen before xive_esc_irq
> > runs */
> > +	sync
> > +5:	/* Enable XIVE escalation */
> >  	mfmsr	r0
> >  	andi.	r0, r0, MSR_DR		/* in real mode? */
> >  	beq	1f
> > -	ld	r10, VCPU_XIVE_ESC_VADDR(r9)
> > -	cmpdi	r10, 0
> > -	beq	3f
> > -	ldx	r0, r10, r5
> > +	ldx	r0, r10, r6
> >  	b	2f
> >  1:	ld	r10, VCPU_XIVE_ESC_RADDR(r9)
> > -	cmpdi	r10, 0
> > -	beq	3f
> > -	ldcix	r0, r10, r5
> > +	ldcix	r0, r10, r6
> >  2:	sync
> > -	li	r0, 1
> > -	stb	r0, VCPU_XIVE_ESC_ON(r9)
> >  #endif /* CONFIG_KVM_XICS */
> >  3:	b	guest_exit_cont
> >  

Paul.
