Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 994314E753
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 13:49:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VcRP5cQKzDqdr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 21:49:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VcPT3M7jzDqRn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 21:47:41 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LBgBI6125612
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 07:47:37 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t8x9ggwnd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 07:47:36 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Fri, 21 Jun 2019 12:47:35 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Jun 2019 12:47:31 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5LBlTqC45940750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jun 2019 11:47:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89B5FA4060;
 Fri, 21 Jun 2019 11:47:29 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDDFFA4062;
 Fri, 21 Jun 2019 11:47:27 +0000 (GMT)
Received: from in.ibm.com (unknown [9.122.208.229])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 21 Jun 2019 11:47:27 +0000 (GMT)
Date: Fri, 21 Jun 2019 17:17:25 +0530
From: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
To: Santosh Sivaraj <santosh@fossix.org>
Subject: Re: [PATCH 11/13] powerpc/64s: Save r13 in machine_check_common_early
References: <cover.1561020760.git.santosh@fossix.org>
 <d6ae7dd59966ee1c7593b8fd936774c0b13e6dd4.1561020760.git.santosh@fossix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6ae7dd59966ee1c7593b8fd936774c0b13e6dd4.1561020760.git.santosh@fossix.org>
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19062111-0020-0000-0000-0000034C2CAB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062111-0021-0000-0000-0000219F8C72
Message-Id: <20190621114725.xg6cogv4ecejz6pj@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906210100
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
Reply-To: mahesh@linux.vnet.ibm.com
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-06-21 06:27:15 Fri, Santosh Sivaraj wrote:
> From: Reza Arbab <arbab@linux.ibm.com>
> 
> Testing my memcpy_mcsafe() work in progress with an injected UE, I get
> an error like this immediately after the function returns:
> 
> BUG: Unable to handle kernel data access at 0x7fff84dec8f8
> Faulting instruction address: 0xc0080000009c00b0
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
> Modules linked in: mce(O+) vmx_crypto crc32c_vpmsum
> CPU: 0 PID: 1375 Comm: modprobe Tainted: G           O      5.1.0-rc6 #267
> NIP:  c0080000009c00b0 LR: c0080000009c00a8 CTR: c000000000095f90
> REGS: c0000000ee197790 TRAP: 0300   Tainted: G           O       (5.1.0-rc6)
> MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 88002826  XER: 00040000
> CFAR: c000000000095f8c DAR: 00007fff84dec8f8 DSISR: 40000000 IRQMASK: 0
> GPR00: 000000006c6c6568 c0000000ee197a20 c0080000009c8400 fffffffffffffff2
> GPR04: c0080000009c02e0 0000000000000006 0000000000000000 c000000003c834c8
> GPR08: 0080000000000000 776a6681b7fb5100 0000000000000000 c0080000009c01c8
> GPR12: c000000000095f90 00007fff84debc00 000000004d071440 0000000000000000
> GPR16: 0000000100000601 c0080000009e0000 c000000000c98dd8 c000000000c98d98
> GPR20: c000000003bba970 c0080000009c04d0 c0080000009c0618 c0000000001e5820
> GPR24: 0000000000000000 0000000000000100 0000000000000001 c000000003bba958
> GPR28: c0080000009c02e8 c0080000009c0318 c0080000009c02e0 0000000000000000
> NIP [c0080000009c00b0] cause_ue+0xa8/0xe8 [mce]
> LR [c0080000009c00a8] cause_ue+0xa0/0xe8 [mce]
> 
> To fix, ensure that r13 is properly restored after an MCE.
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 311f1392a2ec..932d8d05892c 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -265,6 +265,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
>  EXC_REAL_END(machine_check, 0x200, 0x100)
>  EXC_VIRT_NONE(0x4200, 0x100)
>  TRAMP_REAL_BEGIN(machine_check_common_early)
> +	SET_SCRATCH0(r13)		/* save r13 */
>  	EXCEPTION_PROLOG_1(PACA_EXMC, NOTEST, 0x200)
>  	/*
>  	 * Register contents:

We do save r13 before we call machine_check_common_early(). I don't
think I understood clearly how this change fixes the issue you are
seeing. What am I missing here ?

Above change will push the paca pointer to scratch0 overwriting the
original saved r13.

EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
	/* This is moved out of line as it can be patched by FW, but
	 * some code path might still want to branch into the original
	 * vector
	 */
	SET_SCRATCH0(r13)		/* save r13 */
	EXCEPTION_PROLOG_0(PACA_EXMC)
BEGIN_FTR_SECTION
	b	machine_check_common_early

Thanks,
-Mahesh.

