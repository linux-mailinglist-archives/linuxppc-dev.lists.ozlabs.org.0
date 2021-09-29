Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D5841BFF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 09:31:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK7Mt6zmpz3bhj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 17:31:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cfXfx+Bx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cfXfx+Bx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK7M82kJJz2xX6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 17:30:28 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T6U2k7010023; 
 Wed, 29 Sep 2021 03:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=z00JFr7QzFXwaWgXoVFxDedpX+g2+ZcX+Hdu5rFDufg=;
 b=cfXfx+BxWyx5szr12ZmvZlymiXCRL4g50v+d9q4oF90FtPBkns+Bbi59jTJp5RdGetAo
 hzrULOkTKt/iks8STC21or9v3KTC2pQN6ryYh1UQhm1fzvbhYu88qqCvyxBla8Xz52Gq
 NRnTLIGyV438qUmnWDWSDpaFxATz4fdrKMkPEUEtJDm/D9h988ERT1GfqH9Ut1LNEHTT
 hElPnx+cHarBwLoRS2Jj8mttEesS9V8R52tIpNns1POF3IOkuIpRZ2lkDBZr6kU4A2sM
 2nIUAQhy8AGM1FhlB0tZ6NvZKTVJEb1Hp1UIvo/Kv4cEofrdKa6roMC/1yveNyDIIy5T CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bcjx897ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 03:30:23 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18T6UwPH015217;
 Wed, 29 Sep 2021 03:30:23 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bcjx897s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 03:30:23 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18T7DKxh026163;
 Wed, 29 Sep 2021 07:30:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3b9u1jmydx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 07:30:18 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18T7UEkD4588162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Sep 2021 07:30:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1547AE05D;
 Wed, 29 Sep 2021 07:30:14 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 500B3AE058;
 Wed, 29 Sep 2021 07:30:13 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 29 Sep 2021 07:30:13 +0000 (GMT)
Date: Wed, 29 Sep 2021 13:00:12 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc/paravirt: vcpu_is_preempted() commentary
Message-ID: <20210929073012.GF2004@linux.vnet.ibm.com>
References: <20210928214147.312412-1-nathanl@linux.ibm.com>
 <20210928214147.312412-2-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210928214147.312412-2-nathanl@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rngxOmhLJxvQ_FcBOKEtnNskzUwLjjLB
X-Proofpoint-ORIG-GUID: 67wCT-lWxZWrFJq3zm2MJzRlLagi3H2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_02,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109290041
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nathan Lynch <nathanl@linux.ibm.com> [2021-09-28 16:41:46]:

> Add comments more clearly documenting that this function determines whether
> hypervisor-level preemption of the VM has occurred.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

> ---
>  arch/powerpc/include/asm/paravirt.h | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index bcb7b5f917be..39f173961f6a 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -21,7 +21,7 @@ static inline bool is_shared_processor(void)
>  	return static_branch_unlikely(&shared_processor);
>  }
> 
> -/* If bit 0 is set, the cpu has been preempted */
> +/* If bit 0 is set, the cpu has been ceded, conferred, or preempted */
>  static inline u32 yield_count_of(int cpu)
>  {
>  	__be32 yield_count = READ_ONCE(lppaca_of(cpu).yield_count);
> @@ -92,6 +92,19 @@ static inline void prod_cpu(int cpu)
>  #define vcpu_is_preempted vcpu_is_preempted
>  static inline bool vcpu_is_preempted(int cpu)
>  {
> +	/*
> +	 * The dispatch/yield bit alone is an imperfect indicator of
> +	 * whether the hypervisor has dispatched @cpu to run on a physical
> +	 * processor. When it is clear, @cpu is definitely not preempted.
> +	 * But when it is set, it means only that it *might* be, subject to
> +	 * other conditions. So we check other properties of the VM and
> +	 * @cpu first, resorting to the yield count last.
> +	 */
> +
> +	/*
> +	 * Hypervisor preemption isn't possible in dedicated processor
> +	 * mode by definition.
> +	 */
>  	if (!is_shared_processor())
>  		return false;
> 
> @@ -100,9 +113,10 @@ static inline bool vcpu_is_preempted(int cpu)
>  		int first_cpu = cpu_first_thread_sibling(smp_processor_id());
> 
>  		/*
> -		 * Preemption can only happen at core granularity. This CPU
> -		 * is not preempted if one of the CPU of this core is not
> -		 * preempted.
> +		 * The PowerVM hypervisor dispatches VMs on a whole core
> +		 * basis. So we know that a thread sibling of the local CPU
> +		 * cannot have been preempted by the hypervisor, even if it
> +		 * has called H_CONFER, which will set the yield bit.
>  		 */
>  		if (cpu_first_thread_sibling(cpu) == first_cpu)
>  			return false;
> -- 
> 2.31.1
> 

-- 
Thanks and Regards
Srikar Dronamraju
