Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B73A8F8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 05:41:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4WFZ4FFMz30Dr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 13:41:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BD35edRB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BD35edRB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4WF26hnLz2yYP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 13:41:10 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G3XZ8E019459; Tue, 15 Jun 2021 23:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=o1zEKXQLy3OYmP2lEWvFFsG1imwBIkYiLQXTzEfeWiY=;
 b=BD35edRB+3/ibGiAGOI8w8OOKZG+60uUr0Kz0Eq8PbvB4N4Qom6qn+ZhWO4oCd22LfVq
 0KIuLnBJ2SPci5cA+/oSnrSBogsn00w2Gp0e/55fUjkAD/Zjbgr7U5lB1mUfXdDEfs53
 I0vlK/9WY+8PuYW1TAmtAIlsqqmg/TVpAq/N9WnLwkECUNsZBv5C7WgLMYuc8QZPpe8r
 6UzWLJtqV+MzQvjO3FHH1Cn+RSAS2XdjIXwUCIE/Xv5V1jCQoqyo0pan34HoTrTnbXjk
 9KiHKhfOkuy5iwRzGUna1CUkOr+Jg1+X8HuqIrJSdhNYcvA4P3SMsNm4APc74pYAhPNd Eg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39791u8qdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 23:41:00 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15G3cnR7030394;
 Wed, 16 Jun 2021 03:40:58 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 394mj8su2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 03:40:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15G3diiC37093866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 03:39:44 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30D82AE04D;
 Wed, 16 Jun 2021 03:40:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0568AAE045;
 Wed, 16 Jun 2021 03:40:49 +0000 (GMT)
Received: from [9.79.178.221] (unknown [9.79.178.221])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 16 Jun 2021 03:40:48 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Subject: Re: Oops (NULL pointer) with 'perf record' of selftest 'null_syscall'
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <3388922c-0224-e4aa-f7b7-4fea43e060f9@linux.ibm.com>
Date: Wed, 16 Jun 2021 09:10:45 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <6102EF12-AFB2-48B1-B707-D3F5471EADDB@linux.vnet.ibm.com>
References: <c141a18c-b18d-b775-1848-527c35a1c433@csgroup.eu>
 <3388922c-0224-e4aa-f7b7-4fea43e060f9@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dXQvHlncQONsFzcwCNEl2eZIwJweN6GA
X-Proofpoint-GUID: dXQvHlncQONsFzcwCNEl2eZIwJweN6GA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_09:2021-06-15,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160020
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 16-Jun-2021, at 8:53 AM, Madhavan Srinivasan <maddy@linux.ibm.com> =
wrote:
>=20
>=20
> On 6/15/21 8:35 PM, Christophe Leroy wrote:
>> For your information, I'm getting the following Oops. Detected with =
5.13-rc6, it also oopses on 5.12 and 5.11.
>> Runs ok on 5.10. I'm starting bisecting now.
>=20
>=20
> Thanks for reporting, got the issue. What has happened in this case is =
that, pmu device is not registered
> and trying to access the instruction point which will land in =
perf_instruction_pointer(). And recently I have added
> a workaround patch for power10 DD1 which has caused this breakage. My =
bad. We are working on a fix patch
> for the same and will post it out. Sorry again.
>=20

Hi Christophe,

Can you please try with below patch in your environment and test if it =
works for you.

=46rom 55d3afc9369dfbe28a7152c8e9f856c11c7fe43d Mon Sep 17 00:00:00 2001
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Date: Tue, 15 Jun 2021 22:28:11 -0400
Subject: [PATCH] powerpc/perf: Fix crash with 'perf_instruction_pointer' =
when
 pmu is not set

On systems without any specific PMU driver support registered, running
perf record causes oops:

[   38.841073] NIP [c00000000013af54] =
perf_instruction_pointer+0x24/0x100
[   38.841079] LR [c0000000003c7358] perf_prepare_sample+0x4e8/0x820
[   38.841085] --- interrupt: 300
[   38.841088] [c00000001cf03440] [c0000000003c6ef8] =
perf_prepare_sample+0x88/0x820 (unreliable)
[   38.841096] [c00000001cf034a0] [c0000000003c76d0] =
perf_event_output_forward+0x40/0xc0
[   38.841104] [c00000001cf03520] [c0000000003b45e8] =
__perf_event_overflow+0x88/0x1b0
[   38.841112] [c00000001cf03570] [c0000000003b480c] =
perf_swevent_hrtimer+0xfc/0x1a0
[   38.841119] [c00000001cf03740] [c0000000002399cc] =
__hrtimer_run_queues+0x17c/0x380
[   38.841127] [c00000001cf037c0] [c00000000023a5f8] =
hrtimer_interrupt+0x128/0x2f0
[   38.841135] [c00000001cf03870] [c00000000002962c] =
timer_interrupt+0x13c/0x370
[   38.841143i] [c00000001cf038d0] [c000000000009ba4] =
decrementer_common_virt+0x1a4/0x1b0
[   38.841151] --- interrupt: 900 at copypage_power7+0xd4/0x1c0

