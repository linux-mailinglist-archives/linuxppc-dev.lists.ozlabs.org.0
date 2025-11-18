Return-Path: <linuxppc-dev+bounces-14231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 276DCC67499
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 05:42:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9X5d60Pqz2yjm;
	Tue, 18 Nov 2025 15:42:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763440933;
	cv=none; b=LsM3dceCCpIn4m7T+yQOjsQik5gzw9vKmAUvxCbiTQaSpylAmGIZMT1RoV96DVPino02GXXxVeNnlfqPyDMdRjS4mw+9oJzsh45r0J/tFZLl2N81jq2r+JLzXMQ1aYtzKUr2/bIiZS3wwUAGMU345p8Os0Inq0BY/yRIkbPxwyuAjIVIp2XQBAqhKRHU5ldEDF5UfmWotQV4ozSWd+g0KCZW/gOuVjPD+hqhvxrne7K44Zu/MyPUaWFuVuxyrEMgis8A3S8upybgfWRQ9VkPqJNefYGFVxJSSM3+HPjDwCZi6rkq3ZooieougNdIb6cl+Hm8qRSt3cqh4CYFr0BHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763440933; c=relaxed/relaxed;
	bh=nRFhvq2Uz4NA8JO4R785yYCp5GN2GZ3XDrcXeOP+C1o=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type; b=S/1zbEaIDoRTUpx3EHa/XC64zJPdQvWYVINT7KKG6kTZOU60Id2y6S7lT/kq193IOrZMvJ01YYTP6F1LoJC/5ejhkXuCNSpQYj1vltUbnvjsYL7Wkl1fbJ6rnW9rQ7lWiTwRPXQuSSu3U1BgHb+NERNj5lBLIIVVND2E7QamlsFW5MD8yh5UQ97B3L0Afe4alZ6FqRs6uirbUB31TUdsf5qEs9K6p67NYNXdndCpooMGo2i/dcgS0bX9CObyM5lzQQeWhA+6reu3MqfFl1XPcGOEQg88kWm0VX54v+5ROE2kY45fNsrX2qxVnz429TuLOTVoNYL0sEqb4Tm9vKueYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ilLhvtZI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ilLhvtZI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9X5c1s6yz2xqr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 15:42:11 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AHFV2qd019708;
	Tue, 18 Nov 2025 04:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=nRFhvq2Uz4NA8JO4R785yYCp5GN2
	GZ3XDrcXeOP+C1o=; b=ilLhvtZI3yN55Daa9evGhhYcZHd8smX7BqL9S8hrQFYk
	7S74jOfi73w/cZt6ag53f0emBsWk0Q+QKvU940ky8orkhGrjRYH81ZKa/naHgJhs
	SDTH1WUItX5quVYkbDv0SWNC52krgUiWATcLeMxrhev/7TeR3UaiK4CDS17YffQT
	QJRuab4UDdvfZSzkCz78y/Tb6sLLkqW30f3aaqISHgo3/2a/xP9kRcO4/0ka+G1k
	rO4TbfHK/yK06VQMm9m3qHLf3B4k4KCwHzycrwX6MQ036JO+5irmfssTrV+JZ+b6
	xYZpiFVyS37O8vm7LVVbU8tWVbgTkvdAtXVsAZxKfw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgwruyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 04:42:05 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI1NdLC010419;
	Tue, 18 Nov 2025 04:42:04 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3us1gfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 04:42:04 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AI4fn2A27132500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Nov 2025 04:41:49 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79EA158055;
	Tue, 18 Nov 2025 04:42:03 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E606F5804B;
	Tue, 18 Nov 2025 04:42:02 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Nov 2025 04:42:02 +0000 (GMT)
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
Precedence: list
MIME-Version: 1.0
Date: Tue, 18 Nov 2025 10:12:02 +0530
From: Misbah Anjum N <misanjum@linux.ibm.com>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [REGRESSION] [next-20251117] ppc64le: WARNING in vmalloc_fix_flags
 with __GFP_ACCOUNT in BPF/seccomp path
