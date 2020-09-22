Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6CA273B43
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 08:55:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwXBV60BrzDqw9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 16:55:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lCwRDmiq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwX8d2GV2zDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 16:53:50 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08M6gk5K122830; Tue, 22 Sep 2020 02:53:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=e8Me8OpT+IEsVj+/XgqdQfdCCvgyNC8h/sPGAW1su8U=;
 b=lCwRDmiqi2XujNYgiv6fifx148RDE4DvemXwM8dFpsl2hKizJowSeL98jJbiqOPjpOLD
 ZpxydmW9T2tvMz62iyUycRVytsMFqU8OWOxfhRwqigLYm4Ac8zRRTcWLjy2RSaT2+ppV
 ItCuU/zM8Gax8zRSH/G5UdCOGV5pOX06GamPZ2W2Wrs6/WqC3glsnhYRgHpUmoI+kFF/
 0q9EVM4Dgng0nFl6mfJioLdm9O0A3F71PRsPXvPTXK//Zg5Vqt2OSrU7FBXfmV/bBsZn
 BGe+MoLQ4ScKSp6vXwjRNpR2xIHVaEK/72rYxrcyrw3Fvc0R7ZRU2ApdbcFkR2i5w9hf jw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33qc84g878-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 02:53:43 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08M6lmht007718;
 Tue, 22 Sep 2020 06:53:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 33n98gsf0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 06:53:40 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08M6rcas30933352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Sep 2020 06:53:38 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80C7E11C054;
 Tue, 22 Sep 2020 06:53:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC1B011C052;
 Tue, 22 Sep 2020 06:53:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.86.236])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Sep 2020 06:53:37 +0000 (GMT)
Subject: Re: [PATCH V2] powerpc/perf: Exclude pmc5/6 from the irrelevant PMU
 group constraints
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1600672204-1610-1-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <69661e2d-2e81-35f0-604d-905cbbc5f7de@linux.ibm.com>
Date: Tue, 22 Sep 2020 12:23:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600672204-1610-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_05:2020-09-21,
 2020-09-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009220052
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



On 9/21/20 12:40 PM, Athira Rajeev wrote:
> PMU counter support functions enforces event constraints for group of
> events to check if all events in a group can be monitored. Incase of
> event codes using PMC5 and PMC6 ( 500fa and 600f4 respectively ),
> not all constraints are applicable, say the threshold or sample bits.
> But current code includes pmc5 and pmc6 in some group constraints (like
> IC_DC Qualifier bits) which is actually not applicable and hence results
> in those events not getting counted when scheduled along with group of
> other events. Patch fixes this by excluding PMC5/6 from constraints
> which are not relevant for it.

Changes looks fine to me.

Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>

we need to CC this in Stable too.

> Fixes: 7ffd948 ("powerpc/perf: factor out power8 pmu functions")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changes in v2:
> - Added a block comment in the fix path explaining
>    why the change is needed.
>
>   arch/powerpc/perf/isa207-common.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
> index 964437a..12153da 100644
> --- a/arch/powerpc/perf/isa207-common.c
> +++ b/arch/powerpc/perf/isa207-common.c
> @@ -288,6 +288,15 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
>
>   		mask  |= CNST_PMC_MASK(pmc);
>   		value |= CNST_PMC_VAL(pmc);
> +
> +		/*
> +		 * PMC5 and PMC6 are used to count cycles and instructions
> +		 * and these doesnot support most of the constraint bits.
> +		 * Add a check to exclude PMC5/6 from most of the constraints
> +		 * except for ebb/bhrb.
> +		 */
> +		if (pmc >= 5)
> +			goto ebb_bhrb;
>   	}
>
>   	if (pmc <= 4) {
> @@ -357,6 +366,7 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
>   		}
>   	}
>
> +ebb_bhrb:
>   	if (!pmc && ebb)
>   		/* EBB events must specify the PMC */
>   		return -1;

