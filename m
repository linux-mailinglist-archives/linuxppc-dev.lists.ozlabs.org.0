Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 570A6273FE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 12:48:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwdMm4w2MzDqgn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 20:48:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qwmHOaeb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwdKv4hrhzDqfL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 20:47:09 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08MAW0ke085209; Tue, 22 Sep 2020 06:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=fnAgScVP+mGC0EJABFWKI0Y97Pe7NAp/Cui5F6kKcoU=;
 b=qwmHOaeb7ieMXOzJHhejcLwNWYglZVb42o+tvIE0keX144x7FXpnT2rboRFcNMUYMcOo
 6kmQngE8cUEMJMkcgFdZoiGpoQMRpNWq8TvyuLX1a1p8a+V2M864NHCoGvu/+nNlax7U
 7xfGyJdHro/kWY8vbh3vfysa2rpQqwsG+STRSWKhyb7mcu/JTkhuV7V6ON/9FFLvw4Uo
 iuCJG4nYujg+L9rSNl+K0Ax+R15HKF4c2njkqp+uHKt2OXbaHZs6enu0ZeOYaVFbR/d2
 2FfF4hmPLHNv/p7USv+Ond7jKZRvb/8NW2g97ynRDsx2QJif4IuGs4H6gwP35l3RzasI HA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33qeecahwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 06:47:04 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08MAfguK017389;
 Tue, 22 Sep 2020 10:47:02 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 33n9m8x571-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 10:47:02 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08MAkwtp31654248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Sep 2020 10:46:58 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4586C6059;
 Tue, 22 Sep 2020 10:47:01 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E7E6C605B;
 Tue, 22 Sep 2020 10:46:59 +0000 (GMT)
Received: from li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com (unknown
 [9.160.61.128])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 22 Sep 2020 10:46:59 +0000 (GMT)
Date: Tue, 22 Sep 2020 05:46:56 -0500
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] powerpc/perf: Exclude pmc5/6 from the irrelevant PMU
 group constraints
Message-ID: <20200922104656.GA664163@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
References: <1600672204-1610-1-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600672204-1610-1-git-send-email-atrajeev@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_06:2020-09-21,
 2020-09-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=928
 bulkscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220083
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Just one nit in a comment below...
(and this is not worthy of tags like "reviewed-by" ;-)

On Mon, Sep 21, 2020 at 03:10:04AM -0400, Athira Rajeev wrote:
> PMU counter support functions enforces event constraints for group of
> events to check if all events in a group can be monitored. Incase of
> event codes using PMC5 and PMC6 ( 500fa and 600f4 respectively ),
> not all constraints are applicable, say the threshold or sample bits.
> But current code includes pmc5 and pmc6 in some group constraints (like
> IC_DC Qualifier bits) which is actually not applicable and hence results
> in those events not getting counted when scheduled along with group of
> other events. Patch fixes this by excluding PMC5/6 from constraints
> which are not relevant for it.
> 
> Fixes: 7ffd948 ("powerpc/perf: factor out power8 pmu functions")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---

> diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
> index 964437a..12153da 100644
> --- a/arch/powerpc/perf/isa207-common.c
> +++ b/arch/powerpc/perf/isa207-common.c
> @@ -288,6 +288,15 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
> 
>  		mask  |= CNST_PMC_MASK(pmc);
>  		value |= CNST_PMC_VAL(pmc);
> +
> +		/*
> +		 * PMC5 and PMC6 are used to count cycles and instructions
> +		 * and these doesnot support most of the constraint bits.

s/doesnot/do not/

> +		 * Add a check to exclude PMC5/6 from most of the constraints
> +		 * except for ebb/bhrb.
> +		 */
> +		if (pmc >= 5)
> +			goto ebb_bhrb;

PC
