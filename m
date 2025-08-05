Return-Path: <linuxppc-dev+bounces-10631-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DD9B1ADA2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 07:43:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx2R73d4Gz3bh6;
	Tue,  5 Aug 2025 15:43:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754372627;
	cv=none; b=U0/esbefbv+dbVDIO2i0CKzmkqTmToxAfL4y/Sge8rWGq39LfdRD7JElARfKTABJI5Jibmzen1aX2vNFhq6zcp/BySri1o5MC4MRnEz7U6bhfVPbPXpQq3toeD9euX8AdDwBT2Y3miCOurQSWMs7a+MWupFTHHamK6Wj8hZyU8d9LyXN7ptcCSX1lKAJzTc4Q8iH4mY6bgPmYu7Z4DyBqggrthkx2lCixvRiBcpKCQtJLxOHOzXTv81/PXHFDSLHQ3bBJeFZuIWfnv1x2+TxqwuCOm7AFdn5DXTWHcdtXdp/1wKTbMnE+8VHHbTCfwZ3vGmn4/2NlBLVWVhAfw4xwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754372627; c=relaxed/relaxed;
	bh=iu+9r72zR3pCASRkhWRIyYr8/5WyzLrSI0sN2QkS7K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fs3rDTPlzNbP3uL+YJ3GkYtwrZnYzNjOLgYpFn2YcvYS2m24qmcXPJKIABtQ+/Z1FamZktANge6y7qUt82rfGDBkycpLdR6de7cjiBls4MebfUHCnMctL5xp452/RuA/WdlNkRODM0+5YHIYH551+Y16bnh6met2kMbmOP4d2TsPxjkzpI9IfGbh70IaDMNnmujj1U8sE8GQxfaNYv/+H96WLV7GwMNnMjHA+Y0xmbnwDESZnpKeidQmupZPrDHAvtHJGlIb8HSwyfS6MpVjcUlaLfUJ8JaqFRQlcj7AYnXETrccR1aKyEGpEu/E2xVDn1tpIuXkTcnaDH5WXaaopA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YhjxBYWM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YhjxBYWM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bx2R63StNz30WY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 15:43:45 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5753jblj011342;
	Tue, 5 Aug 2025 05:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=iu+9r72zR3pCASRkhWRIyYr8/5WyzLrSI0sN2QkS7K0=; b=YhjxBYWMBNWW
	i7WQGT4zXdWwNhaT3sVHfi0Iz7o9vFT1o8f9BpclXB9ttT2DWE/buxtyoIFW1f2w
	gH/Gp3C6IJGblgoJbAiyY3rJCMFqbSXA6MiJ+VEhGi+5KyyKzrnbaJg1Jiz9o3yf
	T1DUxKwvuuHPQ8eYWEj55LTb7Io+thLi60ueV0RuUwQCW/upl/RYyoMaRdW+AMKN
	eYoIbshlCyLOFxc6zAU1qdfPBXqodkwbqKx94IwurFyX3gBNIlu2PtazWq/L2ojO
	VAoTOlqrP2d5Rwk5yKJM0PIn7JUU8B3Vhq6NHnTANYoWXlKoSEudlyh9iy72/IsE
	dl+8/+PlZA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 489ab3mku0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 05:43:11 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5755ffQl015529;
	Tue, 5 Aug 2025 05:43:11 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 489ab3mktx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 05:43:11 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5754KFv0006827;
	Tue, 5 Aug 2025 05:43:10 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 489xgmh05n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 05:43:10 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5755h6ht38207856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Aug 2025 05:43:06 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6069620043;
	Tue,  5 Aug 2025 05:43:06 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4043D20040;
	Tue,  5 Aug 2025 05:43:04 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Aug 2025 05:43:04 +0000 (GMT)
