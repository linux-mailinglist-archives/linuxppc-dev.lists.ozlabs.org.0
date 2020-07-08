Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A959218189
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 09:45:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1rtt3zXxzDr4g
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 17:45:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1rrw0pfqzDr45
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 17:43:27 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0687VufR009016; Wed, 8 Jul 2020 03:43:23 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3251mv3vr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 03:43:22 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0687Zr4T018470;
 Wed, 8 Jul 2020 07:43:21 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 324b3jkw1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 07:43:21 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0687hLs850987274
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 07:43:21 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EB4CB205F;
 Wed,  8 Jul 2020 07:43:21 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90023B2066;
 Wed,  8 Jul 2020 07:43:20 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.79.213.59])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jul 2020 07:43:20 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id E23812E48C1; Wed,  8 Jul 2020 13:13:15 +0530 (IST)
Date: Wed, 8 Jul 2020 13:13:15 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH v2 07/10] powerpc/perf: support BHRB disable bit and new
 filtering modes
Message-ID: <20200708074315.GA21370@in.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-8-git-send-email-atrajeev@linux.vnet.ibm.com>
 <0cf26e42a3b190d5ea69d1ba61ae71bcaeee1973.camel@neuling.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cf26e42a3b190d5ea69d1ba61ae71bcaeee1973.camel@neuling.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_04:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0 cotscore=-2147483648
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007080049
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
Reply-To: ego@linux.vnet.ibm.com
Cc: ego <ego@linux.vnet.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidyan@in.ibm.com>, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 07, 2020 at 05:17:55PM +1000, Michael Neuling wrote:
> On Wed, 2020-07-01 at 05:20 -0400, Athira Rajeev wrote:
> > PowerISA v3.1 has few updates for the Branch History Rolling Buffer(BHRB).
> > First is the addition of BHRB disable bit and second new filtering
> > modes for BHRB.
> > 
> > BHRB disable is controlled via Monitor Mode Control Register A (MMCRA)
> > bit 26, namely "BHRB Recording Disable (BHRBRD)". This field controls
> > whether BHRB entries are written when BHRB recording is enabled by other
> > bits. Patch implements support for this BHRB disable bit.
> 
> Probably good to note here that this is backwards compatible. So if you have a
> kernel that doesn't know about this bit, it'll clear it and hence you still get
> BHRB. 
> 
> You should also note why you'd want to do disable this (ie. the core will run
> faster).
> 
> > Secondly PowerISA v3.1 introduce filtering support for
> > PERF_SAMPLE_BRANCH_IND_CALL/COND. The patch adds BHRB filter support
> > for "ind_call" and "cond" in power10_bhrb_filter_map().
> > 
> > 'commit bb19af816025 ("powerpc/perf: Prevent kernel address leak to userspace
> > via BHRB buffer")'
> > added a check in bhrb_read() to filter the kernel address from BHRB buffer.
> > Patch here modified
> > it to avoid that check for PowerISA v3.1 based processors, since PowerISA v3.1
> > allows
> > only MSR[PR]=1 address to be written to BHRB buffer.
> > 
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/perf/core-book3s.c       | 27 +++++++++++++++++++++------
> >  arch/powerpc/perf/isa207-common.c     | 13 +++++++++++++
> >  arch/powerpc/perf/power10-pmu.c       | 13 +++++++++++--
> >  arch/powerpc/platforms/powernv/idle.c | 14 ++++++++++++++
> 
> This touches the idle code so we should get those guys on CC (adding Vaidy and
> Ego).
> 
> >  4 files changed, 59 insertions(+), 8 deletions(-)
> > 

[..snip..]


> > diff --git a/arch/powerpc/platforms/powernv/idle.c
> > b/arch/powerpc/platforms/powernv/idle.c
> > index 2dd4673..7db99c7 100644
> > --- a/arch/powerpc/platforms/powernv/idle.c
> > +++ b/arch/powerpc/platforms/powernv/idle.c
> > @@ -611,6 +611,7 @@ static unsigned long power9_idle_stop(unsigned long psscr,
> > bool mmu_on)
> >  	unsigned long srr1;
> >  	unsigned long pls;
> >  	unsigned long mmcr0 = 0;
> > +	unsigned long mmcra_bhrb = 0;

We are saving the whole of MMCRA aren't we ? We might want to just
name it mmcra in that case.

> >  	struct p9_sprs sprs = {}; /* avoid false used-uninitialised */
> >  	bool sprs_saved = false;
> >  
> > @@ -657,6 +658,15 @@ static unsigned long power9_idle_stop(unsigned long
> > psscr, bool mmu_on)
> >  		  */
> >  		mmcr0		= mfspr(SPRN_MMCR0);
> >  	}
> > +
> > +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> > +		/* POWER10 uses MMCRA[:26] as BHRB disable bit
> > +		 * to disable BHRB logic when not used. Hence Save and
> > +		 * restore MMCRA after a state-loss idle.
> > +		 */

Multi-line comment usually has the first line blank.

		/*
	         * Line 1
		 * Line 2
		 * .
		 * .
		 * .
		 * Line N
		 */

> > +		mmcra_bhrb		= mfspr(SPRN_MMCRA);
> 
> 
> Why is the bhrb bit of mmcra special here?

The comment above could include the consequence of not saving and
restoring MMCRA i.e

- If the user hasn't asked for the BHRB to be
  written the value of MMCRA[BHRBD] = 1.

- On wakeup from stop, MMCRA[BHRBD] will be 0, since MMCRA is not a
  previleged resource and will be lost.

- Thus, if we do not save and restore the MMCRA[BHRBD], the hardware
  will be needlessly writing to the BHRB in the problem mode.

> 
> > +	}
> > +
> >  	if ((psscr & PSSCR_RL_MASK) >= pnv_first_spr_loss_level) {
> >  		sprs.lpcr	= mfspr(SPRN_LPCR);
> >  		sprs.hfscr	= mfspr(SPRN_HFSCR);
> > @@ -721,6 +731,10 @@ static unsigned long power9_idle_stop(unsigned long
> > psscr, bool mmu_on)
> >  			mtspr(SPRN_MMCR0, mmcr0);
> >  		}
> >  
> > +		/* Reload MMCRA to restore BHRB disable bit for POWER10 */
> > +		if (cpu_has_feature(CPU_FTR_ARCH_31))
> > +			mtspr(SPRN_MMCRA, mmcra_bhrb);
> > +
> >  		/*
> >  		 * DD2.2 and earlier need to set then clear bit 60 in MMCRA
> >  		 * to ensure the PMU starts running.
> 

--
Thanks and Regards
gautham.
