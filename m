Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FB0725B1A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 11:54:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbjPV5Nndz3dxw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:54:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=anW9C/wt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=anW9C/wt;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbjNb2rHkz3bkD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 19:54:06 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3579edeD018426
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 7 Jun 2023 09:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=UI3cR3wjWkLxPqESeJg/C/98gkZFTM0g3CJvoIeqXFU=;
 b=anW9C/wt7d/AVDOiXGXZkfUa6VyZCckhnixx02Q7bUZ6hsZxhegv5d9D27Q7skJTJL00
 y0w2z7qe2+/0JPW30it6CRjeOktHvy3/OfvgB3BrVWSaqebZZg80E1C0bP5AEo6vGa/x
 B35BzxsBlSSxchuraSAEWOk02Nnc3BMI5Ks0LFVgiwEE1AdBekddxNj2yBgsCLBwT1+4
 cNSGL6uO7seaWUAi34U3Df8vTj3FlWZ2BfZ6IGLU9u1fXbXn0MUXpPAMUaAerWwp+nEJ
 jNY1gim4H7Mab+sOaNE1qiSkiPfjwqVxDvP6pvnoRfG9R92LH0qMFSjiKYekBZpLuvtw XQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2q638vt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 09:54:06 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35776vHn013450
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 7 Jun 2023 09:54:04 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3r2a7a88e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 09:54:04 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3579s0iT16908948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jun 2023 09:54:00 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D00D620043;
	Wed,  7 Jun 2023 09:54:00 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5847620040;
	Wed,  7 Jun 2023 09:54:00 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.192])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jun 2023 09:54:00 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: WARNING at arch/powerpc/mm/book3s64/radix_tlb.c:991 (flush_all_mm)
Message-Id: <87BFD164-09AC-44A7-ABE3-8CBAF6F126D1@linux.ibm.com>
Date: Wed, 7 Jun 2023 15:23:49 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mOHSGUnwez0JRYoRXJVyjdHGRAeypEDM
X-Proofpoint-ORIG-GUID: mOHSGUnwez0JRYoRXJVyjdHGRAeypEDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_06,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=478 priorityscore=1501
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070077
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
Cc: haren@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running powerpc selftests on a Power10 LPAR, following warning
is seen:

