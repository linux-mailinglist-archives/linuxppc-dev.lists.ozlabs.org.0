Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C46558349
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 19:29:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTS116vR5z3chf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 03:29:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y3TA0mqg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y3TA0mqg;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTS0F6FJYz3btT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 03:28:45 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NH477J005821;
	Thu, 23 Jun 2022 17:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=6OXl8nU3O0vsUUAHgJeBUoHNx37icdPhV3yLsSJhBsc=;
 b=Y3TA0mqgqSgd3CMi4ogddbNhPuhnxTaec8Vqyi9b/zcgWwAAMH+YcJA70VNHvCFGIiQN
 zR24VWmejEg/nI2tsC/OF1lcu123dFSKvIKHIbhdqHv2P+ExDf8QUM4whfD01WYA+aCR
 VZzufpxJkUnny3e8QJnownQFe8GW1Z210WiM21twHIas6/ubfst4vAlGMKqwtiIuNKVv
 LgVz+I5tGmGWfsd0MociXvBTL1/2y3m71f7CQAYm8Hv+MclFSw/nq5Ilr0gPvo1Lr3fb
 k/OLV/g+iYVOCU5nnn/FSNOuUF7ulqwMPtSUWS/FRJE320d/A0ZSmr97xfojlH1bCYaU RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvux4srfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 17:28:37 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25NGgZhI019666;
	Thu, 23 Jun 2022 17:28:37 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvux4srf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 17:28:36 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25NHKRpA001613;
	Thu, 23 Jun 2022 17:28:35 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma01dal.us.ibm.com with ESMTP id 3guk92nqty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 17:28:35 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25NHSYCt33161502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jun 2022 17:28:34 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F949136059;
	Thu, 23 Jun 2022 17:28:34 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5EB9F13605D;
	Thu, 23 Jun 2022 17:28:34 +0000 (GMT)
Received: from localhost (unknown [9.211.80.5])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jun 2022 17:28:34 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v2 4/4] pseries/mobility: Set NMI watchdog factor during
 LPM
In-Reply-To: <20220614135414.37746-5-ldufour@linux.ibm.com>
References: <20220614135414.37746-1-ldufour@linux.ibm.com>
 <20220614135414.37746-5-ldufour@linux.ibm.com>
Date: Thu, 23 Jun 2022 12:28:34 -0500
Message-ID: <87sfnvmgql.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: REn_lZoZMpAj12V61_21I2CQkeWkN_5s
X-Proofpoint-ORIG-GUID: Kp3KJByhFMvM2McxSTK861NMN4gk17Zz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_07,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 spamscore=0 bulkscore=0 mlxlogscore=972 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206230067
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, haren@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
> index 179bbd4ae881..4284ceaf9060 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -48,6 +48,39 @@ struct update_props_workarea {
>  #define MIGRATION_SCOPE	(1)
>  #define PRRN_SCOPE -2
>  
> +#ifdef CONFIG_PPC_WATCHDOG
> +static unsigned int lpm_nmi_wd_factor = 200;
> +
> +#ifdef CONFIG_SYSCTL
> +static struct ctl_table lpm_nmi_wd_factor_ctl_table[] = {
> +	{
> +		.procname	= "lpm_nmi_watchdog_factor",

Assuming the basic idea is acceptable, I suggest making the user-visible
name more generic (e.g. "nmi_watchdog_factor") in case it makes sense to
apply this to other contexts in the future.

> +		.data		= &lpm_nmi_wd_factor,
> +		.maxlen		= sizeof(int),
> +		.mode		= 0644,
> +		.proc_handler	= proc_douintvec_minmax,
> +	},
> +	{}
> +};
> +static struct ctl_table lpm_nmi_wd_factor_sysctl_root[] = {
> +	{
> +		.procname       = "kernel",
> +		.mode           = 0555,
> +		.child          = lpm_nmi_wd_factor_ctl_table,
> +	},
> +	{}
> +};
> +
> +static int __init register_lpm_nmi_wd_factor_sysctl(void)
> +{
> +	register_sysctl_table(lpm_nmi_wd_factor_sysctl_root);
> +
> +	return 0;
> +}
> +device_initcall(register_lpm_nmi_wd_factor_sysctl);
> +#endif /* CONFIG_SYSCTL */
> +#endif /* CONFIG_PPC_WATCHDOG */
> +
>  static int mobility_rtas_call(int token, char *buf, s32 scope)
>  {
>  	int rc;
> @@ -702,6 +735,7 @@ static int pseries_suspend(u64 handle)
>  static int pseries_migrate_partition(u64 handle)
>  {
>  	int ret;
> +	unsigned int factor = lpm_nmi_wd_factor;
>  
>  	ret = wait_for_vasi_session_suspending(handle);
>  	if (ret)
> @@ -709,6 +743,13 @@ static int pseries_migrate_partition(u64 handle)
>  
>  	vas_migration_handler(VAS_SUSPEND);
>  
> +#ifdef CONFIG_PPC_WATCHDOG
> +	if (factor) {
> +		pr_info("Set the NMI watchdog factor to %u%%\n", factor);
> +		watchdog_nmi_set_lpm_factor(factor);
> +	}
> +#endif /* CONFIG_PPC_WATCHDOG */
> +
>  	ret = pseries_suspend(handle);
>  	if (ret == 0) {
>  		post_mobility_fixup();
> @@ -716,6 +757,13 @@ static int pseries_migrate_partition(u64 handle)
>  	} else
>  		pseries_cancel_migration(handle, ret);
>  
> +#ifdef CONFIG_PPC_WATCHDOG
> +	if (factor) {
> +		pr_info("Restoring NMI watchdog timer\n");
> +		watchdog_nmi_set_lpm_factor(0);
> +	}
> +#endif /* CONFIG_PPC_WATCHDOG */
> +

A couple more suggestions:

* Move the prints into a single statement in watchdog_nmi_set_lpm_factor().

* Add no-op versions of watchdog_nmi_set_lpm_factor for
  !CONFIG_PPC_WATCHDOG so we can minimize the #ifdef here.

Otherwise this looks fine to me.
