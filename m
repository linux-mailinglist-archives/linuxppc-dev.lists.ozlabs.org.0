Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CCB435B1A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 08:48:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZdNs2Zfdz3bjP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 17:48:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LdJIENPz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=abdhalee@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LdJIENPz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZdN46hrjz2xYD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 17:48:03 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19L410GX015966; 
 Thu, 21 Oct 2021 02:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=pp1;
 bh=YOToBGzx831blHEuAymZ7sSaqz9XnuYhYrMwjgjIbLw=;
 b=LdJIENPzEZyTMRT1G9XqmQkvlGKMHFcorfnLibRQ/QCNxgYZBfzIeZ0OMlI39/cW/TE8
 Owy/bm9UW2EQ4KjwbS3/DpuXafkiE+MdxYgcNQ3eZY6W6NDc+35hciZGPb3kT0quFDDT
 NCNfVEz0HgnYyX+vTlSSYOuHPGDFlX/RGEJXLjk47VI1nvqgG4xdDkOOZxt8+bGRKUVO
 y1Pn17fZ9/F0aX0PyOhWzPd5k4OAvz8l4tCdqJippeWA+H2IdhaaLzclHAqX6tbAkV6b
 L8hjCLEJa0m2kxLbIPUFt+Xf3xSmUvHPhs4AJeBLgIFxD/BBUIvnrpHTmqd74jvcyRMC lA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btwh9ek8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 02:47:58 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19L6jenm031610;
 Thu, 21 Oct 2021 06:47:57 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3bqpcdcpb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 06:47:57 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19L6luH843844064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 06:47:56 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9D54AC15D;
 Thu, 21 Oct 2021 06:47:55 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B98CDAC2B3;
 Thu, 21 Oct 2021 06:46:51 +0000 (GMT)
Received: from [9.160.53.122] (unknown [9.160.53.122])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 21 Oct 2021 06:46:51 +0000 (GMT)
Message-ID: <30cabacf-b12a-3dd6-6d6e-b1c5585bd1c9@linux.vnet.ibm.com>
Date: Thu, 21 Oct 2021 12:14:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: [next-20211019][PPC] kernel panics with lspci -vvnn command
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DOF6jFKjKYon93cxz65m4V8F3fAOK05q
X-Proofpoint-ORIG-GUID: DOF6jFKjKYon93cxz65m4V8F3fAOK05q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-21_01,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=487
 clxscore=1011 phishscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110210029
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-scsi <linux-scsi@vger.kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>, dougmill@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greeting's

Today's next kernel panics when lspci -vvnn commands is executed on my 
powerpc machine

# lspci -vvnn
0012:01:00.0 Fibre Channel [0c04]: QLogic Corp. ISP2722-based 16/32Gb 
Fibre Channel to PCIe Adapter [1077:2261] (rev 01)
     Subsystem: IBM Device [1014:0650]
     Physical Slot: U78D8.ND0.FGD004S-P0-C2-C0
     Device tree node: 
/sys/firmware/devicetree/base/pci@800000020000012/fibre-channel@0
     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ 
Stepping- SERR+ FastB2B- DisINTx-
     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Latency: 0, Cache Line Size: 128 bytes
     Interrupt: pin A routed to IRQ 48
     NUMA node: 2
     IOMMU group: 0
     Region 0: Memory at 40000285000 (64-bit, prefetchable) [size=4K]
     Region 2: Memory at 40000282000 (64-bit, prefetchable) [size=8K]
     Region 4: Memory at 40000100000 (64-bit, prefetchable) [size=1M]
     Expansion ROM at 40000240000 [disabled] [size=256K]
     Capabilities: [44] Power Management version 3
         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
         Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
     Capabilities: [4c] Express (v2) Endpoint, MSI 00
         DevCap:    MaxPayload 2048 bytes, PhantFunc 0, Latency L0s 
<4us, L1 <1us
             ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ 
SlotPowerLimit 0.000W
         DevCtl:    CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
             RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ FLReset-
             MaxPayload 512 bytes, MaxReadReq 4096 bytes
         DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- 
TransPend-
         LnkCap:    Port #0, Speed 8GT/s, Width x8, ASPM L0s L1, Exit 
Latency L0s <2us, L1 <2us
             ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
         LnkCtl:    ASPM Disabled; RCB 64 bytes, Disabled- CommClk-
             ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
         LnkSta:    Speed 8GT/s (ok), Width x8 (ok)
             TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
         DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR-
              10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- 
EETLPPrefix-
              EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
              FRS- TPHComp- ExtTPHComp-
              AtomicOpsCap: 32bit- 64bit- 128bitCAS-
         DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis+ LTR- 
OBFF Disabled,
              AtomicOpsCtl: ReqEn-
         LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 
2Retimers- DRS-
         LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
              Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
              Compliance De-emphasis: -6dB
         LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ 
EqualizationPhase1+
              EqualizationPhase2+ EqualizationPhase3+ 
LinkEqualizationRequest-
              Retimer- 2Retimers- CrosslinkRes: unsupported
     Capabilities: [88] Vital Product Data
BUG: Kernel NULL pointer dereference on read at 0x000080a0
BUG: Unable to handle kernel data access on read at 0x3949ffff40920078
BUG: Unable to handle kernel data access on read at 0x694a0002e94d00f0
Faulting instruction address: 0xc0000000006f4498
Faulting instruction address: 0xc0000000001d3680
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
Faulting instruction address: 0xc0000000001abcf0
Modules linked in:
Thread overran stack, or stack corrupted
  rpadlpar_io rpaphp nfnetlink tcp_diag udp_diag inet_diag unix_diag 
