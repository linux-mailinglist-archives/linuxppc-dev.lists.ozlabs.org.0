Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5B3428D91
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 15:10:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSfKn3sTDz2yQM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 00:10:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IsIZcsWR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IsIZcsWR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSfK128zgz2yMH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 00:09:40 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BB01J4025744; 
 Mon, 11 Oct 2021 09:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=arQSQCAv8lW3Ss7oeZqk+VMGoUu3E2m5PdKWLOGDHzM=;
 b=IsIZcsWROLdLcdbamY8V6WbsrQnaeOrUone8emnC9lrSApaxN7SRLud1FfoHXyFEGRNT
 K27A9bPxxQj0bqgfC6KA+is0EuKQz0+CtIKnXa/afStTds7gA59KJ27sK2BCmvp2/Xcw
 Y//MMtOKJtkyoKyKz3G0DAWpGmhWb3ZFKhSjFCQeaU29YYcHKhpbcFi68p3l0RzzlYOc
 AzlHvatc9Tm/tQFOxmxsm9U/MRxpSrCMDF2Bc3u4k06MgB0CTfompDWzOf23JRAdnUln
 d8iAWh93PeSEsSL0nZcP/McKdfKObPpVApKTMtX9krZRHOUINqAolFbVhHr8RLkICyh9 1g== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bmhhuxn44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 09:09:32 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19BD2eRO009184;
 Mon, 11 Oct 2021 13:09:30 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3bk2bj4yuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 13:09:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19BD3pUo33817048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 13:03:51 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66FF4A4066;
 Mon, 11 Oct 2021 13:09:24 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91B02A4068;
 Mon, 11 Oct 2021 13:09:20 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com (unknown
 [9.43.84.42])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Oct 2021 13:09:20 +0000 (GMT)
Subject: Re: [V3 0/4] powerpc/perf: Add instruction and data address registers
 to extended regs
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au,
 acme@kernel.org, jolsa@kernel.org
References: <20211007065505.27809-1-atrajeev@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <f9064648-adba-92f9-08bc-52ad179de357@linux.ibm.com>
Date: Mon, 11 Oct 2021 18:39:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211007065505.27809-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C8sN5U5SPyOcG0hmXEEgorvk7aX3ejpY
X-Proofpoint-GUID: C8sN5U5SPyOcG0hmXEEgorvk7aX3ejpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_04,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 malwarescore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110076
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/7/21 12:25 PM, Athira Rajeev wrote:
> Patch set adds PMU registers namely Sampled Instruction Address Register
> (SIAR) and Sampled Data Address Register (SDAR) as part of extended regs
> in PowerPC. These registers provides the instruction/data address and
> adding these to extended regs helps in debug purposes.
> 
> Patch 1/4 and 2/4 refactors the existing macro definition of
> PERF_REG_PMU_MASK_300 and PERF_REG_PMU_MASK_31 to make it more
> readable.
> Patch 3/4 adds SIAR and SDAR as part of the extended regs mask.
> Patch 4/4 includes perf tools side changes to add the SPRs to
> sample_reg_mask to use with -I? option.
> 
> Changelog:
> Change from v2 -> v3:
> Addressed review comments from Michael Ellerman
> - Fixed the macro definition to use "unsigned long long"
>   which otherwise will cause build error with perf on
>   32-bit.
> - Added Reviewed-by from Daniel Axtens for patch3.
> 
> Change from v1 -> v2:
> Addressed review comments from Michael Ellerman
> - Refactored the perf reg extended mask value macros for
>   PERF_REG_PMU_MASK_300 and PERF_REG_PMU_MASK_31 to
>   make it more readable. Also moved PERF_REG_EXTENDED_MAX
>   along with enum definition similar to PERF_REG_POWERPC_MAX.
> 
> Athira Rajeev (4):
>   powerpc/perf: Refactor the code definition of perf reg extended mask
>   tools/perf: Refactor the code definition of perf reg extended mask in
>     tools side header file
>   powerpc/perf: Expose instruction and data address registers as part of
>     extended regs
>   tools/perf: Add perf tools support to expose instruction and data
>     address registers as part of extended regs

Patch-set looks good to me.

Reviewed-by: Kajol Jain<kjain@linux.ibm.com>

Thanks,
Kajol Jain
> 
>  arch/powerpc/include/uapi/asm/perf_regs.h     | 28 ++++++++++++-------
>  arch/powerpc/perf/perf_regs.c                 |  4 +++
>  .../arch/powerpc/include/uapi/asm/perf_regs.h | 28 ++++++++++++-------
>  tools/perf/arch/powerpc/include/perf_regs.h   |  2 ++
>  tools/perf/arch/powerpc/util/perf_regs.c      |  2 ++
>  5 files changed, 44 insertions(+), 20 deletions(-)
> 
