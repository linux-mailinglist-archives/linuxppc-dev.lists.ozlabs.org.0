Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 447FB231C8F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 12:15:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGqDg0ZZJzDqsl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 20:15:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGqBw0lnHzDqrj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 20:13:59 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TA302a142797; Wed, 29 Jul 2020 06:13:52 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jy8vmhvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 06:13:52 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06TA9qXG024752;
 Wed, 29 Jul 2020 10:13:50 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 32gcpx4x8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 10:13:50 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06TADm1C56819864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 10:13:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A21D11C054;
 Wed, 29 Jul 2020 10:13:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11EC811C05B;
 Wed, 29 Jul 2020 10:13:47 +0000 (GMT)
Received: from [9.199.51.42] (unknown [9.199.51.42])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jul 2020 10:13:46 +0000 (GMT)
Subject: Re: [PATCH] powerpc: Fix MMCRA_BHRB_DISABLE define to work with
 binutils version < 2.28
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1595996214-5833-1-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <c0222a2d-de0f-49a3-5bd5-4e6feff8021a@linux.ibm.com>
Date: Wed, 29 Jul 2020 15:43:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1595996214-5833-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_04:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxlogscore=922
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007290068
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



On 7/29/20 9:46 AM, Athira Rajeev wrote:
> commit 9908c826d5ed ("powerpc/perf: Add Power10 PMU feature to
> DT CPU features") defines MMCRA_BHRB_DISABLE as `0x2000000000UL`.
> Binutils version less than 2.28 doesn't support UL suffix.
>
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S: Assembler messages:
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: junk at end of line, first unrecognized character is `L'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: junk at end of line, first unrecognized character is `L'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: operand out of range (0x0000002000000000 is not between 0xffffffffffff8000 and 0x000000000000ffff)
>
> Fix this by wrapping it around `_UL` macro.
Looks fine to me.

Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>


>
> Fixes: 9908c826d5ed ("Add Power10 PMU feature to DT CPU features")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   arch/powerpc/include/asm/reg.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index ae71027..41419f1 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -12,6 +12,7 @@
>   #ifdef __KERNEL__
>
>   #include <linux/stringify.h>
> +#include <linux/const.h>
>   #include <asm/cputable.h>
>   #include <asm/asm-const.h>
>   #include <asm/feature-fixups.h>
> @@ -888,7 +889,7 @@
>   #define   MMCRA_SLOT	0x07000000UL /* SLOT bits (37-39) */
>   #define   MMCRA_SLOT_SHIFT	24
>   #define   MMCRA_SAMPLE_ENABLE 0x00000001UL /* enable sampling */
> -#define   MMCRA_BHRB_DISABLE  0x2000000000UL // BHRB disable bit for ISA v3.1
> +#define   MMCRA_BHRB_DISABLE  _UL(0x2000000000) // BHRB disable bit for ISA v3.1
>   #define   POWER6_MMCRA_SDSYNC 0x0000080000000000ULL	/* SDAR/SIAR synced */
>   #define   POWER6_MMCRA_SIHV   0x0000040000000000ULL
>   #define   POWER6_MMCRA_SIPR   0x0000020000000000ULL