af_packet_diag netlink_diag bonding rfkill sunrpc raid456 async_raid6_recov
async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c 
pseries_rng xts vmx_crypto gf128mul binfmt_misc sch_fq_codel ip_tables ext4
mbcache jbd2 dm_service_time sd_mod sg qla2xxx ibmvfc ibmveth nvme_fc 
nvme_fabrics nvme_core t10_pi scsi_transport_fc dm_multipath dm_mirror
dm_region_hash dm_log dm_mod fuse
CPU: 24 PID: 0 Comm: swapper/24 Kdump: loaded Not tainted 
5.15.0-rc5-next-20211012-autotest #1
NIP:  c0000000006f4498 LR: c0000000006f9c18 CTR: c000000000026e60
REGS: c000000006797560 TRAP: 0380   Not tainted 
(5.15.0-rc5-next-20211012-autotest)
MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 42000824  XER: 00000000
CFAR: c0000000006f440c IRQMASK: 1
GPR00: c00000000022434c c000000006797800 c0000000019b2500 c00000117db0ac28
GPR04: c00000117db0a520 0000000000000000 3949ffff40920078 0000000000000001
GPR08: c000000063bd3cf0 c00000000073a7a8 892100602e3f0000 7265677368657265
GPR12: c000000000026e60 c00000117fb4be80 0000000000000000 000000001eef2b00
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000003 0000000000000001
GPR24: 0000638695346493 0000000000000002 0000000000000003 c00000117db0a480
GPR28: c00000117db0a480 0000000000000000 c00000117db0a520 c00000117db0ac28
NIP [c0000000006f4498] rb_erase+0x158/0x440
LR [c0000000006f9c18] timerqueue_del+0x58/0xa0
Call Trace:
[c000000006797800] [0000000000000003] 0x3 (unreliable)
[c000000006797830] [c00000000022434c] __remove_hrtimer+0x5c/0xf0
[c000000006797870] [c000000000224b84] __hrtimer_run_queues+0x144/0x360
[c0000000067978f0] [c000000000225b90] hrtimer_interrupt+0x120/0x2f0
[c0000000067979a0] [c0000000000272d4] timer_interrupt+0x144/0x3e0
[c000000006797a00] [c000000000009a60] decrementer_common_virt+0x210/0x220
--- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
NIP:  c0000000000ef100 LR: c0000000009bca88 CTR: 0000000000000000
REGS: c000000006797a70 TRAP: 0900   Not tainted 
(5.15.0-rc5-next-20211012-autotest)
MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24000224  
XER: 00000000
CFAR: 0000000000000c00 IRQMASK: 0
GPR00: 0000000000000000 c000000006797d10 c0000000019b2500 0000000000000000
GPR04: 8004001f54ca7c10 0000000000000000 0000000000000004 0000000000000018
GPR08: 0000000000000000 0000000000000090 0000000000000001 8004001f54ca7c00
GPR12: 0000000000000000 c00000117fb4be80 0000000000000000 000000001eef2b00
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000000 c0000000018f1e28
GPR24: 0000000000000001 0000638691f200fe 0000000000000000 0000000000000000
GPR28: 0000000000000001 0000000000000000 c000000001192090 c000000001192098
NIP [c0000000000ef100] plpar_hcall_norets_notrace+0x18/0x2c
LR [c0000000009bca88] check_and_cede_processor+0x48/0x60
--- interrupt: 900
[c000000006797d10] [c00000117db0ac28] 0xc00000117db0ac28 (unreliable)
[c000000006797d70] [c0000000009bcec4] dedicated_cede_loop+0x94/0x1a0
[c000000006797dc0] [c0000000009b97f4] cpuidle_enter_state+0x2d4/0x4e0
[c000000006797e20] [c0000000009b9a98] cpuidle_enter+0x48/0x70
[c000000006797e60] [c0000000001a0264] call_cpuidle+0x44/0x80
[c000000006797e80] [c0000000001a0840] do_idle+0x340/0x390
[c000000006797f00] [c0000000001a0ac4] cpu_startup_entry+0x34/0x50
[c000000006797f30] [c00000000006144c] start_secondary+0x27c/0x290
[c000000006797f90] [c00000000000d254] start_secondary_prolog+0x10/0x14
Instruction dump:
7d284b78 e9280008 7fa95040 409eff9c e9280010 e8e90000 e9490008 70e70001
41820168 e8c90010 2fa60000 419e0010 <e8e60000> 70e70001 41820044 2faa0000
---[ end trace 3024a0b7ce3c6f83 ]---

# lspci -nn
0012:01:00.0 Fibre Channel [0c04]: QLogic Corp. ISP2722-based 16/32Gb 
Fibre Channel to PCIe Adapter [1077:2261] (rev 01)
0012:01:00.1 Fibre Channel [0c04]: QLogic Corp. ISP2722-based 16/32Gb 
Fibre Channel to PCIe Adapter [1077:2261] (rev 01)

Problem is not seen with 5.15.0-rc4-next-20211005

-- 
Regard's

Abdul Haleem
IBM Linux Technology Center

