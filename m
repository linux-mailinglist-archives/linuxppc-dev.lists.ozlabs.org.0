Return-Path: <linuxppc-dev+bounces-17724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB8AN6tJqGnysQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 16:03:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C0C202278
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 16:03:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQws309rLz3c2R;
	Thu, 05 Mar 2026 02:03:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772636582;
	cv=none; b=EYy6BlM40jM3fhf8zwqMUmlOLbBMSpB7sP+ibQt8NH74q/NLn9IcWBEdlrFv5I2aDw2l6Zaqpl1UvQF8PSCecLhUUk8doEcIUjvcGa4mU6pMsOxd5fXMAQv2iGZQzRsjwK0TXHm93JP+SaukDidcUgyGN/i/W+rwPteZNeQzHl+Id+st7gpNaGIM+MHRI3GGXpMsmpBN0kqvfTX0EcDMP5O6DGFsVOHYmd3qn8g4ULvCPFTFwhSJ5TFWHE2CiLnXEpNXMfNSKzDBDFu4jP8yX/P8aR17Pa8fsWCb51MjzrsXLdVJeIrwT/1uBeXVwsTPoPCF69vyrst36Yf92EuYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772636582; c=relaxed/relaxed;
	bh=Z19h6WgrjTCw0z8nSioTBlVzaZSe2HgmhCgm4ck5sz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rra0y8Hd3lPE2a630VQ6gUC+cUs/OhBRjJRSYk/Ncg+a2fsje6cjW6jqAhddcpjWva7+G+N1S6dCbj9IuXnnWq+PYXhYZ/RIeBA2PFy2EvzLeRK+aZjqGDlNk0ljBWezFC1M4dxhhp70Rjcc4LioLFS0ghb1uHOoQqw4LvTGCaxLnFM7MZXfOjPgtexxiSZEi1EXEUpIaLafaDK4Zh1BqVwBOrLgJoDO+/iji8whO22nhz8+gvoWMH7UtuJbmsidrJzNfk313ejn8RqLNPS14ZhVvL01BmT/Qti1seQSRHlZU3WzGi7zn78xKHwwnh583tHmUNABt1fsJ+HPQZbTvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CQs6CI0C; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CQs6CI0C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQws16gRwz3btw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 02:03:01 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624AhOOk1787677;
	Wed, 4 Mar 2026 15:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Z19h6WgrjTCw0z8nSioTBlVzaZSe2H
	gmhCgm4ck5sz4=; b=CQs6CI0CEBF28d38x3UgoKsWhnkqI02/m7t6ONNbGNxdoc
	3m+coBKpl6wNGEU+q2J7atfBmLj3qjNOl/ymmpM0faaO7/q3OUsVvIzNRfwLS+hc
	K+xHcf8KsWDQuntrHaohVLUNM/p2a/1KUM8ftLbS16eUDGJO8AlbdBYhjaDZpSHm
	Ucr1VYuZHV06cOpANC+jRZ19DHDZlYqcLvmp2fGEQdVjD+5Ri1FQ+sA6An98fbKv
	gQk6yZCFuwKIw5vSN/TmxnQk10MMSY73WWSJYsTjSjEDWeXvMjGPnRUCMgjQNGv/
	h+NRpjv/31gLWcbdYVindpkNHA6ypdPBLELXPs6w==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckssmqfge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 15:01:51 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 624E81GF003266;
	Wed, 4 Mar 2026 15:01:50 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmb2y77mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 15:01:50 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 624F1kew29885020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Mar 2026 15:01:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 775D420043;
	Wed,  4 Mar 2026 15:01:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A172120040;
	Wed,  4 Mar 2026 15:01:43 +0000 (GMT)
Received: from osiris (unknown [9.111.25.254])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  4 Mar 2026 15:01:43 +0000 (GMT)
Date: Wed, 4 Mar 2026 16:01:42 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
        David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
        Li Nan <linan122@huawei.com>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-raid@vger.kernel.org
Subject: Re: [PATCH 01/25] xor: assert that xor_blocks is not called from
 interrupt context
