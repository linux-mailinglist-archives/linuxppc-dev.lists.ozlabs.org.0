Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D345A22E634
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:03:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFW3Y0f8bzF1DM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:03:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFW1h2y3WzF0YY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:01:28 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R6Wifn131387; Mon, 27 Jul 2020 03:01:22 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32hsqhrr4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 03:01:22 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R6xbLh023205;
 Mon, 27 Jul 2020 07:01:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32gcpx1x09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 07:01:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06R71Hsi59441562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 07:01:17 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFA1E52051;
 Mon, 27 Jul 2020 07:01:16 +0000 (GMT)
Received: from [9.199.35.124] (unknown [9.199.35.124])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2F24952057;
 Mon, 27 Jul 2020 07:01:15 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH V4 1/4] powerpc/perf: Add support for outputting extended
 regs in perf intr_regs
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <1595774713-1482-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1595774713-1482-2-git-send-email-atrajeev@linux.vnet.ibm.com>
Message-ID: <a6076d4b-ed55-11a9-fa2c-4260edb1ffd6@linux.ibm.com>
Date: Mon, 27 Jul 2020 12:31:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595774713-1482-2-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_04:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270046
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 maddy@linux.vnet.ibm.com, acme@kernel.org, jolsa@kernel.org,
 kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Athira,

> +/* Function to return the extended register values */
> +static u64 get_ext_regs_value(int idx)
> +{
> +	switch (idx) {
> +	case PERF_REG_POWERPC_MMCR0:
> +		return mfspr(SPRN_MMCR0);
> +	case PERF_REG_POWERPC_MMCR1:
> +		return mfspr(SPRN_MMCR1);
> +	case PERF_REG_POWERPC_MMCR2:
> +		return mfspr(SPRN_MMCR2);
> +	default: return 0;
> +	}
> +}
> +
>   u64 perf_reg_value(struct pt_regs *regs, int idx)
>   {
> -	if (WARN_ON_ONCE(idx >= PERF_REG_POWERPC_MAX))
> -		return 0;
> +	u64 perf_reg_extended_max = 0;

This should be initialized to PERF_REG_POWERPC_MAX. Default to 0 will always
trigger below WARN_ON_ONCE(idx >= perf_reg_extended_max) on non p9/p10 systems.

> +
> +	if (cpu_has_feature(CPU_FTR_ARCH_300))
> +		perf_reg_extended_max = PERF_REG_MAX_ISA_300;
>   
>   	if (idx == PERF_REG_POWERPC_SIER &&
>   	   (IS_ENABLED(CONFIG_FSL_EMB_PERF_EVENT) ||
> @@ -85,6 +103,16 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
>   	    IS_ENABLED(CONFIG_PPC32)))
>   		return 0;
>   
> +	if (idx >= PERF_REG_POWERPC_MAX && idx < perf_reg_extended_max)
> +		return get_ext_regs_value(idx);
> +
> +	/*
> +	 * If the idx is referring to value beyond the
> +	 * supported registers, return 0 with a warning
> +	 */
> +	if (WARN_ON_ONCE(idx >= perf_reg_extended_max))
> +		return 0;
> +
>   	return regs_get_register(regs, pt_regs_offset[idx]);
>   }

Ravi
