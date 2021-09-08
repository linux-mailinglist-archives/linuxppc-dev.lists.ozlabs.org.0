Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DFA4036DE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 11:28:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4Gys0X3lz2yn7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 19:28:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=cvLwcnMF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=cvLwcnMF; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4Gy40rLQz2xtY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 19:27:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XkMsv0U5b8POCiXTPKYIykquQ4WRiqRp/+CywSEeQKM=; b=cvLwcnMFIGRllbKwXrEE+bZePC
 SYvAY+GPndlL+z/BcUJ5g7TXR6D+jeHVQwudTo2w1fts68ld4gkSXBWBDP8SDpbQo3/Gu1Ju2rxSa
 88VOQH2p6jhfjx6OjpoxugebWvkdYzRT+t3JOT83V/fEFHSXf6zkibnsgNIGH1X6RV5Zdo3kvZYeN
 JWNLj2Uo4fevyhsDOSzFQPF/YfDMDDcQccDOypH0pbyyPdXBPGqwUynNSVCuE66r0AE1txVfiYvYB
 zdYHsarQN8cplUpL3q+ADQW2Df6fofzCT0p8uI9x66u+CKrT0XAfYBoLEc78n80+fy6YfBczbiEsD
 JV9U0Csg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNtqG-008gZD-Tx; Wed, 08 Sep 2021 09:26:15 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0975F300454;
 Wed,  8 Sep 2021 11:26:01 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 90263212EAB70; Wed,  8 Sep 2021 11:26:01 +0200 (CEST)
Date: Wed, 8 Sep 2021 11:26:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/3] perf: Add macros to specify onchip L2/L3 accesses
Message-ID: <YTiBqbxe7ieqY2OE@hirez.programming.kicks-ass.net>
References: <20210904064932.307610-1-kjain@linux.ibm.com>
 <87ilzbmt7i.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ilzbmt7i.fsf@mpe.ellerman.id.au>
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
Cc: mark.rutland@arm.com, atrajeev@linux.vnet.ibm.com, ak@linux.intel.com,
 daniel@iogearbox.net, rnsastry@linux.ibm.com,
 alexander.shishkin@linux.intel.com, Kajol Jain <kjain@linux.ibm.com>,
 linux-kernel@vger.kernel.org, acme@kernel.org, ast@kernel.org,
 linux-perf-users@vger.kernel.org, yao.jin@linux.intel.com, mingo@redhat.com,
 paulus@samba.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org,
 songliubraving@fb.com, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 08, 2021 at 05:17:53PM +1000, Michael Ellerman wrote:
> Kajol Jain <kjain@linux.ibm.com> writes:

> > diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> > index f92880a15645..030b3e990ac3 100644
> > --- a/include/uapi/linux/perf_event.h
> > +++ b/include/uapi/linux/perf_event.h
> > @@ -1265,7 +1265,9 @@ union perf_mem_data_src {
> >  #define PERF_MEM_LVLNUM_L2	0x02 /* L2 */
> >  #define PERF_MEM_LVLNUM_L3	0x03 /* L3 */
> >  #define PERF_MEM_LVLNUM_L4	0x04 /* L4 */
> > -/* 5-0xa available */
> > +#define PERF_MEM_LVLNUM_OC_L2	0x05 /* On Chip L2 */
> > +#define PERF_MEM_LVLNUM_OC_L3	0x06 /* On Chip L3 */
> 
> The obvious use for 5 is for "L5" and so on.
> 
> I'm not sure adding new levels is the best idea, because these don't fit
> neatly into the hierarchy, they are off to the side.
> 
> 
> I wonder if we should use the remote field.
> 
> ie. for another core's L2 we set:
> 
>   mem_lvl = PERF_MEM_LVL_L2
>   mem_remote = 1

This mixes APIs (see below), IIUC the correct usage would be something
like: lvl_num=L2 remote=1

> Which would mean "remote L2", but not remote enough to be
> lvl = PERF_MEM_LVL_REM_CCE1.
> 
> It would be printed by the existing tools/perf code as "Remote L2", vs
> "Remote cache (1 hop)", which seems OK.
> 
> 
> ie. we'd be able to express:
> 
>   Current core's L2: LVL_L2
>   Other core's L2:   LVL_L2 | REMOTE
>   Other chip's L2:   LVL_REM_CCE1 | REMOTE
> 
> And similarly for L3.
> 
> I think that makes sense? Unless people think remote should be reserved
> to mean on another chip, though we already have REM_CCE1 for that.

IIRC the PERF_MEM_LVL_* namespace is somewhat depricated in favour of
the newer composite PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_} fields. Of
course, ABIs being what they are, we get to support both :/ But I'm not
sure mixing them is a great idea.

Also, clearly this could use a comment...

The 'new' composite doesnt have a hops field because the hardware that
nessecitated that change doesn't report it, but we could easily add a
field there.

Suppose we add, mem_hops:3 (would 6 hops be too small?) and the
corresponding PERF_MEM_HOPS_{NA, 0..6}

Then I suppose you can encode things like:

	L2			- local L2
	L2 | REMOTE		- remote L2 at an unspecified distance (NA)
	L2 | REMOTE | HOPS_0	- remote L2 on the same node
	L2 | REMOTE | HOPS_1	- remote L2 on a node 1 removed

Would that work?
