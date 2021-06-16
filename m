Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A313A8F59
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 05:24:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4VsX6Fl6z3byf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 13:24:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lR/kopPH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lR/kopPH; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Vs25xbPz2yjH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 13:23:50 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G3KqLp195887
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9ofA2sWYdgoeOP9fW4M55p5tO0yFWO3c4BY+IjzOp3Q=;
 b=lR/kopPHm4NB4kbZ7eNsiJ3HRUDgkuN/0/b7l5mm5dLpOPYzGehS/9IKuOIdT0F4li/0
 mU0IFoyLq3rCThoK/v28o1nLndAoLnci0jdyykHIbNs1JLZlRaU68xx06ahPBOwXac4p
 8gP7D8FPrQD0erLY4ztGVe9MLbhR1Jj/An6pEukGrCD6ublw8gyFbAaESEViv75q47fz
 Vm50s4HEe7nCEK3wBelj/xHiGxXsHP1T3hSIwLzV6zlQ//jA/ydm2A0/RhgoUmexfBF+
 ofTLsopthl8KQ9cfutM3YOSJs2stAPRKZFHuVbNeBk1vuLTeAxeXW/Rh6dCIUMR/YEyq /g== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3979akr1r4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:23:46 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15G3Ci5N000919
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 03:23:45 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 394mj8h0y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 03:23:44 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15G3NgmI25166164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 03:23:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E08EA405B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 03:23:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35C6FA4054
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 03:23:42 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.68.172])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 03:23:42 +0000 (GMT)
Subject: Re: Oops (NULL pointer) with 'perf record' of selftest 'null_syscall'
To: linuxppc-dev@lists.ozlabs.org
References: <c141a18c-b18d-b775-1848-527c35a1c433@csgroup.eu>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <3388922c-0224-e4aa-f7b7-4fea43e060f9@linux.ibm.com>
Date: Wed, 16 Jun 2021 08:53:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <c141a18c-b18d-b775-1848-527c35a1c433@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OOYlIQ7MIn1vV0H5cwf4BBTOHJOZkt4E
X-Proofpoint-GUID: OOYlIQ7MIn1vV0H5cwf4BBTOHJOZkt4E
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_09:2021-06-15,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160018
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


On 6/15/21 8:35 PM, Christophe Leroy wrote:
> For your information, I'm getting the following Oops. Detected with 
> 5.13-rc6, it also oopses on 5.12 and 5.11.
> Runs ok on 5.10. I'm starting bisecting now.


Thanks for reporting, got the issue. What has happened in this case is 
that, pmu device is not registered
and trying to access the instruction point which will land in 
perf_instruction_pointer(). And recently I have added
a workaround patch for power10 DD1 which has caused this breakage. My 
bad. We are working on a fix patch
for the same and will post it out. Sorry again.

Maddy


