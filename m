Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 308EB719A13
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 12:47:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX2sQ5sNtz3dx2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 20:47:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kVPz6DMy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kVPz6DMy;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX2rX3Hvlz3bbZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 20:47:07 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351AbpdG027899;
	Thu, 1 Jun 2023 10:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=Ss5Ip5q87i2K9GPBLs4GJuNMJrws5AXbQIEe+iZEswY=;
 b=kVPz6DMyl+UHDR4ShUh69LoS1pCFuPF24FOKFGsnhZ58CfsebdYLKGA4W2ZrW0ua7mQC
 QFZiVE60TdEUDQlDpOYVYSw1LxpSzmkpAQZzeBglITD5RYX3ptjs+F3hCpDekF2gTG8r
 jcNHf7kY290FzNlY/eJhxAf0xiSIOLpO+3HVbe8FSb9NN62ySiTxvV10gWDxj3H/QlKj
 6x7kqi8IpC15wpjnFqmtLmfx/DTryVxdYeVfZY1a+SmNBMEJGGdrf08WxcJy3MiLDbjs
 vkh6FVJaLCp7qXjfSAKrDwyorDBmWFwKnOrVJHrAq+g2Vo0dPJjcol2JdHw5d61sViyK 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qxsregbyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 10:47:00 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 351AcA8W029045;
	Thu, 1 Jun 2023 10:47:00 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qxsregbxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 10:46:59 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3511S6a2016865;
	Thu, 1 Jun 2023 10:46:58 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qu9g5afmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 10:46:57 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 351AktFO5046896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Jun 2023 10:46:55 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 991AD20043;
	Thu,  1 Jun 2023 10:46:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B58E920049;
	Thu,  1 Jun 2023 10:46:54 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.106.208])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Jun 2023 10:46:54 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: WARN at kernel/sched/core.c:5358 (kthread_end_lazy_tlb_mm)
Message-Id: <A9A5D83D-BA70-47A4-BCB4-30C1AE19BC22@linux.ibm.com>
Date: Thu, 1 Jun 2023 16:16:43 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mYNYI3lrSvQ52vgJP9gM-vzaciXvA4Bk
X-Proofpoint-GUID: xaJAlDQbVfMYXcbI5JtPKAU_Le48AQhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_07,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=918 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010095
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
Cc: linux-mm@kvack.org, Nick Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While compiling a kernel on a IBM Power system booted with
6.4.0-rc4-next-20230601 following warning is observed

