Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2B88AE55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 07:00:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4670sc4QWGzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 15:00:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4670qd6fTJzDqR7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 14:59:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="SBcQsiXN"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4670qd39hfz9sPG; Tue, 13 Aug 2019 14:59:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4670qd1zdnz9sP6; Tue, 13 Aug 2019 14:59:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1565672349; bh=8UJ/fbVBjvn5G6GKUqcRf7p6NknlS77OKW7AcNAtHL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SBcQsiXNS7jhwDQ+ruoR8BLpmEmdUp3VIS6DbaCA6/7WHzWV/WxO2I02unWgw/XsL
 NOWgWeLBEf4QNT78DtcCoFrydtjH+qe9BasscDCNTMamE4Fn+NUnSYuSZ4eIY4ghoH
 S2+++uPhY300Xlz4lyGVnrnYgf66XdmovrL1tgUhqdeZTSBWJa95xxC9+c8JZpgKEw
 FQF9iWL5g9xFscCp7h3M/3yNlZ9s4eUwL+9M/mfbYidARcrco+iJPJJf23aFqvj0tc
 ySUdvdenHKSQx544w1RWlf12tJbLD1MUNukXtKAA6jx1hVcHKguaNckRC1fHnxsgSP
 JdE7206A16yqg==
Date: Tue, 13 Aug 2019 14:56:39 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Lijun Pan <ljp@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/xive: Implement get_irqchip_state method for
 XIVE to fix shutdown race
Message-ID: <20190813045639.lm443zsouievhtne@oak.ozlabs.ibm.com>
References: <20190812050623.ltla46gh5futsqv4@oak.ozlabs.ibm.com>
 <20190812050743.aczgcqwmtqpkbx2l@oak.ozlabs.ibm.com>
 <E547965E-CC31-470F-8849-0F2A899A121F@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E547965E-CC31-470F-8849-0F2A899A121F@linux.vnet.ibm.com>
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

On Mon, Aug 12, 2019 at 10:52:11PM -0500, Lijun Pan wrote:
> 
> 
> > On Aug 12, 2019, at 12:07 AM, Paul Mackerras <paulus@ozlabs.org> wrote:

[snip]

> > +static void cleanup_single_escalation(struct kvm_vcpu *vcpu,
> > +				      struct kvmppc_xive_vcpu *xc, int irq)
> > +{
> > +	struct irq_data *d = irq_get_irq_data(irq);
> > +	struct xive_irq_data *xd = irq_data_get_irq_handler_data(d);
> > +
> > +	/*
> > +	 * This slightly odd sequence gives the right result
> > +	 * (i.e. stale_p set if xive_esc_on is false) even if
> > +	 * we race with xive_esc_irq() and xive_irq_eoi().
> > +	 */
> 
> Hi Paul,
> 
> I don’t quite understand the logic here.
> Are you saying the code sequence is
> vcpu->arch.xive_esc_on = false; (xive_esc_irq)
> then
> xd->stale_p = true; (cleanup_single_escaltion)
> 
> > +	xd->stale_p = false;
> > +	smp_mb();		/* paired with smb_wmb in xive_esc_irq */
> > +	if (!vcpu->arch.xive_esc_on)
> > +		xd->stale_p = true;

The natural sequence would be just
	xd->stale_p = !vcpu->arch.xive_esc_on;

However, imagine that vcpu->arch.xive_esc_on is true, and the
escalation interrupt gets handled on another CPU between the load of
vcpu->arch.xive_esc_on and the store to xd->stale_p.  The interrupt
code calls xive_esc_irq(), which clears vcpu->arch.xive_esc_on, and
then xive_irq_eoi(), which sets xd->stale_p.  The natural sequence
could read vcpu->arch.xive_esc_on before the interrupt and see 1, then
write 0 to xd->stale_p after xive_irq_eoi() has set it.  That would
mean the final value of xd->stale_p was 0, which is wrong, since in
fact the queue entry has been removed.

With the code I wrote, because the clearing of xd->stale_p comes
before the load from vcpu->arch.xive_esc_on (with a barrier to make
sure they don't get reordered), then if a racing escalation interrupt
on another CPU stores 1 to xd->stale_p before we clear it, then we
must see vcpu->arch.xive_esc_on as 0, and we will set xd->stale_p
again, giving the correct final state (xd->stale_p == 1).  If the
racing interrupt clears vcpu->arch.xive_esc_on after we load it and
see 1, then its store to set xd->stale_p must come after our store to
clear it because of the barrier that I added to xive_esc_irq, so the
final result is once again correct.

[snip]

> > @@ -397,11 +411,16 @@ static void xive_do_source_set_mask(struct xive_irq_data *xd,
> > 	 */
> > 	if (mask) {
> > 		val = xive_esb_read(xd, XIVE_ESB_SET_PQ_01);
> > -		xd->saved_p = !!(val & XIVE_ESB_VAL_P);
> > -	} else if (xd->saved_p)
> > +		if (!xd->stale_p && !!(val & XIVE_ESB_VAL_P))
> > +			xd->saved_p = true;
> > +		xd->stale_p = false;
> > +	} else if (xd->saved_p) {
> > 		xive_esb_read(xd, XIVE_ESB_SET_PQ_10);
> > -	else
> > +		xd->saved_p = false;
> 
> Should we also explicitly set xd->stale_p = true; here?

We don't need to because xd->saved_p and xd->stale_p can never be both
set, and we just saw that xd->saved_p was set.

> > +	} else {
> > 		xive_esb_read(xd, XIVE_ESB_SET_PQ_00);
> > +		xd->stale_p = false;
> 
> Should we also explicitly set xd->saved_p = true; here?

No, that would be incorrect.  This is the case where we are unmasking
the interrupt and there is no queue entry currently.  Setting saved_p
would imply that there is a queue entry, which there isn't.

Paul.
