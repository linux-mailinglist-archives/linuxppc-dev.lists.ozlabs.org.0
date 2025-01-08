Return-Path: <linuxppc-dev+bounces-4849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F4CA05E05
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 15:09:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSqXn4zRQz30TY;
	Thu,  9 Jan 2025 01:09:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736345353;
	cv=none; b=S8p4xy5d+o+o+VXgFhfRvawnU0xHjJzUDoz2zh5xR/f6WvOpLVLhpAPpclzxSQI53V2Pp6Sm4oRhognrHrXxW4kvMMNP0MDnty+vEl7jiSJ8jXJZokTDeVAdOdGTJQ1I5a1WYnl3bNs8Le6yXKb/Q5rNC4QaUmWHAds1x8R+xopm+gWBEyeIIohxZ2Kp8aJf8MSbA1RRRId4iASisKXqJt+TIfdLgqg4W5BhvN1EFGZSuvQIRCft0pculBbDbIfdyu2BbY5ASYC9BbQuMsLuP/n6lZ3ODglHtU3SnFKyyuMOka2X9rn2BAC925ef9l6Wf88k9Olf3qGgcM4R5VqPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736345353; c=relaxed/relaxed;
	bh=8ICLRnkiLJZ3GIg5q3skcI8CzHEf6+OZk7pbFMPmZiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvR3WGBgNOtuyxhKLabfM/5AqM7zJF/ap1dvtYU+aBXbnTva2Sy1/jtbL270DuUL4yE3lTtkXpbE7etW+R7hkhw02bsBMm38XdI+E94lN5w+EzSJQfeUB4W4kcDXv5kHOE1Q3jRQsEMD63cQHOvTEZ3k03u97EnPATx5VM1GYpN+A1TIQm1dbUoxFtz4y4li0j19b5zWVYXjBePovoxzb2/SvC8bxs6tSd32O06PHXAytfjCG1YKqXsUMv4igErvf84pvXpiovX88roRLcA5lVujJ0LGtIBzzlhTWuRYuDpxa8NkkIDyGcn953HEtTKUO5y0EahhrcgVTeCOODD+/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UN+x/oZN; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnac123@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UN+x/oZN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnac123@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSqXm1HrKz30MM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 01:09:11 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508C5jHs023642;
	Wed, 8 Jan 2025 14:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=8ICLRnkiLJZ3GIg5q3skcI8CzHEf6+
	OZk7pbFMPmZiA=; b=UN+x/oZNqJku7S02YOhCbnOFT6Q6SBJsZFyNdbNTf9Dex6
	75G9yVbCWPcONyuXhpYMKmsVJgCSd8+lkMzuthr4DgNr/IEBfHgtWjwmiiGBAk8s
	tR6wS6U/VRsqrz5Dbit46bcrp4WrK7AjgMCgjKFRgkUTtiNFlR3hjxyNcKRMFu9h
	jEVGaok9pAQ6zNBI/DE1DPnNlYxQmPKcDJhMmD/FeZKFLmAB3EX5fwiRJkofV0vD
	8+JAyxBZaKF7wmygyqMIQL8AftaV1C1pvl5800fWOmKLNRM8t3fRkHYLQbs/Stpv
	+ccQ+k7Ln7QDGrvkPsh4m/hMvmbqBhrilFLXy35g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441edj3bs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:08:54 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 508E3nVI014634;
	Wed, 8 Jan 2025 14:08:54 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441edj3bru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:08:54 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 508D8hN9008974;
	Wed, 8 Jan 2025 14:08:53 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43yfq006jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:08:53 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508E8pmj32637462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 14:08:52 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91CA75805E;
	Wed,  8 Jan 2025 14:08:51 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DB7758056;
	Wed,  8 Jan 2025 14:08:51 +0000 (GMT)
Received: from localhost (unknown [9.61.68.12])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jan 2025 14:08:51 +0000 (GMT)
Date: Wed, 8 Jan 2025 08:08:51 -0600
From: Nick Child <nnac123@linux.ibm.com>
To: Yury Norov <yury.norov@gmail.com>,
        y@li-4c4c4544-0047-5210-804b-b8c04f323634.ibm.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>,
        Rick Lindsley <ricklind@linux.ibm.com>,
        Thomas Falcon <tlfalcon@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 03/14] ibmvnic: simplify ibmvnic_set_queue_affinity()y
