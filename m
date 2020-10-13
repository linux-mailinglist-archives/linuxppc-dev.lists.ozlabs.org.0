Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAE228D1AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 18:00:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9gHv6cmnzDqbv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 03:00:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9gFh525szDqTW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 02:58:48 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B936AC6D;
 Tue, 13 Oct 2020 15:58:44 +0000 (UTC)
Date: Tue, 13 Oct 2020 17:58:42 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH] powerpc/perf: fix Threshold Event CounterMultiplier
 width for P10
Message-ID: <20201013155842.GY29778@kitsune.suse.cz>
References: <20201012103128.53243-1-maddy@linux.ibm.com>
 <20201012112905.GQ29778@kitsune.suse.cz>
 <b840fcf3-6546-159e-e23a-c8fe00123539@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b840fcf3-6546-159e-e23a-c8fe00123539@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 13, 2020 at 06:27:05PM +0530, Madhavan Srinivasan wrote:
> 
> On 10/12/20 4:59 PM, Michal Such�nek wrote:
> > Hello,
> > 
> > On Mon, Oct 12, 2020 at 04:01:28PM +0530, Madhavan Srinivasan wrote:
> > > Power9 and isa v3.1 has 7bit mantissa field for Threshold Event Counter
> >                    ^^^ Shouldn't his be 3.0?
> 
> My bad, What I meant was
> 
> Power9, ISA v3.0 and ISA v3.1 define a 7 bit mantissa field for Threshold
> Event Counter Multiplier(TECM).
I am really confused.

The following text and the code suggests that the mantissa is 8bit on
POWER10 and ISA v3.1.

Thanks

Michal
> 
> Maddy
> 
> > 
> > > Multiplier (TECM). TECM is part of Monitor Mode Control Register A (MMCRA).
> > > This field along with Threshold Event Counter Exponent (TECE) is used to
> > > get threshould counter value. In Power10, the width of TECM field is
> > > increase to 8bits. Patch fixes the current code to modify the MMCRA[TECM]
> > > extraction macro to handling this changes.
> > > 
> > > Fixes: 170a315f41c64 ('powerpc/perf: Support to export MMCRA[TEC*] field to userspace')
> > > Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> > > ---
> > >   arch/powerpc/perf/isa207-common.c | 3 +++
> > >   arch/powerpc/perf/isa207-common.h | 4 ++++
> > >   2 files changed, 7 insertions(+)
> > > 
> > > diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
> > > index 964437adec18..5fe129f02290 100644
> > > --- a/arch/powerpc/perf/isa207-common.c
> > > +++ b/arch/powerpc/perf/isa207-common.c
> > > @@ -247,6 +247,9 @@ void isa207_get_mem_weight(u64 *weight)
> > >   	u64 sier = mfspr(SPRN_SIER);
> > >   	u64 val = (sier & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
> > > +	if (cpu_has_feature(CPU_FTR_ARCH_31))
> > > +		mantissa = P10_MMCRA_THR_CTR_MANT(mmcra);
> > > +
> > >   	if (val == 0 || val == 7)
> > >   		*weight = 0;
> > >   	else
> > > diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
> > > index 044de65e96b9..71380e854f48 100644
> > > --- a/arch/powerpc/perf/isa207-common.h
> > > +++ b/arch/powerpc/perf/isa207-common.h
> > > @@ -219,6 +219,10 @@
> > >   #define MMCRA_THR_CTR_EXP(v)		(((v) >> MMCRA_THR_CTR_EXP_SHIFT) &\
> > >   						MMCRA_THR_CTR_EXP_MASK)
> > > +#define P10_MMCRA_THR_CTR_MANT_MASK	0xFFul
> > > +#define P10_MMCRA_THR_CTR_MANT(v)	(((v) >> MMCRA_THR_CTR_MANT_SHIFT) &\
> > > +						P10_MMCRA_THR_CTR_MANT_MASK)
> > > +
> > >   /* MMCRA Threshold Compare bit constant for power9 */
> > >   #define p9_MMCRA_THR_CMP_SHIFT	45
> > > -- 
> > > 2.26.2
> > > 
