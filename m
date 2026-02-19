Return-Path: <linuxppc-dev+bounces-16946-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEfJM+EPl2n7uAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16946-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 14:28:01 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DD115F0EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 14:27:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGvMH4PFGz30GV;
	Fri, 20 Feb 2026 00:27:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771507675;
	cv=none; b=gtMqjcdVudvWNn/Aih1eMj5AzUX3natNDhW7z3W7iGNdHXa92BONQc1W3QXhtZaRgipyJCta/65H6PbxuQyQP/qvjpTIqwiXjbjTVNjPfATlBLBWHjyiC3QiMKArTL7qRNkpA6687MSmIbAFlo9YfqlwOTloxTVY/OYLFABFBuM6FbgU5XOZQmKElizXbvxAmODmiI0JbmA/GgCNkksGLRzi76jOQFpZ2YrX683lu6qc1BdFcV8cBK/mbAFX80QzjlMIDdBx2ZkFUT1KtPh/DL96VblXArgjXMRuLnwBEA8RCXpNfFE/p598tLK4X7suAJkHa29tCmPzkmRTE/c7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771507675; c=relaxed/relaxed;
	bh=JCHlV5EvVFPz9lEcPTQ5bZ5Z3rttIz2QPyt558X+ruY=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type; b=eVA96ExD08kslwj9fL/C2OC3rquTuXXUkZDOI5cE8q1RZ78UzBS5DRfG46gOaAOP5hnm9900fTtqcIyFg0NkMM5mTlEYkkK1J0KajoVFOd44G71P5u+ukGsZbhgYE8uJCGw6WA3amhEeXVzht7I0CRA8V1/Zq21aAbYZnIYN35D9rAN2L6qjpExm583dwCBNY6qJ7Llzol/cH9lpsIlrIPCyd+aiXri6m3t1hjR1LGyRQgQPOPG8/buIfhgbsjMqfkWY1gSXlE9q/N3Wd7ni79kzB0af36USAdE10316d/kniPPlCiV1oam3HLlWURdUefya/w3jfgGlhs1lVaSeWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PaclBfMd; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PaclBfMd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGvMF73TWz2xlj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 00:27:53 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J9A5Bw1602113;
	Thu, 19 Feb 2026 13:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=JCHlV5EvVFPz9lEcPTQ5bZ5Z3rtt
	Iz2QPyt558X+ruY=; b=PaclBfMdfrgfoP/2NI4uE0E1a0fUBWOb7zmJYrD0vw/9
	V6neZApIawQOT7rXsgIFMpkz8GSK+OzfnufRiXG8LbKXCwDkCiibZ/YRzcdJZBJN
	v8LnryPWjQVlEcxRBgwi5Ude7fCXlbtU8OhQnJ42hp00WFAVcucswvKl7XTPkH+j
	pSXokKw/BFrLUrMuGKMUj367eOKZrLM7zsHdIw49TcVD0cAPdtZyASb68Q55YqAf
	n+LUHKRGZM4MYythaMcxgOIKZFNU8WShlxik746V1CxFVPG+pnq65h5pzd8y71v3
	eafeAog4aE1HWobN/nyytD3YxrPa/AqEXV1duh4L3w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cajcr68h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 13:27:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61J8nLWf030217;
	Thu, 19 Feb 2026 13:27:46 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ccb45c93y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 13:27:46 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61JDROv925231956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Feb 2026 13:27:24 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 410D458067;
	Thu, 19 Feb 2026 13:27:45 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D362658056;
	Thu, 19 Feb 2026 13:27:44 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Feb 2026 13:27:44 +0000 (GMT)
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
Date: Thu, 19 Feb 2026 18:57:44 +0530
From: Misbah Anjum N <misanjum@linux.ibm.com>
To: Linux Next <linux-next@vger.kernel.org>, linux-nfs@vger.kernel.org
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
        Linuxppc Dev
 <linuxppc-dev@lists.ozlabs.org>, chuck.lever@oracle.com,
        jlayton@kernel.org
