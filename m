Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 159EF3800F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 23:56:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Kfd52j7CzDqs2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 07:56:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Kfbc5wKJzDqbm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 07:55:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="ukxjcF1d"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 45Kfbb3sJ1z9s00; Fri,  7 Jun 2019 07:55:23 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 45Kfbb3Hs4z9s7h; Fri,  7 Jun 2019 07:55:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1559858123; bh=v2fPZbg0lV/jywlzf1lVRFPPfX0tXSSobcR99ThU+kU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ukxjcF1d4OPWpHSO9EUhznijRmucnyz1uMHaN6KIwJ9mCwLxSPqT9h8z5YGTUpemF
 1AiHTDCY1Kp/Wug/JmNdvDWQyX6+kCMo32Brd8181PBU8amDYobPawwliCrK5Tgb8W
 qlA4kks+lc3pC71kHXqiWqxiq4T3v7XWszFz6Ck2D/dD8q6+7iw94dyoJ5TV945aKl
 g93fKZnLGUCi0xbsNJFRFy5Zat42yFS4UaOf7eojpg5GFbKOiFBnVWRNK45R6seH2w
 WRpygMctPR293+mJCel2LRIDKNH8TuAPfFEW7J060Ykeqoy6Cubz2+KdBW5lWVWiHa
 8vPr5wGwQs8pg==
Date: Fri, 7 Jun 2019 07:55:20 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Murilo Opsfelder =?iso-8859-1?Q?Ara=FAjo?= <mopsfelder@gmail.com>
Subject: Re: [PATCH v3 6/9] KVM: PPC: Ultravisor: Restrict flush of the
 partition tlb cache
Message-ID: <20190606215520.GA1220@blackberry>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
 <20190606173614.32090-7-cclaudio@linux.ibm.com>
 <8736kmld0n.fsf@kermit.br.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8736kmld0n.fsf@kermit.br.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauermann@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 06, 2019 at 04:39:04PM -0300, Murilo Opsfelder Araújo wrote:
> Claudio Carvalho <cclaudio@linux.ibm.com> writes:
> 
> > From: Ram Pai <linuxram@us.ibm.com>
> >
> > Ultravisor is responsible for flushing the tlb cache, since it manages
> > the PATE entries. Hence skip tlb flush, if the ultravisor firmware is
> > available.
> >
> > Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> > Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> > ---
> >  arch/powerpc/mm/book3s64/pgtable.c | 33 +++++++++++++++++-------------
> >  1 file changed, 19 insertions(+), 14 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> > index 40a9fc8b139f..1eeb5fe87023 100644
> > --- a/arch/powerpc/mm/book3s64/pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/pgtable.c
> > @@ -224,6 +224,23 @@ void __init mmu_partition_table_init(void)
> >  	powernv_set_nmmu_ptcr(ptcr);
> >  }
> >
> > +static void flush_partition(unsigned int lpid, unsigned long dw0)
> > +{
> > +	if (dw0 & PATB_HR) {
> > +		asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 1) : :
> > +			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
> > +		asm volatile(PPC_TLBIE_5(%0, %1, 2, 1, 1) : :
> > +			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
> > +		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 1);
> > +	} else {
> > +		asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 0) : :
> > +			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
> > +		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
> > +	}
> > +	/* do we need fixup here ?*/
> > +	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
> > +}
> > +
> 
> checkpatch.pl seems to complain:
> 
> ERROR: need consistent spacing around '%' (ctx:WxV)
> #125: FILE: arch/powerpc/mm/book3s64/pgtable.c:230:
> +               asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 1) : :
>                                              ^
> 
> ERROR: need consistent spacing around '%' (ctx:WxV)
> #127: FILE: arch/powerpc/mm/book3s64/pgtable.c:232:
> +               asm volatile(PPC_TLBIE_5(%0, %1, 2, 1, 1) : :
>                                              ^
> 
> ERROR: need consistent spacing around '%' (ctx:WxV)
> #131: FILE: arch/powerpc/mm/book3s64/pgtable.c:236:
> +               asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 0) : :
>                                              ^

Then clearly checkpatch.pl has a bug.

Paul.
