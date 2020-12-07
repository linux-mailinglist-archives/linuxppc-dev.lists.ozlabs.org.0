Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3CB2D1076
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 13:20:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqMpp16gKzDqVx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:20:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RIF6jAXZ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqMfW2zsczDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 23:13:38 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7C2HPJ173170; Mon, 7 Dec 2020 07:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=p2hrgGkKKslMC+KJ70GZbtkYBRpjtOL62PnROiS3A9k=;
 b=RIF6jAXZoX1h2jo7ep39VWsB1IiBKrY8bI7is+K5KbMRFxdKxeoa7FiW8rHWeVMjHx/n
 /lxz/jmBV1OeRY3LKrk7ysIH7+r1nEVhlFyYI1xJgvi+9LNkMC6soJplPZQznqzxW7Rk
 hSeWyrlvCSMPdhHqvbjy4kFqNBbQGgkHg7SXsXHSbYppcqL8hX0irqOSSiAOMPZe6XIe
 4xllLvlYZbZxdRXB1wrmy/bUyjka8HkaDiaS9bFZOaWrLAKUQTC9DtKKCILVTeX4oa44
 iZJV5vnqQLFGBbNwtBm/UFjIs/clv2e76XH+7efnqLR3KIJXAdPH9dn/pDAQrMUnr3Lm 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359m0jrffv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 07:13:19 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B7C2f1G175650;
 Mon, 7 Dec 2020 07:13:18 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359m0jrff6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 07:13:18 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7C7Wox031428;
 Mon, 7 Dec 2020 12:13:17 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3581u8kmp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 12:13:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0B7CAi9156885606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 12:10:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5F68A405C;
 Mon,  7 Dec 2020 12:10:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE0CAA4064;
 Mon,  7 Dec 2020 12:10:42 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  7 Dec 2020 12:10:42 +0000 (GMT)
Date: Mon, 7 Dec 2020 17:40:42 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/smp: Parse ibm,thread-groups with multiple
 properties
Message-ID: <20201207121042.GH528281@linux.vnet.ibm.com>
References: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
 <1607057327-29822-2-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1607057327-29822-2-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_10:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=5 malwarescore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070075
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R. Shenoy <ego@linux.vnet.ibm.com> [2020-12-04 10:18:45]:

> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

<snipped>

> 
>  static int parse_thread_groups(struct device_node *dn,
> -			       struct thread_groups *tg,
> -			       unsigned int property)
> +			       struct thread_groups_list *tglp)
>  {
> -	int i;
> -	u32 thread_group_array[3 + MAX_THREAD_LIST_SIZE];
> +	int i = 0;
> +	u32 *thread_group_array;
>  	u32 *thread_list;
>  	size_t total_threads;
> -	int ret;
> +	int ret = 0, count;
> +	unsigned int property_idx = 0;

NIT:
tglx mentions in one of his recent comments to try keep a reverse fir tree
ordering of variables where possible.

> 
> +	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
> +	thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
>  	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
> -					 thread_group_array, 3);
> +					 thread_group_array, count);
>  	if (ret)
> -		return ret;
> -
> -	tg->property = thread_group_array[0];
> -	tg->nr_groups = thread_group_array[1];
> -	tg->threads_per_group = thread_group_array[2];
> -	if (tg->property != property ||
> -	    tg->nr_groups < 1 ||
> -	    tg->threads_per_group < 1)
> -		return -ENODATA;
> +		goto out_free;
> 
> -	total_threads = tg->nr_groups * tg->threads_per_group;
> +	while (i < count && property_idx < MAX_THREAD_GROUP_PROPERTIES) {
> +		int j;
> +		struct thread_groups *tg = &tglp->property_tgs[property_idx++];

NIT: same as above.

> 
> -	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
> -					 thread_group_array,
> -					 3 + total_threads);
> -	if (ret)
> -		return ret;
> +		tg->property = thread_group_array[i];
> +		tg->nr_groups = thread_group_array[i + 1];
> +		tg->threads_per_group = thread_group_array[i + 2];
> +		total_threads = tg->nr_groups * tg->threads_per_group;
> +
> +		thread_list = &thread_group_array[i + 3];
> 
> -	thread_list = &thread_group_array[3];
> +		for (j = 0; j < total_threads; j++)
> +			tg->thread_list[j] = thread_list[j];
> +		i = i + 3 + total_threads;

	Can't we simply use memcpy instead?

