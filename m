Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 976081E783C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 10:26:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YHj932GZzDqfL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 18:26:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YHfv4WSwzDqdv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 18:24:39 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04T84KsN107430; Fri, 29 May 2020 04:24:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31as1araqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 04:24:31 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04T85Zec114965;
 Fri, 29 May 2020 04:24:30 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31as1arap0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 04:24:30 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04T8L13i004840;
 Fri, 29 May 2020 08:24:27 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 316uf84nt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 08:24:27 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04T8OPKL60686780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 May 2020 08:24:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C561AE051;
 Fri, 29 May 2020 08:24:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 006F0AE057;
 Fri, 29 May 2020 08:24:25 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 May 2020 08:24:24 +0000 (GMT)
Received: from [9.81.219.74] (unknown [9.81.219.74])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B5AB7A064A;
 Fri, 29 May 2020 18:24:23 +1000 (AEST)
Subject: Re: [PATCH] powerpc/64/syscall: Disable sanitisers for C syscall
 entry/exit code
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com
References: <20200529061446.2773-1-dja@axtens.net>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <2fc6270d-9c63-32ab-8d32-66875f8e5d4f@linux.ibm.com>
Date: Fri, 29 May 2020 18:24:22 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200529061446.2773-1-dja@axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_02:2020-05-28,
 2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1011
 impostorscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005290064
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29/5/20 4:14 pm, Daniel Axtens wrote:
> syzkaller is picking up a bunch of crashes that look like this:
> 
> Unrecoverable exception 380 at c00000000037ed60 (msr=8000000000001031)
> Oops: Unrecoverable exception, sig: 6 [#1]
> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in:
> CPU: 0 PID: 874 Comm: syz-executor.0 Not tainted 5.7.0-rc7-syzkaller-00016-gb0c3ba31be3e #0
> NIP:  c00000000037ed60 LR: c00000000004bac8 CTR: c000000000030990
> REGS: c0000000555a7230 TRAP: 0380   Not tainted  (5.7.0-rc7-syzkaller-00016-gb0c3ba31be3e)
> MSR:  8000000000001031 <SF,ME,IR,DR,LE>  CR: 48222882  XER: 20000000
> CFAR: c00000000004bac4 IRQMASK: 0
> GPR00: c00000000004bb68 c0000000555a74c0 c0000000024b3500 0000000000000005
> GPR04: 0000000000000000 0000000000000000 c00000000004bb88 c008000000910000
> GPR08: 00000000000b0000 c00000000004bac8 0000000000016000 c000000002503500
> GPR12: c000000000030990 c000000003190000 00000000106a5898 00000000106a0000
> GPR16: 00000000106a5890 c000000007a92000 c000000008180e00 c000000007a8f700
> GPR20: c000000007a904b0 0000000010110000 c00000000259d318 5deadbeef0000100
> GPR24: 5deadbeef0000122 c000000078422700 c000000009ee88b8 c000000078422778
> GPR28: 0000000000000001 800000000280b033 0000000000000000 c0000000555a75a0
> NIP [c00000000037ed60] __sanitizer_cov_trace_pc+0x40/0x50
> LR [c00000000004bac8] interrupt_exit_kernel_prepare+0x118/0x310
> Call Trace:
> [c0000000555a74c0] [c00000000004bb68] interrupt_exit_kernel_prepare+0x1b8/0x310 (unreliable)
> [c0000000555a7530] [c00000000000f9a8] interrupt_return+0x118/0x1c0
> --- interrupt: 900 at __sanitizer_cov_trace_pc+0x0/0x50
> ...<random previous call chain>...
> 
> That looks like the KCOV helper accessing memory that's not safe to
> access in the interrupt handling context.
> 
> Do not instrument the new syscall entry/exit code with KCOV, GCOV or
> UBSAN.
> 
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Fixes: 68b34588e202 ("powerpc/64/sycall: Implement syscall entry/exit logic in C")
> Signed-off-by: Daniel Axtens <dja@axtens.net>

This seems reasonable - I've verified that this does indeed suppress the 
kcov trace calls.

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

(does this need to be tagged for stable? the Fixes: commit is in 5.6 but 
we're at 5.7-rc7 at this point...)

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
