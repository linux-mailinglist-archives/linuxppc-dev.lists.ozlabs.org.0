Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 366F01628FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 15:59:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MPBZ4C9NzDqnp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 01:59:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MP8s608szDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 01:57:33 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01IEvG6K122604
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 09:57:30 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y85f3sdr4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 09:57:26 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 18 Feb 2020 14:55:08 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Feb 2020 14:55:03 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01IEt2DC51249382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 14:55:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91C46A4040;
 Tue, 18 Feb 2020 14:55:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0869A4057;
 Tue, 18 Feb 2020 14:55:01 +0000 (GMT)
Received: from localhost (unknown [9.199.60.10])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Feb 2020 14:55:01 +0000 (GMT)
Date: Tue, 18 Feb 2020 20:25:00 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/kprobes: Fix trap address when trap happened
 in real mode
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Larry Finger <Larry.Finger@lwfinger.net>,
 Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <0cd6647dae57894f77ceb7d5a48d52fac6c10ca5.1582036047.git.christophe.leroy@c-s.fr>
In-Reply-To: <0cd6647dae57894f77ceb7d5a48d52fac6c10ca5.1582036047.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20021814-0008-0000-0000-000003542617
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021814-0009-0000-0000-00004A752FB5
Message-Id: <1582037375.4mkd6m1m5m.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_02:2020-02-17,
 2020-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 spamscore=0 suspectscore=0 mlxlogscore=838
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002180117
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
Cc: stable@kernel.vger.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> When a program check exception happens while MMU translation is
> disabled, following Oops happens in kprobe_handler() in the following
> code:
>=20
> 		} else if (*addr !=3D BREAKPOINT_INSTRUCTION) {
>=20
> [   33.098554] BUG: Unable to handle kernel data access on read at 0x0000=
e268
> [   33.105091] Faulting instruction address: 0xc000ec34
> [   33.110010] Oops: Kernel access of bad area, sig: 11 [#1]
> [   33.115348] BE PAGE_SIZE=3D16K PREEMPT CMPC885
> [   33.119540] Modules linked in:
> [   33.122591] CPU: 0 PID: 429 Comm: cat Not tainted 5.6.0-rc1-s3k-dev-00=
824-g84195dc6c58a #3267
> [   33.131005] NIP:  c000ec34 LR: c000ecd8 CTR: c019cab8
> [   33.136002] REGS: ca4d3b58 TRAP: 0300   Not tainted  (5.6.0-rc1-s3k-de=
v-00824-g84195dc6c58a)
> [   33.144324] MSR:  00001032 <ME,IR,DR,RI>  CR: 2a4d3c52  XER: 00000000
> [   33.150699] DAR: 0000e268 DSISR: c0000000
> [   33.150699] GPR00: c000b09c ca4d3c10 c66d0620 00000000 ca4d3c60 000000=
00 00009032 00000000
> [   33.150699] GPR08: 00020000 00000000 c087de44 c000afe0 c66d0ad0 100d3d=
d6 fffffff3 00000000
> [   33.150699] GPR16: 00000000 00000041 00000000 ca4d3d70 00000000 000000=
00 0000416d 00000000
> [   33.150699] GPR24: 00000004 c53b6128 00000000 0000e268 00000000 c07c00=
00 c07bb6fc ca4d3c60
> [   33.188015] NIP [c000ec34] kprobe_handler+0x128/0x290
> [   33.192989] LR [c000ecd8] kprobe_handler+0x1cc/0x290
> [   33.197854] Call Trace:
> [   33.200340] [ca4d3c30] [c000b09c] program_check_exception+0xbc/0x6fc
> [   33.206590] [ca4d3c50] [c000e43c] ret_from_except_full+0x0/0x4
> [   33.212392] --- interrupt: 700 at 0xe268
> [   33.270401] Instruction dump:
> [   33.273335] 913e0008 81220000 38600001 3929ffff 91220000 80010024 bb41=
0008 7c0803a6
> [   33.280992] 38210020 4e800020 38600000 4e800020 <813b0000> 6d2a7fe0 2f=
8a0008 419e0154
> [   33.288841] ---[ end trace 5b9152d4cdadd06d ]---
>=20
> kprobe is not prepared to handle events in real mode and functions
> running in real mode should have been blacklisted, so kprobe_handler()
> can safely bail out telling 'this trap is not mine' for any trap that
> happened while in real-mode.
>=20
> If the trap happened with MSR_IR cleared, return 0 immediately.
>=20
> Reported-by: Larry Finger <Larry.Finger@lwfinger.net>
> Fixes: 6cc89bad60a6 ("powerpc/kprobes: Invoke handlers directly")
> Cc: stable@vger.kernel.org
> Cc: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>=20
> ---
> v2: bailing out instead of converting real-time address to virtual and co=
ntinuing.
>=20
> The bug might have existed even before that commit from Naveen.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/kprobes.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.=
c
> index 2d27ec4feee4..673f349662e8 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -264,6 +264,9 @@ int kprobe_handler(struct pt_regs *regs)
>  	if (user_mode(regs))
>  		return 0;
>=20
> +	if (!(regs->msr & MSR_IR))
> +		return 0;
> +

Should we also check for MSR_DR? Are there scenarios with ppc32 where=20
MSR_IR is on, but MSR_DR is off?


- Naveen

