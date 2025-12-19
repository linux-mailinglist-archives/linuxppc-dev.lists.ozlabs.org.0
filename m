Return-Path: <linuxppc-dev+bounces-14888-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC2CCE7AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 05:57:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXZyj5GzJz2yFY;
	Fri, 19 Dec 2025 15:57:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766120237;
	cv=none; b=CFJ6p6o51ACSwi7hU7QiZgDCUona5gSvnJlHUHKwYbOGsQhApr7R5HyR0h5M10HNjlEhR/1i+4o7JmQVUhpt6AMTgvY+3r0ZBKWw1t/HS0gQEfn3aY8o4vjnv+rZiiYtRNPWevEOc+zGnV3PQccEL47gVJY910io+W5C2odpyAHIlP8MzmjcBIxtlVmDGQoKvMUFuIfrbIgOW0dIxM89agrToYAGQGGCK69g7STMMjTfOhvXfFtG+y5Kuifee/YXgyIYnRcZ9ZI0j25ar8U+1xH9sSFdtlR7gBnA2TYPVgE0Vnfh7WYdjFS5pQoUiJmZJR1jli9dap2xsKOAeqto/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766120237; c=relaxed/relaxed;
	bh=xwGEev6nVoeQE62jvV1/TITwwqxcUCUjuccVvb6yjTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liSnq8RmbLsZsMlBsFhzBZbjSI3uzgi2p+oG1ebvy1KplWrakL6Xmu1LIpTtEAMMe45Ko3uKBYcABMCXMwIbUjJ84YUCEkTh8422m7BJQfcIR2oMkJKhz+7KP9Ma3iw+up6ausF5OVeWAtytRp+FrCvfJt1cIWMEdaPIY8YkHL0Zc2Wy7fiykfpauUeunBIt0bIXIEbJNcXVTQNZcgI5cPBe2dpK7/O7aWAK3uEPcCq7QSpaaRVr1+GmOgiraEaNMI9plpEG63T9vOIBXXwLn3tCcZw3ct4sExwatFUiLIoioaq1eauH64G6/AVX0gJu7gwfGrEhOhpqpPX252PnRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JfWr8yAf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JfWr8yAf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXZyh3tcDz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 15:57:15 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJmHP5031778;
	Fri, 19 Dec 2025 04:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xwGEev
	6nVoeQE62jvV1/TITwwqxcUCUjuccVvb6yjTQ=; b=JfWr8yAfnDtMfMZwJqoeZL
	h+/S/kHMBwlLVMtvw4s6G4GtRKJYxkbi8DjuXyol7q5/r4CQJFbWn3yt3JDDvE61
	E/Znj2eCYdZJiPGVvyy+BSUe6JIgnlDdfe7DGidHULM5wnrxwEvTrq6aoZ7ing1/
	r5rEeEvCNaqGQTC4uqFS2/yI6XHA06pgus9YNCj53NFT2jPhUQ/zdSwLO6gWFZTI
	6/TIBWmux76kmEibCR/L5tCyoDxEXPR+2fn831FYc4gdVUltmEs+O7JDiX/LFfIM
	ohVkPV9bnXghDM+8XbzvGHb0uNaOj+oWdgDJocFiGKppCM/EqtB0WnL2Mx3hLnPQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b4r3dhq0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 04:56:35 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BJ4tGXB019619;
	Fri, 19 Dec 2025 04:56:35 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b4r3dhq0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 04:56:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BJ3eU6x006405;
	Fri, 19 Dec 2025 04:56:34 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b4qvqj0jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 04:56:34 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BJ4uU9C44106150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Dec 2025 04:56:30 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E89E820040;
	Fri, 19 Dec 2025 04:56:29 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED19F20043;
	Fri, 19 Dec 2025 04:56:23 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.39.20.206])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 19 Dec 2025 04:56:23 +0000 (GMT)
Date: Fri, 19 Dec 2025 10:26:20 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        sshegde@linux.ibm.com, charlie@rivosinc.com, macro@orcam.me.uk,
        akpm@linux-foundation.org, ldv@strace.io, deller@gmx.de,
        ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] powerpc: Prepare for IRQ entry exit