Message-ID: <20260304150142.10892A0b-hca@linux.ibm.com>
References: <20260226151106.144735-1-hch@lst.de>
 <20260226151106.144735-2-hch@lst.de>
 <20260227142455.GG1282955@noisy.programming.kicks-ass.net>
 <20260303160050.GB7021@lst.de>
 <20260303195517.GC2846@sol>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303195517.GC2846@sol>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExOCBTYWx0ZWRfXxUsUtXWxLU0g
 tOf9MkgFvTvS3iU6cDfKOn4aNolsTtOVPcZcXf1hUWj5wzTqP1Jl3+/Pm1cQVpOnkbFqwFNMhf6
 s+RzCypo6nWpEuKNhutPo8iGmRcRoJdPPeW2AHlivR0pa3WvG7MuKg6LhCcWrG1WOM0rkgfm19k
 qgAb59DROFK7ep/NcAuDgpnw0JZPbBrXcLu+FzFLE1z/pziDLja646pVdwK+IBBTRDR1FQEcZJp
 lfowdfxrkcZzLwHH+LflcIL8dIXBqbnVe5qsIr2WyyWonlYBWIkG2NU4qQkn3RkrdFvpk5bMnfx
 y6ZnU/ob1zljXV+Bvs7eICxTvlTjJerN5LTcEbwG9785zRtEi8PpmmpjVgPHHt/QSDnTPmdU2FM
 ORBAnPiiMlkrZ3OuR96PF0PhhS06e2TRrNxeZd60P8WuqA8hDS63eVa4RHuW0mUSWw36XnZPzR1
 yRlWiLRJO8vVTj1uMIQ==
X-Proofpoint-ORIG-GUID: 3wYtRTuLNljAHWLrazsX9evHAr6tDNHS
X-Proofpoint-GUID: tYQX-PAFkE56knElIo5jilP_p3jXLSWx
X-Authority-Analysis: v=2.4 cv=AobjHe9P c=1 sm=1 tr=0 ts=69a84960 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=CCDUfiGXGlpCvJ-ZZpMA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040118
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: E6C0C202278
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17724-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[lst.de,infradead.org,linux-foundation.org,linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FORGED_SENDER(0.00)[hca@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:hch@lst.de,m:peterz@infradead.org,m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:arnd@arndb.de,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kernel.org,m:linux-kernel
 @vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[hca@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[56];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 11:55:17AM -0800, Eric Biggers wrote:
> On Tue, Mar 03, 2026 at 05:00:50PM +0100, Christoph Hellwig wrote:
> > On Fri, Feb 27, 2026 at 03:24:55PM +0100, Peter Zijlstra wrote:
> > > >  	unsigned long *p1, *p2, *p3, *p4;
> > > >  
> > > > +	WARN_ON_ONCE(in_interrupt());
> > > 
> > > Your changelog makes it sound like you want:
> > > 
> > > 	WARN_ON_ONCE(!in_task());
> > > 
> > > But perhaps something like so:
> > > 
> > > 	lockdep_assert_preempt_enabled();
> > > 
> > > Would do? That ensures we are in preemptible context, which is much the
> > > same. That also ensures the cost of this assertion is only paid on debug
> > > kernels.
> > 
> > No idea honestly.  The kernel FPU/vector helpers generally don't work
> > from irq context, and I want to assert that.  Happy to do whatever
> > version works best for that.
> 
> may_use_simd() is the "generic" way to check "can the FPU/vector/SIMD
> registers be used".  However, what it does varies by architecture, and
> it's kind of a questionable abstraction in the first place.  It's used
> mostly by architecture-specific code.
> 
> If you union together the context restrictions from all the
> architectures, I think you get: "For may_use_simd() to be guaranteed not
> to return false due to the context, the caller needs to be running in
> task context without hardirqs or softirqs disabled."
> 
> However, some architectures also incorporate a CPU feature check in
> may_use_simd() as well, which makes it return false if some
> CPU-dependent SIMD feature is not supported.

Oh, interesting. I wasn't aware of may_use_simd(), and of course this is
missing on s390, and hence we fallback to the generic !in_interrupt()
variant.

In fact the s390 simd implementation allows for usage in any context, also
interrupt context. So the s390 implementation of may_use_simd() would
always return true, _except_ for the feature check you mention.

Let me try to change that and see if anything explodes.

> Because of that CPU feature check, I don't think
> "WARN_ON_ONCE(!may_use_simd())" would actually be correct here.
> 
> How about "WARN_ON_ONCE(!preemptible())"?  I think that covers the union
> of the context restrictions correctly.  (Compared to in_task(), it
> handles the cases where hardirqs or softirqs are disabled.)

I guess, this is not true, since there is at least one architecture which
allows to run simd code in interrupt context (but which missed to implement
may_use_simd()).

