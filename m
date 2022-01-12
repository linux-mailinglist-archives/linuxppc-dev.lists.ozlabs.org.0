Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49F48BE63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 06:37:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYbtS0tW1z30Pf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 16:37:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rh3lJZm/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rh3lJZm/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYbsd2CC9z2xtF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 16:36:52 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20C2Xuxe018689
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 05:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=MdpRP3fSTfCR0eCs0k5aV7mHhsMDgPM7cTdK/xh1wt0=;
 b=rh3lJZm/+KyFaOBo1GxM+Yg3KrqcPUz9mryFqpYNcjqp14F1YKX5weKNoPocZNPihMzz
 YkrNN/7YxHN1J3K03k4Ef9xsCv1MRk1nUwSV6WMhgCpCHmL4KMO48Be4GfwRkc9znw5N
 H/79EnuLLSz+J/Z/ekFymWc3VNXeMYpMubjMEJ8DLwz0QXItOZn+zbST01RbhNYBUeE8
 NNIqdWRB0SBTUDf9rD5Otkd4Xlg4Iqo1/a6SALLt0yyZuttzJjzbTu/zkj3QS5zo9vwx
 fjjYEbhbFrQlMZT7jg/XBb7jv5qjhYZ01S1790eABJm9lKATpTiQEp6oP7DnRYYZQRbv oA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhf6nt8y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 05:36:48 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20C5Xvl1029392
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 05:36:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3df289nn6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 05:36:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20C5ah9J44696018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 05:36:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21BAAA4054;
 Wed, 12 Jan 2022 05:36:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5687CA4062;
 Wed, 12 Jan 2022 05:36:40 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.211.97.247])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 12 Jan 2022 05:36:39 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [powerpc/merge] PMU: Kernel warning while running pmu/ebb
 selftests
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <0A534F83-D1CB-4DF2-907C-FCCAA65EBA35@linux.ibm.com>
Date: Wed, 12 Jan 2022 11:06:33 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <14F95BC2-208C-4936-8809-19B01321B170@linux.vnet.ibm.com>
References: <4645BEDB-75D8-4178-A5AE-C2AE8693BE96@linux.vnet.ibm.com>
 <0A534F83-D1CB-4DF2-907C-FCCAA65EBA35@linux.ibm.com>
To: Sachin Sant <sachinp@linux.ibm.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Cw2652OKnoK1cakP9lIHPkDMscEEoxUf
X-Proofpoint-ORIG-GUID: Cw2652OKnoK1cakP9lIHPkDMscEEoxUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_02,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120028
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 11-Jan-2022, at 2:25 PM, Sachin Sant <sachinp@linux.ibm.com> wrote:
>=20
>=20
>=20
>> On 18-Dec-2021, at 3:38 PM, Sachin Sant <sachinp@linux.vnet.ibm.com> =
wrote:
>>=20
>> While running kernel selftests (lost_exception_test) against latest
>> powerpc merge/next branch code (5.16.0-rc5-03218-g798527287598)
>> following warning is seen:
>>=20
> Ping. I continue to see this problem.
>=20

Hi Sachin,

Thanks for reporting this. I could recreate the warning in my =
environment too and have a patch to fix the same.I will post this in =
mailing list.
Can you please test with this patch  ?

=46rom 509840c661c87c467ba2dc2fdb895f5e8dc5018e Mon Sep 17 00:00:00 2001
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Date: Wed, 12 Jan 2022 08:34:40 +0530
Subject: [PATCH] powerpc/perf: Fix power_pmu_disable to call
 clear_pmi_irq_pending only if PMI is pending

Running selftest with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG enabled in kernel
triggered below warning:

