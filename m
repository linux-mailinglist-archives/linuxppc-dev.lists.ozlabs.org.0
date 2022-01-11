Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA3048A9F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 09:56:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY4Lj3xBrz3bTp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 19:56:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s5I+2iC8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=s5I+2iC8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY4Kl2268z30JB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 19:55:54 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20B62Jte027501
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 08:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=vTWEVUOjVcxjez8GZCCErK94Z0JwgP5wVGXlpLnl0Xo=;
 b=s5I+2iC8Z3Y508rjlgPv1dMT/OIOtPdG7g5OjvpcfAGcawHkpm/jLEOlLB/+Hzw2dkmt
 Cdda/jscNHpX+PSLkWVcBPCi4ez39GsAg8WEASgqylb/M1BbCCXszEVwpu/x6Q3yY+ld
 p3PWg42+w0B/u+Tl+F/uvHQxscJJNxHA0t41FB/SVAIBlQXeeMvXzbhwF0YVfkNxpD62
 7eHhuQgPAVQi/Jqm/7u9gRJVdVMXRO5tO6DjUdt48Mx/veiAybytGbIXJUwKPYRscghe
 R+o85FlTNvgMQh/hkNZo5yGCGeDVh+udptaryfzNR0KEFb0jJJs/P6+RxXkFBtkprxKG IQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfm6qgxfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 08:55:51 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20B8qUg1016495
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 08:55:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3df1vjbe91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 08:55:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20B8tjcq24903952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 08:55:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF71FA4065;
 Tue, 11 Jan 2022 08:55:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E89ADA4055;
 Tue, 11 Jan 2022 08:55:44 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.184.118])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 11 Jan 2022 08:55:44 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [powerpc/merge] PMU: Kernel warning while running pmu/ebb
 selftests
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <4645BEDB-75D8-4178-A5AE-C2AE8693BE96@linux.vnet.ibm.com>
Date: Tue, 11 Jan 2022 14:25:43 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <0A534F83-D1CB-4DF2-907C-FCCAA65EBA35@linux.ibm.com>
References: <4645BEDB-75D8-4178-A5AE-C2AE8693BE96@linux.vnet.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wWHSKx2Qac8Iy-az4rRVCXQao_xcYj2A
X-Proofpoint-GUID: wWHSKx2Qac8Iy-az4rRVCXQao_xcYj2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_03,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201110047
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 18-Dec-2021, at 3:38 PM, Sachin Sant <sachinp@linux.vnet.ibm.com> =
wrote:
>=20
> While running kernel selftests (lost_exception_test) against latest
> powerpc merge/next branch code (5.16.0-rc5-03218-g798527287598)
> following warning is seen:
>=20
Ping. I continue to see this problem.

