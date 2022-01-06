Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB9E485E68
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 03:03:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTqQR6cDjz30RD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 13:03:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jkm7bqdG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Jkm7bqdG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTqPh2qFgz2yL9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 13:03:04 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20607jBl004971; 
 Thu, 6 Jan 2022 02:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=UB2BvIQz4OweGWLs+RJKapXkRpBUCgsIDMqFmq1afBk=;
 b=Jkm7bqdGFaOZfG95I24ZxgLKHGr2ffIBQqPQFXYRUYWrNDeyqRn5jQoKRgVfnoGPNLnj
 FlVwBClqK3ofozkKBQY/YiGnW/ea6qVn9tZdm7PUwYvC1GQ0OqsZ/eFgw80ilWNOy3vC
 vkfUPFrudaCcR1XJS/oVGGaDykn8Y/1tfoZds1fZwbqB2PRE073LV3e25U+r6RgIw+q1
 XLK4afgrhLo6bXVps/A8GGv5r/S9oCHFC2ByBnAPEvi7WRvrOQ4gsX5JV+GkX6x751Sb
 yssWEO2TFuqeAz6qyvvhN2nc+s6Sw+11jRwtEc+zw1dA9qBRSQay0l8r0caidjz1upt3 oQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ddnkt1fpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 02:03:01 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2061xkAr031919;
 Thu, 6 Jan 2022 02:03:00 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 3ddmtyj4fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 02:03:00 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20622xSH7537488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 02:02:59 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5C93B206B;
 Thu,  6 Jan 2022 02:02:59 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A223B2064;
 Thu,  6 Jan 2022 02:02:59 +0000 (GMT)