[  172.851380] ------------[ cut here ]------------
[  172.851391] WARNING: CPU: 8 PID: 2901 at =
arch/powerpc/include/asm/hw_irq.h:246 power_pmu_disable+0x270/0x280
[  172.851402] Modules linked in: dm_mod bonding nft_ct nf_conntrack =
nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables rfkill nfnetlink sunrpc =
xfs libcrc32c pseries_rng xts vmx_crypto uio_pdrv_genirq uio =
sch_fq_codel ip_tables ext4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi =
ibmveth scsi_transport_srp fuse
[  172.851442] CPU: 8 PID: 2901 Comm: lost_exception_ Not tainted =
5.16.0-rc5-03218-g798527287598 #2
[  172.851451] NIP:  c00000000013d600 LR: c00000000013d5a4 CTR: =
c00000000013b180
[  172.851458] REGS: c000000017687860 TRAP: 0700   Not tainted  =
(5.16.0-rc5-03218-g798527287598)
[  172.851465] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
48004884  XER: 20040000
[  172.851482] CFAR: c00000000013d5b4 IRQMASK: 1
[  172.851482] GPR00: c00000000013d5a4 c000000017687b00 c000000002a10600 =
0000000000000004
[  172.851482] GPR04: 0000000082004000 c0000008ba08f0a8 0000000000000000 =
00000008b7ed0000
[  172.851482] GPR08: 00000000446194f6 0000000000008000 c00000000013b118 =
c000000000d58e68
[  172.851482] GPR12: c00000000013d390 c00000001ec54a80 0000000000000000 =
0000000000000000
[  172.851482] GPR16: 0000000000000000 0000000000000000 c000000015d5c708 =
c0000000025396d0
[  172.851482] GPR20: 0000000000000000 0000000000000000 c00000000a3bbf40 =
0000000000000003
[  172.851482] GPR24: 0000000000000000 c0000008ba097400 c0000000161e0d00 =
c00000000a3bb600
[  172.851482] GPR28: c000000015d5c700 0000000000000001 0000000082384090 =
c0000008ba0020d8
[  172.851549] NIP [c00000000013d600] power_pmu_disable+0x270/0x280
[  172.851557] LR [c00000000013d5a4] power_pmu_disable+0x214/0x280
[  172.851565] Call Trace:
[  172.851568] [c000000017687b00] [c00000000013d5a4] =
power_pmu_disable+0x214/0x280 (unreliable)
[  172.851579] [c000000017687b40] [c0000000003403ac] =
perf_pmu_disable+0x4c/0x60
[  172.851588] [c000000017687b60] [c0000000003445e4] =
__perf_event_task_sched_out+0x1d4/0x660
[  172.851596] [c000000017687c50] [c000000000d1175c] =
__schedule+0xbcc/0x12a0
[  172.851602] [c000000017687d60] [c000000000d11ea8] schedule+0x78/0x140
[  172.851608] [c000000017687d90] [c0000000001a8080] =
sys_sched_yield+0x20/0x40
[  172.851615] [c000000017687db0] [c0000000000334dc] =
system_call_exception+0x18c/0x380
[  172.851622] [c000000017687e10] [c00000000000c74c] =
system_call_common+0xec/0x268