Subject: [BUG] [powerpc] [next-20260216/17] nfsd: use-after-free in
 cache_check_rcu() triggered by sosreport on ppc64le
Message-ID: <dcd371d3a95815a84ba7de52cef447b8@linux.ibm.com>
X-Sender: misanjum@linux.ibm.com
Organization: IBM
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: StfXldVJY_8vxmh0IVfp407gplE6OIud
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEyMCBTYWx0ZWRfX6zdL3Opy2Xpb
 e0A3DNc//Hs32Cn5+211CyVT0aPik9VEmyxQjEmQgzaSQNAZWpFJtsmBvNlEv2i/aIBYXO136Op
 66Uic3RGQJgDKmH1chAmTusI1BgFvdWqk1jKwyNSF65o9+wDWxN89PX0Dh7rq0VW1TG6D38LfIF
 Vnp+6bX77J9CdNNlvKOJvzQcQ+5RO0Ep/3Rxpn5m9js4SrUwME0tVbnp6mm2C9dWQoSVlEdxQv+
 05Pme//aQg9jdIE/JpImD8hqEjDoHq90qjEg+aTDAlfB7DBn4BvBhbwHX0Hrf38LBc6czHIHKEP
 tNUM+0MXBXAA3RmGsPsEoDJso1+DB/H+gvdxb5Ho8qPzFXjHzYpgcw31zZ4i8v3yTGa+FJDDDI3
 PGOMjWVk0BNT3z/6h5Az/2nyWHyU4mp831OQFsPjlhoWFTaNixJuD8jYknTh72adwbR8kdF8I/i
 vIC3WqjDvQQQyys9h8Q==
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=69970fd3 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=fLEW9mKOiIiKqoFP268A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: StfXldVJY_8vxmh0IVfp407gplE6OIud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190120
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	TAGGED_FROM(0.00)[bounces-16946-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-next@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:chuck.lever@oracle.com,m:jlayton@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[misanjum@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[misanjum@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 18DD115F0EF
X-Rspamd-Action: no action

Hi,

I'm reporting a critical use-after-free bug in linux-next NFS server 
code that causes kernel crashes when sosreport reads /proc/fs/nfsd/* 
files. This appears to be a recent regression affecting ppc64le systems.
The bug is 100% reproducible and shows corrupted pointers containing 
ASCII strings (library names, export cache names) instead of valid 
kernel addresses, indicating freed memory has been reallocated.

Thanks,
Misbah Anjum N

Bug Description:
The kernel crashes with use-after-free in cache_check_rcu() [sunrpc] 
when sosreport reads NFS export information from /proc. The bug is 
highly reproducible and consistently shows corrupted pointers containing 
ASCII strings (library names, export cache names, filesystem paths) 
instead of valid kernel addresses.
This is a critical regression in linux-next that needs to be fixed 
before reaching mainline.

System Information:
Kernel: 6.19.0-next-20260216 and 6.19.0-next-20260217
Architecture: ppc64le (IBM Power11, 9080-HEX)
Hardware: IBM,9080-HEX Power11 (architected) 0x820200 0xf000007
Firmware: IBM,FW1110.11 (NH1110_102)
Hypervisor: phyp (PowerVM)
Distribution: Fedora 42 (Server Edition Prerelease)
Reproducible: 100%

Reproduction Steps:
On ppc64le system with kernel 6.19.0-next-20260216/17:
1. Run: modprobe nfsd
2. Run: sosreport
System crashes (typically within 30-60 seconds)

Important notes:
1. Direct cat /proc/fs/nfsd/exports does NOT trigger the crash
2. The crash is triggered by sosreport's specific access pattern to 
/proc/fs/nfsd/* files
3. No NFS exports or active NFS server configuration needed
4. Reproducible 100% of the time with sosreport

Kernel Configuration:
Relevant NFS configuration options:
CONFIG_NFSD=m
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
CONFIG_NFSD_SCSILAYOUT=y
CONFIG_NFSD_V4_2_INTER_SSC=y
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_NFS_FS=m
CONFIG_NFS_V3=m
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_NFS_FSCACHE=y
CONFIG_NFS_DEBUG=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
CONFIG_NFS_ACL_SUPPORT=m
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=m
CONFIG_SUNRPC_DEBUG=y

Detailed Crash Traces:
Crash #1 - cache_check_rcu() with "export_cap" pointer 
(6.19.0-next-20260216)
[ 3162.071511] BUG: Unable to handle kernel data access at 
0x657079745f70618b
[ 3162.071529] Faulting instruction address: 0xc0080000083322bc
[ 3162.071534] Oops: Kernel access of bad area, sig: 11 [#1]
[ 3162.071537] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=2048 NUMA pSeries
[ 3162.071542] Modules linked in: binfmt_misc vhost_net vhost 
vhost_iotlb tap tun nft_masq nft_ct nft_reject_ipv4 nf_reject_ipv4 
nft_reject act_csum cls_u32 sch_htb nft_chain_nat nf_nat nf_conntrack 
nf_defrag_ipv6 nf_defrag_ipv4 nf_tables bridge stp llc rpcrdma rdma_cm 
iw_cm kvm_hv ib_cm ib_core kvm bonding rfkill nfsd auth_rpcgss nfs_acl 
lockd grace pseries_rng vmx_crypto drm loop drm_panel_orientation_quirks 
nfnetlink vsock_loopback vmw_vsock_virtio_transport_common vsock zram 
xfs dm_service_time sd_mod ibmvscsi ibmveth scsi_transport_srp tg3 ipr 
btrfs xor libblake2b raid6_pq zstd_compress sunrpc dm_mirror 
dm_region_hash dm_log be2iscsi bnx2i cnic uio cxgb4i cxgb4 tls libcxgbi 
libcxgb qla4xxx iscsi_boot_sysfs iscsi_tcp libiscsi_tcp libiscsi 
scsi_transport_iscsi dm_multipath fuse dm_mod
[ 3162.071618] CPU: 51 UID: 0 PID: 52936 Comm: sosreport Kdump: loaded 
Not tainted 6.19.0-next-20260216 #1 PREEMPTLAZY
[ 3162.071623] Hardware name: IBM,9080-HEX Power11 (architected) 
0x820200 0xf000007 of:IBM,FW1110.11 (NH1110_102) hv:phyp pSeries
[ 3162.071627] NIP:  c0080000083322bc LR: c0080000115f6b48 CTR: 
c008000008332278
[ 3162.071631] REGS: c0000000b353f7c0 TRAP: 0380   Not tainted  
(6.19.0-next-20260216)
[ 3162.071635] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
48044402  XER: 00000000
[ 3162.071643] CFAR: c00800001164e15c IRQMASK: 0
[ 3162.071643] GPR00: c0080000115f6b48 c0000000b353fa60 c008000008397600 
c00000012a758700
[ 3162.071643] GPR04: 657079745f706163 0000000000000000 0000000000000000 
c000000144b4d000
[ 3162.071643] GPR08: c00000012a758700 0000000000000000 0000000000400cc0 
c00800001164e148
[ 3162.071643] GPR12: c008000008332278 c0000027fde49f00 0000000000000000 
0000000000000000
[ 3162.071643] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 3162.071643] GPR20: 0000000000000000 0000000000000000 c000000145433788 
c000000145433778
[ 3162.071643] GPR24: 000000007fff0000 0000000000000000 fffffffffffff000 
0000000000000000
[ 3162.071643] GPR28: c00000012a758700 0000000000000000 c00000012a758700 
657079745f706163
[ 3162.071682] NIP [c0080000083322bc] cache_check_rcu+0x44/0x2c0 
[sunrpc]
[ 3162.071716] LR [c0080000115f6b48] e_show+0x40/0x260 [nfsd]
[ 3162.071747] Call Trace:
[ 3162.071749] [c0000000b353fa60] [c0000000b353fb50] 0xc0000000b353fb50 
(unreliable)
[ 3162.071754] [c0000000b353fb10] [c0080000115f6b48] e_show+0x40/0x260 
[nfsd]
[ 3162.071780] [c0000000b353fb50] [c0000000007a7468] 
seq_read_iter+0x1a8/0x680
[ 3162.071787] [c0000000b353fc20] [c0000000007a7a44] 
seq_read+0x104/0x150
[ 3162.071791] [c0000000b353fcc0] [c00000000084ecb0] 
proc_reg_read+0xf0/0x160
[ 3162.071796] [c0000000b353fcf0] [c000000000756b00] vfs_read+0xe0/0x3d0
[ 3162.071800] [c0000000b353fdb0] [c000000000757a08] 
ksys_read+0x78/0x140
[ 3162.071804] [c0000000b353fe00] [c0000000000348c8] 
system_call_exception+0x128/0x350
[ 3162.071809] [c0000000b353fe50] [c00000000000d6a0] 
system_call_common+0x160/0x2e4
[ 3162.071815] ---- interrupt: c00 at 0x7fff7ecb9fc8
[ 3162.071818] NIP:  00007fff7ecb9fc8 LR: 00007fff7eca8438 CTR: 
0000000000000000
[ 3162.071821] REGS: c0000000b353fe80 TRAP: 0c00   Not tainted  
(6.19.0-next-20260216)
[ 3162.071824] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28044404  XER: 00000000
[ 3162.071834] IRQMASK: 0
[ 3162.071834] GPR00: 0000000000000003 00007fff6afdd9d0 00007fff7ee47c00 
0000000000000005
[ 3162.071834] GPR04: 00007fff5c0223c0 0000000000010000 0000000000000000 
0000000000000000
[ 3162.071834] GPR08: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 3162.071834] GPR12: 0000000000000000 00007fff6afe68a0 0000000000000000 
0000000000000000
[ 3162.071834] GPR16: 0000000000000000 0000000000000000 00007fff7d800828 
00007fff6afddf88
[ 3162.071834] GPR20: 00007fff7d800830 00007fff7f3ed480 00007fff7d800838 
00007fff7f40d480
[ 3162.071834] GPR24: 00007fff7f58e0f0 00007fff5c0223c0 0000000000000005 
00007fff6c001290
[ 3162.071834] GPR28: 0000000000000000 00007fff6afdf8d0 00007fff79db3140 
0000000000010000
[ 3162.071870] NIP [00007fff7ecb9fc8] 0x7fff7ecb9fc8
[ 3162.071872] LR [00007fff7eca8438] 0x7fff7eca8438
[ 3162.071875] ---- interrupt: c00
[ 3162.071877] Code: fba1ffe8 fbe1fff8 fb61ffd8 fbc1fff0 7c9f2378 
7c7c1b78 7cbd2b78 f8010010 f821ff51 e92d0c78 f9210078 39200000 
<e9240028> 71290001 418201cc fb410080
[ 3162.071890] ---[ end trace 0000000000000000 ]---

Crash #2 - d_path() NULL pointer dereference (6.19.0-next-20260217)
[ 5489.374563] Kernel attempted to read user page (60) - exploit 
attempt? (uid: 0)
[ 5489.374582] BUG: Kernel NULL pointer dereference on read at 
0x00000060
[ 5489.374586] Faulting instruction address: 0xc0000000007cb354
[ 5489.374590] Oops: Kernel access of bad area, sig: 11 [#1]
[ 5489.374593] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=2048 NUMA pSeries
[ 5489.374598] Modules linked in: binfmt_misc vhost_net vhost 
vhost_iotlb tap tun nft_masq nft_ct nft_reject_ipv4 nf_reject_ipv4 
nft_reject act_csum cls_u32 sch_htb nft_chain_nat nf_nat nf_conntrack 
nf_defrag_ipv6 nf_defrag_ipv4 nf_tables bridge stp llc rpcrdma rdma_cm 
iw_cm kvm_hv ib_cm kvm ib_core bonding rfkill nfsd auth_rpcgss nfs_acl 
lockd grace pseries_rng vmx_crypto drm loop drm_panel_orientation_quirks 
nfnetlink vsock_loopback vmw_vsock_virtio_transport_common vsock zram 
xfs dm_service_time sd_mod ibmvscsi tg3 ibmveth scsi_transport_srp ipr 
btrfs xor libblake2b raid6_pq zstd_compress sunrpc dm_mirror 
dm_region_hash dm_log be2iscsi bnx2i cnic uio cxgb4i cxgb4 tls libcxgbi 
libcxgb qla4xxx iscsi_boot_sysfs iscsi_tcp libiscsi_tcp libiscsi 
scsi_transport_iscsi dm_multipath fuse dm_mod
[ 5489.374671] CPU: 2 UID: 0 PID: 45718 Comm: sosreport Kdump: loaded 
Not tainted 6.19.0-next-20260217 #1 PREEMPTLAZY
[ 5489.374676] Hardware name: IBM,9080-HEX Power11 (architected) 
0x820200 0xf000007 of:IBM,FW1110.11 (NH1110_102) hv:phyp pSeries
[ 5489.374680] NIP:  c0000000007cb354 LR: c0000000007a7ed0 CTR: 
c0000000007a7e60
[ 5489.374683] REGS: c00000026f2676b0 TRAP: 0300   Not tainted  
(6.19.0-next-20260217)
[ 5489.374688] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
88044408  XER: 00000000
[ 5489.374696] CFAR: c0000000007a7ecc DAR: 0000000000000060 DSISR: 
40000000 IRQMASK: 0
[ 5489.374696] GPR00: c0000000007a7ed0 c00000026f267950 c000000001868100 
0000000000000000
[ 5489.374696] GPR04: c0000012e1350002 000000000000fffe c00800000ee360f0 
c0000012e1350002
[ 5489.374696] GPR08: 000000000000fffe c000000146400840 c0000012e1360000 
0000000000000000
[ 5489.374696] GPR12: c0000000007a7e60 c0000027ffffdf00 0000000000000000 
0000000000000000
[ 5489.374696] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 5489.374696] GPR20: 0000000000000000 0000000000000000 c0000000bbca06c8 
c0000000bbca06b8
[ 5489.374696] GPR24: 000000007fff0000 0000000000000000 fffffffffffff000 
0000000000000000
[ 5489.374696] GPR28: c00000026f267c50 c000000140db5800 c000000146400800 
c0000012e1350002
[ 5489.374736] NIP [c0000000007cb354] d_path+0x44/0x210
[ 5489.374742] LR [c0000000007a7ed0] seq_path+0x70/0x160
[ 5489.374747] Call Trace:
[ 5489.374749] [c00000026f267950] [0000000000000006] 0x6 (unreliable)
[ 5489.374755] [c00000026f2679b0] [c0000000007a7ed0] seq_path+0x70/0x160
[ 5489.374759] [c00000026f2679f0] [c00800001144673c] 
svc_export_show+0x1d4/0x5a0 [nfsd]
[ 5489.374789] [c00000026f267aa0] [c008000004a126fc] c_show+0xa4/0x1c0 
[sunrpc]
[ 5489.374819] [c00000026f267b50] [c0000000007a7468] 
seq_read_iter+0x1a8/0x680
[ 5489.374824] [c00000026f267c20] [c0000000007a7a44] 
seq_read+0x104/0x150
[ 5489.374829] [c00000026f267cc0] [c00000000084ecb0] 
proc_reg_read+0xf0/0x160
[ 5489.374833] [c00000026f267cf0] [c000000000756af0] vfs_read+0xe0/0x3d0
[ 5489.374837] [c00000026f267db0] [c0000000007579f8] 
ksys_read+0x78/0x140
[ 5489.374841] [c00000026f267e00] [c0000000000348c8] 
system_call_exception+0x128/0x350
[ 5489.374846] [c00000026f267e50] [c00000000000d6a0] 
system_call_common+0x160/0x2e4
[ 5489.374852] ---- interrupt: c00 at 0x7fff866b9fc8
[ 5489.374855] NIP:  00007fff866b9fc8 LR: 00007fff866a8438 CTR: 
0000000000000000
[ 5489.374858] REGS: c00000026f267e80 TRAP: 0c00   Not tainted  
(6.19.0-next-20260217)
[ 5489.374861] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28044404  XER: 00000000
[ 5489.374871] IRQMASK: 0
[ 5489.374871] GPR00: 0000000000000003 00007fff71fbd9d0 00007fff86847c00 
0000000000000008
[ 5489.374871] GPR04: 00007fff600228e0 0000000000010000 0000000000000000 
0000000000000000
[ 5489.374871] GPR08: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 5489.374871] GPR12: 0000000000000000 00007fff71fc68a0 0000000000000000 
0000000000000000
[ 5489.374871] GPR16: 0000000000000000 0000000000000000 00007fff847f0828 
00007fff71fbdf88
[ 5489.374871] GPR20: 00007fff847f0830 00007fff86ded480 00007fff847f0838 
00007fff86e0d480
[ 5489.374871] GPR24: 00007fff86f8e0f0 00007fff600228e0 0000000000000008 
00007fff6c0016a0
[ 5489.374871] GPR28: 0000000000000000 00007fff71fbf8d0 00007fff80548c40 
0000000000010000
[ 5489.374906] NIP [00007fff866b9fc8] 0x7fff866b9fc8
[ 5489.374909] LR [00007fff866a8438] 0x7fff866a8438
[ 5489.374912] ---- interrupt: c00
[ 5489.374914] Code: f8010010 f821ffa1 f8410018 e92d0c78 f9210058 
39200000 91410044 7c691b78 7d442a14 f9410038 e8630008 90a10040 
<e9430060> 2c2a0000 41820064 e98a0048
[ 5489.374927] ---[ end trace 0000000000000000 ]---

Crash #3 - cache_check_rcu() with "libz.so." pointer 
(6.19.0-next-20260217)
[   63.748591] BUG: Unable to handle kernel data access at 
0x2e6f732e7a626994
[   63.748601] Faulting instruction address: 0xc008000009de22bc
[   63.748606] Oops: Kernel access of bad area, sig: 11 [#1]
[   63.748609] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=2048 NUMA pSeries
[   63.748614] Modules linked in: nft_masq nft_ct nft_reject_ipv4 
nf_reject_ipv4 nft_reject act_csum cls_u32 sch_htb nft_chain_nat nf_nat 
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables bridge stp llc 
binfmt_misc rpcrdma rdma_cm iw_cm kvm_hv ib_cm kvm ib_core bonding 
rfkill nfsd auth_rpcgss nfs_acl lockd grace pseries_rng vmx_crypto drm 
loop drm_panel_orientation_quirks nfnetlink vsock_loopback 
vmw_vsock_virtio_transport_common vsock zram xfs dm_service_time sd_mod 
tg3 ibmvscsi ibmveth scsi_transport_srp ipr btrfs xor libblake2b 
raid6_pq zstd_compress sunrpc dm_mirror dm_region_hash dm_log be2iscsi 
bnx2i cnic uio cxgb4i cxgb4 tls libcxgbi libcxgb qla4xxx 
iscsi_boot_sysfs iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi 
dm_multipath fuse dm_mod
[   63.748680] CPU: 58 UID: 0 PID: 5675 Comm: sosreport Kdump: loaded 
Not tainted 6.19.0-next-20260217 #1 PREEMPTLAZY
[   63.748686] Hardware name: IBM,9080-HEX Power11 (architected) 
0x820200 0xf000007 of:IBM,FW1110.11 (NH1110_102) hv:phyp pSeries
[   63.748690] NIP:  c008000009de22bc LR: c00800000f086b48 CTR: 
c008000009de2278
[   63.748693] REGS: c0000000a3a4f7c0 TRAP: 0380   Not tainted  
(6.19.0-next-20260217)
[   63.748697] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
48044402  XER: 00000000
[   63.748706] CFAR: c00800000f0de15c IRQMASK: 0
[   63.748706] GPR00: c00800000f086b48 c0000000a3a4fa60 c008000006f47600 
c0000000b70f9b00
[   63.748706] GPR04: 2e6f732e7a62696c 0000000000000000 0000000000000000 
c000000152f70800
[   63.748706] GPR08: c0000000b70f9b00 0000000000000000 0000000000400cc0 
c00800000f0de148
[   63.748706] GPR12: c008000009de2278 c0000027fde40700 0000000000000000 
0000000000000000
[   63.748706] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[   63.748706] GPR20: 0000000000000000 0000000000000000 c0000000e2e17b08 
c0000000e2e17af8
[   63.748706] GPR24: 000000007fff0000 0000000000000000 fffffffffffff000 
0000000000000000
[   63.748706] GPR28: c0000000b70f9b00 0000000000000000 c0000000b70f9b00 
2e6f732e7a62696c
[   63.748744] NIP [c008000009de22bc] cache_check_rcu+0x44/0x2c0 
[sunrpc]
[   63.748776] LR [c00800000f086b48] e_show+0x40/0x260 [nfsd]
[   63.748805] Call Trace:
[   63.748807] [c0000000a3a4fa60] [c0000000a3a4fb50] 0xc0000000a3a4fb50 
(unreliable)
[   63.748812] [c0000000a3a4fb10] [c00800000f086b48] e_show+0x40/0x260 
[nfsd]
[   63.748839] [c0000000a3a4fb50] [c0000000007a7468] 
seq_read_iter+0x1a8/0x680
[   63.748845] [c0000000a3a4fc20] [c0000000007a7a44] 
seq_read+0x104/0x150
[   63.748850] [c0000000a3a4fcc0] [c00000000084ecb0] 
proc_reg_read+0xf0/0x160
[   63.748855] [c0000000a3a4fcf0] [c000000000756af0] vfs_read+0xe0/0x3d0
[   63.748859] [c0000000a3a4fdb0] [c0000000007579f8] 
ksys_read+0x78/0x140
[   63.748862] [c0000000a3a4fe00] [c0000000000348c8] 
system_call_exception+0x128/0x350
[   63.748868] [c0000000a3a4fe50] [c00000000000d6a0] 
system_call_common+0x160/0x2e4
[   63.748873] ---- interrupt: c00 at 0x7fffa74b9fc8
[   63.748876] NIP:  00007fffa74b9fc8 LR: 00007fffa74a8438 CTR: 
0000000000000000
[   63.748879] REGS: c0000000a3a4fe80 TRAP: 0c00   Not tainted  
(6.19.0-next-20260217)
[   63.748882] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28044404  XER: 00000000
[   63.748892] IRQMASK: 0
[   63.748892] GPR00: 0000000000000003 00007fff8b7ed9d0 00007fffa7647c00 
0000000000000008
[   63.748892] GPR04: 00007fff7c021af0 0000000000010000 0000000000000000 
0000000000000000
[   63.748892] GPR08: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[   63.748892] GPR12: 0000000000000000 00007fff8b7f68a0 0000000000000000 
0000000000000000
[   63.748892] GPR16: 0000000000000000 0000000000000000 00007fffa55f0828 
00007fff8b7edf88
[   63.748892] GPR20: 00007fffa55f0830 00007fffa7bed480 00007fffa55f0838 
00007fffa7c0d480
[   63.748892] GPR24: 00007fffa7d8e0f0 00007fff7c021af0 0000000000000008 
00007fff94001290
[   63.748892] GPR28: 0000000000000000 00007fff8b7ef8d0 00007fffa062be00 
0000000000010000
[   63.748927] NIP [00007fffa74b9fc8] 0x7fffa74b9fc8
[   63.748930] LR [00007fffa74a8438] 0x7fffa74a8438
[   63.748933] ---- interrupt: c00
[   63.748935] Code: fba1ffe8 fbe1fff8 fb61ffd8 fbc1fff0 7c9f2378 
7c7c1b78 7cbd2b78 f8010010 f821ff51 e92d0c78 f9210078 39200000 
<e9240028> 71290001 418201cc fb410080
[   63.748948] ---[ end trace 0000000000000000 ]---

Next Steps:
I have vmcore dumps from multiple crashes and am working on:
1. Crash utility analysis to examine the corrupted cache structures
2. Git bisect to identify the problematic commit

