Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0073AE213
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 06:10:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7bfr578Zz3093
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 14:10:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V5ysQANO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=V5ysQANO; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7bfH20KMz2ykM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 14:10:14 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15L4466s069182; Mon, 21 Jun 2021 00:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=P8EUbYc7C9qkuea8p4If6NhL0zI8PwAfN0hQMdjTCas=;
 b=V5ysQANOyzfd4AfggUHKNTZoQCr4sdZzCsV2Q0iwRFTR+jUfQ04jcy+VZR+xQJpkMzlT
 PFM4oKp5qViXjZmkM49/4uq266f0M4UxkpmT28Xi0mX0oI7hyaouSyf2IMSuMJIl88A8
 RaUAsMC8iEYntU2HP+Kkr1PFy9NtastQ5IUnSCiRCLeouhsZGsUysGiR4qYrDceIvtbs
 7nsdVZ3fWiKQWbLV1sV0ytKysbY/96ljC9zsCobHFAzMvj1Dot0PdKmeXIKXy3ADvU5P
 oLyVuv/hACNby3ugcxRl14+ypgkFWJT/EHyRh5sdpS0pxyq5k5Ah2pm4mCQa7tu8f96R /g== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ajxm0nwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 00:10:03 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15L41IwJ019382;
 Mon, 21 Jun 2021 04:10:01 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3998788n5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 04:10:01 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15L49wHr9044310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 04:09:58 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55D4742045;
 Mon, 21 Jun 2021 04:09:58 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0266B42041;
 Mon, 21 Jun 2021 04:09:57 +0000 (GMT)
Received: from Nageswaras-MacBook-Pro-2.local (unknown [9.199.59.190])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 21 Jun 2021 04:09:56 +0000 (GMT)
Subject: Re: [PATCH 0/2] powerpc/perf: Add instruction and data address
 registers to extended regs
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au,
 acme@kernel.org, jolsa@kernel.org
References: <1624200360-1429-1-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Nageswara Sastry <rnsastry@linux.ibm.com>
Message-ID: <cbc124ff-3415-a3c3-95c4-a4f99152b17f@linux.ibm.com>
Date: Mon, 21 Jun 2021 09:39:55 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624200360-1429-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Zn6UUaZeo9WdggoSFDaOfTMeFtFqvHFn
X-Proofpoint-ORIG-GUID: Zn6UUaZeo9WdggoSFDaOfTMeFtFqvHFn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_01:2021-06-20,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210021
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 20/06/21 8:15 pm, Athira Rajeev wrote:
> Patch set adds PMU registers namely Sampled Instruction Address Register
> (SIAR) and Sampled Data Address Register (SDAR) as part of extended regs
> in PowerPC. These registers provides the instruction/data address and
> adding these to extended regs helps in debug purposes.
> 
> Patch 1/2 adds SIAR and SDAR as part of the extended regs mask.
> Patch 2/2 includes perf tools side changes to add the SPRs to
> sample_reg_mask to use with -I? option.
> 
> Athira Rajeev (2):
>    powerpc/perf: Expose instruction and data address registers as part of
>      extended regs
>    tools/perf: Add perf tools support to expose instruction and data
>      address registers as part of extended regs


Tested with the following scenarios on P9, P10 - PowerVM environment
1. perf record -I? - shows added - sdar, siar
2. perf record -I <workload> and perf report -D - shows added - sdar, 
siar with and with out counts.

Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>


>   arch/powerpc/include/uapi/asm/perf_regs.h       | 12 +++++++-----
>   arch/powerpc/perf/perf_regs.c                   |  4 ++++
>   tools/arch/powerpc/include/uapi/asm/perf_regs.h | 12 +++++++-----
>   tools/perf/arch/powerpc/include/perf_regs.h     |  2 ++
>   tools/perf/arch/powerpc/util/perf_regs.c        |  2 ++
>   5 files changed, 22 insertions(+), 10 deletions(-)
> 

-- 
Thanks and Regards
R.Nageswara Sastry