Received: from localhost (unknown [9.160.191.186])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 02:02:59 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Kip Warner <kip@thevertigo.com>
Subject: Re: ppc64el kernel bug?
In-Reply-To: <ab1cf0bfad75e06ee2a56ebcf435a977f463b2d6.camel@thevertigo.com>
References: <ab1cf0bfad75e06ee2a56ebcf435a977f463b2d6.camel@thevertigo.com>
Date: Wed, 05 Jan 2022 20:02:58 -0600
Message-ID: <87bl0pvcx9.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1W8cpaMplZyWfRWAXm2LOFtuyy1DJRfq
X-Proofpoint-GUID: 1W8cpaMplZyWfRWAXm2LOFtuyy1DJRfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_08,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=361 suspectscore=0 bulkscore=0
 clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2112160000 definitions=main-2201060009
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kip Warner <kip@thevertigo.com> writes:
>    Dec 25 06:52:52 romulus-server kernel: [28835.277591] BUG: Unable to h=
andle kernel data access on write at 0x132b47d38499fd58
>    Dec 25 06:52:52 romulus-server kernel: [28835.277624] Faulting instruc=
tion address: 0xc0000000004d0434
>    Dec 25 06:52:52 romulus-server kernel: [28835.277636] Oops: Kernel acc=
ess of bad area, sig: 11 [#150]
>    Dec 25 06:52:52 romulus-server kernel: [28835.277656] LE PAGE_SIZE=3D6=
4K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA PowerNV
>    Dec 25 06:52:52 romulus-server kernel: [28835.277669] Modules linked i=
n: veth nft_masq zfs(PO) zunicode(PO) zzstd(O) zlua(O) zcommon(PO) znvpair(=
PO) zavl(PO) icp(PO) spl(O) vhost_vsock vmw_vsock_virtio_transport_common v=
host vhost_iotlb vsock xt_CHECKSUM nft_chain_nat xt_MASQUERADE nf_nat nf_co=
nntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_counter xt_tcpudp nft_compat brid=
ge stp llc nf_tables nfnetlink binfmt_misc dm_multipath scsi_dh_rdac scsi_d=
h_emc scsi_dh_alua joydev input_leds ipmi_powernv mac_hid ipmi_devintf ipmi=
_msghandler ofpart cmdlinepart at24 powernv_flash mtd uio_pdrv_genirq opal_=
prd uio ibmpowernv vmx_crypto sch_fq_codel jc42 ip_tables x_tables autofs4 =
xfs btrfs blake2b_generic raid10 raid456 async_raid6_recov async_memcpy asy=
nc_pq async_xor async_tx xor hid_generic usbhid hid raid6_pq libcrc32c raid=
1 raid0 multipath linear nouveau ses enclosure scsi_transport_sas ast drm_v=
ram_helper i2c_algo_bit drm_ttm_helper ttm drm_kms_helper syscopyarea sysfi=
llrect sysimgblt fb_sys_fops cec rc_core drm crct10dif_vpmsum
>    Dec 25 06:52:52 romulus-server kernel: [28835.277776]  crc32c_vpmsum x=
hci_pci tg3 aacraid xhci_pci_renesas drm_panel_orientation_quirks
>    Dec 25 06:52:52 romulus-server kernel: [28835.277918] CPU: 26 PID: 144=
937 Comm: postgres Tainted: P      D    O      5.11.0-41-generic #45-Ubuntu
>    Dec 25 06:52:52 romulus-server kernel: [28835.277943] NIP: c0000000004=
d0434 LR: c0000000004d032c CTR: c0000000010a90e0
>    Dec 25 06:52:52 romulus-server kernel: [28835.277975] REGS: c000000056=
b9f6b0 TRAP: 0380   Tainted: P      D    O       (5.11.0-41-generic)
>    Dec 25 06:52:52 romulus-server kernel: [28835.278008] MSR: 90000000000=
09033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 88002281  XER: 0000008c
>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] CFAR: c000000000=
4d041c IRQMASK: 0=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR00: c00000000=
04d032c c000000056b9f950 c000000002409a00 0000000000000000=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR04: 000000000=
0400cc0 0000000000000097 ffffffffffffffff c000000ffda9d0d0=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR08: 0000000ff=
bd90000 132b47d38499fce8 0000000000000070 d4ff277338704e25=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR12: 000000000=
0002000 c000000ffffd2c00 0000000000000000 c000000116c512d0=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR16: 000000000=
0000154 c000000116c51570 c000000056b9fc88 0000000000000154=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR20: 000000000=
0000000 0000000000000000 0000000000000000 0000000000000000=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR24: c00000000=
0ecccc0 0000000000000001 c0000000024588fc c000000000ec9954=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR28: fffffffff=
fffffff c00000001d597e40 0000000000400cc0 c000000003018880=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278213] NIP [c0000000004=
d0434] kmem_cache_alloc_node+0x1d4/0x490
>    Dec 25 06:52:52 romulus-server kernel: [28835.278237] LR [c0000000004d=
032c] kmem_cache_alloc_node+0xcc/0x490
>    Dec 25 06:52:52 romulus-server kernel: [28835.278268] Call Trace:
>    Dec 25 06:52:52 romulus-server kernel: [28835.278283] [c000000056b9f95=
0] [c0000000004d032c] kmem_cache_alloc_node+0xcc/0x490 (unreliable)
>    Dec 25 06:52:52 romulus-server kernel: [28835.278328] [c000000056b9f9c=
0] [c000000000ec9954] __alloc_skb+0x74/0x2d0
>    Dec 25 06:52:52 romulus-server kernel: [28835.278369] [c000000056b9fa2=
0] [c000000000ecccc0] alloc_skb_with_frags+0x70/0x2e0
>    Dec 25 06:52:52 romulus-server kernel: [28835.278403] [c000000056b9faa=
0] [c000000000ec0f38] sock_alloc_send_pskb+0x1d8/0x200
>    Dec 25 06:52:52 romulus-server kernel: [28835.278436] [c000000056b9fb1=
0] [c0000000010a93a8] unix_stream_sendmsg+0x2c8/0x710
>    Dec 25 06:52:52 romulus-server kernel: [28835.278471] [c000000056b9fc1=
0] [c000000000eb64e0] sock_sendmsg+0x80/0xb0
>    Dec 25 06:52:52 romulus-server kernel: [28835.278494] [c000000056b9fc4=
0] [c000000000ebab88] __sys_sendto+0xf8/0x1a0
>    Dec 25 06:52:52 romulus-server kernel: [28835.278526] [c000000056b9fd9=
0] [c000000000ebaca0] sys_send+0x30/0x40
>    Dec 25 06:52:52 romulus-server kernel: [28835.278558] [c000000056b9fdb=
0] [c000000000036ffc] system_call_exception+0x10c/0x230
>    Dec 25 06:52:52 romulus-server kernel: [28835.278601] [c000000056b9fe1=
0] [c00000000000d374] system_call_vectored_common+0xf4/0x26c
>    Dec 25 06:52:52 romulus-server kernel: [28835.278634] --- interrupt: 3=
000 at 0x7ec638a194f4
>    Dec 25 06:52:52 romulus-server kernel: [28835.278654] NIP: 00007ec638a=
194f4 LR: 0000000000000000 CTR: 0000000000000000
>    Dec 25 06:52:52 romulus-server kernel: [28835.278685] REGS: c000000056=
b9fe80 TRAP: 3000   Tainted: P      D    O       (5.11.0-41-generic)
>    Dec 25 06:52:52 romulus-server kernel: [28835.278719] MSR: 90000000028=
0f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48008281 XER: 00000000
>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] IRQMASK: 0=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR00: 000000000=
000014e 00007fffe99c1800 00007ec638a47f00 0000000000000009=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR04: 000000438=
09d1148 0000000000000154 0000000000000000 0000000000001ae8=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR08: 000000436=
2347d00 0000000000000000 0000000000000000 0000000000000000=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR12: 000000000=
0000000 00007ec6348e0890 0000000000000000 ffffffffffffffff=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR16: 000000000=
0000000 000000436233f7a0 0000000000000001 0000000000000000=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR20: 00007fffe=
99c18ac 0000004362344f48 0000000000000004 00007fffe99c18b0=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR24: 000000000=
6000001 0000000000000000 0000000000000154 00000043809d1148=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR28: 000000000=
0000000 00007ec6348d9938 00000043809ceb00 000000000000000b=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.278992] NIP [00007ec638a=
194f4] 0x7ec638a194f4
>    Dec 25 06:52:52 romulus-server kernel: [28835.279020] LR [000000000000=
0000] 0x0
>    Dec 25 06:52:52 romulus-server kernel: [28835.279038] --- interrupt: 3=
000
>    Dec 25 06:52:52 romulus-server kernel: [28835.279054] Instruction dump:
>    Dec 25 06:52:52 romulus-server kernel: [28835.279072] f9210020 4182009=
8 2e1cffff 3b200001 2c2a0000 41820088 41920010 894a0007=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.279110] 7c1c5000 4082007=
8 815f0028 e97f00b8 <7ce9502a> 7c095214 886d0988 9b2d0988=20
>    Dec 25 06:52:52 romulus-server kernel: [28835.279141] ---[ end trace f=
e7ee98d0b7beb6a ]---

Perhaps slab corruption, but the 'D' taint flag (TAINT_DIE) means the
kernel oopsed at least once before this. Probably best to look at that
one first.
