Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF7C8955CF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 15:52:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D8UnmUe+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V88TG6YHwz3vXW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 00:52:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D8UnmUe+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V88SW1swmz3cDd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 00:51:54 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 432DgJAM021352;
	Tue, 2 Apr 2024 13:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : to : from : subject : cc : content-type :
 content-transfer-encoding; s=pp1;
 bh=ZyUFALjx6viMMzdOywgL4/zB9g6cPayR5XSV8h2scQg=;
 b=D8UnmUe+TQp/rNg8uykrQb9D/aRlBxqXYhW0bfx7udPsSNippnBtG+eBImKhGwKRdluw
 yKqdNwUob3qh9s0LhaTK89Ki6Gk6Fuv37QjhSGJTRVMP8O94VNpxTVx8qBD+uxOTGPY2
 Tf+6XKCjEqj3fRVAbYiYIPF6r6yGuBhNCxDRe9u5FYOV70wM0NbeUFsSutWPoOIXLQ8I
 ygo+OMMX9k8Amf1XM+ywDDGzJkCzTeJAD7rJiQ2zBFDc9HmqxuQj4fL1AwCy5OS9kp9z
 bARPFZ/irp6ADBoaP+vcwePujQey+Eg9OdP1ma/flxncQDdGJY01zTlu7T5zBm+Tcr/a +w== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x8k0mg131-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 13:51:40 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 432Cuoeo008419;
	Tue, 2 Apr 2024 13:51:38 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x6w2ty2hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 13:51:38 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 432DpZRC16909050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Apr 2024 13:51:37 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 523D85806D;
	Tue,  2 Apr 2024 13:51:35 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0A465805E;
	Tue,  2 Apr 2024 13:51:31 +0000 (GMT)
Received: from [9.43.62.54] (unknown [9.43.62.54])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Apr 2024 13:51:31 +0000 (GMT)
Message-ID: <62efbf21-fdb5-4c3b-a370-085b39672b72@linux.vnet.ibm.com>
Date: Tue, 2 Apr 2024 19:21:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Alexander@wetzel-home.de, bvanassche@acm.org, martin.petersen@oracle.com,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Subject: [Revert commit 27f58c04a8f438078583041468ec60597841284d] [linux-next]
 [6.9.0-rc1-next-20240328] WARNING: CPU: 9 PID: 209 at drivers/scsi/sg.c:2236
 sg_remove_sfp_usercontext+0x270/0x280 [sg]
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pZ5TDoYdJf9sBdDIlbdMDid7UGTHjEdC
X-Proofpoint-ORIG-GUID: pZ5TDoYdJf9sBdDIlbdMDid7UGTHjEdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_06,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2404020101
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
Cc: sachinp@linux.vnet.com, sfr@canb.auug.org.au, mputtash@linux.vnet.com, abdhalee@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greetings!!


Below warnings is observed with the commit 
27f58c04a8f438078583041468ec60597841284d.


Once reverting the above commit id, issue is resloved.


Please help in fixing this issue.


   470.425710] ------------[ cut here ]------------
[  470.425728] WARNING: CPU: 5 PID: 226 at drivers/scsi/sg.c:2236 sg_remove_sfp_usercontext+0x270/0x280 [sg]
[  470.425739] Modules linked in: nvram nft_compat nf_tables libcrc32c nfnetlink rpadlpar_io rpaphp xsk_diag bonding tls rfkill binfmt_misc vmx_crypto pseries_rng dax_pmem drm drm_panel_orientation_quirks ext4 mbcache jbd2 dm_service_time sd_mod t10_pi crc64_rocksoft_generic crc64_rocksoft crc64 sg nd_pmem nd_btt ibmvfc papr_scm ibmvnic scsi_transport_fc ibmveth libnvdimm dm_multipath dm_mirror dm_region_hash dm_log dm_mod fuse
[  470.425778] CPU: 5 PID: 226 Comm: kworker/5:1 Kdump: loaded Not tainted 6.9.0-rc1-next-20240328-auto #1
[  470.425784] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_016) hv:phyp pSeries
[  470.425788] Workqueue: events sg_remove_sfp_usercontext [sg]
[  470.425794] NIP:  c008000004904110 LR: c008000004903ffc CTR: c0000000005391a0
[  470.425799] REGS: c000000092297ae0 TRAP: 0700   Not tainted  (6.9.0-rc1-next-20240328-auto)
[  470.425803] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 44000204  XER: 00000001
[  470.425814] CFAR: c00800000490400c IRQMASK: 0
[  470.425814] GPR00: c008000004903ffc c000000092297d80 c008000004928900 c000000090581298
[  470.425814] GPR04: 00000000c0000000 0000000000001281 c0000000056e0000 0000000000001280
[  470.425814] GPR08: 000000135acf0000 0000000000000002 0000000000000000 c008000004908bc0
[  470.425814] GPR12: c0000000005391a0 c0000013ffff9300 c0000000001a2b5c c0000000995efac0
[  470.425814] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[  470.425814] GPR20: c00000135cfb3b00 c0000000056fc030 c0000000056fc000 c0000000b15d3000
[  470.425814] GPR24: 0000000000000000 c000000090581200 c0000000044e6c05 c0000000056fd330
[  470.425814] GPR28: c00000135cfb3b00 c0000000056fc080 c0000000056fd328 c000000002fdee44
[  470.425858] NIP [c008000004904110] sg_remove_sfp_usercontext+0x270/0x280 [sg]
[  470.425864] LR [c008000004903ffc] sg_remove_sfp_usercontext+0x15c/0x280 [sg]
[  470.425870] Call Trace:
[  470.425872] [c000000092297d80] [c008000004903ffc] sg_remove_sfp_usercontext+0x15c/0x280 [sg] (unreliable)
[  470.425879] [c000000092297e40] [c00000000019332c] process_one_work+0x20c/0x4f4
[  470.425887] [c000000092297ef0] [c0000000001942ac] worker_thread+0x378/0x544
[  470.425892] [c000000092297f90] [c0000000001a2c8c] kthread+0x138/0x140
[  470.425898] [c000000092297fe0] [c00000000000df98] start_kernel_thread+0x14/0x18
[  470.425903] Code: e8c98310 3d220000 e8698010 480044bd e8410018 7ec3b378 48004ac9 e8410018 38790098 81390098 2c090001 4182ff04 <0fe00000> 4bfffefc 000247e0 00000000
[  470.425917] ---[ end trace 0000000000000000 ]---

Regards,
Venkat.

