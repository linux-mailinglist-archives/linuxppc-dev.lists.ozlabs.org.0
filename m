Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C70E7CBEC9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 11:18:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BBOkZpng;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8pKz2hNQz3fNd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 20:17:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BBOkZpng;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8pK425jDz30YZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 20:17:11 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39H9Ea5M018239;
	Tue, 17 Oct 2023 09:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=xN7Xz7bdiV5FnscEEpFBNx8e2AdVqvL557a7SjDjUCc=;
 b=BBOkZpngSynpO7I96rj6RaYMTlDSJ16LvmA5XFsYg8fJUW+xo4NbCKs/aSicy1cnyz6e
 vqmAev1N+pE9WpPx3VmYu+LfjyoMSV5Er+pQqv6dkbaV0anwyiY+FfO4LTgoT3h6doRQ
 NMpV+lC0dlK3bckH/O8J+uVHS9cD0eT3hrtAiz3n02sGYKc988ixC+qtkGG6Df0pyBzr
 OYxhtBpbreG28bs/Ld7DnB/XZuqc8Qth77TnW8nUQ+vVJ1i0bfWM+MAiuzi0zwlaVASD
 gJDHugxrMn6v2TlmN4ShViGNh3/9dNlt+CKP9fOe3MZil71W+VzX+fiYlchBMX4S3S8y tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsqf58566-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 09:17:03 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39H9EnKt019342;
	Tue, 17 Oct 2023 09:16:58 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsqf584a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 09:16:57 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39H8sxfW012850;
	Tue, 17 Oct 2023 09:16:22 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr5py7uq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 09:16:22 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39H9GJc237945844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Oct 2023 09:16:19 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50D702004B;
	Tue, 17 Oct 2023 09:16:19 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3783B20043;
	Tue, 17 Oct 2023 09:16:18 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.80.84])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Oct 2023 09:16:17 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: [powerpc] Kernel crash while running LTP (bisected)
Message-Id: <81C9E2C1-DCC3-4DDD-8466-069893398B5B@linux.ibm.com>
Date: Tue, 17 Oct 2023 14:46:07 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, lstoakes@gmail.com
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: otCDU0km5g1xxX2zAESsEmX8oPRpQBzX
X-Proofpoint-GUID: j6wSEwpGQIVJ5sULyiTY_orJXecYQi4D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_13,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=672 mlxscore=0
 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310170076
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
Cc: linux-mm@kvack.org, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running LTP tests (getpid02) on a Power10 server booted with
6.6.0-rc6-next-20231016 following crash was seen:

[   76.386628] Kernel attempted to read user page (d8) - exploit =
attempt? (uid: 0)
[   76.386649] BUG: Kernel NULL pointer dereference on read at =
0x000000d8
[   76.386653] Faulting instruction address: 0xc0000000004cda90
[   76.386658] Oops: Kernel access of bad area, sig: 11 [#1]
[   76.386661] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D8192 NUMA =
pSeries
[   76.386667] Modules linked in: rpadlpar_io rpaphp xsk_diag =
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet =
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat =
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding rfkill tls ip_set =
nf_tables nfnetlink sunrpc pseries_rng vmx_crypto aes_gcm_p10_crypto =
binfmt_misc xfs libcrc32c sd_mod t10_pi sr_mod cdrom crc64_rocksoft =
crc64 sg ibmvscsi ibmveth scsi_transport_srp fuse
[   76.386709] CPU: 22 PID: 5763 Comm: getpid02 Kdump: loaded Not =
tainted 6.6.0-rc6-next-20231016 #3
[   76.386713] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
[   76.386718] NIP:  c0000000004cda90 LR: c0000000004cd840 CTR: =
0000000000000000
[   76.386721] REGS: c0000001f491b840 TRAP: 0300   Not tainted  =
(6.6.0-rc6-next-20231016)
[   76.386724] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
48082804  XER: 00000000
[   76.386733] CFAR: c0000000004cd848 DAR: 00000000000000d8 DSISR: =
40000000 IRQMASK: 0
[   76.386733] GPR00: c0000000004cd840 c0000001f491bae0 c000000001471a00 =
0000000000000000
[   76.386733] GPR04: 00000000000000fb 0000000000000000 0000000000000000 =
0000000000000001
[   76.386733] GPR08: 00000000000001c4 c0000001fb8aa830 c0000001e5140d00 =
c0000001eccfac00
[   76.386733] GPR12: 000000000000001f c000000e87bf7300 0000000000000000 =
0000000000000000
[   76.386733] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[   76.386733] GPR20: 00007fff9944ffff 0000000000000000 c0000001e86bdd60 =
c0000001e86be8e0
[   76.386733] GPR24: 0000000000000001 0000000000000001 0000000000000001 =
0000000000000000
[   76.386733] GPR28: 00000000000000fb c0000001e5140d00 00007fff99440000 =
c0000001fb8aa830
[   76.386773] NIP [c0000000004cda90] mmap_region+0x8b0/0xb30
[   76.386781] LR [c0000000004cd840] mmap_region+0x660/0xb30
[   76.386784] Call Trace:
[   76.386786] [c0000001f491bae0] [c0000000004cd840] =
mmap_region+0x660/0xb30 (unreliable)
[   76.386791] [c0000001f491bc10] [c0000000004ce0dc] do_mmap+0x3cc/0x5c0
[   76.386794] [c0000001f491bca0] [c000000000486724] =
vm_mmap_pgoff+0x134/0x240
[   76.386800] [c0000001f491bd80] [c0000000004c98a8] =
ksys_mmap_pgoff+0x158/0x2b0
[   76.386806] [c0000001f491bdf0] [c000000000011834] do_mmap2+0x54/0xc0
[   76.386811] [c0000001f491be10] [c000000000036624] =
system_call_exception+0x134/0x330
[   76.386817] [c0000001f491be50] [c00000000000d6a0] =
system_call_common+0x160/0x2e4
[   76.386822] --- interrupt: c00 at 0x7fff9932ff68
[   76.386825] NIP:  00007fff9932ff68 LR: 0000000010005074 CTR: =
0000000000000000
[   76.386828] REGS: c0000001f491be80 TRAP: 0c00   Not tainted  =
(6.6.0-rc6-next-20231016)
[   76.386831] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24002204  XER: 00000000
[   76.386840] IRQMASK: 0
[   76.386840] GPR00: 000000000000005a 00007fffd709f9f0 00007fff99407300 =
0000000000000000
[   76.386840] GPR04: 0000000000000004 0000000000000003 0000000000000021 =
ffffffffffffffff
[   76.386840] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[   76.386840] GPR12: 0000000000000000 00007fff994ea3d0 0000000000000000 =
0000000000000000
[   76.386840] GPR16: ffffffffffffffff 0000000010034498 0000000010034be8 =
00000000100336a8
[   76.386840] GPR20: 0000000010034ba8 0000000000000001 000000001007c418 =
0000000010033770
[   76.386840] GPR24: 0000000000000000 0000000000000000 0000000010034bd0 =
000000001007c438
[   76.386840] GPR28: 0000000010061c88 00007fffd70afed5 000000001007c438 =
0000000010033770
[   76.386876] NIP [00007fff9932ff68] 0x7fff9932ff68
[   76.386879] LR [0000000010005074] 0x10005074
[   76.386881] --- interrupt: c00
[   76.386883] Code: 73890008 4082012c e93f0020 3b000000 fb7f0078 =
4bfffc74 60000000 60000000 e87f0088 3b000000 4bffff20 60000000 =
<e93b00d8> 39490044 7d005028 3108ffff  [   76.386896] ---[ end trace =
0000000000000000 ]---
[   76.388667] pstore: backend (nvram) writing error (-1)

Git bisect points to following patch

commit 1db41d29b79ad271674081c752961edd064bbbac
    mm: perform the mapping_map_writable() check after call_mmap()

Reverting the patch allows the test to complete.

- Sachin=