During perf record session, perf_instruction_pointer() is called to
capture the sample ip. This function in core-book3s accesses =
ppmu->flags.
If a platform specific PMU driver is not registered, ppmu is set to NULL
and accessing its members results in a crash. Fix this crash by checking
if ppmu is set.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/perf/core-book3s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
index 16d4d1b6a1ff..816756588cb7 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2254,7 +2254,7 @@ unsigned long perf_instruction_pointer(struct =
pt_regs *regs)
 	bool use_siar =3D regs_use_siar(regs);
 	unsigned long siar =3D mfspr(SPRN_SIAR);
=20
-	if (ppmu->flags & PPMU_P10_DD1) {
+	if (ppmu && ppmu->flags & PPMU_P10_DD1) {
 		if (siar)
 			return siar;
 		else
--=20
2.27.0


Thanks
Athira

> Maddy
>=20
>=20
>>=20
>> root@vgoippro:/tmp# perf record /root/null_syscall
>> [  285.559987] BUG: Kernel NULL pointer dereference on read at =
0x00000040
>> [  285.566533] Faulting instruction address: 0xc0021f0c
>> [  285.571486] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  285.576872] BE PAGE_SIZE=3D4K PREEMPT CMPCPRO
>> [  285.581080] SAF3000 DIE NOTIFICATION
>> [  285.584661] CPU: 0 PID: 442 Comm: null_syscall Not tainted =
5.13.0-rc6-s3k-dev-01645-g7649ee3d2957 #5164
>> [  285.594035] NIP:  c0021f0c LR: c00e8ad8 CTR: c00d8a5c
>> [  285.599074] REGS: e67757d0 TRAP: 0300   Not tainted =
(5.13.0-rc6-s3k-dev-01645-g7649ee3d2957)
>> [  285.607576] MSR:  00001032 <ME,IR,DR,RI>  CR: 44775b18 XER: =
20000000
>> [  285.614063] DAR: 00000040 DSISR: 20000000
>> [  285.614063] GPR00: c00e8810 e6775880 c1c52640 e6775b20 7cb36ae0 =
f0000028 43ebeedc 5ccc47d0
>> [  285.614063] GPR08: 00000000 00000900 e6775b20 00000001 00000000 =
1025b2c0 10013088 10012ee0
>> [  285.614063] GPR16: b0000000 00000007 00000001 c00deb64 00000042 =
00000001 78db7b23 c0b13200
>> [  285.614063] GPR24: 00000000 00000000 00000000 e6775b20 c13b8560 =
00000107 e6775940 e67758e8
>> [  285.651693] NIP [c0021f0c] perf_instruction_pointer+0x10/0x60
>> [  285.657460] LR [c00e8ad8] perf_prepare_sample+0x344/0x674
>> [  285.662859] Call Trace:
>> [  285.665301] [e6775880] [c00e8810] perf_prepare_sample+0x7c/0x674 =
(unreliable)
>> [  285.672452] [e67758c0] [c00e8e44] =
perf_event_output_forward+0x3c/0x94
>> [  285.678903] [e6775910] [c00dea8c] __perf_event_overflow+0x74/0x14c
>> [  285.685108] [e6775930] [c00dec5c] perf_swevent_hrtimer+0xf8/0x170
>> [  285.691217] [e6775a40] [c008c8d0] =
__hrtimer_run_queues.constprop.0+0x160/0x318
>> [  285.698456] [e6775a90] [c008d94c] hrtimer_interrupt+0x148/0x3b0
>> [  285.704394] [e6775ae0] [c000c0c0] timer_interrupt+0xc4/0x22c
>> [  285.710067] [e6775b10] [c00046f0] Decrementer_virt+0xb8/0xbc
>> [  285.715744] --- interrupt: 900 at pagecache_get_page+0x210/0x430
>> [  285.721764] NIP:  c00f52a8 LR: c00f5408 CTR: c00f59d8
>> [  285.726805] REGS: e6775b20 TRAP: 0900   Not tainted =
(5.13.0-rc6-s3k-dev-01645-g7649ee3d2957)
>> [  285.735306] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 28422d68  XER: =
00000000
>> [  285.742056]
>> [  285.742056] GPR00: c00f513c e6775bd0 c1c52640 c1c52640 00000000 =
00000000 00000000 c1382c38
>> [  285.742056] GPR08: 00000000 00000000 00000001 00000000 88482d68 =
1025b2c0 10013088 10012ee0
>> [  285.742056] GPR16: b0000000 00000007 00000001 10012ee0 c18187ac =
c0b87800 61c88647 c0c18c00
>> [  285.742056] GPR24: 00000001 00000003 00000000 00000002 c18187a8 =
00100cca 00000044 00000000
>> [  285.777079] NIP [c00f52a8] pagecache_get_page+0x210/0x430
>> [  285.782482] LR [c00f5408] pagecache_get_page+0x370/0x430
>> [  285.787796] --- interrupt: 900
>> [  285.790843] [e6775bd0] [c00f513c] pagecache_get_page+0xa4/0x430 =
(unreliable)
>> [  285.797910] [e6775c30] [c00f5ca8] filemap_fault+0x2d0/0x8e8
>> [  285.803500] [e6775ca0] [c012d244] __do_fault+0x4c/0xd8
>> [  285.808666] [e6775cb0] [c0130f64] handle_mm_fault+0x274/0x10b8
>> [  285.814517] [e6775d30] [c0014f58] do_page_fault+0x1d4/0x67c
>> [  285.820117] [e6775d60] [c000424c] DataAccess_virt+0xd4/0xe4
>> [  285.825707] --- interrupt: 300 at __arch_clear_user+0x10/0xcc
>> [  285.831458] NIP:  c001a3cc LR: c01d5cfc CTR: 00000000
>> [  285.836497] REGS: e6775d70 TRAP: 0300   Not tainted =
(5.13.0-rc6-s3k-dev-01645-g7649ee3d2957)
>> [  285.845000] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 48004264  XER: =
20000000
>> [  285.851751] DAR: 10012ee0 DSISR: 22000000
>> [  285.851751] GPR00: c01d53fc e6775e20 c1c52640 00000000 00000120 =
00000008 c136241c 00000000
>> [  285.851751] GPR08: 00000000 9ffed120 10012ee0 00000004 28004868 =
1025b2c0 10013088 10012ee0
>> [  285.851751] GPR16: b0000000 00000007 00000001 10012ee0 10000000 =
10012d0c 10000000 c1d74240
>> [  285.851751] GPR24: 10012ee0 00000000 c1345e80 c1343dc0 10000b38 =
00000000 c132ec00 c1386a00
>> [  285.889384] NIP [c001a3cc] __arch_clear_user+0x10/0xcc
>> [  285.894527] LR [c01d5cfc] load_elf_binary+0xec4/0x1340
>> [  285.899682] --- interrupt: 300
>> [  285.902730] [e6775e20] [c01d53fc] load_elf_binary+0x5c4/0x1340 =
(unreliable)
>> [  285.909713] [e6775ea0] [c0163258] bprm_execve+0x200/0x55c
>> [  285.915138] [e6775ef0] [c0163e00] do_execveat_common+0x178/0x1f4
>> [  285.921162] [e6775f20] [c0165558] sys_execve+0x40/0x58
>> [  285.926321] [e6775f40] [c001404c] ret_from_syscall+0x0/0x28
>> [  285.931917] --- interrupt: c00 at 0xfc3ce78
>> [  285.936097] NIP:  0fc3ce78 LR: 0fc3d7cc CTR: c01657cc
>> [  285.941135] REGS: e6775f50 TRAP: 0c00   Not tainted =
(5.13.0-rc6-s3k-dev-01645-g7649ee3d2957)
>> [  285.949636] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 22004868  XER: =
20000000
>> [  285.956655]
>> [  285.956655] GPR00: 0000000b afab1bf0 a7d77a50 afab6ee1 afab64c8 =
104bd9b0 fefefeff 7f7f7f7f
>> [  285.956655] GPR08: afab6ee0 00000000 006df8f9 0000011d 24004864 =
1025b2c0 10231a50 10249108
>> [  285.956655] GPR16: 104beeb0 10254830 105dd3f4 10250000 1018a124 =
10188448 10234e58 00000000
>> [  285.956655] GPR24: 10231ae0 00000003 00000001 104bd9b0 afab64c8 =
afab6ee1 0fd25244 afab1bf0
>> [  285.991684] NIP [0fc3ce78] 0xfc3ce78
>> [  285.995257] LR [0fc3d7cc] 0xfc3d7cc
>> [  285.998742] --- interrupt: c00
>> [  286.001789] Instruction dump:
>> [  286.004757] 3d20c07d 80a40010 3889847c 486bc444 80630084 546397fe =
38630001 4e800020
>> [  286.012556] 3d20c0b9 7c6a1b78 810915e4 812300a0 <81080040> =
55290036 2c090f00 5508056a
>> [  286.020531] ---[ end trace e381e6fcc2db5226 ]---