[   43.878929] MCE: CPU25: PID: 6025 Comm: inject-ra-err NIP: =
[0000000010000e48]
[   43.878933] MCE: CPU25: Initiator CPU
[   43.878935] MCE: CPU25: Unknown
[   43.906866] ------------[ cut here ]------------
[   43.906870] WARNING: CPU: 25 PID: 6025 at =
arch/powerpc/mm/book3s64/radix_tlb.c:991 __flush_all_mm+0x1c0/0x2c0
[   43.906878] Modules linked in: dm_mod(E) nft_fib_inet(E) =
nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) =
nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) =
nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) =
nf_defrag_ipv4(E) bonding(E) tls(E) rfkill(E) ip_set(E) sunrpc(E) =
nf_tables(E) nfnetlink(E) pseries_rng(E) aes_gcm_p10_crypto(E) drm(E) =
drm_panel_orientation_quirks(E) xfs(E) libcrc32c(E) sd_mod(E) t10_pi(E) =
sr_mod(E) crc64_rocksoft_generic(E) cdrom(E) crc64_rocksoft(E) crc64(E) =
sg(E) ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) vmx_crypto(E) fuse(E)
[   43.906917] CPU: 25 PID: 6025 Comm: inject-ra-err Kdump: loaded =
Tainted: G   M        E      6.4.0-rc5-00016-ga4d7d7011219 #2
[   43.906922] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
[   43.906925] NIP:  c0000000000a94a0 LR: c00000000011b7d4 CTR: =
000000000000007b
[   43.906929] REGS: c0000000ded9b8c0 TRAP: 0700   Tainted: G   M        =
E       (6.4.0-rc5-00016-ga4d7d7011219)
[   43.906933] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 24002484  XER: 20040000
[   43.906942] CFAR: c0000000000a930c IRQMASK: 0  [   43.906942] GPR00: =
c00000000011b7d4 c0000000ded9bb60 c0000000014a1500 c0000000aaf15a00  [   =
43.906942] GPR04: 0000000000000000 00000000802a000c c0000000aaf15a00 =
00000000802a000b  [   43.906942] GPR08: 003ffff800000201 =
0000000000000000 003ffff800000200 0000000000000001  [   43.906942] =
GPR12: c000000000159cc0 c00000135faaf300 0000000000000000 =
0000000000000000  [   43.906942] GPR16: 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000  [   43.906942] =
GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000  [   43.906942] GPR24: 0000000000000000 =
0000000000000000 0000000000000000 c000000004208580  [   43.906942] =
GPR28: c0000000025f9930 c000000002b9c038 ffffffffffffffff =
c0000000a0a58600  [   43.906979] NIP [c0000000000a94a0] =
__flush_all_mm+0x1c0/0x2c0
[   43.906982] LR [c00000000011b7d4] vas_deallocate_window+0x174/0x300
[   43.906987] Call Trace:
[   43.906988] [c0000000ded9bb60] [c0000000ded9bbb0] 0xc0000000ded9bbb0 =
(unreliable)
[   43.906994] [c0000000ded9bbb0] [c00000000011b918] =
vas_deallocate_window+0x2b8/0x300
[   43.906998] [c0000000ded9bc30] [c00000000011cec0] =
coproc_release+0x60/0xb0
[   43.907002] [c0000000ded9bc60] [c0000000005a86f8] __fput+0xc8/0x350
[   43.907008] [c0000000ded9bcb0] [c000000000196c14] =
task_work_run+0xe4/0x170
[   43.907014] [c0000000ded9bd00] [c00000000016940c] do_exit+0x2fc/0x590
[   43.907019] [c0000000ded9bdb0] [c0000000001698ec] =
do_group_exit+0x4c/0xc0
[   43.907023] [c0000000ded9bdf0] [c000000000169988] =
sys_exit_group+0x28/0x30
[   43.907027] [c0000000ded9be10] [c000000000034adc] =
system_call_exception+0x13c/0x340
[   43.907033] [c0000000ded9be50] [c00000000000d05c] =
system_call_vectored_common+0x15c/0x2ec
[   43.907038] --- interrupt: 3000 at 0x7fffa0b0c2c4
[   43.907041] NIP:  00007fffa0b0c2c4 LR: 0000000000000000 CTR: =
0000000000000000
[   43.907043] REGS: c0000000ded9be80 TRAP: 3000   Tainted: G   M        =
E       (6.4.0-rc5-00016-ga4d7d7011219)
[   43.907047] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 42002822  XER: 00000000
[   43.907056] IRQMASK: 0  [   43.907056] GPR00: 00000000000000ea =
00007fffc8ab87f0 00007fffa0e87e00 0000000000000000  [   43.907056] =
GPR04: 0000000000000000 000000003da602a0 00007fffa0e81200 =
0000000000000000  [   43.907056] GPR08: 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000  [   43.907056] =
GPR12: 0000000000000000 00007fffa0e8a5a0 0000000000000000 =
0000000000000000  [   43.907056] GPR16: 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000  [   43.907056] =
GPR20: 0000000000000000 0000000000000000 0000000000000001 =
0000000000000001  [   43.907056] GPR24: 00007fffa0c423c0 =
0000000000000000 00007fffa0c40a38 0000000000000000  [   43.907056] =
GPR28: 0000000000000001 00007fffa0e835b0 fffffffffffff000 =
0000000000000000  [   43.907090] NIP [00007fffa0b0c2c4] 0x7fffa0b0c2c4
[   43.907092] LR [0000000000000000] 0x0
[   43.907094] --- interrupt: 3000
[   43.907096] Code: 39000002 38c00400 38a00000 38800000 38600000 =
4bf6c0b5 60000000 4bffff10 7fc3f378 38800002 4bffe371 4bfffe9c =
<0fe00000> 7c0802a6 fbe10048 f8010060  [   43.907108] ---[ end trace =
0000000000000000 ]=E2=80=94


- Sachin

