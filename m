Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1FB1CE4AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 21:42:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LWXv0941zDqrM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 05:42:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LWVw02lnzDqlm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 05:40:23 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BJZCZb088655; Mon, 11 May 2020 15:40:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30wry0r9rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 15:40:06 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04BJZEaG088752;
 Mon, 11 May 2020 15:40:06 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30wry0r9r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 15:40:06 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04BJZh9Z022500;
 Mon, 11 May 2020 19:40:05 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 30wm568krq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 19:40:05 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04BJe4vQ22020408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 May 2020 19:40:04 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E9D7112065;
 Mon, 11 May 2020 19:40:04 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55380112069;
 Mon, 11 May 2020 19:40:04 +0000 (GMT)
Received: from localhost (unknown [9.85.205.196])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 11 May 2020 19:40:04 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v8 5/5] powerpc/hv-24x7: Update post_mobility_fixup() to
 handle migration
In-Reply-To: <20200506110737.14904-6-kjain@linux.ibm.com>
References: <20200506110737.14904-1-kjain@linux.ibm.com>
 <20200506110737.14904-6-kjain@linux.ibm.com>
Date: Mon, 11 May 2020 14:40:03 -0500
Message-ID: <87eerq2rcc.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_09:2020-05-11,
 2020-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 suspectscore=1 mlxlogscore=999 malwarescore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005110149
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com,
 anju@linux.vnet.ibm.com, peterz@infradead.org, gregkh@linuxfoundation.org,
 suka@us.ibm.com, alexander.shishkin@linux.intel.com, mingo@kernel.org,
 mpetlan@redhat.com, yao.jin@linux.intel.com, ak@linux.intel.com,
 mamatha4@linux.vnet.ibm.com, acme@kernel.org, jmario@redhat.com,
 namhyung@kernel.org, linuxppc-dev@lists.ozlabs.org, jolsa@kernel.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Kajol Jain <kjain@linux.ibm.com> writes:
> Function 'read_sys_info_pseries()' is added to get system parameter
> values like number of sockets and chips per socket.
> and it gets these details via rtas_call with token
> "PROCESSOR_MODULE_INFO".
>
> Incase lpar migrate from one system to another, system
> parameter details like chips per sockets or number of sockets might
> change. So, it needs to be re-initialized otherwise, these values
> corresponds to previous system values.
> This patch adds a call to 'read_sys_info_pseries()' from
> 'post-mobility_fixup()' to re-init the physsockets and physchips values
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/mobility.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Please cc me on patches for this code, thanks.

I see no technical problems with how this patch handles partition
migration. However:

"Update post_mobility_fixup() to handle migration" is not an appropriate
summary for this change. post_mobility_fixup() already handles
migration. A better summary would be

"powerpc/pseries: update hv-24x7 info after migration"


> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
> index b571285f6c14..0fb8f1e6e9d2 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -42,6 +42,12 @@ struct update_props_workarea {
>  #define MIGRATION_SCOPE	(1)
>  #define PRRN_SCOPE -2
>  
> +#ifdef CONFIG_HV_PERF_CTRS
> +void read_sys_info_pseries(void);
> +#else
> +static inline void read_sys_info_pseries(void) { }
> +#endif

This should go in a header.


>  static int mobility_rtas_call(int token, char *buf, s32 scope)
>  {
>  	int rc;
> @@ -371,6 +377,16 @@ void post_mobility_fixup(void)
>  	/* Possibly switch to a new RFI flush type */
>  	pseries_setup_rfi_flush();
>  
> +	/*
> +	 * In case an Lpar migrates from one system to another, system
> +	 * parameter details like chips per sockets, cores per chip and
> +	 * number of sockets details might change.
> +	 * So, they needs to be re-initialized otherwise the
> +	 * values will correspond to the previous system.
> +	 * Call read_sys_info_pseries() to reinitialise the values.
> +	 */

This is needlessly verbose; any literate reader of this code knows this
is used immediately after resuming from a suspend (migration). If you
give your hook a more descriptive name, the comment becomes unnecessary.


> +	read_sys_info_pseries();
> +

