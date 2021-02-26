Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA13263A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 15:04:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnBGm614Pz3cZx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 01:04:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tZtoehDc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tZtoehDc; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnBGH4chnz3cYD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 01:03:50 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QE2iM4137022; Fri, 26 Feb 2021 09:03:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=2/89xUzGTiALtQ4njlH/dWXYbNGQOyGMyxLKQ7KkzrU=;
 b=tZtoehDcB0H6VhYT7gQP9CVLq/89Cb4jio3GO46iLlSy9p/w16RuredoWTcVM2JMEtzQ
 MffJHy3w9gxycdpu6Y3Ghm3GNJz5+Vakok9PUy0dlnIvmBW3uXlV4ySrtGQM7YMm0I5/
 qmReDdVsszPR2IvkC9GyspJlXFVzgO6k8J4MjOHkhWSG4K3+Iuio4zWRAv3PNjq0ztOu
 6hhThXBrdYWxvT1MNB8euK5WVYIW6mgvxbqso5uHAyGsBJHK4SU/oFOdOHjSoGAD9L0m
 vrunPkMvvxYq6lz/T3FvB/BLrS+L9r/G/f7Ym3n/bvXWhhpM5NDqJ67nSeIsuq3+/r4M zQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36y02svrmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 09:03:43 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11QE2xlX011714;
 Fri, 26 Feb 2021 14:03:43 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 36tt2atp2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 14:03:43 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11QE3geP36045210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 14:03:42 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 767782805C;
 Fri, 26 Feb 2021 14:03:42 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24D0728060;
 Fri, 26 Feb 2021 14:03:42 +0000 (GMT)
Received: from li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com (unknown
 [9.80.207.80]) by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 26 Feb 2021 14:03:42 +0000 (GMT)
Date: Fri, 26 Feb 2021 08:03:40 -0600
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH V2 1/2] powerpc/perf: Infrastructure to support checking
 of attr.config*
Message-ID: <20210226140340.GA36821@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
References: <20210226065025.1254973-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226065025.1254973-1-maddy@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_02:2021-02-24,
 2021-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260109
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Another drive-by review... just some minor nits, below...

On Fri, Feb 26, 2021 at 12:20:24PM +0530, Madhavan Srinivasan wrote:
> Introduce code to support the checking of attr.config* for
> values which are reserved for a given platform.
> Performance Monitoring Unit (PMU) configuration registers
> have fields that are reserved and specific value to bit field

I'd reword to "some specific values for bit fields are reserved".

> as reserved. For ex., MMCRA[61:62] is Randome Sampling Mode (SM)

s/Randome/Random/
This occurs here, and below, and in patch 2/2.

> and value of 0b11 to this field is reserved.

s/to/for/

> Writing a non-zero values in these fields or writing invalid
> value to bit fields will have unknown behaviours.

Suggest: Writing non-zero or invalid values in these fields
will have unknown behaviors. (or "behaviours" ;-)

PC

> Patch adds a generic call-back function "check_attr_config"
> in "struct power_pmu", to be called in event_init to
> check for attr.config* values for a given platform.
> "check_attr_config" is valid only for raw event type.
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Changelog v1:
> -Fixed commit message and in-code comments
> 
>  arch/powerpc/include/asm/perf_event_server.h |  6 ++++++
>  arch/powerpc/perf/core-book3s.c              | 14 ++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
> index 00e7e671bb4b..dde97d7d9253 100644
> --- a/arch/powerpc/include/asm/perf_event_server.h
> +++ b/arch/powerpc/include/asm/perf_event_server.h
> @@ -67,6 +67,12 @@ struct power_pmu {
>  	 * the pmu supports extended perf regs capability
>  	 */
>  	int		capabilities;
> +	/*
> +	 * Function to check event code for values which are
> +	 * reserved. Function takes struct perf_event as input,
> +	 * since event code could be spread in attr.config*
> +	 */
> +	int		(*check_attr_config)(struct perf_event *ev);
>  };
> 
>  /*
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 6817331e22ff..c6eeb4fdc5fd 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -1958,6 +1958,20 @@ static int power_pmu_event_init(struct perf_event *event)
> 
>  		if (ppmu->blacklist_ev && is_event_blacklisted(ev))
>  			return -EINVAL;
> +		/*
> +		 * PMU config registers have fields that are
> +		 * reserved and specific value to bit field as reserved.
> +		 * For ex., MMCRA[61:62] is Randome Sampling Mode (SM)
> +		 * and value of 0b11 to this field is reserved.
> +		 *
> +		 * This check is needed only for raw event type,
> +		 * since tools like fuzzer use raw event type to
> +		 * provide randomized event code values for test.
> +		 *
> +		 */
> +		if (ppmu->check_attr_config &&
> +		    ppmu->check_attr_config(event))
> +			return -EINVAL;
>  		break;
>  	default:
>  		return -ENOENT;
> -- 
> 2.26.2
> 