[  276.351697] ------------[ cut here ]------------
[  276.351709] WARNING: CPU: 27 PID: 9237 at kernel/sched/core.c:5358 =
kthread_end_lazy_tlb_mm+0x90/0xa0
[  276.351719] Modules linked in: dm_mod nft_fib_inet nft_fib_ipv4 =
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 =
nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 =
nf_defrag_ipv4 bonding tls rfkill ip_set nf_tables nfnetlink sunrpc =
pseries_rng aes_gcm_p10_crypto xfs libcrc32c sd_mod sr_mod t10_pi =
crc64_rocksoft_generic cdrom crc64_rocksoft crc64 sg ibmvscsi =
scsi_transport_srp ibmveth vmx_crypto fuse
[  276.351752] CPU: 27 PID: 9237 Comm: cc1 Kdump: loaded Not tainted =
6.4.0-rc4-next-20230601 #1
[  276.351756] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
[  276.351759] NIP:  c0000000001b8c10 LR: c0000000000a8d54 CTR: =
c00000000046ec00
[  276.351763] REGS: c0000000dce337d0 TRAP: 0700   Not tainted  =
(6.4.0-rc4-next-20230601)
[  276.351766] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
24002228  XER: 00000000
[  276.351774] CFAR: c0000000001b8ba0 IRQMASK: 0  [  276.351774] GPR00: =
c0000000000a8d54 c0000000dce33a70 c0000000014a1800 c000000007852a00  [  =
276.351774] GPR04: 0000000000000001 ffffffffffffffff 0000000000000000 =
c000000007852f78  [  276.351774] GPR08: 0000000000000000 =
0000000000000000 0000000000000000 0000000024002428  [  276.351774] =
GPR12: c0000000a032b608 c00000135faa5b00 0000000000000000 =
0000000000000000  [  276.351774] GPR16: 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000  [  276.351774] =
GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000  [  276.351774] GPR24: 0000000000000000 =
0000000000000000 0000000000000000 c000000007852a70  [  276.351774] =
GPR28: 0000000000000000 0000000000000000 000000000000001b =
c000000007852a00  [  276.351810] NIP [c0000000001b8c10] =
kthread_end_lazy_tlb_mm+0x90/0xa0
[  276.351814] LR [c0000000000a8d54] exit_lazy_flush_tlb+0xf4/0x110
[  276.351818] Call Trace:
[  276.351820] [c0000000dce33a70] [0000000000000001] 0x1 (unreliable)
[  276.351825] [c0000000dce33ab0] [c0000000000a8fbc] =
flush_type_needed+0x24c/0x260
[  276.351829] [c0000000dce33af0] [c0000000000a91a8] =
__flush_all_mm+0x48/0x2c0
[  276.351833] [c0000000dce33b40] [c0000000004d6dcc] =
tlb_finish_mmu+0x16c/0x230
[  276.351839] [c0000000dce33b70] [c0000000004d2a2c] =
exit_mmap+0x17c/0x4c0
[  276.351844] [c0000000dce33c90] [c000000000159120] __mmput+0x60/0x1e0
[  276.351849] [c0000000dce33cc0] [c0000000001689cc] exit_mm+0xdc/0x170
[  276.351853] [c0000000dce33d00] [c000000000168cec] do_exit+0x28c/0x580
[  276.351857] [c0000000dce33db0] [c00000000016922c] =
do_group_exit+0x4c/0xc0
[  276.351861] [c0000000dce33df0] [c0000000001692c8] =
sys_exit_group+0x28/0x30
[  276.351866] [c0000000dce33e10] [c000000000034adc] =
system_call_exception+0x13c/0x340
[  276.351871] [c0000000dce33e50] [c00000000000d05c] =
system_call_vectored_common+0x15c/0x2ec
[  276.351876] --- interrupt: 3000 at 0x7fffa330c2c4
[  276.351879] NIP:  00007fffa330c2c4 LR: 0000000000000000 CTR: =
0000000000000000
[  276.351882] REGS: c0000000dce33e80 TRAP: 3000   Not tainted  =
(6.4.0-rc4-next-20230601)
[  276.351885] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44002422  XER: 00000000
[  276.351894] IRQMASK: 0  [  276.351894] GPR00: 00000000000000ea =
00007fffed1a4ca0 00007fffa3a77e00 0000000000000000  [  276.351894] =
GPR04: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000  [  276.351894] GPR08: 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000  [  276.351894] =
GPR12: 0000000000000000 00007fffa3a7cac0 0000000000000000 =
0000000000000000  [  276.351894] GPR16: 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000  [  276.351894] =
GPR20: 0000000000000000 0000000000000000 000000000000003a =
0000000000000001  [  276.351894] GPR24: 00007fffa34423c0 =
0000000000000000 00007fffa3440a38 0000000000000000  [  276.351894] =
GPR28: 0000000000000001 00007fffa3a75e48 fffffffffffff000 =
0000000000000000  [  276.351928] NIP [00007fffa330c2c4] 0x7fffa330c2c4
[  276.351930] LR [0000000000000000] 0x0
[  276.351932] --- interrupt: 3000
[  276.351935] Code: 38210020 e8010010 7c0803a6 4e800020 0fe00000 =
60000000 60000000 60000000 4e800020 60000000 60000000 60000000 =
<0fe00000> 60000000 60000000 60000000  [  276.351946] ---[ end trace =
0000000000000000 ]=E2=80=94

Git bisect points to following code change:

commit 253808d464bf472c66d299faa3d8ffb65149f4da
     lazy tlb: consolidate lazy tlb mm switching

- Sachin