Message-ID: <dbe42ce9543dbc3af95f95d6a6d9540b@linux.ibm.com>
X-Sender: misanjum@linux.ibm.com
Organization: IBM
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dl3jukZaATzcvyZbsrEt5xz6YXoakvzG
X-Authority-Analysis: v=2.4 cv=YqwChoYX c=1 sm=1 tr=0 ts=691bf91d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=eDBbsAWTgkdve4Kpa_YA:9 a=CjuIK1q_8ugA:10
 a=HhbK4dLum7pmb74im6QT:22 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-ORIG-GUID: dl3jukZaATzcvyZbsrEt5xz6YXoakvzG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX64yia7Fiuaql
 EWJIRt/dqFz0YVbI7vJiUa7wAgeZLr0WJY7g5gdDJ15f7doSh2PF/L84JjWRv6W8kb6aIhkbjNT
 FOO8ZE4aschFbZA4vUUa/O9eXQFyw2L7Fh9QhlgrB8Y5p3C4yNeA9mxNd96HJnZzd0jDnl4gPCZ
 l1A0waUMoy0PplYoy3uF7oJaypN8+2k7tCOA0TtG7ZbHNIS9wM7b/128BcRoY1VlHKuALmGvqzj
 qag7OQ9vN0Xszg92OjJL0OW46pexRdBvl0jGdaWz3TUMtoNq29rbC+ljfr72laOCS7nUfyF+FlA
 gzCu8i1p56UiY1TRoe9rtxzHLAnHl4w9GamC5VHRWnr50Std5j8jaaj04k78kN4PYlwwmJh7kwP
 p/1AcUkQg6wyi1mQMuR6rhb7j1UQ1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

I'm reporting a regression in linux-next that was introduced between 
20251114 and 20251117.

Regression Info:
- Working: 6.18.0-rc5-next-20251114
- Broken: 6.18.0-rc6-next-20251117

Environment:
- IBM Power11 pSeries (ppc64le)
- Fedora43 Distro

Issue:
WARNING: mm/vmalloc.c:3937 at vmalloc_fix_flags+0x6c/0xa0
"Unexpected gfp: 0x400000 (__GFP_ACCOUNT). Fixing up to gfp: 0xdc0 
(GFP_KERNEL|__GFP_ZERO). Fix your code!"

Call Trace:
[  523.921345] Unexpected gfp: 0x400000 (__GFP_ACCOUNT). Fixing up to 
gfp: 0xdc0 (GFP_KERNEL|__GFP_ZERO). Fix your code!
[  523.921356] WARNING: mm/vmalloc.c:3937 at 
vmalloc_fix_flags+0x6c/0xa0, CPU#69: (ostnamed)/6500
[  523.921365] Modules linked in: rpcrdma rdma_cm iw_cm ib_cm ib_core 
kvm_hv kvm bonding rfkill binfmt_misc pseries_rng vmx_crypto nfsd 
auth_rpcgss drm nfs_acl lockd grace loop drm_panel_orientation_quirks 
vsock_loopback vmw_vsock_virtio_transport_common vsock zram ext4 crc16 
mbcache jbd2 sr_mod sd_mod cdrom ibmvscsi ibmveth scsi_transport_srp 
btrfs blake2b libblake2b xor raid6_pq zstd_compress sunrpc dm_mirror 
dm_region_hash dm_log be2iscsi bnx2i cnic uio cxgb4i cxgb4 tls libcxgbi 
libcxgb qla4xxx iscsi_boot_sysfs iscsi_tcp libiscsi_tcp libiscsi 
scsi_transport_iscsi i2c_dev dm_multipath fuse dm_mod nfnetlink
[  523.921485] CPU: 69 UID: 0 PID: 6500 Comm: (ostnamed) Kdump: loaded 
Tainted: G        W           6.18.0-rc6-next-20251117 #1 VOLUNTARY
[  523.921504] Tainted: [W]=WARN
[  523.921511] Hardware name: IBM,9824-42A Power11 (architected) 
0x820200 0xf000007 of:IBM,FW1110.00 (RB1110_082) hv:phyp pSeries
[  523.921523] NIP:  c00000000063f8fc LR: c00000000063f8f8 CTR: 
00000000005d7e44
[  523.921537] REGS: c0000001ad0f78e0 TRAP: 0700   Tainted: G        W   
          (6.18.0-rc6-next-20251117)