The warning indicates that MSR_EE being set(interrupt enabled) when
there was an overflown PMC detected. This could happen in
power_pmu_disable since it runs under interrupt soft disable
condition ( local_irq_save ) and not with interrupts hard disabled.
commit 2c9ac51b850d ("powerpc/perf: Fix PMU callbacks to clear
pending PMI before resetting an overflown PMC") intended to clear
PMI pending bit in Paca when disabling the PMU. It could happen
that PMC gets overflown while code is in power_pmu_disable
callback function. Hence add a check to see if PMI pending bit
is set in Paca before clearing it via clear_pmi_pending.

Fixes: 2c9ac51b850d ("powerpc/perf: Fix PMU callbacks to clear pending =
PMI before resetting an overflown PMC")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
---
 arch/powerpc/perf/core-book3s.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
index a684901b6965..dfb0ea0f0df3 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1327,9 +1327,10 @@ static void power_pmu_disable(struct pmu *pmu)
 		 * Otherwise provide a warning if there is PMI pending, =
but
 		 * no counter is found overflown.
 		 */
-		if (any_pmc_overflown(cpuhw))
-			clear_pmi_irq_pending();
-		else
+		if (any_pmc_overflown(cpuhw)) {
+			if (pmi_irq_pending())
+				clear_pmi_irq_pending();
+		} else
 			WARN_ON(pmi_irq_pending());
=20
 		val =3D mmcra =3D cpuhw->mmcr.mmcra;
--=20
2.33.0
=20

Thanks
Athira=20
>> [  172.851380] ------------[ cut here ]------------
>> [  172.851391] WARNING: CPU: 8 PID: 2901 at =
arch/powerpc/include/asm/hw_irq.h:246 power_pmu_disable+0x270/0x280
>> [  172.851402] Modules linked in: dm_mod bonding nft_ct nf_conntrack =
nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables rfkill nfnetlink sunrpc =
xfs libcrc32c pseries_rng xts vmx_crypto uio_pdrv_genirq uio =
sch_fq_codel ip_tables ext4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi =
ibmveth scsi_transport_srp fuse
>> [  172.851442] CPU: 8 PID: 2901 Comm: lost_exception_ Not tainted =
5.16.0-rc5-03218-g798527287598 #2
>> [  172.851451] NIP:  c00000000013d600 LR: c00000000013d5a4 CTR: =
c00000000013b180
>> [  172.851458] REGS: c000000017687860 TRAP: 0700   Not tainted  =
(5.16.0-rc5-03218-g798527287598)
>> [  172.851465] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
48004884  XER: 20040000
>> [  172.851482] CFAR: c00000000013d5b4 IRQMASK: 1=20
>> [  172.851482] GPR00: c00000000013d5a4 c000000017687b00 =
c000000002a10600 0000000000000004=20
>> [  172.851482] GPR04: 0000000082004000 c0000008ba08f0a8 =
0000000000000000 00000008b7ed0000=20
>> [  172.851482] GPR08: 00000000446194f6 0000000000008000 =
c00000000013b118 c000000000d58e68=20
>> [  172.851482] GPR12: c00000000013d390 c00000001ec54a80 =
0000000000000000 0000000000000000=20
>> [  172.851482] GPR16: 0000000000000000 0000000000000000 =
c000000015d5c708 c0000000025396d0=20
>> [  172.851482] GPR20: 0000000000000000 0000000000000000 =
c00000000a3bbf40 0000000000000003=20
>> [  172.851482] GPR24: 0000000000000000 c0000008ba097400 =
c0000000161e0d00 c00000000a3bb600=20
>> [  172.851482] GPR28: c000000015d5c700 0000000000000001 =
0000000082384090 c0000008ba0020d8=20
>> [  172.851549] NIP [c00000000013d600] power_pmu_disable+0x270/0x280
>> [  172.851557] LR [c00000000013d5a4] power_pmu_disable+0x214/0x280
>> [  172.851565] Call Trace:
>> [  172.851568] [c000000017687b00] [c00000000013d5a4] =
power_pmu_disable+0x214/0x280 (unreliable)
>> [  172.851579] [c000000017687b40] [c0000000003403ac] =
perf_pmu_disable+0x4c/0x60
>> [  172.851588] [c000000017687b60] [c0000000003445e4] =
__perf_event_task_sched_out+0x1d4/0x660
>> [  172.851596] [c000000017687c50] [c000000000d1175c] =
__schedule+0xbcc/0x12a0
>> [  172.851602] [c000000017687d60] [c000000000d11ea8] =
schedule+0x78/0x140
>> [  172.851608] [c000000017687d90] [c0000000001a8080] =
sys_sched_yield+0x20/0x40
>> [  172.851615] [c000000017687db0] [c0000000000334dc] =
system_call_exception+0x18c/0x380
>> [  172.851622] [c000000017687e10] [c00000000000c74c] =
system_call_common+0xec/0x268
>> [  172.851629] --- interrupt: c00 at 0x7fffa9d0d2fc
>> [  172.851633] NIP:  00007fffa9d0d2fc LR: 0000000010001914 CTR: =
0000000000000000
>> [  172.851638] REGS: c000000017687e80 TRAP: 0c00   Not tainted  =
(5.16.0-rc5-03218-g798527287598)
>> [  172.851643] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28000288  XER: 00000000
>> [  172.851657] IRQMASK: 0=20
>> [  172.851657] GPR00: 000000000000009e 00007fffe44c0b40 =
00007fffa9e07300 0000000000000000=20
>> [  172.851657] GPR04: 00007fffe44c0c28 0000000000000018 =
000000000000000a 0000000000000008=20
>> [  172.851657] GPR08: 0000000000000007 0000000000000000 =
0000000000000000 0000000000000000=20
>> [  172.851657] GPR12: 0000000000000000 00007fffa9eaa270 =
0000000000000000 0000000000000000=20
>> [  172.851657] GPR16: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000=20
>> [  172.851657] GPR20: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000=20
>> [  172.851657] GPR24: 0000000000000190 0000000000000000 =
00000000000186a0 00000000000f423f=20
>> [  172.851657] GPR28: 0000000010021650 0000000000000198 =
0000000010020238 000000000000d446=20
>> [  172.851711] NIP [00007fffa9d0d2fc] 0x7fffa9d0d2fc
>> [  172.851715] LR [0000000010001914] 0x10001914
>> [  172.851719] --- interrupt: c00
>> [  172.851722] Instruction dump:
>> [  172.851725] 71490001 81280078 552905ac 79290020 2fa90000 4182fe9c =
4bffff88 60000000=20
>> [  172.851735] 4bee4729 60000000 9bdf0014 4bfffe00 <0fe00000> =
60000000 60000000 60000000=20
>> [  172.851745] ---[ end trace 10a1b687c9c436f7 ]=E2=80=94
>>=20
>> CONFIG_PPC_IRQ_SOFT_MASK_DEBUG is enabled for this kernel.
>>=20
>> The code in question was last changed by following commit:
>>=20
>> commit 2c9ac51b850d=20
>> powerpc/perf: Fix PMU callbacks to clear pending PMI before resetting =
an overflown PMC
>>=20
>> Reverting this commit helps.
>>=20
>> Thanks
>> -Sachin
>=20

