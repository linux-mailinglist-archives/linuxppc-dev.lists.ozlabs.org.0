Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A8E84BB17
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 17:36:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ECQqCXpv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTplz17nYz3cZs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 03:36:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ECQqCXpv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTpl920mjz3c4V
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 03:35:32 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 416FqRtR008291;
	Tue, 6 Feb 2024 16:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : from : subject : cc : to : content-type :
 content-transfer-encoding; s=pp1;
 bh=mF1bxTg83JCcbT2p2VNjnSZdKXCMHgjUucY1HXSBHp4=;
 b=ECQqCXpvGIsdxNYSso/q56Ake+eF2U2THTENgPB6fP/yIAPTqxuH2UXxeBrmZtiWSVX7
 5hkWFgbphxRWWr7OsvtoPNs9NxuYC5hgXpZ2XrW7jveVuThfnb1lJsBXizcQPg+9h3Bj
 f8nIYyoUnP/dsnkdHGZ1Kttqs1QkTWDm2GDo5mMSChOiVY3V7gzmVxMMfT8wUY6d93Ut
 fZ5u2NVeeRTbUS+8C9m5rAxGRs11PZwMJv7oTypv1kGrGKdj+jVJtO8R15UCPX6FWIx7
 ZLENj8XpLYEn/xY+NfUlFb0qsKe5iOoS6gCnLL+LJSZ7ZKmW0DtQF3cU3dBu28hpFjxa Cg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w3qsw98jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 16:35:26 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 416EtUPZ008770;
	Tue, 6 Feb 2024 16:35:25 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w206ygbyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 16:35:25 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 416GZO4H2622116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Feb 2024 16:35:25 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC1865805D;
	Tue,  6 Feb 2024 16:35:24 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF2E958057;
	Tue,  6 Feb 2024 16:35:21 +0000 (GMT)
Received: from [9.43.109.155] (unknown [9.43.109.155])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Feb 2024 16:35:21 +0000 (GMT)
Message-ID: <a54c8860-18c7-474d-95e2-a0153a2da885@linux.vnet.ibm.com>
Date: Tue, 6 Feb 2024 22:05:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Subject: [revert commit 9f079dda1433] [mainline] [6.8.0-rc3] [NVME] OOPS
 kernel crash while booting
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eRSAn1IgLACeoIXaugRY1X-ApsOlxI6z
X-Proofpoint-ORIG-GUID: eRSAn1IgLACeoIXaugRY1X-ApsOlxI6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=635 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402060116
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
Cc: kch@nvidia.com, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, alan.adamson@oracle.com, kbusch@kernel.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greetings,

[revert commit 9f079dda1433] [mainline] [6.8.0-rc3] [NVME] OOPS kernel 
crash while booting to kernel

Reverting below commit fixes the problem

commit 9f079dda14339ee87d864306a9dc8c6b4e4da40b
     nvme: allow passthru cmd error logging

--- Traces ---