> [  172.851380] ------------[ cut here ]------------
> [  172.851391] WARNING: CPU: 8 PID: 2901 at =
arch/powerpc/include/asm/hw_irq.h:246 power_pmu_disable+0x270/0x280
> [  172.851402] Modules linked in: dm_mod bonding nft_ct nf_conntrack =
nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables rfkill nfnetlink sunrpc =
xfs libcrc32c pseries_rng xts vmx_crypto uio_pdrv_genirq uio =
sch_fq_codel ip_tables ext4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi =
ibmveth scsi_transport_srp fuse
> [  172.851442] CPU: 8 PID: 2901 Comm: lost_exception_ Not tainted =
5.16.0-rc5-03218-g798527287598 #2
> [  172.851451] NIP:  c00000000013d600 LR: c00000000013d5a4 CTR: =
c00000000013b180
> [  172.851458] REGS: c000000017687860 TRAP: 0700   Not tainted  =
(5.16.0-rc5-03218-g798527287598)
> [  172.851465] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
48004884  XER: 20040000
> [  172.851482] CFAR: c00000000013d5b4 IRQMASK: 1=20
> [  172.851482] GPR00: c00000000013d5a4 c000000017687b00 =
c000000002a10600 0000000000000004=20
> [  172.851482] GPR04: 0000000082004000 c0000008ba08f0a8 =
0000000000000000 00000008b7ed0000=20
> [  172.851482] GPR08: 00000000446194f6 0000000000008000 =
c00000000013b118 c000000000d58e68=20
> [  172.851482] GPR12: c00000000013d390 c00000001ec54a80 =
0000000000000000 0000000000000000=20
> [  172.851482] GPR16: 0000000000000000 0000000000000000 =
c000000015d5c708 c0000000025396d0=20
> [  172.851482] GPR20: 0000000000000000 0000000000000000 =
c00000000a3bbf40 0000000000000003=20
> [  172.851482] GPR24: 0000000000000000 c0000008ba097400 =
c0000000161e0d00 c00000000a3bb600=20
> [  172.851482] GPR28: c000000015d5c700 0000000000000001 =
0000000082384090 c0000008ba0020d8=20
> [  172.851549] NIP [c00000000013d600] power_pmu_disable+0x270/0x280
> [  172.851557] LR [c00000000013d5a4] power_pmu_disable+0x214/0x280
> [  172.851565] Call Trace:
> [  172.851568] [c000000017687b00] [c00000000013d5a4] =
power_pmu_disable+0x214/0x280 (unreliable)
> [  172.851579] [c000000017687b40] [c0000000003403ac] =
perf_pmu_disable+0x4c/0x60
> [  172.851588] [c000000017687b60] [c0000000003445e4] =
__perf_event_task_sched_out+0x1d4/0x660
> [  172.851596] [c000000017687c50] [c000000000d1175c] =
__schedule+0xbcc/0x12a0
> [  172.851602] [c000000017687d60] [c000000000d11ea8] =
schedule+0x78/0x140
> [  172.851608] [c000000017687d90] [c0000000001a8080] =
sys_sched_yield+0x20/0x40
> [  172.851615] [c000000017687db0] [c0000000000334dc] =
system_call_exception+0x18c/0x380
> [  172.851622] [c000000017687e10] [c00000000000c74c] =
system_call_common+0xec/0x268
> [  172.851629] --- interrupt: c00 at 0x7fffa9d0d2fc
> [  172.851633] NIP:  00007fffa9d0d2fc LR: 0000000010001914 CTR: =
0000000000000000
> [  172.851638] REGS: c000000017687e80 TRAP: 0c00   Not tainted  =
(5.16.0-rc5-03218-g798527287598)
> [  172.851643] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28000288  XER: 00000000
> [  172.851657] IRQMASK: 0=20
> [  172.851657] GPR00: 000000000000009e 00007fffe44c0b40 =
00007fffa9e07300 0000000000000000=20
> [  172.851657] GPR04: 00007fffe44c0c28 0000000000000018 =
000000000000000a 0000000000000008=20
> [  172.851657] GPR08: 0000000000000007 0000000000000000 =
0000000000000000 0000000000000000=20
> [  172.851657] GPR12: 0000000000000000 00007fffa9eaa270 =
0000000000000000 0000000000000000=20
> [  172.851657] GPR16: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000=20
> [  172.851657] GPR20: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000=20
> [  172.851657] GPR24: 0000000000000190 0000000000000000 =
00000000000186a0 00000000000f423f=20
> [  172.851657] GPR28: 0000000010021650 0000000000000198 =
0000000010020238 000000000000d446=20
> [  172.851711] NIP [00007fffa9d0d2fc] 0x7fffa9d0d2fc
> [  172.851715] LR [0000000010001914] 0x10001914
> [  172.851719] --- interrupt: c00
> [  172.851722] Instruction dump:
> [  172.851725] 71490001 81280078 552905ac 79290020 2fa90000 4182fe9c =
4bffff88 60000000=20
> [  172.851735] 4bee4729 60000000 9bdf0014 4bfffe00 <0fe00000> 60000000 =
60000000 60000000=20
> [  172.851745] ---[ end trace 10a1b687c9c436f7 ]=E2=80=94
>=20
> CONFIG_PPC_IRQ_SOFT_MASK_DEBUG is enabled for this kernel.
>=20
> The code in question was last changed by following commit:
>=20
> commit 2c9ac51b850d=20
> powerpc/perf: Fix PMU callbacks to clear pending PMI before resetting =
an overflown PMC
>=20
> Reverting this commit helps.
>=20
> Thanks
> -Sachin

