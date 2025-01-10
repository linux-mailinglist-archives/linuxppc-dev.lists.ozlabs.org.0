Return-Path: <linuxppc-dev+bounces-4959-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7C2A08880
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 07:44:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTsZd5M27z3cVH;
	Fri, 10 Jan 2025 17:44:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736491465;
	cv=none; b=HCP1j/XN42sF6TIW6vmajppADa4uVZE0nGwlRQKTQtwfoG1sy2BOXUQIHhlW+jrRyrd3gDzNfxCC4MDCtDKvPR2skDhm3T2hG38axtXhIFsKoKQ0R8Eu0HDOBtpSBPmPdWQBDVdF5si0FSBktUfvGxNqEGwYOtOsIYoXn4mFhifQcC8m5FN4uYTFmTsFNRxA3uBYsCRB9KDzkbIOvQBedwHlQnPr2x2TgjEj2Q8HGOyu2co7QKHfTJ3fllnbWHYYTURUPbBO6F0tf31IuokT8KtGM1H/iqnXUS/RCmxHBtkCl8QDcjwDUXnUFX7tP/cVOqKUjs2POy2xg8b5XG1BmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736491465; c=relaxed/relaxed;
	bh=NBYbHV5vk3/hK2aFKOqRhcwGkFlE8IWUpAJ6TMPeig8=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=PPV0WVfI2r024QajJPVsLgW1V+3DgsP3OPxh2M+Bj3jfZkjQQJzE91jguh1DO5nBJMeKQWz44E/3cIkBHwR+kDsR68aWLYrAE4RxytmB7V3mEGMe9fDCi4RsJBdzaiqQtVQ5KjK3TSuasiVSivJRS6zwAbMRbNFTj472HElG4yRH3RYAciAHQtu9FIIzAnAGWrxAoqT+DU4j3p+Ga7Kxs3tSczmYYVrCtw4uDN4fFlfUcvoIDRLVbkBJZ2Vl1xoq5tK149ve8lwjM/U6RNKoMor9t4JkKTOTqfAk9Wpm0TQg/O8dSsJLFG5/pN068uUd/OOw10q6Kc8/Tt0TRlfQFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fFOBYJk4; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fFOBYJk4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTsZc0V2mz3cVG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:44:23 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A3rB30015062;
	Fri, 10 Jan 2025 06:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=NBYbHV5vk3/hK2aFKOqRhcwGkFlE
	8IWUpAJ6TMPeig8=; b=fFOBYJk42c1Jf6MFoS0+L/D+vTtPbPhzUwqmSRh0UC/d
	LNVydd8peTXJcJRLAyj7y3j0qkGO7vpf/jXLXTlySwrU5hvOuPQU/umaNrUjm9St
	41VVo/CKYLHkF9iFn1yB/bHg4ysciKPn1ID4Xhs8BoinAfQNmgobLqua8XbZZTJI
	NfXtfXhk0gAu/FnRueFPIGT8oR0HqIXcPpGCOq/3iK3Ayw8ru/iLRYrN1VlmXo1v
	ILeVvQMlNM1f6QchIjTETwp+ZN00kRSPr9iFXgH9f9ZP2VpYZY9YleXxiD8X0ouw
	4x79Ma96RNGnU8uWdt5cMWGMyc/NiFm5ltj4HaEumw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442v1brj2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:44:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50A6dGbs026195;
	Fri, 10 Jan 2025 06:44:17 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yj12gp8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:44:17 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50A6iHuj27853456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 06:44:17 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 76A145805F;
	Fri, 10 Jan 2025 06:44:17 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE51358051;
	Fri, 10 Jan 2025 06:44:15 +0000 (GMT)
Received: from [9.61.241.26] (unknown [9.61.241.26])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jan 2025 06:44:15 +0000 (GMT)
Message-ID: <a1cf98f7-c16b-472a-b56d-f745e94017ef@linux.vnet.ibm.com>
Date: Fri, 10 Jan 2025 12:14:13 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
To: gregkh@linuxfoundation.org, johannes.berg@intel.com
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Kernel Warnings at fs/debugfs/file.c 90
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -T_X5v59pd2R4oT_PdS-Jp6YwTG4tMGT
X-Proofpoint-GUID: -T_X5v59pd2R4oT_PdS-Jp6YwTG4tMGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=744
 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100052
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Greetings!!!


Observing Kernel Warnings on kernel 6.13.0-rc6-next-20250109, while 
running fstests ext4/001.


Traces:

[  433.607975] ------------[ cut here ]------------
[  433.607984] WARNING: CPU: 2 PID: 32051 at fs/debugfs/file.c:90 
__debugfs_file_get+0xcc/0x274
[  433.608002] Modules linked in: ext4 mbcache jbd2 loop dm_mod 
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet 
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat 
nf_conntrack bonding nf_defrag_ipv6 nf_defrag_ipv4 tls ip_set rfkill 
nf_tables nfnetlink pseries_rng aes_gcm_p10_crypto crypto_simd 
vmx_crypto xfs sr_mod cdrom sd_mod sg ibmvscsi ibmveth 
scsi_transport_srp fuse
[  433.608065] CPU: 2 UID: 0 PID: 32051 Comm: check Kdump: loaded Not 
tainted 6.13.0-rc6-next-20250109 #1
[  433.608072] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202 
0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
[  433.608078] NIP:  c00000000073ce70 LR: c00000000073e69c CTR: 
c00000000073e658
[  433.608083] REGS: c00000000d367720 TRAP: 0700   Not tainted 
(6.13.0-rc6-next-20250109)
[  433.608089] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
44248802  XER: 20040000
[  433.608102] CFAR: c00000000073cdec IRQMASK: 0
[  433.608102] GPR00: c00000000073e69c c00000000d3679c0 c000000001644500 
c0000000040a4f80
[  433.608102] GPR04: 0000000000000000 0000000000000007 0000000000040004 
c00000000302a800
[  433.608102] GPR08: 0000000000400000 0000000000000001 0000000000000000 
0000000000002000
[  433.608102] GPR12: c00000000073e658 c00000000f7cdf00 0000000000000000 
0000000000000000
[  433.608102] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[  433.608102] GPR20: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[  433.608102] GPR24: c000000002b92dc8 c0000000953af100 0000000000000002 
c0000000953af140
[  433.608102] GPR28: 0000000000000000 c0000000016148b9 c0000000953af100 
c0000000040a4f80
[  433.608161] NIP [c00000000073ce70] __debugfs_file_get+0xcc/0x274
[  433.608168] LR [c00000000073e69c] open_proxy_open+0x44/0x1c4
[  433.608175] Call Trace:
[  433.608178] [c00000000d367a10] [c0000000007a10b4] 
selinux_file_open+0xdc/0x110
[  433.608186] [c00000000d367aa0] [c00000000060b640] 
do_dentry_open+0x2ec/0x720
[  433.608195] [c00000000d367af0] [c00000000060d370] vfs_open+0x44/0x128
[  433.608201] [c00000000d367b20] [c000000000628e8c] do_open+0x354/0x4fc
[  433.608208] [c00000000d367b80] [c00000000062fc60] path_openat+0x16c/0x344
[  433.608215] [c00000000d367c00] [c00000000062fef4] do_filp_open+0xbc/0x19c
[  433.608222] [c00000000d367d40] [c00000000060da20] 
do_sys_openat2+0x100/0x150
[  433.608229] [c00000000d367db0] [c00000000060de20] sys_openat+0x84/0xe0
[  433.608235] [c00000000d367e10] [c0000000000337e8] 
system_call_exception+0x138/0x330
[  433.608244] [c00000000d367e50] [c00000000000d05c] 
system_call_vectored_common+0x15c/0x2ec
[  433.608252] --- interrupt: 3000 at 0x7fff899ad0c4
[  433.608259] NIP:  00007fff899ad0c4 LR: 00007fff899ad0c4 CTR: 
0000000000000000
[  433.608264] REGS: c00000000d367e80 TRAP: 3000   Not tainted 
(6.13.0-rc6-next-20250109)
[  433.608269] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44248404  XER: 00000000
[  433.608284] IRQMASK: 0
[  433.608284] GPR00: 000000000000011e 00007fffce9eecd0 00007fff89ac7200 
ffffffffffffff9c
[  433.608284] GPR04: 000001003b659d40 0000000000000241 00000000000001b6 
0000000000000000
[  433.608284] GPR08: 0000000000000020 0000000000000000 0000000000000000 
0000000000000000
[  433.608284] GPR12: 0000000000000000 00007fff89beab20 000001003b661f30 
0000000121cd87b8
[  433.608284] GPR16: 0000000121cd89bc 0000000121cd8a50 0000000000000004 
0000000121cd89b8
[  433.608284] GPR20: 0000000000000241 00007fff89be3b30 000001003b659d40 
0000000000000000
[  433.608284] GPR24: 0000000000000241 00007fffce9eee50 0000000000000001 
0000000000000003
[  433.608284] GPR28: 0000000000000000 0000000121cd8260 000001003b5d6480 
00007fffce9eed10
[  433.608342] NIP [00007fff899ad0c4] 0x7fff899ad0c4
[  433.608346] LR [00007fff899ad0c4] 0x7fff899ad0c4
[  433.608349] --- interrupt: 3000
[  433.608352] Code: 38600000 38210050 7c6307b4 eba1ffe8 ebe1fff8 
4e800020 60000000 60000000 7c890034 fb810030 7c9c2378 5529d97e 
<0b090000> 2c240000 41820188 7c0802a6
[  433.608372] ---[ end trace 0000000000000000 ]---


This issue got introduced by the commit: 
f8f25893a477a4da4414c3e40ddd51d77fac9cfc.


Reverting the above commit, test case passes with out warnings.


Regards,

Venkat.


