Return-Path: <linuxppc-dev+bounces-7964-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F4AA9B501
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 19:11:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zk2YC48Mgz3bnL;
	Fri, 25 Apr 2025 03:10:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745514638;
	cv=none; b=ngZesEB8PKY9YWvY0adxrDvPJlySNkW4CtcvFDg17WTLUy62JuOafUuXSBeNHTtEsreEKbdeKvNWEAuTUfOcNBLl3a3/r+NQhYYn+QXdsQ4vVF/mEOPWJTjCXKw4mmIIVZ7OnS2shB09gUq5znaz3nJIw6LbpxAlFMWJbG/pHeoLSxqqFBYNidaR75DPb2wn0Z9zj4RdNeRYpO5qvHcVYtyQ19amsHNNyAos6OAH1AhFW8psGM9OgVgyJg1KahYN4XRbuC4YH4K1qsbaBgHMHSBLHck/TUN4NxHj1ipxq4EEUF0i3MQVKpaNCKRcnQ/GTegGPPaCp4lbgXNg87Pb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745514638; c=relaxed/relaxed;
	bh=+ccnUv06O5qK+wZzwIVU2JLwrxodc3+PuvFG1IojwTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTdihyUuGCaKrKx4ySjW3d7uSpKqU0OY94blJo8RtqwmO9jQhC/nBr0EvTujWWb3oZtQ/nlAhNt5vUCYtmVxArKdFw6+yidpalbWEqWkgTegS6uZsYA05/atuWa8axQut6Y40uWyn2R/UXnJktvwWU6m7aaOheDh4q/ERhuT93/k8Egpomo8PwndEjZGtf58Eg8ZYi4YuKbtl+l8vGWmBdUsjjCbgm6MMq2ARvQUk8bXn+7qa7vpGMryy5A7GioUHqXPba4+iCCuExZMzANJGCtE1pUmvzH0S90gmnD4Vziz23DuRCpInugaq9pIgmcIJy5gm6/HszVdESMtRbFzoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qKMF8m0q; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qKMF8m0q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zk2Y83KMRz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 03:10:35 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9v66e010688;
	Thu, 24 Apr 2025 17:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+ccnUv
	06O5qK+wZzwIVU2JLwrxodc3+PuvFG1IojwTw=; b=qKMF8m0qvAH/mzyQ524Sxq
	X3zvqXaHi1/uN+uJQNEwcpM1wvVWJjIgYTtW6Ngu0Q0GY/07o3QZyJi/PyKrFZ6t
	r2dDWfORvPtLfUCkXrgRXJzeVsPyUWlKo7DfZaly8dFS+0aQrSbTxTnerwY/cBrT
	2P5CbI7bR+BN8/zDJBSyY5q8OjpxkC+Pexkg/0gHNsbQDi/kuIuBaau9INLr0fad
	RsvwyUmw5o61BxRKyX1ETVnvWvkCemEbTekXCh64MY0iksFo5JT49yTuLlgl+Lfu
	3SA0qai/gWp5t36prYebCxaSCGQ44G4P1u/jQhX4yumg50snUH1MOzHEzJm5nv5A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4677sm54dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 17:10:09 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53OGp0VY025563;
	Thu, 24 Apr 2025 17:10:09 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4677sm54dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 17:10:09 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53OFkTdj028407;
	Thu, 24 Apr 2025 17:10:07 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfvs6j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 17:10:07 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53OHA4VO65732900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 17:10:04 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DF1F58069;
	Thu, 24 Apr 2025 17:10:04 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 76D895805A;
	Thu, 24 Apr 2025 17:09:58 +0000 (GMT)
Received: from [9.61.255.202] (unknown [9.61.255.202])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Apr 2025 17:09:58 +0000 (GMT)
Message-ID: <16bee348-2b41-4337-85c8-8a6d2719e99b@linux.ibm.com>
Date: Thu, 24 Apr 2025 22:39:56 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf build: Add tools/arch/x86/include/asm/amd/ibs.h to
 sync the headers
