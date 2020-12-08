Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CC52D3101
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 18:28:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr6Zq6n3KzDqX8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 04:28:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ltMVt7Ag; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr6XT5jGlzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 04:26:01 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8HNr1v051098; Tue, 8 Dec 2020 12:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=IaZ84GfW6YCR3f5g6WY5rPkcyNxY+cDXFyijgJulcfY=;
 b=ltMVt7AgZh8pMGH4crwqLBNJbJ3OdNGMEMTQQhanefEpsm++r9E91uuh5PZc5wjKzFTT
 MGPYbYUpp93fn5mv109UMmHvXJaDX0XKCG55yN7JRVIn36cdpt77pThRAPdoodNaH0oJ
 QkaAok5wJ6+bv5ifiOPH1g4sSzStkmLlAD5ybNKewlAPmlXMj44oJubGMHQ30KLme8l2
 r7r3yDpiRCF+QG2kbFdhCsurymoo3dXvGBkHhIiynWKZqM1OM0oO6tt/nYlSLqBqdXDU
 SHLrNiwEhZ/Lzb4wcrssDVzBrHE6QaO+1eUg6jBJSPOIRpiHpDnT71FxGHCCKeX495cg FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35aab8r2su-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 12:25:46 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B8HNqpU050964;
 Tue, 8 Dec 2020 12:25:46 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35aab8r2sb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 12:25:46 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8HLtwU013816;
 Tue, 8 Dec 2020 17:25:44 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 3581u99ay1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 17:25:44 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8HPihN15335772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 17:25:44 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7172428064;
 Tue,  8 Dec 2020 17:25:44 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C81D62805A;
 Tue,  8 Dec 2020 17:25:43 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.54.209])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Dec 2020 17:25:43 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 237B52E35A1; Tue,  8 Dec 2020 22:55:40 +0530 (IST)
Date: Tue, 8 Dec 2020 22:55:40 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/smp: Parse ibm,thread-groups with multiple
 properties
Message-ID: <20201208172540.GA14206@in.ibm.com>
References: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
 <1607057327-29822-2-git-send-email-ego@linux.vnet.ibm.com>
 <20201207121042.GH528281@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207121042.GH528281@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_14:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=2
 malwarescore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080104
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
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Srikar,

Thanks for taking a look at the patch.

On Mon, Dec 07, 2020 at 05:40:42PM +0530, Srikar Dronamraju wrote:
> * Gautham R. Shenoy <ego@linux.vnet.ibm.com> [2020-12-04 10:18:45]:
> 
> > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> <snipped>
> 
> > 
> >  static int parse_thread_groups(struct device_node *dn,
> > -			       struct thread_groups *tg,
> > -			       unsigned int property)
> > +			       struct thread_groups_list *tglp)
> >  {
> > -	int i;
> > -	u32 thread_group_array[3 + MAX_THREAD_LIST_SIZE];
> > +	int i = 0;
> > +	u32 *thread_group_array;
> >  	u32 *thread_list;
> >  	size_t total_threads;
> > -	int ret;
> > +	int ret = 0, count;
> > +	unsigned int property_idx = 0;
> 
> NIT:
> tglx mentions in one of his recent comments to try keep a reverse fir tree
> ordering of variables where possible.

I suppose you mean moving the longer local variable declarations to to
the top and shorter ones to the bottom. Thanks. Will fix this.


> 
> > 
> > +	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
> > +	thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
> >  	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
> > -					 thread_group_array, 3);
> > +					 thread_group_array, count);
> >  	if (ret)
> > -		return ret;
> > -
> > -	tg->property = thread_group_array[0];
> > -	tg->nr_groups = thread_group_array[1];
> > -	tg->threads_per_group = thread_group_array[2];
> > -	if (tg->property != property ||
> > -	    tg->nr_groups < 1 ||
> > -	    tg->threads_per_group < 1)
> > -		return -ENODATA;
> > +		goto out_free;
> > 
> > -	total_threads = tg->nr_groups * tg->threads_per_group;
> > +	while (i < count && property_idx < MAX_THREAD_GROUP_PROPERTIES) {
> > +		int j;
> > +		struct thread_groups *tg = &tglp->property_tgs[property_idx++];
> 
> NIT: same as above.

Ok.
> 
> > 
> > -	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
> > -					 thread_group_array,
> > -					 3 + total_threads);
> > -	if (ret)
> > -		return ret;
> > +		tg->property = thread_group_array[i];
> > +		tg->nr_groups = thread_group_array[i + 1];
> > +		tg->threads_per_group = thread_group_array[i + 2];
> > +		total_threads = tg->nr_groups * tg->threads_per_group;
> > +
> > +		thread_list = &thread_group_array[i + 3];
> > 
> > -	thread_list = &thread_group_array[3];
> > +		for (j = 0; j < total_threads; j++)
> > +			tg->thread_list[j] = thread_list[j];
> > +		i = i + 3 + total_threads;
> 
> 	Can't we simply use memcpy instead?

