Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EAC19C6F1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 18:19:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tSvL2NF8zDrC7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 03:19:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tSqW5X1rzDr1Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 03:16:23 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032G4jRk125200
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Apr 2020 12:16:21 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304hjbgyv2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 12:16:21 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Thu, 2 Apr 2020 17:16:00 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 Apr 2020 17:15:58 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 032GGGQv57606340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 16:16:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BB3AA4054;
 Thu,  2 Apr 2020 16:16:16 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A74A7A405B;
 Thu,  2 Apr 2020 16:16:15 +0000 (GMT)
Received: from localhost (unknown [9.85.74.67])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 16:16:15 +0000 (GMT)
Date: Thu, 02 Apr 2020 21:46:12 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v8 2/7] powerpc/kprobes: Mark newly allocated probes as RO
To: linuxppc-dev@lists.ozlabs.org, Russell Currey <ruscur@russell.cc>
References: <20200402084053.188537-1-ruscur@russell.cc>
 <20200402084053.188537-2-ruscur@russell.cc>
In-Reply-To: <20200402084053.188537-2-ruscur@russell.cc>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20040216-0020-0000-0000-000003C05099
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040216-0021-0000-0000-00002218FCDC
Message-Id: <1585844035.o235bvxmq0.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_06:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020131
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
Cc: kernel-hardening@lists.openwall.com, ajd@linux.ibm.com, npiggin@gmail.com,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey wrote:
> With CONFIG_STRICT_KERNEL_RWX=3Dy and CONFIG_KPROBES=3Dy, there will be o=
ne
> W+X page at boot by default.  This can be tested with
> CONFIG_PPC_PTDUMP=3Dy and CONFIG_PPC_DEBUG_WX=3Dy set, and checking the
> kernel log during boot.
>=20
> powerpc doesn't implement its own alloc() for kprobes like other
> architectures do, but we couldn't immediately mark RO anyway since we do
> a memcpy to the page we allocate later.  After that, nothing should be
> allowed to modify the page, and write permissions are removed well
> before the kprobe is armed.
>=20
> The memcpy() would fail if >1 probes were allocated, so use
> patch_instruction() instead which is safe for RO.
>=20
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/kprobes.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.=
c
> index 81efb605113e..fa4502b4de35 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -24,6 +24,8 @@
>  #include <asm/sstep.h>
>  #include <asm/sections.h>
>  #include <linux/uaccess.h>
> +#include <linux/set_memory.h>
> +#include <linux/vmalloc.h>
> =20
>  DEFINE_PER_CPU(struct kprobe *, current_kprobe) =3D NULL;
>  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> @@ -102,6 +104,16 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name=
, unsigned int offset)
>  	return addr;
>  }
> =20
> +void *alloc_insn_page(void)
> +{
> +	void *page =3D vmalloc_exec(PAGE_SIZE);
> +
> +	if (page)
> +		set_memory_ro((unsigned long)page, 1);
> +
> +	return page;
> +}
> +

This crashes for me with KPROBES_SANITY_TEST during the kretprobe test. =20
It seems to be handling the kretprobe itself properly, but seems to=20
crash on the return path. I haven't yet been able to work out what's=20
going wrong.

[    0.517880] Kprobe smoke test: started
[    0.626680] Oops: Exception in kernel mode, sig: 4 [#1]
[    0.626708] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA Power=
NV
[    0.626735] Modules linked in:
[    0.626760] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.6.0-06592-g2e646=
94b9137 #51
[    0.626795] NIP:  c008000000020000 LR: c00000000021ce34 CTR: c0000000002=
1c5f8
[    0.626829] REGS: c0000000fd3e3860 TRAP: 0e40   Not tainted  (5.6.0-0659=
2-g2e64694b9137)
[    0.626862] MSR:  9000000002089433 <SF,HV,VEC,EE,ME,SE,IR,DR,RI,LE>  CR:=
 28000284  XER: 00040000
[    0.626922] CFAR: c00000000000ef20 IRQMASK: 0=20
[    0.626922] GPR00: c000000000052250 c0000000fd3e3af0 c000000002330200 00=
0000002db8ad86=20
[    0.626922] GPR04: 0000000000000000 c00000000006ba3c 0000000000000800 c0=
000000fd3a0000=20
[    0.626922] GPR08: 0000000000000000 ffffffffaaaaaaab c0000000fd3a0000 00=
00000040000000=20
[    0.626922] GPR12: c00000000021c5f0 c000000002520000 c000000000011790 00=
00000000000000=20
[    0.626922] GPR16: 0000000000000000 0000000000000000 0000000000000000 00=
00000000000000=20
[    0.626922] GPR20: 0000000000000000 0000000000000000 0000000000000000 00=
00000000000000=20
[    0.626922] GPR24: c0000000020034bc c0000000012068b8 c000000002062e50 c0=
000000fd2319a0=20
[    0.626922] GPR28: c000000000f5ebb0 0000000000000000 c0000000021bc278 c0=
00000002458540=20
[    0.627234] NIP [c008000000020000] 0xc008000000020000
[    0.627264] LR [c00000000021ce34] init_test_probes+0x424/0x560
[    0.627291] Call Trace:
[    0.627313] [c0000000fd3e3af0] [c00000000021ce34] init_test_probes+0x424=
/0x560 (unreliable)
[    0.627356] [c0000000fd3e3b90] [c00000000202de2c] init_kprobes+0x1a8/0x1=
c8
[    0.627392] [c0000000fd3e3c00] [c000000000011140] do_one_initcall+0x60/0=
x2b0
[    0.627432] [c0000000fd3e3cd0] [c000000002004674] kernel_init_freeable+0=
x2e0/0x3a0
[    0.627471] [c0000000fd3e3db0] [c0000000000117ac] kernel_init+0x24/0x178
[    0.627510] [c0000000fd3e3e20] [c00000000000c7a8] ret_from_kernel_thread=
+0x5c/0x74
[    0.627543] Instruction dump:
[    0.627562] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXX=
XX XXXXXXXX=20
[    0.627607] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX <00000000> 00000000 0000=
0000 00000000=20
[    0.627660] ---[ end trace 964ab92781f5d99d ]---
[    0.629607]=20


- Naveen

