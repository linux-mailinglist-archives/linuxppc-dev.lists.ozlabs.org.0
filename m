Return-Path: <linuxppc-dev+bounces-7499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE5A7E9CC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 20:19:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWctj35xKz2xdL;
	Tue,  8 Apr 2025 04:19:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744049981;
	cv=none; b=cCnuonp7CWbOIyyf2sIABQFGRvkkrLmn1dvNV181ruvEML673ZlKkL1zZhOyIEHxICp9zCW1JizPXyWp4NPgsmdrkUhNwW2PHHQ3olr9ucQ6dWsFvd7v+2/sYDBqf6zON3FujAZPzaswKZRE5kIhcJAzrzHKeIoHkLnqpeasP2sh5KIE6gxCNCNpRBe2dafIye61Thpg+QDqV2MWhsk0dfpqnrnCnHPY+B0zqrnqbftNTZ3vrnu1gbaCACS/WPa/tCEhwBX/A2qLJidWaNf3HcwziyWELlxwaZiWPQoiVZ3V4T5FWaPE0a8ACqExucgUXllB1g9XcAcp1BhdsK4xWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744049981; c=relaxed/relaxed;
	bh=SsiXmkjpxWpWXtGgTVa6dLzbh0ktON13ReGN0efbFcY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=OuDKm1LNBTfOI5RuIGlTmBBefqEziansK3VQZsCxPHslF9C7zzaZsgKpsCziQslX0iIaAi81Z5kxbYzf6G+XYRpv+A4l00oY1QX9JqtD4PzM5GhTBObZ2S5ArcoY2p4Q1t/7FjDlI0em86H7YIPJVgSCgaae7G0rkvJhfV2w3kpp+SdMcuGRoBEO5ATE00o2+QmIaYOnk1nm/Njf8frHLKpscDkFiq1wXjocprnCCxpXS51Cpx7cMXPx27iHzkEwI4zmPZF4G4dPPyZh4LftyDrENHAVoWwK3S2aa9wDFzJrOlfMrET/JUh+fbvbryO+fNTRT/95Ez9OTIc1ugTVUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D409supu; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D409supu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWctg6yJXz2xRx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 04:19:39 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537HBWpi005794;
	Mon, 7 Apr 2025 18:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=SsiXmkjpxWpWXtGgTVa6dLzbh0kt
	ON13ReGN0efbFcY=; b=D409supuSn3gnL74BCugiCiWD51zfi/dcyZuxarEI3Ko
	SCOoQZFeCGGZNXfoPrMD3YI3wAmvKE9nvxDAEmxQg+l4Etgyt7ZCOznVqupnxYhU
	ePbArFAq0gqxyGUUo7fxL+9wwBmTUa0kCOEuoZcH/ULqoYxa+Iah8NAiCmkF/KX6
	KndGkYHo+5btDQcy2RFwrn2jPOrC0Eynf1eIX8UDSDSg/8NjZPUbzE7xZRqeMN/0
	0km1gmIQv3F1D14vGN2/Y58kRroqtQF6bDXOJcHprMR1hgfF8t6LbjOclb1foBEp
	W9CsMK9WThaYEAd5AABoAeza7C2YwWLITj7NC7IHnw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45vjvxg9f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 18:19:33 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 537HxDJG011069;
	Mon, 7 Apr 2025 18:19:33 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45uf7yf7w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 18:19:32 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 537IJVcC50528712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 18:19:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8A6320043;
	Mon,  7 Apr 2025 18:19:30 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16B1820040;
	Mon,  7 Apr 2025 18:19:29 +0000 (GMT)
