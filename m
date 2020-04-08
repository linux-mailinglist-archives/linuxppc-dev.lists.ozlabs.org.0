Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA131A1E55
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 11:53:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y02L1N34zDqkc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 19:52:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xzzs6VWszDqTj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 19:50:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48xzzs1Vylz8t60
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 19:50:49 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 48xzzs0Zj6z9sSh; Wed,  8 Apr 2020 19:50:49 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48xzzr4LPmz9sSG;
 Wed,  8 Apr 2020 19:50:48 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0389X3Eo015625; Wed, 8 Apr 2020 05:50:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30920aeuv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 05:50:41 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0389XNqJ016615;
 Wed, 8 Apr 2020 05:50:41 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30920aeuuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 05:50:41 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0389njPk006743;
 Wed, 8 Apr 2020 09:50:40 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 3091mdm01g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 09:50:40 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0389odc535717612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 09:50:39 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EF966E04C;
 Wed,  8 Apr 2020 09:50:39 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B71AB6E052;
 Wed,  8 Apr 2020 09:50:38 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.92.41])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 09:50:38 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 23B962E3023; Wed,  8 Apr 2020 15:20:33 +0530 (IST)
Date: Wed, 8 Apr 2020 15:20:33 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Subject: Re: [RFC] Support stop state version quirk and firmware enabled stop
Message-ID: <20200408095033.GC950@in.ibm.com>
References: <20200304155648.11501-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304155648.11501-1-psampat@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080079
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, pratik.r.sampat@gmail.com,
 vaidy@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 linuxppc-dev@ozlabs.org, oohall@gmail.com, skiboot@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pratik,

On Wed, Mar 04, 2020 at 09:26:48PM +0530, Pratik Rajesh Sampat wrote:
> A concept patch in Skiboot to illustrate the case wherein handling of
> stop states for different DD versions of a CPU can be achieved by a
> simple modification in the list of cpu_features.
> As an example idle-stop1 is defined which uses P9_CPU_DD1 to define the
> cpu feature.
> 
> Along with that, an implementation is being worked upon the LE OPAL
> series which helps OPAL handle the stop state entry and exit.
> 
> This patch advertises this capability of the firmware which can be
> availed if the quirk-version-setting is not cognizable.
> 
> The firmware-enabled stop is being worked by Abhishek Goel
> <huntbag@linux.vnet.ibm.com> building upon the LE OPAL series.
> 
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> ---
>  core/cpufeatures.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/core/cpufeatures.c b/core/cpufeatures.c
> index ec30c975..b9875e7b 100644
> --- a/core/cpufeatures.c
> +++ b/core/cpufeatures.c
> @@ -510,6 +510,25 @@ static const struct cpu_feature cpu_features_table[] = {
>  	-1, -1, -1,
>  	NULL, },
> 
> +	/*
> +	 * QUIRK for ISAv3.0B stop idle instructions and registers
> +	 * Helps us determine if there are any quirks
> +	 * XXX: Same of idle-stop
> +	 */
> +	{ "idle-stop-v1",
> +	CPU_P9_DD1,
> +	ISA_V3_0B, USABLE_HV|USABLE_OS,
> +	HV_CUSTOM, OS_CUSTOM,
> +	-1, -1, -1,
> +	NULL, },


So, at this point, we don't need any such quirk for any of the DD
version right ? This is to demonstrate that if say P9_DD1 had a quirk
w.r.t stop-state handling, then this is how we would advertise it to
the kernel.

> +
> +	{ "firmware-stop-supported",
> +	CPU_P9,
> +	ISA_V3_0B, USABLE_HV|USABLE_OS,
> +	HV_CUSTOM, OS_CUSTOM,
> +	-1, -1, -1,
> +	NULL, },
> +


I suppose this is for the opal-cpuidle driver support posted here:
https://lists.ozlabs.org/pipermail/skiboot/2020-April/016726.html

>  	/*
>  	 * ISAv3.0B Hypervisor Virtualization Interrupt
>  	 * Also associated system registers, LPCR EE, HEIC, HVICE,
> @@ -883,6 +902,9 @@ static void add_cpufeatures(struct dt_node *cpus,
>  		const struct cpu_feature *f = &cpu_features_table[i];
> 
>  		if (f->cpus_supported & cpu_feature_cpu) {
> +			if (!strcmp(f->name, "firmware-stop-supported") &&
> +			    HAVE_BIG_ENDIAN)
> +				continue;

In OPAL do we have an macro defining BIG_ENDIAN ? If yes, you could
wrap the "firmware-stop-supported" in cpu_features_table[] within
#ifndef BIG_ENDIAN. That way you won't need a special case here.



>  			DBG("  '%s'\n", f->name);
>  			add_cpu_feature_nodeps(features, f);
>  		}
> -- 
> 2.24.1
> 

--
Thanks and Regards
gautham.
