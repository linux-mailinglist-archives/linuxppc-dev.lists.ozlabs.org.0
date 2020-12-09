Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F10752D3E50
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 10:17:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrWff26HjzDqrN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 20:17:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MUaROpBH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrWcp02hfzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 20:16:09 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B993Cwp034240; Wed, 9 Dec 2020 04:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=OUtnX1xWfkGMVaDSZjdSLkzl+kWnd4BJdWJwy6bdJjs=;
 b=MUaROpBH57+TaLj07MoKv4oPJblZB9pCaZUD9m/NcP9Emu9iJXvDrTLfNqORgCzmeeiS
 lohj2a0/9vTxBaQ0cw94+55dfS5Bc+gwYiXl/KjWC7Ev06whC7goKgtWsag6iWTCAn+S
 RZ5HSyAKS3DePYTfGecaEWoBE/EP38deneSVXNjStmXVakPJ8V8FKRYTK/KIeXga3K2f
 t5Q3bwriH0/8qjqcEbZOynGKUT8X4vbr2AWBXYZIs7QsFI9aUIXEtfWiPDb363p9Bt04
 /kIHpwNXC9ke++SetrIHv5qSvLLBW6rhMtPBW+ooJUxgtC+uMTuJzHkbb1uiUxvld/uE wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35aab9ecmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 04:15:58 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B994lAl043893;
 Wed, 9 Dec 2020 04:15:57 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35aab9ecjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 04:15:57 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B99CJGK000367;
 Wed, 9 Dec 2020 09:15:53 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3581u8ph7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 09:15:53 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B99EaXv8585844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 09:14:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F63AA4062;
 Wed,  9 Dec 2020 09:14:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 173B4A405B;
 Wed,  9 Dec 2020 09:14:34 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  9 Dec 2020 09:14:33 +0000 (GMT)
Date: Wed, 9 Dec 2020 14:44:33 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/smp: Add support detecting thread-groups
 sharing L2 cache
Message-ID: <20201209091433.GM528281@linux.vnet.ibm.com>
References: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
 <1607057327-29822-3-git-send-email-ego@linux.vnet.ibm.com>
 <20201207124039.GI528281@linux.vnet.ibm.com>
 <20201208174237.GB14206@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20201208174237.GB14206@in.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_07:2020-12-08,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=1
 malwarescore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090064
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

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-12-08 23:12:37]:

> 
> > For L2 we have thread_group_l2_cache_map to store the tasks from the thread
> > group.  but cpu_l2_cache_map for keeping track of tasks.
> 
> > 
> > I think we should do some renaming to keep the names consistent.
> > I would say probably say move the current cpu_l2_cache_map to
> > cpu_llc_cache_map and move the new aka  thread_group_l2_cache_map as
> > cpu_l2_cache_map to be somewhat consistent.
> 
> Hmm.. cpu_llc_cache_map is still very generic. We want to have
> something that defines l2 map.
> 
> I agree that we need to keep it consistent. How about renaming
> cpu_l1_cache_map to thread_groups_l1_cache_map ?
> 
> That way thread_groups_l1_cache_map and thread_groups_l2_cache_map
> refer to the corresponding L1 and L2 siblings as discovered from
> ibm,thread-groups property.

I am fine with this.

> > > +
> > > +	for_each_possible_cpu(cpu) {
> > > +		int err = init_cpu_cache_map(cpu, THREAD_GROUP_SHARE_L2);
> > > +
> > > +		if (err)
> > > +			return err;
> > > +	}
> > > +
> > > +	thread_group_shares_l2 = true;
> > 
> > Why do we need a separate loop. Why cant we merge this in the above loop
> > itself?
> 
> No, there are platforms where one THREAD_GROUP_SHARE_L1 exists while
> THREAD_GROUP_SHARE_L2 doesn't exist. It becomes easier if these are
> separately tracked. Also, what do we gain if we put this in the same
> loop? It will be (nr_possible_cpus * 2 * invocations of
> init_cpu_cache_map()) as opposed to 2 * (nr_possible_cpus *
> invocations of init_cpu_cache_map()). Isn't it ?
> 
Its not about the number of invocations but per-cpu thread group list
that would need not be loaded again. Currently they would probably be in the
cache-line, but get dropped to be loaded again in the next loop.
And we still can support platforms with only THREAD_GROUP_SHARE_L1 since
parse_thread_groups would have given us how many levels of thread groups are
supported on a platform.

> > 
> > > +	pr_info("Thread-groups in a core share L2-cache\n");
> > 
> > Can this be moved to a pr_debug? Does it help any regular user/admins to
> > know if thread-groups shared l2 cache. Infact it may confuse users on what
> > thread groups are and which thread groups dont share cache.
> > I would prefer some other name than thread_group_shares_l2 but dont know any
> > better alternatives and may be my choices are even worse.
> 
> Would you be ok with "L2 cache shared by threads of the small core" ?

Sounds better to me. I would still think pr_debug is better since regular
Admins/users may not make too much information from this.
> 
> > 
> > Ah this can be simplified to:
> > if (thread_group_shares_l2) {
> > 	cpumask_set_cpu(cpu, cpu_l2_cache_mask(cpu));
> > 
> > 	for_each_cpu(i, per_cpu(thread_group_l2_cache_map, cpu)) {
> > 		if (cpu_online(i))
> > 			set_cpus_related(i, cpu, cpu_l2_cache_mask);
> > 	}
> 
> Don't we want to enforce that the siblings sharing L1 be a subset of
> the siblings sharing L2 ? Or do you recommend putting in a check for
> that somewhere ?
> 
I didnt think about the case where the device-tree could show L2 to be a
subset of L1.

How about initializing thread_group_l2_cache_map itself with
cpu_l1_cache_map. It would be a simple one time operation and reduce the
overhead here every CPU online.
And it would help in your subsequent patch too. We dont want the cacheinfo
for L1 showing CPUs not present in L2.

-- 
Thanks and Regards
Srikar Dronamraju
