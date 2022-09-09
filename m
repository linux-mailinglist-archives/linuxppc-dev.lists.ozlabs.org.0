Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4925B3AB2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 16:30:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPJL20YBDz3c4c
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 00:30:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S3R03Eh+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S3R03Eh+;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPJKH5gSzz309f
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 00:29:23 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289DNr7e010893;
	Fri, 9 Sep 2022 14:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wZxReJ3Ffmz159YEIahngqp4tyxSHVA2tQes+OfDn3Y=;
 b=S3R03Eh+oQUqH89dcva+uO6wyDXU8EnCNGkz2tiFihH+JQwhCxdu0iEajoDTQPR3JZWC
 j1gaGUUlzeapFCdTcqfEM+UcIGOkXI5dbOs3w0rJSGpxDOJkenxDtpoHnLLEVkvcHCfe
 14UhddCOumx92QMUIB0bGyQPMwnla+rCMAymz54RDU7Tl2EMcD9q/1ZYxKKQ2f45wIGJ
 r7vh0BDkoRj2yI9k5IWrGmhgXlUoD6njRGMsD/ddPOgXeVVFlGPWnOco191oMU5q5d0q
 yNXq3/95c8O4pmCFRyJyFjokUp1jLMPXVwYCsdT7JrF2r7PXijkjbdE0qdy61MxIl7RC BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg6b4t2ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 14:29:06 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 289DOJQY013289;
	Fri, 9 Sep 2022 14:29:06 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg6b4t2bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 14:29:05 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 289EKAbG024750;
	Fri, 9 Sep 2022 14:29:03 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06ams.nl.ibm.com with ESMTP id 3jbx6hr48f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 14:29:03 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 289ET1Hv40370576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Sep 2022 14:29:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57CAD42042;
	Fri,  9 Sep 2022 14:29:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 484234203F;
	Fri,  9 Sep 2022 14:29:00 +0000 (GMT)
Received: from [9.145.83.17] (unknown [9.145.83.17])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  9 Sep 2022 14:29:00 +0000 (GMT)
Message-ID: <54df2224-feca-52ed-567b-a82bb9d711da@linux.ibm.com>
Date: Fri, 9 Sep 2022 16:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [RFC PATCH RESEND 20/28] mm: introduce per-VMA lock statistics
Content-Language: fr
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-21-surenb@google.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220901173516.702122-21-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kvYuLStn_uQ1uNl81BCuqtUnrzGOXhxS
X-Proofpoint-GUID: I5PdrQNOrZt0oie58OYFreJ7Ngfr0ULC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209090049
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 01/09/2022 à 19:35, Suren Baghdasaryan a écrit :
> Add a new CONFIG_PER_VMA_LOCK_STATS config option to dump extra
> statistics about handling page fault under VMA lock.
> 

Why not making this a default when per VMA lock are enabled?

> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/vm_event_item.h | 6 ++++++
>  include/linux/vmstat.h        | 6 ++++++
>  mm/Kconfig.debug              | 8 ++++++++
>  mm/vmstat.c                   | 6 ++++++
>  4 files changed, 26 insertions(+)
> 
> diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
> index f3fc36cd2276..a325783ed05d 100644
> --- a/include/linux/vm_event_item.h
> +++ b/include/linux/vm_event_item.h
> @@ -150,6 +150,12 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
>  #ifdef CONFIG_X86
>  		DIRECT_MAP_LEVEL2_SPLIT,
>  		DIRECT_MAP_LEVEL3_SPLIT,
> +#endif
> +#ifdef CONFIG_PER_VMA_LOCK_STATS
> +		VMA_LOCK_SUCCESS,
> +		VMA_LOCK_ABORT,
> +		VMA_LOCK_RETRY,
> +		VMA_LOCK_MISS,
>  #endif
>  		NR_VM_EVENT_ITEMS
>  };
> diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
> index bfe38869498d..0c2611899cfc 100644
> --- a/include/linux/vmstat.h
> +++ b/include/linux/vmstat.h
> @@ -131,6 +131,12 @@ static inline void vm_events_fold_cpu(int cpu)
>  #define count_vm_vmacache_event(x) do {} while (0)
>  #endif
>  
> +#ifdef CONFIG_PER_VMA_LOCK_STATS
> +#define count_vm_vma_lock_event(x) count_vm_event(x)
> +#else
> +#define count_vm_vma_lock_event(x) do {} while (0)
> +#endif
> +
>  #define __count_zid_vm_events(item, zid, delta) \
>  	__count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
>  
> diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
> index ce8dded36de9..075642763a03 100644
> --- a/mm/Kconfig.debug
> +++ b/mm/Kconfig.debug
> @@ -207,3 +207,11 @@ config PTDUMP_DEBUGFS
>  	  kernel.
>  
>  	  If in doubt, say N.
> +
> +
> +config PER_VMA_LOCK_STATS
> +	bool "Statistics for per-vma locks"
> +	depends on PER_VMA_LOCK
> +	help
> +	  Statistics for per-vma locks.
> +	  If in doubt, say N.
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index 90af9a8572f5..3f3804c846a6 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1411,6 +1411,12 @@ const char * const vmstat_text[] = {
>  	"direct_map_level2_splits",
>  	"direct_map_level3_splits",
>  #endif
> +#ifdef CONFIG_PER_VMA_LOCK_STATS
> +	"vma_lock_success",
> +	"vma_lock_abort",
> +	"vma_lock_retry",
> +	"vma_lock_miss",
> +#endif
>  #endif /* CONFIG_VM_EVENT_COUNTERS || CONFIG_MEMCG */
>  };
>  #endif /* CONFIG_PROC_FS || CONFIG_SYSFS || CONFIG_NUMA || CONFIG_MEMCG */

