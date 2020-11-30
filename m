Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE80E2C7D7C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 04:57:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ckrz93vcgzDrJB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 14:57:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KoBOjs/O; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkrxN4261zDrJB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 14:55:48 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AU3WR2X179964; Sun, 29 Nov 2020 22:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=gRA3ZPmcwtlvU08q1iPwhxoVtOcb8hEH82B4M1MSv6I=;
 b=KoBOjs/OtkPY6/CWaxSl1Hh1Dqsw7dTgkbXnae39l/5aSrisqlppSw46aeYLgL/7mzV4
 GcuNPFzv2zp/2i1CYLebpRt7VRZ1pEE9rTs3nXzgLBb7xzSeaLFINbNqR5kiMtPMK1Jf
 gvKp8Oep3Ip0ofToqlLU/TMi+AoKAdDLSoPvl2CHnV+mVKvK0elBiMfZ81k9szTpicJp
 hgdex7fKS1ETwb/B+IFHxiSbKYzMo9PpTJiqWIr6DbHnfs6rObsnzU0E5yzC9a0LVzhL
 0KE0X3OK/hZvZZZAVX07ee0HrqjkiPPKzlQboNF/rdJ8vRE/IGPV3QY9tYcCY2cQhO3Y AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 354rak8yak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Nov 2020 22:55:46 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AU3mcS9082297;
 Sun, 29 Nov 2020 22:55:46 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 354rak8ya7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Nov 2020 22:55:45 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AU3mFqX021901;
 Mon, 30 Nov 2020 03:55:43 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 353e681khf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 03:55:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AU3tfOS50921828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 03:55:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 302F84204B;
 Mon, 30 Nov 2020 03:55:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E28942047;
 Mon, 30 Nov 2020 03:55:40 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.71.39])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 30 Nov 2020 03:55:40 +0000 (GMT)
Date: Mon, 30 Nov 2020 09:25:38 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/8] powerpc/64s/powernv: Fix memory corruption when
 saving SLB entries on MCE
Message-ID: <20201130035538.n63kjui6wslj33vt@in.ibm.com>
References: <20201128070728.825934-1-npiggin@gmail.com>
 <20201128070728.825934-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201128070728.825934-2-npiggin@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-29_12:2020-11-26,
 2020-11-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 suspectscore=1 malwarescore=0 clxscore=1011 adultscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011300018
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
Reply-To: mahesh@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-11-28 17:07:21 Sat, Nicholas Piggin wrote:
> This can be hit by an HPT guest running on an HPT host and bring down
> the host, so it's quite important to fix.
> 
> Fixes: 7290f3b3d3e66 ("powerpc/64s/powernv: machine check dump SLB contents")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/setup.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
> index 46115231a3b2..4426a109ec2f 100644
> --- a/arch/powerpc/platforms/powernv/setup.c
> +++ b/arch/powerpc/platforms/powernv/setup.c
> @@ -211,11 +211,16 @@ static void __init pnv_init(void)
>  		add_preferred_console("hvc", 0, NULL);
>  
>  	if (!radix_enabled()) {
> +		size_t size = sizeof(struct slb_entry) * mmu_slb_size;

Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.


>  		int i;
>  
>  		/* Allocate per cpu area to save old slb contents during MCE */
> -		for_each_possible_cpu(i)
> -			paca_ptrs[i]->mce_faulty_slbs = memblock_alloc_node(mmu_slb_size, __alignof__(*paca_ptrs[i]->mce_faulty_slbs), cpu_to_node(i));
> +		for_each_possible_cpu(i) {
> +			paca_ptrs[i]->mce_faulty_slbs =
> +					memblock_alloc_node(size,
> +						__alignof__(struct slb_entry),
> +						cpu_to_node(i));
> +		}
>  	}
>  }
>  
> -- 
> 2.23.0
> 

-- 
Mahesh J Salgaonkar
