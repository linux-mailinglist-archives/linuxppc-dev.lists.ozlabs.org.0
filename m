Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CC316BA09
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 07:47:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RTyQ2pBWzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 17:47:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RTwL2k3TzDqRc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 17:45:54 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01P6jfxg166980; Tue, 25 Feb 2020 01:45:51 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ybu13qm2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2020 01:45:50 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01P6jhKO167045;
 Tue, 25 Feb 2020 01:45:43 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ybu13qm0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2020 01:45:43 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01P6jA14027561;
 Tue, 25 Feb 2020 06:45:35 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 2yaux6hsbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2020 06:45:35 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01P6jZf245351314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Feb 2020 06:45:35 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEBB3AC059;
 Tue, 25 Feb 2020 06:45:34 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0458AC05B;
 Tue, 25 Feb 2020 06:45:34 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.114])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 25 Feb 2020 06:45:34 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 7FAAC2E2F59; Tue, 25 Feb 2020 12:15:32 +0530 (IST)
Date: Tue, 25 Feb 2020 12:15:32 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 2/2] cpufreq/powernv: Fix unsafe notifiers
Message-ID: <20200225064532.GJ12846@in.ibm.com>
References: <20200206062622.28235-1-oohall@gmail.com>
 <20200206062622.28235-2-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206062622.28235-2-oohall@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-25_01:2020-02-21,
 2020-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002250054
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 06, 2020 at 05:26:22PM +1100, Oliver O'Halloran wrote:
> The PowerNV cpufreq driver registers two notifiers: one to catch throttle
> messages from the OCC and one to bump the CPU frequency back to normal
> before a reboot. Both require the cpufreq driver to be registered in order
> to function since the notifier callbacks use various cpufreq_*() functions.
> 
> Right now we register both notifiers before we've initialised the driver.
> This seems to work, but we should head off any protential problems by
> registering the notifiers after the driver is initialised.
> 
> Cc: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> ---
>  drivers/cpufreq/powernv-cpufreq.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> index 1806b1d..03798c4 100644
> --- a/drivers/cpufreq/powernv-cpufreq.c
> +++ b/drivers/cpufreq/powernv-cpufreq.c
> @@ -1114,9 +1114,6 @@ static int __init powernv_cpufreq_init(void)
>  	if (rc)
>  		goto out;
> 
> -	register_reboot_notifier(&powernv_cpufreq_reboot_nb);
> -	opal_message_notifier_register(OPAL_MSG_OCC, &powernv_cpufreq_opal_nb);
> -
>  	if (powernv_pstate_info.wof_enabled)
>  		powernv_cpufreq_driver.boost_enabled = true;
>  	else
> @@ -1125,15 +1122,17 @@ static int __init powernv_cpufreq_init(void)
>  	rc = cpufreq_register_driver(&powernv_cpufreq_driver);
>  	if (rc) {
>  		pr_info("Failed to register the cpufreq driver (%d)\n", rc);
> -		goto cleanup_notifiers;
> +		goto cleanup;
>  	}
> 
>  	if (powernv_pstate_info.wof_enabled)
>  		cpufreq_enable_boost_support();
> 
> +	register_reboot_notifier(&powernv_cpufreq_reboot_nb);
> +	opal_message_notifier_register(OPAL_MSG_OCC, &powernv_cpufreq_opal_nb);
> +
>  	return 0;
> -cleanup_notifiers:
> -	unregister_all_notifiers();
> +cleanup:
>  	clean_chip_info();
>  out:
>  	pr_info("Platform driver disabled. System does not support PState control\n");
> -- 
> 2.9.5
> 
