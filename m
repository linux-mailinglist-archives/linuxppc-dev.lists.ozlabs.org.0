Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC52D1198
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 14:15:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqP1k48jSzDqVN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 00:15:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ami/VGSc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqNxr4H74zDqSk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 00:12:00 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7D2Bx4045870; Mon, 7 Dec 2020 08:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=WHXphbVjeJDgHgn5XibvhdAbLfM2z0E3WZL+Rif4r44=;
 b=ami/VGSc794gvTQDhcZ41lA3gYpjOV6vQx/ruOr1qmAkOeygTOoocNboiA985grf8YD0
 fww8Jy3ik91krDd1KbqSgk1I0v0UGuNdVA6oiDdJE7hHXb4vqSdL3jnsrhdFfL5Tz/Kx
 6FCr8R3Hp9FiGgGdGcOxjDXEBUgi8I18TCnoYBTN1ynEdCzYjYKcozOhV+2qjX8GGBKK
 cnOtkqEXmL5/D3OlUYGwiHZt09+O3jLL/Dt1ryx6AWyUptl6hjSq6BG51ZCZlwKbuFMm
 v0zNv+EiXoVfpCMs8BoQrf3MAdol3biYY0X6exTC9C2Lc3+Oz9UxNQ8+fFKyBEmf1nqw hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 359m8x9mf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 08:11:45 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B7D2Bhu045828;
 Mon, 7 Dec 2020 08:11:45 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 359m8x9mek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 08:11:45 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7D6aDK029563;
 Mon, 7 Dec 2020 13:11:43 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3581fhjgnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 13:11:43 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7DBfPv9306794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 13:11:41 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F122A405C;
 Mon,  7 Dec 2020 13:11:41 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0DBAA4060;
 Mon,  7 Dec 2020 13:11:38 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  7 Dec 2020 13:11:38 +0000 (GMT)
Date: Mon, 7 Dec 2020 18:41:38 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/cacheinfo: Print correct cache-sibling
 map/list for L2 cache
Message-ID: <20201207131138.GJ528281@linux.vnet.ibm.com>
References: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
 <1607057327-29822-4-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1607057327-29822-4-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_11:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=1 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070080
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

* Gautham R. Shenoy <ego@linux.vnet.ibm.com> [2020-12-04 10:18:47]:

> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> 
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
> 
> +extern bool thread_group_shares_l2;
>  /*
>   * On big-core systems, each core has two groups of CPUs each of which
>   * has its own L1-cache. The thread-siblings which share l1-cache with
>   * @cpu can be obtained via cpu_smallcore_mask().
> + *
> + * On some big-core systems, the L2 cache is shared only between some
> + * groups of siblings. This is already parsed and encoded in
> + * cpu_l2_cache_mask().
>   */
>  static const struct cpumask *get_big_core_shared_cpu_map(int cpu, struct cache *cache)
>  {
>  	if (cache->level == 1)
>  		return cpu_smallcore_mask(cpu);
> +	if (cache->level == 2 && thread_group_shares_l2)
> +		return cpu_l2_cache_mask(cpu);
> 
>  	return &cache->shared_cpu_map;

As pointed with lkp@intel.org, we need to do this only with #CONFIG_SMP,
even for cache->level = 1 too.

I agree that we are displaying shared_cpu_map correctly. Should we have also
update /clear shared_cpu_map in the first place. For example:- If for a P9
core with CPUs 0-7, the cache->shared_cpu_map for L1 would have 0-7 but
would display 0,2,4,6.

The drawback of this is even if cpus 0,2,4,6 are released L1 cache will not
be released. Is this as expected?


-- 
Thanks and Regards
Srikar Dronamraju