> +	}
> 
> -	for (i = 0 ; i < total_threads; i++)
> -		tg->thread_list[i] = thread_list[i];
> +	tglp->nr_properties = property_idx;
> 
> -	return 0;
> +out_free:
> +	kfree(thread_group_array);
> +	return ret;
>  }
> 
>  /*
> @@ -805,24 +827,39 @@ static int get_cpu_thread_group_start(int cpu, struct thread_groups *tg)
>  	return -1;
>  }
> 
> -static int init_cpu_l1_cache_map(int cpu)
> +static int init_cpu_cache_map(int cpu, unsigned int cache_property)
> 
>  {
>  	struct device_node *dn = of_get_cpu_node(cpu, NULL);
> -	struct thread_groups tg = {.property = 0,
> -				   .nr_groups = 0,
> -				   .threads_per_group = 0};
> +	struct thread_groups *tg = NULL;
>  	int first_thread = cpu_first_thread_sibling(cpu);
>  	int i, cpu_group_start = -1, err = 0;
> +	cpumask_var_t *mask;
> +	struct thread_groups_list *cpu_tgl = &tgl[cpu];

NIT: same as 1st comment.

> 
>  	if (!dn)
>  		return -ENODATA;
> 
> -	err = parse_thread_groups(dn, &tg, THREAD_GROUP_SHARE_L1);
> -	if (err)
> -		goto out;
> +	if (!(cache_property == THREAD_GROUP_SHARE_L1))
> +		return -EINVAL;
> 
> -	cpu_group_start = get_cpu_thread_group_start(cpu, &tg);
> +	if (!cpu_tgl->nr_properties) {
> +		err = parse_thread_groups(dn, cpu_tgl);
> +		if (err)
> +			goto out;
> +	}
> +
> +	for (i = 0; i < cpu_tgl->nr_properties; i++) {
> +		if (cpu_tgl->property_tgs[i].property == cache_property) {
> +			tg = &cpu_tgl->property_tgs[i];
> +			break;
> +		}
> +	}
> +
> +	if (!tg)
> +		return -EINVAL;
> +
> +	cpu_group_start = get_cpu_thread_group_start(cpu, tg);

This whole hunk should be moved to a new function and called before
init_cpu_cache_map. It will simplify the logic to great extent.

> 
>  	if (unlikely(cpu_group_start == -1)) {
>  		WARN_ON_ONCE(1);
> @@ -830,11 +867,12 @@ static int init_cpu_l1_cache_map(int cpu)
>  		goto out;
>  	}
> 
> -	zalloc_cpumask_var_node(&per_cpu(cpu_l1_cache_map, cpu),
> -				GFP_KERNEL, cpu_to_node(cpu));
> +	mask = &per_cpu(cpu_l1_cache_map, cpu);
> +
> +	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
> 

This hunk (and the next hunk) should be moved to next patch.

>  	for (i = first_thread; i < first_thread + threads_per_core; i++) {
> -		int i_group_start = get_cpu_thread_group_start(i, &tg);
> +		int i_group_start = get_cpu_thread_group_start(i, tg);
> 
>  		if (unlikely(i_group_start == -1)) {
>  			WARN_ON_ONCE(1);
> @@ -843,7 +881,7 @@ static int init_cpu_l1_cache_map(int cpu)
>  		}
> 
>  		if (i_group_start == cpu_group_start)
> -			cpumask_set_cpu(i, per_cpu(cpu_l1_cache_map, cpu));
> +			cpumask_set_cpu(i, *mask);
>  	}
> 
>  out:
> @@ -924,7 +962,7 @@ static int init_big_cores(void)
>  	int cpu;
> 
>  	for_each_possible_cpu(cpu) {
> -		int err = init_cpu_l1_cache_map(cpu);
> +		int err = init_cpu_cache_map(cpu, THREAD_GROUP_SHARE_L1);
> 
>  		if (err)
>  			return err;
> -- 
> 1.9.4
> 

-- 
Thanks and Regards
Srikar Dronamraju