Message-ID: <3ddsrov3wv5dtfntiotyesikhmbsi3vnld2pynooj3lqi6obhg@rx7ytg6fy4rq>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-7-mkchauras@linux.ibm.com>
 <91d280af-fb41-4c05-8b96-113717ecd64a@kernel.org>
 <vk6k6fbjpq6pajvce5idrfq2m7smygpazpqemxkiyov7ywhbt7@6sckgpjdxarq>
 <49b2a51b-a324-4a8b-b6e8-434fcc411b19@kernel.org>
 <33v3ncxlwtc5qfdc257hky7pnly5j445qaqzc45vnbiswnge4t@wx5nujnzrazh>
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
In-Reply-To: <33v3ncxlwtc5qfdc257hky7pnly5j445qaqzc45vnbiswnge4t@wx5nujnzrazh>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uiRLs7V5jfM4gAmAzyh59l_QgwkbhqP0
X-Proofpoint-GUID: tjCHiNQzideDh781Wrvut9htx-Jzj0nS
X-Authority-Analysis: v=2.4 cv=KrZAGGWN c=1 sm=1 tr=0 ts=6944db03 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=VJ81eyxrqXbgAbdtzYcA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAzNyBTYWx0ZWRfX3i8myeq1r0lM
 NQQdjRmrLF5uzWKk6QyGDil5Y/MdqdxLnL0ytY5A3I1qmaoXYN88DSXbWCKz71dLrWO51TaIput
 ML6msRkcXqpB1QYV0I5pVTkOFfcyj/0J2IzRumGuHRlwiy5MoJLE9dpDdJiYBxoI0FcNLJUUPUR
 jH+ieseFm4N1xRNn0fgjVPwhkDC/4KqX7S8adqOEC32MXxehQHC5TwTQICWSb76H7yD6mzfNchT
 bo1yFUr5b/5+C/qk5lrDaKZjfyqr3eRsMyTrW0wz+tQ0HssO0XuQESqufUt5INTGjhGNWI1o7XP
 r3P5eb5qy936YPcChGmw+XB39YUY8ap3+l22FOXu7vl58GllWv8eWUGkHEwglJ20MhVedqXOqlW
 km5mmwrpZ8WhrqPoeOpU3Gh6VkrLY8ky8ce2RlytFmRjEVXHu1mEO8Y7/nFfWRLlOpoZR9aCZx1
 KxIfol+6+Lj1+N/TqzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512190037
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Dec 17, 2025 at 10:13:19AM +0530, Mukesh Kumar Chaurasiya wrote:
> On Tue, Dec 16, 2025 at 11:40:51PM +0100, Christophe Leroy (CS GROUP) wrote:
> > 
> > 
> > Le 16/12/2025 à 16:00, Mukesh Kumar Chaurasiya a écrit :
> > > On Tue, Dec 16, 2025 at 10:58:16AM +0100, Christophe Leroy (CS GROUP) wrote:
> > > > 
> > > > 
> > > > Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> > > > > From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > > > > 
> > > > > Move interrupt entry and exit helper routines from interrupt.h into the
> > > > > PowerPC-specific entry-common.h header as a preparatory step for enabling
> > > > > the generic entry/exit framework.
> > > > > 
> > > > > This consolidation places all PowerPC interrupt entry/exit handling in a
> > > > > single common header, aligning with the generic entry infrastructure.
> > > > > The helpers provide architecture-specific handling for interrupt and NMI
> > > > > entry/exit sequences, including:
> > > > > 
> > > > >    - arch_interrupt_enter/exit_prepare()
> > > > >    - arch_interrupt_async_enter/exit_prepare()
> > > > >    - arch_interrupt_nmi_enter/exit_prepare()
> > > > >    - Supporting helpers such as nap_adjust_return(), check_return_regs_valid(),
> > > > >      debug register maintenance, and soft mask handling.
> > > > > 
> > > > > The functions are copied verbatim from interrupt.h to avoid functional
> > > > > changes at this stage. Subsequent patches will integrate these routines
> > > > > into the generic entry/exit flow.
> > > > 
> > > > Can we move them instead of duplicating them ?
> > > > 
> > > Till we enable the Generic framework i didn't want to touch the already
> > > used code path. Once we enable the code all the unused code should be
> > > removed. This helps us in bisecting future issues caused due to this.
> > 
> > I can't see who it can help bisecting. What did I miss ?
> > 
> > If you copy the code, you don't know whether what you have copied is correct
> > or not until you use it. So when you start using it you don't know if the
> > problem is in the copied code or the code using it.
> > 
> > If instead of copying the code you move it and continue to use the moved
> > code from the only implementation, they when you start using it with the new
> > code you are sure it works and then if you have a problem you know it is not
> > the moved code but the new code using it.
> > 
> Sure makes sense. Will move this instead of duplicating.
> 
> Regards,
> Mukesh
> > Christophe
> 
Ah one more reason we can't move them is because this file is not
directly included by the arch code. It's included by the generic
framework and then we include it the generic header.

Regards,
Mukesh