Received: from [9.43.100.133] (unknown [9.43.100.133])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Apr 2025 18:19:28 +0000 (GMT)
Message-ID: <3c239727-6c46-45c2-80e7-d6853427f72c@linux.ibm.com>
Date: Mon, 7 Apr 2025 23:49:27 +0530
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
Content-Language: en-US
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-crypto@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: kexec is not working in 6.15-rc1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2Y7QNhaSE5g1oWjxPyeBaxqJI4KmeudN
X-Proofpoint-GUID: 2Y7QNhaSE5g1oWjxPyeBaxqJI4KmeudN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_05,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070125
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello All,

I noticed that kexec is broken on the upstream v6.15-rc1 kernel.

My testing was limited to PowerPC (pSeries), but it's possible that 
other architectures may have a similar issue.

Both the first and kexec kernel are v6.15-rc1.

Distro: RHEL

Kexec command to load kexec kernel:
-------------------------------------------------------
kexec --initrd=/boot/initramfs-`uname -r`.img /boot/vmlinuz-`uname -r` 
--append="`cat /proc/cmdline`" -lsd

To kexec into new kernel:
------------------------------------
reboot


Console log:
-----------------

[   90.405318] dracut: Disassembling device-mapper devices
[   90.892608] Removing IBM Power 842 compression device
[   90.892635] Kernel attempted to read user page (4fbcaf0008) - exploit 
attempt? (uid: 0)
[   90.892642] BUG: Unable to handle kernel data access on read at 
0x4fbcaf0008
[   90.892647] Faulting instruction address: 0xc000000000845eb0
[   90.892652] Oops: Kernel access of bad area, sig: 11 [#1]
[   90.892655] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=2048 NUMA pSeries
[   90.892661] Modules linked in: xsk_diag nft_fib_inet nft_fib_ipv4 
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 
nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 
nf_defrag_ipv4 bonding tls rfkill ip_set nf_tables nfnetlink binfmt_misc 
pseries_rng vmx_crypto drm drm_panel_orientation_quirks xfs sd_mod sg 
ibmvscsi ibmveth scsi_transport_srp pseries_wdt dm_mirror dm_region_hash 
vfio_pci dm_log vfio_pci_core irqbypass dm_mod vfio_iommu_spapr_tce vfio 
iommufd fuse
[   90.892714] CPU: 14 UID: 0 PID: 6192 Comm: kexec Kdump: loaded Not 
tainted 6.15.0-rc1 #10 VOLUNTARY
[   90.892723] Hardware name: IBM,9824-42A Power11 (architected) 
0x820200 0xf000007 of:IBM,FW1110.00 (NL1110_015) hv:phyp pSeries
[   90.892730] NIP:  c000000000845eb0 LR: c000000000845ee0 CTR: 
c000000000845f2c
[   90.892734] REGS: c00000019964f6e0 TRAP: 0300   Not tainted (6.15.0-rc1)
[   90.892741] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
48088288  XER: 2004000a
[   90.892752] CFAR: c000000000845ef4 DAR: 0000004fbcaf0008 DSISR: 
40000000 IRQMASK: 0
[   90.892752] GPR00: c00000000082e808 c00000019964f980 c000000001b38100 
0000000000000000
[   90.892752] GPR04: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[   90.892752] GPR08: 0000000000000000 0000004fbcaf0000 0000000000000000 
0000000000008000
[   90.892752] GPR12: c000000000845f2c c000004fbfff2480 0000000000000000 
0000000000000000
[   90.892752] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[   90.892752] GPR20: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[   90.892752] GPR24: 0000000000000000 0000000000000000 0000000000000000 
c0000000015e11d8
[   90.892752] GPR28: 0000000000000000 c000000002c5b8b0 c000000002cc6bc0 
0000000000000000
[   90.892796] NIP [c000000000845eb0] scomp_free_streams+0x6c/0xe8
[   90.892803] LR [c000000000845ee0] scomp_free_streams+0x9c/0xe8
[   90.892808] Call Trace:
[   90.892810] [c00000019964f980] [c00000019964f988] 0xc00000019964f988 
(unreliable)
[   90.892816] [c00000019964f9d0] [c00000000082e808] 
crypto_destroy_alg+0x48/0x7c
[   90.892822] [c00000019964fa00] [c000000000832ec4] 
crypto_unregister_alg+0x104/0x180
[   90.892829] [c00000019964faa0] [c0000000008460bc] 
crypto_unregister_scomp+0x24/0x38
[   90.892834] [c00000019964fac0] [c000000000cce9d8] nx842_remove+0x88/0x120
[   90.892841] [c00000019964fb50] [c000000000112a2c] 
vio_bus_remove+0x58/0xcc
[   90.892848] [c00000019964fb90] [c000000000b0853c] 
device_shutdown+0x220/0x3b4
[   90.892856] [c00000019964fc20] [c0000000001a2f14] 
kernel_restart_prepare+0x54/0x68
[   90.892863] [c00000019964fc40] [c0000000002af1dc] kernel_kexec+0x84/0x118
[   90.892869] [c00000019964fcb0] [c0000000001a35e4] 
__do_sys_reboot+0x210/0x2c4
[   90.892877] [c00000019964fe10] [c0000000000308f4] 
system_call_exception+0x124/0x320
[   90.892885] [c00000019964fe50] [c00000000000cedc] 
system_call_vectored_common+0x15c/0x2ec
[   90.892893] --- interrupt: 3000 at 0x7fffa40cf970
[   90.892898] NIP:  00007fffa40cf970 LR: 00007fffa40cf970 CTR: 
0000000000000000
[   90.892902] REGS: c00000019964fe80 TRAP: 3000   Not tainted (6.15.0-rc1)
[   90.892909] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48022884  XER: 00000000
[   90.892919] IRQMASK: 0
[   90.892919] GPR00: 0000000000000058 00007fffe2c644d0 0000000116c37f00 
fffffffffee1dead
[   90.892919] GPR04: 0000000028121969 0000000045584543 0000000000000000 
0000000000000003
[   90.892919] GPR08: 0000000000100000 0000000000000000 0000000000000000 
0000000000000000
[   90.892919] GPR12: 0000000000000000 00007fffa433b2e0 0000000116c2f568 
ffffffffffffffff
[   90.892919] GPR16: 0000000116c10b98 0000000000000000 0000000000000002 
0000000000000000
[   90.892919] GPR20: 0000000137e81060 0000000000008913 0000000000000000 
0000000000008914
[   90.892919] GPR24: 0000000000000001 0000000000000003 0000000000000003 
00007fffe2c64590
[   90.892919] GPR28: 0000000116c0ade0 0000000116c0add8 00007fffa41c19c0 
0000000137e81080
[   90.892959] NIP [00007fffa40cf970] 0x7fffa40cf970
[   90.892963] LR [00007fffa40cf970] 0x7fffa40cf970
[   90.892966] --- interrupt: 3000
[   90.892968] Code: 3d22ffab 3b6990d8 f8010010 f821ffb1 f8410018 
eb4301a0 7f5cd378 48000034 3d220119 3929a268 7d29502a 7d29e214 
<e8690008> 2c230000 41820040 e99d0008
[   90.892982] ---[ end trace 0000000000000000 ]---
[   90.895452] pstore: backend (nvram) writing error (-1)
[   90.895456]
[   91.895460] Kernel panic - not syncing: Fatal exception
[   91.903894] Rebooting in 10 seconds..


Git bisect identified the first bad commit as:
---------------------------------------------------------------

27b13425349e94ad77b174b032674097cab241c8 is the first bad commit
commit 27b13425349e94ad77b174b032674097cab241c8
Author: Herbert Xu <herbert@gondor.apana.org.au>
Date:   Sun Mar 16 17:50:24 2025 +0800

     crypto: api - Call crypto_alg_put in crypto_unregister_alg

     Instead of calling cra_destroy by hand, call it through
     crypto_alg_put so that the correct unwinding functions are called
     through crypto_destroy_alg.

     Fixes: 3d6979bf3bd5 ("crypto: api - Add cra_type->destroy hook")
     Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

  crypto/algapi.c | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)


