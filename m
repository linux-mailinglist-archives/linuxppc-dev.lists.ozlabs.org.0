Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1576A1DA5E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 01:58:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RXrL4kHCzDqZN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 09:57:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RXpl5wKHzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 09:56:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49RXpk1qHcz9sPF;
 Wed, 20 May 2020 09:56:29 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 6/7] powerpc/dt_cpu_ftrs: Add MMA feature
Date: Wed, 20 May 2020 09:56:23 +1000
Message-ID: <26076686.W3figiy1un@townsend>
In-Reply-To: <20200519175153.GE24922@oc3272150783.ibm.com>
References: <20200519003157.31946-1-alistair@popple.id.au>
 <20200519003157.31946-7-alistair@popple.id.au>
 <20200519175153.GE24922@oc3272150783.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
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
Cc: aneesh.kumar@linux.ibm.com, mikey@neuling.org,
 "Paul A. Clarke" <pc@us.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks, not sure where I got that name from but it's probably wrong in a few 
places. Will wait a bit in case there are any more comments and then respin 
the series to update the name.

- Alistair

On Wednesday, 20 May 2020 3:51:53 AM AEST Paul A. Clarke wrote:
> On Tue, May 19, 2020 at 10:31:56AM +1000, Alistair Popple wrote:
> > Matrix multiple accumulate (MMA) is a new feature added to ISAv3.1 and
> 
> Conclusion is that this should be "Matrix-Multiply Assist", but then there
> are a couple more below...
> 
> > POWER10. Support on powernv can be selected via a firmware CPU device
> > tree feature which enables it via a PCR bit.
> > 
> > Signed-off-by: Alistair Popple <alistair@popple.id.au>
> > ---
> > 
> >  arch/powerpc/include/asm/reg.h    |  3 ++-
> >  arch/powerpc/kernel/dt_cpu_ftrs.c | 17 ++++++++++++++++-
> >  2 files changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/reg.h
> > b/arch/powerpc/include/asm/reg.h index 1931b1142599..c446863a40cf 100644
> > --- a/arch/powerpc/include/asm/reg.h
> > +++ b/arch/powerpc/include/asm/reg.h
> > @@ -479,7 +479,8 @@
> > 
> >  #define   PCR_VEC_DIS	(__MASK(63-0))	/* Vec. disable (bit NA since
> >  POWER8) */ #define   PCR_VSX_DIS	(__MASK(63-1))	/* VSX disable (bit NA
> >  since POWER8) */ #define   PCR_TM_DIS	(__MASK(63-2))	/* Trans. memory
> >  disable (POWER8) */> 
> > -#define   PCR_HIGH_BITS	(PCR_VEC_DIS | PCR_VSX_DIS | PCR_TM_DIS)
> > +#define   PCR_MMA_DIS	(__MASK(63-3)) /* Matrix-Multiply Accelerator */
> 
> also here.
> 
> > +#define   PCR_HIGH_BITS	(PCR_MMA_DIS | PCR_VEC_DIS | PCR_VSX_DIS |
> > PCR_TM_DIS)> 
> >  /*
> >  
> >   * These bits are used in the function kvmppc_set_arch_compat() to
> >   specify and * determine both the compatibility level which we want to
> >   emulate and the> 
> > diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c
> > b/arch/powerpc/kernel/dt_cpu_ftrs.c index 93c340906aad..e7540ee5cad8
> > 100644
> > --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> > +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> > @@ -75,6 +75,7 @@ static struct {
> > 
> >  	u64	lpcr_clear;
> >  	u64	hfscr;
> >  	u64	fscr;
> > 
> > +	u64	pcr;
> > 
> >  } system_registers;
> >  
> >  static void (*init_pmu_registers)(void);
> > 
> > @@ -102,7 +103,7 @@ static void __restore_cpu_cpufeatures(void)
> > 
> >  	if (hv_mode) {
> >  	
> >  		mtspr(SPRN_LPID, 0);
> >  		mtspr(SPRN_HFSCR, system_registers.hfscr);
> > 
> > -		mtspr(SPRN_PCR, PCR_MASK);
> > +		mtspr(SPRN_PCR, system_registers.pcr);
> > 
> >  	}
> >  	mtspr(SPRN_FSCR, system_registers.fscr);
> > 
> > @@ -555,6 +556,18 @@ static int __init feat_enable_large_ci(struct
> > dt_cpu_feature *f)> 
> >  	return 1;
> >  
> >  }
> > 
> > +static int __init feat_enable_mma(struct dt_cpu_feature *f)
> > +{
> > +	u64 pcr;
> > +
> > +	feat_enable(f);
> > +	pcr = mfspr(SPRN_PCR);
> > +	pcr &= ~PCR_MMA_DIS;
> > +	mtspr(SPRN_PCR, pcr);
> > +
> > +	return 1;
> > +}
> > +
> > 
> >  struct dt_cpu_feature_match {
> >  
> >  	const char *name;
> >  	int (*enable)(struct dt_cpu_feature *f);
> > 
> > @@ -629,6 +642,7 @@ static struct dt_cpu_feature_match __initdata
> > 
> >  	{"vector-binary16", feat_enable, 0},
> >  	{"wait-v3", feat_enable, 0},
> >  	{"prefix-instructions", feat_enable, 0},
> > 
> > +	{"matrix-multiply-accumulate", feat_enable_mma, 0},
> 
> and presumably here as well.
> 
> >  };
> 
> PC




