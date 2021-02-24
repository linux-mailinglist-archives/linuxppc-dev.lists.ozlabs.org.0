Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A86323F3E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 15:48:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlzLm16Zrz3cbx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 01:48:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KujFqZfe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KujFqZfe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlzLL24qBz30Ny
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 01:48:09 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OEWo1J091110; Wed, 24 Feb 2021 09:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=5Ni5odoyAPPqY4CgBVr3QXyVYPTEfZXQe5QewEQ2qQ0=;
 b=KujFqZfeCX0Vdx4zJS1FFVOTJaQfKDXyS9G3d9N1GKY+6DhzI6gKmwB+aanUfZwX9D+S
 S0ar1gyZ5QA4LDOFAjWr5GG6lV/JaMhBMbDz62eljwoHxRfe8vGFJDDOsi+gVRKfQdNQ
 yR9Ag0UDu75mabcGym1duBHoNxhLv0xJ74iDZ93u3zfpPvc+hb6rQNAhYpGzi4KRG8nq
 2NXAV5kJEONp+zLNM89Id8FTxki8OS0C3Bh4PUe2r/CJ8RrnBPQfduCt0UGmWkhk3G/X
 QU2uzRf5jrauxLO8M0hOnkjrH1z8vmLlvL6kmL0N2TKvmxA9K7IAdwD8n1G/0Q4FADYr 4w== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36wm1ethbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 09:48:02 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11OEc0I1004319;
 Wed, 24 Feb 2021 14:48:01 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 36tt297ama-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 14:48:01 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11OEm1TL21954994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 14:48:01 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14101AE060;
 Wed, 24 Feb 2021 14:48:01 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3B84AE063;
 Wed, 24 Feb 2021 14:48:00 +0000 (GMT)
Received: from li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com (unknown
 [9.85.196.115]) by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 24 Feb 2021 14:48:00 +0000 (GMT)
Date: Wed, 24 Feb 2021 08:47:58 -0600
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/perf: Infrastructure to support checking of
 attr.config*
Message-ID: <20210224144758.GA566251@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
References: <20210224142840.1170088-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210224142840.1170088-1-maddy@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_04:2021-02-24,
 2021-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240114
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 24, 2021 at 07:58:39PM +0530, Madhavan Srinivasan wrote:
> Introduce code to support the checking of attr.config* for
> values which are reserved for a given platform.
> Performance Monitoring Unit (PMU) configuration registers
> have fileds that are reserved and specific values to bit fields

s/fileds/fields/

> as reserved. Writing a none zero values in these fields

Should the previous sentences say something like "required values
for specific bit fields" or "specific bit fields that are reserved"?

s/none zero/non-zero/

> or writing invalid value to bit fields will have unknown
> behaviours.
> 
> Patch here add a generic call-back function "check_attr_config"

s/add/adds/ or "This patch adds ..." or just "Add ...".

> in "struct power_pmu", to be called in event_init to
> check for attr.config* values for a given platform.
> "check_attr_config" is valid only for raw event type.
> 
> Suggested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/perf_event_server.h |  6 ++++++
>  arch/powerpc/perf/core-book3s.c              | 12 ++++++++++++
>  2 files changed, 18 insertions(+)
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
> index 6817331e22ff..679d67506299 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -1958,6 +1958,18 @@ static int power_pmu_event_init(struct perf_event *event)
> 
>  		if (ppmu->blacklist_ev && is_event_blacklisted(ev))
>  			return -EINVAL;
> +		/*
> +		 * PMU config registers have fileds that are
> +		 * reserved and spacific values to bit fileds be reserved.

s/spacific/specific/
s/fileds/fields/
Same comment about "specific values to bit fields be reserved", and
rewording that to be more clear.

> +		 * This call-back will check the event code for same.
> +		 *
> +		 * Event type hardware and hw_cache will not value
> +		 * invalid values in the event code which is not true
> +		 * for raw event type.

I confess I don't understand what this means. (But it could be just me!)

> +		 */
> +		if (ppmu->check_attr_config &&
> +		    ppmu->check_attr_config(event))
> +			return -EINVAL;
>  		break;
>  	default:
>  		return -ENOENT;
> -- 

PC