[   15.639835] BUG: Kernel NULL pointer dereference on read at 0x000003d8
[   15.639840] Faulting instruction address: 0xc0080000215b01dc
[   15.639845] Oops: Kernel access of bad area, sig: 11 [#1]
[   15.639849] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=8192 NUMA pSeries
[   15.639855] Modules linked in: xsk_diag bonding tls nft_compat 
nf_tables nfnetlink rfkill binfmt_misc dm_multipath dm_mod pseries_rng 
dax_pmem drm drm_panel_orientation_quirks ext4 mbcache jbd2 ibmvfc 
nd_pmem nd_btt scsi_transport_fc ibmveth nvme papr_scm bnx2x nvme_core 
t10_pi vmx_crypto libnvdimm crc64_rocksoft_generic crc64_rocksoft mdio 
crc64 libcrc32c fuse
[   15.639901] CPU: 1 PID: 3289 Comm: udevadm Not tainted 
6.8.0-rc3-auto-g99bd3cb0d12e #1
[   15.639907] Hardware name: IBM,9009-42A POWER9 (raw) 0x4e0202 
0xf000005 of:IBM,FW950.A0 (VL950_141) hv:phyp pSeries
[   15.639913] NIP:  c0080000215b01dc LR: c000000000a197bc CTR: 
c0080000215b01b8
[   15.639918] REGS: c00000006f3177f0 TRAP: 0300   Not tainted 
(6.8.0-rc3-auto-g99bd3cb0d12e)
[   15.639923] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
84888480  XER: 20040000
[   15.639936] CFAR: c00000000000dbbc DAR: 00000000000003d8 DSISR: 
40000000 IRQMASK: 0
[   15.639936] GPR00: c000000000a197bc c00000006f317a90 c0080000215d8200 
c000000092810000
[   15.639936] GPR04: c0080000215d2570 c000000092810000 c000000092820000 
0000000000000000
[   15.639936] GPR08: c000000092810000 0000000000000000 0000000000010000 
0000000022888482
[   15.639936] GPR12: c0080000215b01b8 c00000000f8cf300 0000000000000000 
0000000000000000
[   15.639936] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000001
[   15.639936] GPR20: 0000000000000000 0000000000400cc0 c000000086d14c28 
000000007fff0000
[   15.639936] GPR24: fffffffffffff000 0000000000000000 c000000086d14c18 
0000000000010000
[   15.639936] GPR28: c00000007509c180 c000000005bc1448 c0080000215d2570 
c000000086d14bf0
[   15.639999] NIP [c0080000215b01dc] 
nvme_io_passthru_err_log_enabled_show+0x24/0x80 [nvme_core]
[   15.640013] LR [c000000000a197bc] dev_attr_show+0x40/0xac
[   15.640020] Call Trace:
[   15.640023] [c00000006f317a90] [c00000006f317b10] 0xc00000006f317b10 
(unreliable)
[   15.640030] [c00000006f317af0] [c000000000a197bc] dev_attr_show+0x40/0xac
[   15.640037] [c00000006f317b60] [c0000000006c11a0] 
sysfs_kf_seq_show+0xcc/0x1f0
[   15.640045] [c00000006f317bf0] [c0000000006be224] 
kernfs_seq_show+0x44/0x58
[   15.640052] [c00000006f317c10] [c00000000060882c] 
seq_read_iter+0x254/0x69c
[   15.640060] [c00000006f317cf0] [c0000000006bed60] 
kernfs_fop_read_iter+0x4c/0x60
[   15.640067] [c00000006f317d10] [c0000000005bf61c] vfs_read+0x2bc/0x390
[   15.640074] [c00000006f317dc0] [c0000000005c040c] ksys_read+0x84/0x144
[   15.640081] [c00000006f317e10] [c000000000033358] 
system_call_exception+0x138/0x330
[   15.640088] [c00000006f317e50] [c00000000000d05c] 
system_call_vectored_common+0x15c/0x2ec
[   15.640096] --- interrupt: 3000 at 0x7fff87d342e4
[   15.640101] NIP:  00007fff87d342e4 LR: 0000000000000000 CTR: 
0000000000000000
[   15.640106] REGS: c00000006f317e80 TRAP: 3000   Not tainted 
(6.8.0-rc3-auto-g99bd3cb0d12e)
[   15.640110] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 42884482  XER: 00000000
[   15.640126] IRQMASK: 0
[   15.640126] GPR00: 0000000000000003 00007fffea617e80 00007fff87e47200 
0000000000000003
[   15.640126] GPR04: 0000010009494f20 0000000000010008 00007fff87e40e18 
00000100094a4f20
[   15.640126] GPR08: 0000000000010008 0000000000000000 0000000000000000 
0000000000000000
[   15.640126] GPR12: 0000000000000000 00007fff88434ba0 0000000000000000 
0000000000000000
[   15.640126] GPR16: 0000000000000000 000000013e082f48 00007fffea618290 
00007fffea617ee8
[   15.640126] GPR20: 00000000003ffffe 00007fffea618108 00007fffea618110 
0000000000008000
[   15.640126] GPR24: 0000000000000000 0000000000000002 00000000003ffffe 
ffffffffffffffff
[   15.640126] GPR28: 0000000000010007 0000000000010008 0000010009494f20 
0000000000000003
[   15.640185] NIP [00007fff87d342e4] 0x7fff87d342e4
[   15.640189] LR [0000000000000000] 0x0
[   15.640193] --- interrupt: 3000
[   15.640196] Code: e8410018 00028048 00000000 3c4c0003 38428048 
7c0802a6 60000000 7c0802a6 f8010010 f821ffa1 e9230078 7ca32b78 
<892903d8> 2c090000 4082002c 3d220000
[   15.640217] ---[ end trace 0000000000000000 ]---

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