To: Athira Rajeev <atrajeev@linux.ibm.com>, acme@kernel.org, jolsa@kernel.org,
        adrian.hunter@intel.com, irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        jiang.peng9@zte.com.cn, Tejas.Manhas1@ibm.com, sshegde@linux.ibm.com,
        sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, mingo@redhat.com,
        ravi.bangoria@amd.com, bp@alien8.de
References: <20250424163033.6601-1-atrajeev@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250424163033.6601-1-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDExOCBTYWx0ZWRfX1W3ezGWNI+5X tRD7VZfUJdKEy955W2SDP1pFuRkMagc2h1WS4+EOKbLCxQm16tlcxe03k+7ewMLl8zk+ttwxB8d hjjUEP3GkpR5xJ/ksG0JsUUbIP3RH7KSDk61Fq56h98niVMnk3fd2WtSSeM5pLKJ7fWCEQ9bEW2
 QedKOqMwEtO6lUYMpMXmHo3HSE/IPGLcAY6kduBq5/LsaESR6ISDMNvnQuX/qs+pmb6WZ1K/I/j 09T/Egyx0U6qfnweehWs3PCempvQIMffzASIec1A4YzrJaOdOEjyryTZaKjqRAHAB27b+dBEXuJ I6SaULLBQ3H7CItw2bekUBOj2wA0+QVHCyMR+VaWp1oSDMInQ6d9Q+86oACxI82Q3oXCl9F9v1b
 c75DH8HJnrSLM25GyUYAA7tbbF0VF6BZeDX7sLKZJV/jCovck6VakGopIAnQPclPYe6+jNdH