Git bisect log:
-------------------

[root@root linux]# git bisect log
git bisect start
# status: waiting for both good and bad commits
# bad: [0af2f6be1b4281385b618cb86ad946eded089ac8] Linux 6.15-rc1
git bisect bad 0af2f6be1b4281385b618cb86ad946eded089ac8
# status: waiting for good commit(s), bad commit known
# good: [e3185ee438c28ee926cb3ef26f3bfb0aae510606] powerpc/crash: use 
generic crashkernel reservation
git bisect good e3185ee438c28ee926cb3ef26f3bfb0aae510606
# good: [a9fc2304972b1db28b88af8203dffef23e1e92ba] Merge tag 
'soc-drivers-6.15-1' of 
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good a9fc2304972b1db28b88af8203dffef23e1e92ba
# bad: [1c83601b8ffc1b4ba8dc7f35151131707a8a5ae7] Merge tag 'mips_6.15' 
of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
git bisect bad 1c83601b8ffc1b4ba8dc7f35151131707a8a5ae7
# good: [a82866fbecca6961c00edb2035ad66478571012c] Merge tag 
'amd-drm-next-6.15-2025-03-21' of 
https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect good a82866fbecca6961c00edb2035ad66478571012c
# good: [f174ac5ba2d0c77b406b3f73bdcde819d6ed6704] Merge tag 
'ipe-pr-20250324' of git://git.kernel.org/pub/scm/linux/kernel/git/wufan/ipe
git bisect good f174ac5ba2d0c77b406b3f73bdcde819d6ed6704
# good: [7d06015d936c861160803e020f68f413b5c3cd9d] Merge tag 
'pci-v6.15-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
git bisect good 7d06015d936c861160803e020f68f413b5c3cd9d
# bad: [0ccff074d6aa45835ccb7c0e4a995a32e4c90b5a] Merge tag 
'for-linus-fwctl' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
git bisect bad 0ccff074d6aa45835ccb7c0e4a995a32e4c90b5a
# good: [c3e054dbdb08fef653ea3ef9e6dca449a214c976] crypto: api - Move 
struct crypto_type into internal.h
git bisect good c3e054dbdb08fef653ea3ef9e6dca449a214c976
# good: [b03d542c3c9569f549b1ba0cf7f4d90151fbf8ab] PM: hibernate: Use 
crypto_acomp interface
git bisect good b03d542c3c9569f549b1ba0cf7f4d90151fbf8ab
# good: [7e9dd0d1e9c50cedef403d4bef6a2c1dc22ac79d] pds_core: add new 
fwctl auxiliary_device
git bisect good 7e9dd0d1e9c50cedef403d4bef6a2c1dc22ac79d
# good: [fce8b8d5986b76a4fdd062e3eec1bb6420fee6c5] crypto: remove 
obsolete 'comp' compression API
git bisect good fce8b8d5986b76a4fdd062e3eec1bb6420fee6c5
# bad: [8b54e6a8f4156ed43627f40300b0711dc977fbc1] crypto: testmgr - Add 
multibuffer hash testing
git bisect bad 8b54e6a8f4156ed43627f40300b0711dc977fbc1
# bad: [27b13425349e94ad77b174b032674097cab241c8] crypto: api - Call 
crypto_alg_put in crypto_unregister_alg
git bisect bad 27b13425349e94ad77b174b032674097cab241c8
# good: [5a06ef1f8da226b2de587e22c17f88b72cede3be] crypto: scompress - 
Fix incorrect stream freeing
git bisect good 5a06ef1f8da226b2de587e22c17f88b72cede3be
# first bad commit: [27b13425349e94ad77b174b032674097cab241c8] crypto: 
api - Call crypto_alg_put in crypto_unregister_alg


Thanks,
Sourabh Jain