Date: Tue, 5 Aug 2025 11:13:03 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH] pseries/lparcfg: Add resource group monitoring
Message-ID: <aJGZ5_Sf4c1ByCeb@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20250716104600.59102-1-srikar@linux.ibm.com>
 <da3a0717-fe3a-49db-bebd-f231a7fdedb7@linux.ibm.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da3a0717-fe3a-49db-bebd-f231a7fdedb7@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Z+jsHGRA c=1 sm=1 tr=0 ts=689199ef cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=8nJEP1OIZ-IA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8
 a=1UX6Do5GAAAA:8 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8 a=lvIQcBwFF3NVhGCl7ikA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=Et2XPkok5AAZYJIKzHr1:22
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: FY6mcWGyx6EazsTF6nacTvWuaUOVG35s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAzNyBTYWx0ZWRfX/36Mr1FyDhwd
 dE6horRhScaRXRtEHNdTN/atoUsYjUazqUprEjoHXXMmtfS3ajkPfzWYEDNJKLD0UgaQ/3NIiO7
 DKrzCGZcQgydDw3WrIHeUBjxTKfsH/mgXm7Ebcm6vh/CpizR19K01wnHJamvYLlAgJN/YK6livv
 n0znTmHOs7hXrEGPn+cJZMiO5pxT/EJSNBvTj7EQ7E6gLhOTTpF/ke1xWuFV0AKfoetnhCBvYLv
 v6Ju1RXL1J5wh5dEGbw4kD7CIN9VhdalbcttPJgMJPHmm3VUS8mlnCeFez19Ps8GmAr91VAJVtr
 a0pnyIRzzi49Z9gPAqI/ozzll13wI4KpPi3rFmjuGMdSIToWBR4E98Qnuf4SD0gOP6gWXGYexCQ
 W+YK0ASydNKEicgfgysImdkHqss21FAEqX58wmMqwmJRdemLobeOWe+7ge37THHjjBRyonhQ
X-Proofpoint-GUID: VcAtqeWHvzy-U1iaqPjdyHvDBi3kwJbT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050037
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Shrikanth Hegde <sshegde@linux.ibm.com> [2025-08-01 19:27:22]:

> 
> On 7/16/25 16:15, Srikar Dronamraju wrote:
> > Systems can now be partitioned into resource groups. By default all
> > systems will be part of default resource group. Once a resource group is
> > created, and resources allocated to the resource group, those resources
> > will be removed from the default resource group. If a LPAR moved to a
> > resource group, then it can only use resources in the resource group.
> > 
> > So maximum processors that can be allocated to a LPAR can be equal or
> > smaller than the resources in the resource group.
> > 
> > lparcfg can now exposes the resource group id to which this LPAR belongs
> > to. It also exposes the number of processors in the current resource
> > group. The default resource group id happens to be 0. These would be
> > documented in the upcoming PAPR update.
> 
> Could you please add a link to patch on power utils on how it is being consumed?

I am not sure I understood your query, it looks a bit ambiguous.

If your query is on how lparcfg data is being consumed.
All tools that are consuming lparcfg will continue to use the same way.
Since this is not changing the way lparcfg is being consumed, I think it is
redundant information that need not be carried in all the changes/commits to
lparcfg. Such an information would be required when lparcfg file was
created.

If your query is on how resource group data is being consumed by users.
Kernel is being transparent and reporting the information from the firmware.
This information is mostly for system administrators and they would already
known this info since they would be people who would have configured the
resource groups in the first place. Kernel doesnt provide a way to configure
resource group settings. This is more of a handy way to recollect the
information, rather than any action that needs to be taken.

> 
> > 
> > Example of an LPAR in a default resource group
> > root@ltcp11-lp3 $ grep resource_group /proc/powerpc/lparcfg
> > resource_group_number=0
> > resource_group_active_processors=50
> > root@ltcp11-lp3 $
> > 
> > Example of an LPAR in a non-default resource group
> > root@ltcp11-lp5 $ grep resource_group /proc/powerpc/lparcfg
> > resource_group_number=1
> > resource_group_active_processors=30
> > root@ltcp11-lp5 $
> > 
> > Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>
> > Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> > ---
> >   arch/powerpc/platforms/pseries/lparcfg.c | 17 ++++++++++++++---
> >   1 file changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
> > index cc22924f159f..6554537984fb 100644
> > --- a/arch/powerpc/platforms/pseries/lparcfg.c
> > +++ b/arch/powerpc/platforms/pseries/lparcfg.c
> 
> Does MODULE_VERS need to increased?