X-Proofpoint-GUID: ab4ubInCN8YQE6ESl2-ELeaUBy95GIbW
X-Proofpoint-ORIG-GUID: W2O773Nlm7aOPqK_BCZh1Ae7fttbgPCz
X-Authority-Analysis: v=2.4 cv=CcMI5Krl c=1 sm=1 tr=0 ts=680a7071 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=rOUgymgbAAAA:8 a=VnNF1IyMAAAA:8 a=a7G4Gb3wKFATOBt86dsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240118
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 24/04/25 10:00 pm, Athira Rajeev wrote:
> Headers sync up update for the patch that adds the original
> copy of the IBS header file in arch/x86/include/asm/amd/ibs.h
>
> Without this, perf shows build warning:
>
>   # make
>    BUILD:   Doing 'make -j24' parallel build
> diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory
> Warning: Kernel ABI header differences:
>    diff -u tools/include/uapi/linux/bits.h include/uapi/linux/bits.h
>    diff -u tools/include/linux/bits.h include/linux/bits.h
>    diff -u tools/include/vdso/unaligned.h include/vdso/unaligned.h
>    diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
>    diff -u tools/arch/x86/include/asm/msr-index.h arch/x86/include/asm/msr-index.h
>    diff -u tools/arch/x86/include/asm/amd/ibs.h arch/x86/include/asm/amd/ibs.h
>    diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/cputype.h
>
> Add tools/arch/x86/include/asm/amd directory and also file
> tools/arch/x86/include/asm/amd/ibs.h to sync up the kernel headers
> with perf tools and fix the warning:
>
> diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory
>
> Apart from the warning, the perf build also fails as below on powerpc:
>
>    In file included from util/amd-sample-raw.c:12:0:
>    /root/bug/tip/tools/include/../../arch/x86/include/asm/amd/ibs.h:10:10: fatal error: asm/msr-index.h: No such file or directory
>     #include <asm/msr-index.h>
>              ^~~~~~~~~~~~~~~~~
>    compilation terminated.
>
> To fix this, added this change:
>
>    -#include <asm/msr-index.h>
>    +#include "../msr-index.h"
>
> And change the check-headers.sh entry to ignore this line when
> comparing with the original kernel header.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
>   tools/arch/x86/include/asm/amd/ibs.h | 158 +++++++++++++++++++++++++++
>   tools/perf/check-headers.sh          |   2 +-
>   2 files changed, 159 insertions(+), 1 deletion(-)
>   create mode 100644 tools/arch/x86/include/asm/amd/ibs.h
>
> diff --git a/tools/arch/x86/include/asm/amd/ibs.h b/tools/arch/x86/include/asm/amd/ibs.h
> new file mode 100644
> index 000000000000..cbce54fec7b9
> --- /dev/null
> +++ b/tools/arch/x86/include/asm/amd/ibs.h
> @@ -0,0 +1,158 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_X86_AMD_IBS_H
> +#define _ASM_X86_AMD_IBS_H
> +
> +/*
> + * From PPR Vol 1 for AMD Family 19h Model 01h B1
> + * 55898 Rev 0.35 - Feb 5, 2021
> + */
> +
> +#include "../msr-index.h"
> +
> +/* IBS_OP_DATA2 DataSrc */
> +#define IBS_DATA_SRC_LOC_CACHE			 2
> +#define IBS_DATA_SRC_DRAM			 3
> +#define IBS_DATA_SRC_REM_CACHE			 4
> +#define IBS_DATA_SRC_IO				 7
> +
> +/* IBS_OP_DATA2 DataSrc Extension */
> +#define IBS_DATA_SRC_EXT_LOC_CACHE		 1
> +#define IBS_DATA_SRC_EXT_NEAR_CCX_CACHE		 2
> +#define IBS_DATA_SRC_EXT_DRAM			 3
> +#define IBS_DATA_SRC_EXT_FAR_CCX_CACHE		 5
> +#define IBS_DATA_SRC_EXT_PMEM			 6
> +#define IBS_DATA_SRC_EXT_IO			 7
> +#define IBS_DATA_SRC_EXT_EXT_MEM		 8
> +#define IBS_DATA_SRC_EXT_PEER_AGENT_MEM		12
> +
> +/*
> + * IBS Hardware MSRs
> + */
> +
> +/* MSR 0xc0011030: IBS Fetch Control */
> +union ibs_fetch_ctl {
> +	__u64 val;
> +	struct {
> +		__u64	fetch_maxcnt:16,/* 0-15: instruction fetch max. count */
> +			fetch_cnt:16,	/* 16-31: instruction fetch count */
> +			fetch_lat:16,	/* 32-47: instruction fetch latency */
> +			fetch_en:1,	/* 48: instruction fetch enable */
> +			fetch_val:1,	/* 49: instruction fetch valid */
> +			fetch_comp:1,	/* 50: instruction fetch complete */
> +			ic_miss:1,	/* 51: i-cache miss */
> +			phy_addr_valid:1,/* 52: physical address valid */
> +			l1tlb_pgsz:2,	/* 53-54: i-cache L1TLB page size
> +					 *	  (needs IbsPhyAddrValid) */
> +			l1tlb_miss:1,	/* 55: i-cache fetch missed in L1TLB */
> +			l2tlb_miss:1,	/* 56: i-cache fetch missed in L2TLB */
> +			rand_en:1,	/* 57: random tagging enable */
> +			fetch_l2_miss:1,/* 58: L2 miss for sampled fetch
> +					 *      (needs IbsFetchComp) */
> +			l3_miss_only:1,	/* 59: Collect L3 miss samples only */
> +			fetch_oc_miss:1,/* 60: Op cache miss for the sampled fetch */
> +			fetch_l3_miss:1,/* 61: L3 cache miss for the sampled fetch */
> +			reserved:2;	/* 62-63: reserved */
> +	};
> +};
> +
> +/* MSR 0xc0011033: IBS Execution Control */
> +union ibs_op_ctl {
> +	__u64 val;
> +	struct {
> +		__u64	opmaxcnt:16,	/* 0-15: periodic op max. count */
> +			l3_miss_only:1,	/* 16: Collect L3 miss samples only */
> +			op_en:1,	/* 17: op sampling enable */
> +			op_val:1,	/* 18: op sample valid */
> +			cnt_ctl:1,	/* 19: periodic op counter control */
> +			opmaxcnt_ext:7,	/* 20-26: upper 7 bits of periodic op maximum count */
> +			reserved0:5,	/* 27-31: reserved */
> +			opcurcnt:27,	/* 32-58: periodic op counter current count */
> +			ldlat_thrsh:4,	/* 59-62: Load Latency threshold */
> +			ldlat_en:1;	/* 63: Load Latency enabled */
> +	};
> +};
> +
> +/* MSR 0xc0011035: IBS Op Data 1 */
> +union ibs_op_data {
> +	__u64 val;
> +	struct {
> +		__u64	comp_to_ret_ctr:16,	/* 0-15: op completion to retire count */
> +			tag_to_ret_ctr:16,	/* 15-31: op tag to retire count */
> +			reserved1:2,		/* 32-33: reserved */
> +			op_return:1,		/* 34: return op */
> +			op_brn_taken:1,		/* 35: taken branch op */
> +			op_brn_misp:1,		/* 36: mispredicted branch op */
> +			op_brn_ret:1,		/* 37: branch op retired */
> +			op_rip_invalid:1,	/* 38: RIP is invalid */
> +			op_brn_fuse:1,		/* 39: fused branch op */
> +			op_microcode:1,		/* 40: microcode op */
> +			reserved2:23;		/* 41-63: reserved */
> +	};
> +};
> +
> +/* MSR 0xc0011036: IBS Op Data 2 */
> +union ibs_op_data2 {
> +	__u64 val;
> +	struct {
> +		__u64	data_src_lo:3,	/* 0-2: data source low */
> +			reserved0:1,	/* 3: reserved */
> +			rmt_node:1,	/* 4: destination node */
> +			cache_hit_st:1,	/* 5: cache hit state */
> +			data_src_hi:2,	/* 6-7: data source high */
> +			reserved1:56;	/* 8-63: reserved */
> +	};
> +};
> +
> +/* MSR 0xc0011037: IBS Op Data 3 */
> +union ibs_op_data3 {
> +	__u64 val;
> +	struct {
> +		__u64	ld_op:1,			/* 0: load op */
> +			st_op:1,			/* 1: store op */
> +			dc_l1tlb_miss:1,		/* 2: data cache L1TLB miss */
> +			dc_l2tlb_miss:1,		/* 3: data cache L2TLB hit in 2M page */
> +			dc_l1tlb_hit_2m:1,		/* 4: data cache L1TLB hit in 2M page */
> +			dc_l1tlb_hit_1g:1,		/* 5: data cache L1TLB hit in 1G page */
> +			dc_l2tlb_hit_2m:1,		/* 6: data cache L2TLB hit in 2M page */
> +			dc_miss:1,			/* 7: data cache miss */
> +			dc_mis_acc:1,			/* 8: misaligned access */
> +			reserved:4,			/* 9-12: reserved */
> +			dc_wc_mem_acc:1,		/* 13: write combining memory access */
> +			dc_uc_mem_acc:1,		/* 14: uncacheable memory access */
> +			dc_locked_op:1,			/* 15: locked operation */
> +			dc_miss_no_mab_alloc:1,		/* 16: DC miss with no MAB allocated */
> +			dc_lin_addr_valid:1,		/* 17: data cache linear address valid */
> +			dc_phy_addr_valid:1,		/* 18: data cache physical address valid */
> +			dc_l2_tlb_hit_1g:1,		/* 19: data cache L2 hit in 1GB page */
> +			l2_miss:1,			/* 20: L2 cache miss */
> +			sw_pf:1,			/* 21: software prefetch */
> +			op_mem_width:4,			/* 22-25: load/store size in bytes */
> +			op_dc_miss_open_mem_reqs:6,	/* 26-31: outstanding mem reqs on DC fill */
> +			dc_miss_lat:16,			/* 32-47: data cache miss latency */
> +			tlb_refill_lat:16;		/* 48-63: L1 TLB refill latency */
> +	};
> +};
> +
> +/* MSR 0xc001103c: IBS Fetch Control Extended */
> +union ic_ibs_extd_ctl {
> +	__u64 val;
> +	struct {
> +		__u64	itlb_refill_lat:16,	/* 0-15: ITLB Refill latency for sampled fetch */
> +			reserved:48;		/* 16-63: reserved */
> +	};
> +};
> +
> +/*
> + * IBS driver related
> + */
> +
> +struct perf_ibs_data {
> +	u32		size;
> +	union {
> +		u32	data[0];	/* data buffer starts here */
> +		u32	caps;
> +	};
> +	u64		regs[MSR_AMD64_IBS_REG_COUNT_MAX];
> +};
> +
> +#endif /* _ASM_X86_AMD_IBS_H */
> diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
> index e9fab20e9330..e1a1fdfa7115 100755
> --- a/tools/perf/check-headers.sh
> +++ b/tools/perf/check-headers.sh
> @@ -186,7 +186,7 @@ done
>   # diff with extra ignore lines
>   check arch/x86/lib/memcpy_64.S        '-I "^EXPORT_SYMBOL" -I "^#include <asm/export.h>" -I"^SYM_FUNC_START\(_LOCAL\)*(memcpy_\(erms\|orig\))" -I"^#include <linux/cfi_types.h>"'
>   check arch/x86/lib/memset_64.S        '-I "^EXPORT_SYMBOL" -I "^#include <asm/export.h>" -I"^SYM_FUNC_START\(_LOCAL\)*(memset_\(erms\|orig\))"'
> -check arch/x86/include/asm/amd/ibs.h  '-I "^#include [<\"]\(asm/\)*msr-index.h"'
> +check arch/x86/include/asm/amd/ibs.h  '-I "^#include <asm/msr-index.h>" -I "^#include \"\.\./msr-index.h\""'
>   check arch/arm64/include/asm/cputype.h '-I "^#include [<\"]\(asm/\)*sysreg.h"'
>   check include/linux/unaligned.h '-I "^#include <linux/unaligned/packed_struct.h>" -I "^#include <asm/byteorder.h>" -I "^#pragma GCC diagnostic"'
>   check include/uapi/asm-generic/mman.h '-I "^#include <\(uapi/\)*asm-generic/mman-common\(-tools\)*.h>"'


Tested this patch by applying on tip HEAD: 
7ab869c799fc0fb22f9b4c2f36aaa603d9c7cc9d and it fixes the reported 
issue. Hence,


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Before Patch:


Below warning is observed at the start of compilation.


diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory


  CC      util/ordered-events.o
   CC      util/namespaces.o
In file included from util/amd-sample-raw.c:12:
/root/tip/tools/include/../../arch/x86/include/asm/amd/ibs.h:10:10: 
fatal error: asm/msr-index.h: No such file or directory
    10 | #include <asm/msr-index.h>
       |          ^~~~~~~~~~~~~~~~~
compilation terminated.
   CC      util/comm.o
make[4]: *** [/root/tip/tools/build/Makefile.build:86: 
util/amd-sample-raw.o] Error 1
make[4]: *** Waiting for unfinished jobs....


After Patch:


Reproted warning is fixed.


   CC      util/bpf-filter-flex.o
   LD      util/perf-util-in.o
   LD      perf-in.o
   LD      perf-util-in.o
   AR      libperf-util.a
   LINK    perf
   GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so

# ./perf version
perf version 6.15.rc3.g477fb4e08521


Regards,

Venkat.