[  523.921544] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
2824222f  XER: 0000000a
[  523.921564] CFAR: c00000000023225c IRQMASK: 0
[  523.921564] GPR00: c00000000063f8f8 c0000001ad0f7b80 c0000000017f8100 
0000000000000069
[  523.921564] GPR04: 00000000ffff7fff c0000001ad0f7970 00000027f9c50000 
0000000000000001
[  523.921564] GPR08: 0000000000000027 0000000000000000 0000000000000000 
0000000000000003
[  523.921564] GPR12: c0000000028fe748 c0000027fde3c300 0000000000000000 
0000000000000000
[  523.921564] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[  523.921564] GPR20: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[  523.921564] GPR24: c000000001711608 0000000000000000 0000000000000000 
c0000001270c7858
[  523.921564] GPR28: 0000000000000000 0000000000000dc0 0000000000010000 
0000000000400000
[  523.921626] NIP [c00000000063f8fc] vmalloc_fix_flags+0x6c/0xa0
[  523.921631] LR [c00000000063f8f8] vmalloc_fix_flags+0x68/0xa0
[  523.921636] Call Trace:
[  523.921639] [c0000001ad0f7b80] [c00000000063f8f8] 
vmalloc_fix_flags+0x68/0xa0 (unreliable)
[  523.921646] [c0000001ad0f7c00] [c00000000064a7a0] 
__vmalloc_noprof+0x90/0xa0
[  523.921653] [c0000001ad0f7c80] [c0000000004addf4] 
bpf_prog_alloc_no_stats+0x54/0x270
[  523.921660] [c0000001ad0f7cd0] [c0000000004ae03c] 
bpf_prog_alloc+0x2c/0x130
[  523.921665] [c0000001ad0f7d10] [c000000000f39d24] 
bpf_prog_create_from_user+0x74/0x180
[  523.921673] [c0000001ad0f7d80] [c0000000003f2400] 
seccomp_set_mode_filter+0x1e0/0x790
[  523.921690] [c0000001ad0f7e10] [c000000000033758] 
system_call_exception+0x128/0x310
[  523.921701] [c0000001ad0f7e50] [c00000000000d05c] 
system_call_vectored_common+0x15c/0x2ec
[  523.921716] ---- interrupt: 3000 at 0x7fffa8750d3c
[  523.921725] NIP:  00007fffa8750d3c LR: 00007fffa8750d3c CTR: 
0000000000000000
[  523.921737] REGS: c0000001ad0f7e80 TRAP: 3000   Tainted: G        W   
          (6.18.0-rc6-next-20251117)
[  523.921750] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44244224  XER: 00000000
[  523.921775] IRQMASK: 0
[  523.921775] GPR00: 0000000000000166 00007fffeec77650 00007fffa8837c00 
0000000000000001
[  523.921775] GPR04: 0000000000000000 00000001524c2af0 0000000000000000 
0000000000000000
[  523.921775] GPR08: 0000000040000000 0000000000000000 0000000000000000 
0000000000000000
[  523.921775] GPR12: 0000000000000000 00007fffa9571520 00007fffeec77a90 
000000013fa85300
[  523.921775] GPR16: 0000000000000001 0000000000000000 000000013fa8a610 
0000000000000093
[  523.921775] GPR20: 000000007fff0000 000000013face248 0000000152102d28 
000000007ffffffe
[  523.921775] GPR24: 0000000000050026 0000000000050001 0000000000000092 
00000001524c4e30
[  523.921775] GPR28: 000000013fae0088 00000000c0000015 0000000000000000 
00000001524c4e30
[  523.921835] NIP [00007fffa8750d3c] 0x7fffa8750d3c
[  523.921841] LR [00007fffa8750d3c] 0x7fffa8750d3c
[  523.921850] ---- interrupt: 3000
[  523.921857] Code: 79440020 79260020 38e1006c 38a10074 9101006c 
e90d0c78 f9010078 39000000 91410074 9121006c 4bbf2885 60000000 
<0fe00000> e9410078 e92d0c78 7d4a4a79
[  523.921882] ---[ end trace 0000000000000000 ]---


Reported-by: Misbah Anjum N <misanjum@linux.ibm.com>

Regards,
Misbah Anjum N