All tools that are consuming lparcfg will continue to use the same way.
If there was some conditional changes that need to be done by the tools,
then we should have updated the same.
Hence there is not need to update MODULE_VERS.

> 
> > @@ -78,6 +78,8 @@ struct hvcall_ppp_data {
> >   	u8	capped;
> >   	u8	weight;
> >   	u8	unallocated_weight;
> > +	u8      resource_group_index;
> > +	u16     active_procs_in_resource_group;
> >   	u16	active_procs_in_pool;
> >   	u16	active_system_procs;
> >   	u16	phys_platform_procs;
> > @@ -86,7 +88,7 @@ struct hvcall_ppp_data {
> >   };
> >   /*
> > - * H_GET_PPP hcall returns info in 4 parms.
> > + * H_GET_PPP hcall returns info in 5 parms.
> >    *  entitled_capacity,unallocated_capacity,
> >    *  aggregation, resource_capability).
> >    *
> > @@ -94,11 +96,11 @@ struct hvcall_ppp_data {
> >    *  R5 = Unallocated Processor Capacity Percentage.
> >    *  R6 (AABBCCDDEEFFGGHH).
> >    *      XXXX - reserved (0)
> > - *          XXXX - reserved (0)
> > + *          XXXX - Active Cores in Resource Group
> >    *              XXXX - Group Number
> >    *                  XXXX - Pool Number.
> >    *  R7 (IIJJKKLLMMNNOOPP).
> > - *      XX - reserved. (0)
> > + *      XX - Resource group Number
> >    *        XX - bit 0-6 reserved (0).   bit 7 is Capped indicator.
> >    *          XX - variable processor Capacity Weight
> >    *            XX - Unallocated Variable Processor Capacity Weight.
> > @@ -120,9 +122,11 @@ static unsigned int h_get_ppp(struct hvcall_ppp_data *ppp_data)
> >   	ppp_data->entitlement = retbuf[0];
> >   	ppp_data->unallocated_entitlement = retbuf[1];
> > +	ppp_data->active_procs_in_resource_group = (retbuf[2] >> 4 * 8) & 0xffff;
> >   	ppp_data->group_num = (retbuf[2] >> 2 * 8) & 0xffff;
> >   	ppp_data->pool_num = retbuf[2] & 0xffff;
> > +	ppp_data->resource_group_index = (retbuf[3] >> 7 *  8) & 0xff;
> >   	ppp_data->capped = (retbuf[3] >> 6 * 8) & 0x01;
> >   	ppp_data->weight = (retbuf[3] >> 5 * 8) & 0xff;
> >   	ppp_data->unallocated_weight = (retbuf[3] >> 4 * 8) & 0xff;
> > @@ -236,6 +240,13 @@ static void parse_ppp_data(struct seq_file *m)
> >   	seq_printf(m, "unallocated_capacity=%lld\n",
> >   		   ppp_data.unallocated_entitlement);
> > +	if (ppp_data.active_procs_in_resource_group)  {
> 
> ppp_data.active_procs_in_resource_group can ever be zero?
> 
> If the entry is absent in lparcfg, then lparstat will print it as 0 (which happens to be
> default RG, while default RG may have processors)

If active_procs_in_resource_group is 0, then we are not printing the
resource group information. If active_procs_in_resource_group is non-zero
and resource_group_index is wrong, we need to report a bug to the firmware
to update it. Kernel is very transparent with respect to this information.
It can neither verify the information received nor should we even be doing
this.

> 
> > +		seq_printf(m, "resource_group_number=%d\n",
> > +				ppp_data.resource_group_index);
> > +		seq_printf(m, "resource_group_active_processors=%d\n",
> > +				ppp_data.active_procs_in_resource_group);
> > +	}
> > +
> >   	/* The last bits of information returned from h_get_ppp are only
> >   	 * valid if the ibm,partition-performance-parameters-level
> >   	 * property is >= 1.
> 

-- 
Thanks and Regards
Srikar Dronamraju