>
> root@vgoippro:/tmp# perf record /root/null_syscall
> [  285.559987] BUG: Kernel NULL pointer dereference on read at 0x00000040
> [  285.566533] Faulting instruction address: 0xc0021f0c
> [  285.571486] Oops: Kernel access of bad area, sig: 11 [#1]
> [  285.576872] BE PAGE_SIZE=4K PREEMPT CMPCPRO
> [  285.581080] SAF3000 DIE NOTIFICATION
> [  285.584661] CPU: 0 PID: 442 Comm: null_syscall Not tainted 
> 5.13.0-rc6-s3k-dev-01645-g7649ee3d2957 #5164
> [  285.594035] NIP:  c0021f0c LR: c00e8ad8 CTR: c00d8a5c
> [  285.599074] REGS: e67757d0 TRAP: 0300   Not tainted 
> (5.13.0-rc6-s3k-dev-01645-g7649ee3d2957)
> [  285.607576] MSR:  00001032 <ME,IR,DR,RI>  CR: 44775b18 XER: 20000000
> [  285.614063] DAR: 00000040 DSISR: 20000000
> [  285.614063] GPR00: c00e8810 e6775880 c1c52640 e6775b20 7cb36ae0 
> f0000028 43ebeedc 5ccc47d0
> [  285.614063] GPR08: 00000000 00000900 e6775b20 00000001 00000000 
> 1025b2c0 10013088 10012ee0
> [  285.614063] GPR16: b0000000 00000007 00000001 c00deb64 00000042 
> 00000001 78db7b23 c0b13200
> [  285.614063] GPR24: 00000000 00000000 00000000 e6775b20 c13b8560 
> 00000107 e6775940 e67758e8
> [  285.651693] NIP [c0021f0c] perf_instruction_pointer+0x10/0x60
> [  285.657460] LR [c00e8ad8] perf_prepare_sample+0x344/0x674
> [  285.662859] Call Trace:
> [  285.665301] [e6775880] [c00e8810] perf_prepare_sample+0x7c/0x674 
> (unreliable)
> [  285.672452] [e67758c0] [c00e8e44] perf_event_output_forward+0x3c/0x94
> [  285.678903] [e6775910] [c00dea8c] __perf_event_overflow+0x74/0x14c
> [  285.685108] [e6775930] [c00dec5c] perf_swevent_hrtimer+0xf8/0x170
> [  285.691217] [e6775a40] [c008c8d0] 
> __hrtimer_run_queues.constprop.0+0x160/0x318
> [  285.698456] [e6775a90] [c008d94c] hrtimer_interrupt+0x148/0x3b0
> [  285.704394] [e6775ae0] [c000c0c0] timer_interrupt+0xc4/0x22c
> [  285.710067] [e6775b10] [c00046f0] Decrementer_virt+0xb8/0xbc
> [  285.715744] --- interrupt: 900 at pagecache_get_page+0x210/0x430
> [  285.721764] NIP:  c00f52a8 LR: c00f5408 CTR: c00f59d8
> [  285.726805] REGS: e6775b20 TRAP: 0900   Not tainted 
> (5.13.0-rc6-s3k-dev-01645-g7649ee3d2957)
> [  285.735306] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 28422d68  XER: 
> 00000000
> [  285.742056]
> [  285.742056] GPR00: c00f513c e6775bd0 c1c52640 c1c52640 00000000 
> 00000000 00000000 c1382c38
> [  285.742056] GPR08: 00000000 00000000 00000001 00000000 88482d68 
> 1025b2c0 10013088 10012ee0
> [  285.742056] GPR16: b0000000 00000007 00000001 10012ee0 c18187ac 
> c0b87800 61c88647 c0c18c00
> [  285.742056] GPR24: 00000001 00000003 00000000 00000002 c18187a8 
> 00100cca 00000044 00000000
> [  285.777079] NIP [c00f52a8] pagecache_get_page+0x210/0x430
> [  285.782482] LR [c00f5408] pagecache_get_page+0x370/0x430
> [  285.787796] --- interrupt: 900
> [  285.790843] [e6775bd0] [c00f513c] pagecache_get_page+0xa4/0x430 
> (unreliable)
> [  285.797910] [e6775c30] [c00f5ca8] filemap_fault+0x2d0/0x8e8
> [  285.803500] [e6775ca0] [c012d244] __do_fault+0x4c/0xd8
> [  285.808666] [e6775cb0] [c0130f64] handle_mm_fault+0x274/0x10b8
> [  285.814517] [e6775d30] [c0014f58] do_page_fault+0x1d4/0x67c
> [  285.820117] [e6775d60] [c000424c] DataAccess_virt+0xd4/0xe4
> [  285.825707] --- interrupt: 300 at __arch_clear_user+0x10/0xcc
> [  285.831458] NIP:  c001a3cc LR: c01d5cfc CTR: 00000000
> [  285.836497] REGS: e6775d70 TRAP: 0300   Not tainted 
> (5.13.0-rc6-s3k-dev-01645-g7649ee3d2957)
> [  285.845000] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 48004264  XER: 
> 20000000
> [  285.851751] DAR: 10012ee0 DSISR: 22000000
> [  285.851751] GPR00: c01d53fc e6775e20 c1c52640 00000000 00000120 
> 00000008 c136241c 00000000
> [  285.851751] GPR08: 00000000 9ffed120 10012ee0 00000004 28004868 
> 1025b2c0 10013088 10012ee0
> [  285.851751] GPR16: b0000000 00000007 00000001 10012ee0 10000000 
> 10012d0c 10000000 c1d74240
> [  285.851751] GPR24: 10012ee0 00000000 c1345e80 c1343dc0 10000b38 
> 00000000 c132ec00 c1386a00
> [  285.889384] NIP [c001a3cc] __arch_clear_user+0x10/0xcc
> [  285.894527] LR [c01d5cfc] load_elf_binary+0xec4/0x1340
> [  285.899682] --- interrupt: 300
> [  285.902730] [e6775e20] [c01d53fc] load_elf_binary+0x5c4/0x1340 
> (unreliable)
> [  285.909713] [e6775ea0] [c0163258] bprm_execve+0x200/0x55c
> [  285.915138] [e6775ef0] [c0163e00] do_execveat_common+0x178/0x1f4
> [  285.921162] [e6775f20] [c0165558] sys_execve+0x40/0x58
> [  285.926321] [e6775f40] [c001404c] ret_from_syscall+0x0/0x28
> [  285.931917] --- interrupt: c00 at 0xfc3ce78
> [  285.936097] NIP:  0fc3ce78 LR: 0fc3d7cc CTR: c01657cc
> [  285.941135] REGS: e6775f50 TRAP: 0c00   Not tainted 
> (5.13.0-rc6-s3k-dev-01645-g7649ee3d2957)
> [  285.949636] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 22004868  XER: 
> 20000000
> [  285.956655]
> [  285.956655] GPR00: 0000000b afab1bf0 a7d77a50 afab6ee1 afab64c8 
> 104bd9b0 fefefeff 7f7f7f7f
> [  285.956655] GPR08: afab6ee0 00000000 006df8f9 0000011d 24004864 
> 1025b2c0 10231a50 10249108
> [  285.956655] GPR16: 104beeb0 10254830 105dd3f4 10250000 1018a124 
> 10188448 10234e58 00000000
> [  285.956655] GPR24: 10231ae0 00000003 00000001 104bd9b0 afab64c8 
> afab6ee1 0fd25244 afab1bf0
> [  285.991684] NIP [0fc3ce78] 0xfc3ce78
> [  285.995257] LR [0fc3d7cc] 0xfc3d7cc
> [  285.998742] --- interrupt: c00
> [  286.001789] Instruction dump:
> [  286.004757] 3d20c07d 80a40010 3889847c 486bc444 80630084 546397fe 
> 38630001 4e800020
> [  286.012556] 3d20c0b9 7c6a1b78 810915e4 812300a0 <81080040> 55290036 
> 2c090f00 5508056a
> [  286.020531] ---[ end trace e381e6fcc2db5226 ]---
