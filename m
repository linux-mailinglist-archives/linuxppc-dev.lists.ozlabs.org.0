Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F10590B6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 07:18:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3sQ1565Pz3blQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 15:18:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gduafzJm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gduafzJm;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3sPG3yN3z2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 15:17:22 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27C59ljA016231;
	Fri, 12 Aug 2022 05:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=131XI9ovrZitKqkC7KwlSKSEJrUNTkpNLUvP93QYz6Y=;
 b=gduafzJmtrWC+HAHESBQZEtRu9impveEf7j7GJOunJJ88R5766MU7aGYD8Es1/5PxhlZ
 vy5EZa0+P24drxXxXvYCydNcYotyLq8ghxOrdzT0bTH0Pq712BPxW0xzm6dH8/GeZPzx
 MuDdBECHcxCBzUwSpB/fsU3AJUwMfwKkUKg1+nRfj0FjX2kxMZJ7wOnv7crBfuYmE4Gi
 TGesQUlGN2c0x9M8YavaHfSBiXRPFsQWxSQDUfsK/srRqmXsViAlf2X48Ft71Qt2ZfCF
 U47n4X5SSgkKNn6h0eVGIMTs6amHyTkmuLpNzLYrd9YYOgokCaSoZ831gaV0uJndIrLY HA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwg2p0p7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Aug 2022 05:17:05 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27C5A7vh019491;
	Fri, 12 Aug 2022 05:17:05 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwg2p0p6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Aug 2022 05:17:05 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27C5D7si016861;
	Fri, 12 Aug 2022 05:17:04 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma03wdc.us.ibm.com with ESMTP id 3huww6f7wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Aug 2022 05:17:04 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27C5H3v066126324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Aug 2022 05:17:03 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E965BE056;
	Fri, 12 Aug 2022 05:17:03 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42218BE051;
	Fri, 12 Aug 2022 05:17:00 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.116.179])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Fri, 12 Aug 2022 05:16:59 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [RESEND PATCH 2/2] lib/nodemask: inline next_node_in() and
 node_random()
In-Reply-To: <20220723214537.2054208-3-yury.norov@gmail.com>
References: <20220723214537.2054208-1-yury.norov@gmail.com>
 <20220723214537.2054208-3-yury.norov@gmail.com>
Date: Fri, 12 Aug 2022 10:46:57 +0530
Message-ID: <87o7wqkpme.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cWUuknHOZVTa5K0zwF78-zCcvprFdnaK
X-Proofpoint-ORIG-GUID: 9teZ_uOpdBiVgc_xxIGvvxtT4kK5ekKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_04,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120014
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
Cc: Yury Norov <yury.norov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yury Norov <yury.norov@gmail.com> writes:

> The functions are pretty thin wrappers around find_bit engine, and
> keeping them in c-file prevents compiler from small_const_nbits()
> optimization, which must take place for all systems with MAX_NUMNODES
> less than BITS_PER_LONG (default is 16 for me).
>
> Moving them to header file doesn't blow up the kernel size:
> add/remove: 1/2 grow/shrink: 9/5 up/down: 968/-88 (880)
>
> CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  MAINTAINERS              |  1 -
>  include/linux/nodemask.h | 27 ++++++++++++++++++++++-----
>  lib/Makefile             |  2 +-
>  lib/nodemask.c           | 30 ------------------------------
>  4 files changed, 23 insertions(+), 37 deletions(-)
>  delete mode 100644 lib/nodemask.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7c0b8f28aa25..19c8d0ef1177 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3540,7 +3540,6 @@ F:	lib/bitmap.c
>  F:	lib/cpumask.c
>  F:	lib/find_bit.c
>  F:	lib/find_bit_benchmark.c
> -F:	lib/nodemask.c
>  F:	lib/test_bitmap.c
>  F:	tools/include/linux/bitmap.h
>  F:	tools/include/linux/find.h
> diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
> index 0f233b76c9ce..48ebe4007955 100644
> --- a/include/linux/nodemask.h
> +++ b/include/linux/nodemask.h
> @@ -94,6 +94,7 @@
>  #include <linux/bitmap.h>
>  #include <linux/minmax.h>
>  #include <linux/numa.h>
> +#include <linux/random.h>
>  
>  typedef struct { DECLARE_BITMAP(bits, MAX_NUMNODES); } nodemask_t;
>  extern nodemask_t _unused_nodemask_arg_;
> @@ -276,7 +277,14 @@ static inline unsigned int __next_node(int n, const nodemask_t *srcp)
>   * the first node in src if needed.  Returns MAX_NUMNODES if src is empty.
>   */
>  #define next_node_in(n, src) __next_node_in((n), &(src))
> -unsigned int __next_node_in(int node, const nodemask_t *srcp);
> +static inline unsigned int __next_node_in(int node, const nodemask_t *srcp)
> +{
> +	unsigned int ret = __next_node(node, srcp);
> +
> +	if (ret == MAX_NUMNODES)
> +		ret = __first_node(srcp);
> +	return ret;
> +}
>  
>  static inline void init_nodemask_of_node(nodemask_t *mask, int node)
>  {
> @@ -493,14 +501,23 @@ static inline int num_node_state(enum node_states state)
>  
>  #endif
>  
> +/*
> + * Return the bit number of a random bit set in the nodemask.
> + * (returns NUMA_NO_NODE if nodemask is empty)
> + */
> +static inline int node_random(const nodemask_t *maskp)
> +{
>  #if defined(CONFIG_NUMA) && (MAX_NUMNODES > 1)
> -extern int node_random(const nodemask_t *maskp);
> +	int w, bit = NUMA_NO_NODE;
> +
> +	w = nodes_weight(*maskp);
> +	if (w)
> +		bit = find_nth_bit(maskp->bits, MAX_NUMNODES, get_random_int() % w);
> +	return bit;
>  #else
> -static inline int node_random(const nodemask_t *mask)
> -{
>  	return 0;
> -}
>  #endif
> +}
>  
>  #define node_online_map 	node_states[N_ONLINE]
>  #define node_possible_map 	node_states[N_POSSIBLE]
> diff --git a/lib/Makefile b/lib/Makefile
> index f99bf61f8bbc..731cea0342d1 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -33,7 +33,7 @@ lib-y := ctype.o string.o vsprintf.o cmdline.o \
>  	 flex_proportions.o ratelimit.o show_mem.o \
>  	 is_single_threaded.o plist.o decompress.o kobject_uevent.o \
>  	 earlycpio.o seq_buf.o siphash.o dec_and_lock.o \
> -	 nmi_backtrace.o nodemask.o win_minmax.o memcat_p.o \
> +	 nmi_backtrace.o win_minmax.o memcat_p.o \
>  	 buildid.o
>  
>  lib-$(CONFIG_PRINTK) += dump_stack.o
> diff --git a/lib/nodemask.c b/lib/nodemask.c
> deleted file mode 100644
> index 7dad4ce8ff59..000000000000
> --- a/lib/nodemask.c
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <linux/nodemask.h>
> -#include <linux/module.h>
> -#include <linux/random.h>
> -
> -unsigned int __next_node_in(int node, const nodemask_t *srcp)
> -{
> -	unsigned int ret = __next_node(node, srcp);
> -
> -	if (ret == MAX_NUMNODES)
> -		ret = __first_node(srcp);
> -	return ret;
> -}
> -EXPORT_SYMBOL(__next_node_in);
> -
> -#ifdef CONFIG_NUMA
> -/*
> - * Return the bit number of a random bit set in the nodemask.
> - * (returns NUMA_NO_NODE if nodemask is empty)
> - */
> -int node_random(const nodemask_t *maskp)
> -{
> -	int w, bit = NUMA_NO_NODE;
> -
> -	w = nodes_weight(*maskp);
> -	if (w)
> -		bit = find_nth_bit(maskp->bits, MAX_NUMNODES, get_random_int() % w);
> -	return bit;
> -}
> -#endif
> -- 
> 2.34.1

The patch that got merged (36d4b36b69590fed99356a4426c940a253a93800) still have lib/nodemask.c