Message-ID: <Z36Gqy5eGigodc_K@li-4c4c4544-0047-5210-804b-b8c04f323634.ibm.com>
References: <20241228184949.31582-1-yury.norov@gmail.com>
 <20241228184949.31582-4-yury.norov@gmail.com>
 <Z32sncx9K4iFLsJN@li-4c4c4544-0047-5210-804b-b8c04f323634.ibm.com>
 <Z32t88W3biaZa7fH@yury-ThinkPad>
 <Z32zCDd2GnFPW465@yury-ThinkPad>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z32zCDd2GnFPW465@yury-ThinkPad>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RRvn840XxeBuA_YfDL03YvNNhcoHRq75
X-Proofpoint-ORIG-GUID: qZpGr0saVqHzqny3mGdwUsct0nLUUzBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=804 phishscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080112
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 07, 2025 at 03:04:40PM -0800, Yury Norov wrote:
> On Tue, Jan 07, 2025 at 02:43:01PM -0800, Yury Norov wrote:
> > On Tue, Jan 07, 2025 at 04:37:17PM -0600, Nick Child wrote:
> > > On Sat, Dec 28, 2024 at 10:49:35AM -0800, Yury Norov wrote:
> > > > A loop based on cpumask_next_wrap() opencodes the dedicated macro
> > > > for_each_online_cpu_wrap(). Using the macro allows to avoid setting
> > > > bits affinity mask more than once when stride >= num_online_cpus.
> > > > 
> > > > This also helps to drop cpumask handling code in the caller function.
> > > > 
> > > > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > > > ---
> > > >  drivers/net/ethernet/ibm/ibmvnic.c | 17 ++++++++++-------
> > > >  1 file changed, 10 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> > > > index e95ae0d39948..4cfd90fb206b 100644
> > > > --- a/drivers/net/ethernet/ibm/ibmvnic.c
> > > > +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> > > > @@ -234,11 +234,16 @@ static int ibmvnic_set_queue_affinity(struct ibmvnic_sub_crq_queue *queue,
> > > >  		(*stragglers)--;
> > > >  	}
> > > >  	/* atomic write is safer than writing bit by bit directly */
> > > > -	for (i = 0; i < stride; i++) {
> > > > -		cpumask_set_cpu(*cpu, mask);
> > > > -		*cpu = cpumask_next_wrap(*cpu, cpu_online_mask,
> > > > -					 nr_cpu_ids, false);
> > > > +	for_each_online_cpu_wrap(i, *cpu) {
> > > > +		if (!stride--)
> > > > +			break;
> > > > +		cpumask_set_cpu(i, mask);
> > > >  	}
> > > > +
> > > > +	/* For the next queue we start from the first unused CPU in this queue */
> > > > +	if (i < nr_cpu_ids)
> > > > +		*cpu = i + 1;
> > > > +
> > > This should read '*cpu = i'. Since the loop breaks after incrementing i.
> > > Thanks!
> > 
> > cpumask_next_wrap() makes '+ 1' for you. The for_each_cpu_wrap() starts
> > exactly where you point. So, this '+1' needs to be explicit now.
> > 
> > Does that make sense?
> 
> Ah, I think I see what you mean. It should be like this, right?
> 
>   for_each_online_cpu_wrap(i, *cpu) {
>   	if (!stride--) {
>         	*cpu = i + 1;
>   		break;
>         }
>   	cpumask_set_cpu(i, mask);
>   }
Not quite, for_each_online_cpu_wrap will increment i to point to the
next online cpu, then enter the body of the loop. When we break (beacuse
stride is zero), we exit the loop early before i is added to any mask, i
is the next unassigned online cpu.
I tested this to make sure, we see unused cpus (#7, #23)  with the patch as is:
  IRQ : 256 -> ibmvnic-30000003-tx0
	/proc/irq/256/smp_affinity_list:0-6
  IRQ : 257 -> ibmvnic-30000003-tx1
	/proc/irq/257/smp_affinity_list:16-22
  IRQ : 258 -> ibmvnic-30000003-rx0
	/proc/irq/258/smp_affinity_list:8-14
  IRQ : 259 -> ibmvnic-30000003-rx1
	/proc/irq/259/smp_affinity_list:24-30


