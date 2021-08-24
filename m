Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A83F5A41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 10:57:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gv30M23zJz2yPm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 18:57:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cetFPRl5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cetFPRl5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gv2zZ3Tl9z2yHY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 18:56:57 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17O8YHWG176112; Tue, 24 Aug 2021 04:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=TN4DDib0sMGVyRRXyINUx3mu1Wj4tum7kRkSPU/zLt0=;
 b=cetFPRl5xdnLp6Wf89PnHbHJ4ivPy+F5YQkKwTZhk3XdMcjbK9a1VB1hpc8ReJRHQXnr
 Nlne6ztuq04Amphpbsh0NrH7sXzDBAKzDkCDDmgXzlVtmc9m80IAFybr0gHcSaJ3dmZx
 5Xj6ysKUim9O/fNxx81cffEgVt6Lg9UGKKd+16QxiLlzb3Xrw5umnwLQ2uuO6J3qT+Rk
 W8i+ydTxH0/CaCxwW0I4zxr5NPohj84w5+xA/Zkd1Ahf9yB+AW2qvfOP2JoTBcEU1Z8D
 trZhCY0PU0EMZuStdtQOycI+YmMmpT22jjHXYWGxchyJeF1SR94wDR7Kcp92mZz+Ta92 EA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3amwaj8na3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Aug 2021 04:56:37 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17O8qtIi031285;
 Tue, 24 Aug 2021 08:56:37 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 3ajs4cqddp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Aug 2021 08:56:37 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17O8uaST34341362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Aug 2021 08:56:36 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6E43136063;
 Tue, 24 Aug 2021 08:56:35 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 101FE136060;
 Tue, 24 Aug 2021 08:56:30 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.43.32.176])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with SMTP;
 Tue, 24 Aug 2021 08:56:30 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id AE6042E318C; Tue, 24 Aug 2021 14:25:57 +0530 (IST)
Date: Tue, 24 Aug 2021 14:25:57 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/smp: Enable CACHE domain for shared processor
Message-ID: <20210824085557.GA13164@in.ibm.com>
References: <20210821092419.167454-1-srikar@linux.vnet.ibm.com>
 <20210821092419.167454-4-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210821092419.167454-4-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NtYBGtzjLcI11RT1xllo1apHPFewI97v
X-Proofpoint-ORIG-GUID: NtYBGtzjLcI11RT1xllo1apHPFewI97v
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-24_02:2021-08-24,
 2021-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240057
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Srikar,

On Sat, Aug 21, 2021 at 02:54:19PM +0530, Srikar Dronamraju wrote:
[..snip..]

The patch looks good to me.

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> ---
>  arch/powerpc/kernel/smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 3d26d3c61e94..47b15f31cc29 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1365,7 +1365,7 @@ static bool update_mask_by_l2(int cpu, cpumask_var_t *mask)
>  	l2_cache = cpu_to_l2cache(cpu);
>  	if (!l2_cache || !*mask) {
>  		/* Assume only core siblings share cache with this CPU */
> -		for_each_cpu(i, submask_fn(cpu))
> +		for_each_cpu(i, cpu_sibling_mask(cpu))
>  			set_cpus_related(cpu, i, cpu_l2_cache_mask);
> 
>  		return false;
> -- 
> 2.18.2
> 