We could. But this one makes it more explicit.


> 
> > +	}
> > 
> > -	for (i = 0 ; i < total_threads; i++)
> > -		tg->thread_list[i] = thread_list[i];
> > +	tglp->nr_properties = property_idx;
> > 
> > -	return 0;
> > +out_free:
> > +	kfree(thread_group_array);
> > +	return ret;
> >  }
> > 
> >  /*
> > @@ -805,24 +827,39 @@ static int get_cpu_thread_group_start(int cpu, struct thread_groups *tg)
> >  	return -1;
> >  }
> > 
> > -static int init_cpu_l1_cache_map(int cpu)
> > +static int init_cpu_cache_map(int cpu, unsigned int cache_property)
> > 
> >  {
> >  	struct device_node *dn = of_get_cpu_node(cpu, NULL);
> > -	struct thread_groups tg = {.property = 0,
> > -				   .nr_groups = 0,
> > -				   .threads_per_group = 0};
> > +	struct thread_groups *tg = NULL;
> >  	int first_thread = cpu_first_thread_sibling(cpu);
> >  	int i, cpu_group_start = -1, err = 0;
> > +	cpumask_var_t *mask;
> > +	struct thread_groups_list *cpu_tgl = &tgl[cpu];
> 
> NIT: same as 1st comment.

Sure, will fix this.

> 
> > 
> >  	if (!dn)
> >  		return -ENODATA;
> > 
> > -	err = parse_thread_groups(dn, &tg, THREAD_GROUP_SHARE_L1);
> > -	if (err)
> > -		goto out;
> > +	if (!(cache_property == THREAD_GROUP_SHARE_L1))
> > +		return -EINVAL;
> > 
> > -	cpu_group_start = get_cpu_thread_group_start(cpu, &tg);
> > +	if (!cpu_tgl->nr_properties) {
> > +		err = parse_thread_groups(dn, cpu_tgl);
> > +		if (err)
> > +			goto out;
> > +	}
> > +
> > +	for (i = 0; i < cpu_tgl->nr_properties; i++) {
> > +		if (cpu_tgl->property_tgs[i].property == cache_property) {
> > +			tg = &cpu_tgl->property_tgs[i];
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!tg)
> > +		return -EINVAL;
> > +
> > +	cpu_group_start = get_cpu_thread_group_start(cpu, tg);
> 
> This whole hunk should be moved to a new function and called before
> init_cpu_cache_map. It will simplify the logic to great extent.

I suppose you are referring to the part where we select the correct
tg. Yeah, that can move to a different helper.

> 
> > 
> >  	if (unlikely(cpu_group_start == -1)) {
> >  		WARN_ON_ONCE(1);
> > @@ -830,11 +867,12 @@ static int init_cpu_l1_cache_map(int cpu)
> >  		goto out;
> >  	}
> > 
> > -	zalloc_cpumask_var_node(&per_cpu(cpu_l1_cache_map, cpu),
> > -				GFP_KERNEL, cpu_to_node(cpu));
> > +	mask = &per_cpu(cpu_l1_cache_map, cpu);
> > +
> > +	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
> > 
> 
> This hunk (and the next hunk) should be moved to next patch.
>

The next patch is only about introducing  THREAD_GROUP_SHARE_L2. Hence
I put in any other code in this patch, since it seems to be a logical
place to collate whatever we have in a generic form.



> >  	for (i = first_thread; i < first_thread + threads_per_core; i++) {
> > -		int i_group_start = get_cpu_thread_group_start(i, &tg);
> > +		int i_group_start = get_cpu_thread_group_start(i, tg);
> > 
> >  		if (unlikely(i_group_start == -1)) {
> >  			WARN_ON_ONCE(1);
> > @@ -843,7 +881,7 @@ static int init_cpu_l1_cache_map(int cpu)
> >  		}
> > 
> >  		if (i_group_start == cpu_group_start)
> > -			cpumask_set_cpu(i, per_cpu(cpu_l1_cache_map, cpu));
> > +			cpumask_set_cpu(i, *mask);
> >  	}
> > 
> >  out:
> > @@ -924,7 +962,7 @@ static int init_big_cores(void)
> >  	int cpu;
> > 
> >  	for_each_possible_cpu(cpu) {
> > -		int err = init_cpu_l1_cache_map(cpu);
> > +		int err = init_cpu_cache_map(cpu, THREAD_GROUP_SHARE_L1);
> > 
> >  		if (err)
> >  			return err;
> > -- 
> > 1.9.4
> > 
> 
> -- 
> Thanks and Regards
> Srikar Dronamraju
