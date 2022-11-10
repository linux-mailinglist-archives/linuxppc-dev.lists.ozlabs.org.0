Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C1623D0B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 09:02:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7DpH5VL7z3dvc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 19:02:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qy7Jxg20;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qy7Jxg20;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7DnK0KJ3z3c7G
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 19:01:40 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2AA6cViV000492;
	Thu, 10 Nov 2022 08:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=UfS2M5BskP/u3MZdbZOc3sjFjYUZ2k9IwakRV9/QwBM=;
 b=Qy7Jxg20ogsjx2omGlC0V6AUHSb9V+teYfAXO1LY93oL+IzRU5g+umKmEzBK9NxE7kaN
 w2lL4gjonOywQ2elSCSVesHJW9eDKlQQwOFqTUre5FiKWHtxpZmcAjE6SiMph2uv3pu9
 W5zAuUuO63AsyGRjBSYjyVxsVd2omCNLqtXI4DVOwLrGIamJTKiTUcyR1SrewaDXY4su
 OU/6CiYa2t2iCnPcTLIYtBYU8aVMTWKX10TFgPXISQFGOMW80eJ9Dm5DRRzunOs+Xfgq
 lUFkDC21LageIWDv0TCRt+qYBnwV9XU4/LVh6mF9q3lZdDcL2igppniYD1tqSMyF3ZMS VQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3krupktjgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 08:01:33 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AA7qifJ032580;
	Thu, 10 Nov 2022 08:01:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma05fra.de.ibm.com with ESMTP id 3krcbr0t95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 08:01:31 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AA81T2j7537228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Nov 2022 08:01:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 823D952050;
	Thu, 10 Nov 2022 08:01:29 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.54])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B759D5204E;
	Thu, 10 Nov 2022 08:01:28 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: [6.1.0-rc4-next-20221109] Boot time warning kernel/module/main.c:852
Message-Id: <06C70AFA-75C5-49A7-9EB4-27AF20A80EBB@linux.ibm.com>
Date: Thu, 10 Nov 2022 13:31:17 +0530
To: linux-scsi@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dgJqpu82evfKmaqG3ZN2ugS6iyQKhdh3
X-Proofpoint-GUID: dgJqpu82evfKmaqG3ZN2ugS6iyQKhdh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_05,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1011 mlxscore=0
 adultscore=0 spamscore=0 mlxlogscore=790 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211100056
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While booting 6.1.0-rc4-next-20221109 next kernel on a IBM Power9 LPAR
following warning is seen:

[ 8.808868] ------------[ cut here ]------------
[ 8.808872] WARNING: CPU: 1 PID: 378 at kernel/module/main.c:852 =
module_put+0x48/0x100
[ 8.808881] Modules linked in: sr_mod(E) cdrom(E) sd_mod(E) sg(E) =
lpfc(E) nvmet_fc(E) nvmet(E) ibmvscsi(E) scsi_transport_srp(E) =
ibmveth(E) nvme_fc(E) nvme(E) nvme_fabrics(E) nvme_core(E) t10_pi(E) =
scsi_transport_fc(E) crc64_rocksoft(E) crc64(E) tg3(E) fuse(E)
[ 8.808912] sd 1:0:0:1: [sdc] Write Protect is off
[ 8.808913] CPU: 1 PID: 378 Comm: kworker/1:3 Tainted: G E =
6.1.0-rc4-next-20221109 #1
[ 8.808916] Hardware name: IBM,8375-42A POWER9 (raw) 0x4e0202 0xf000005 =
of:IBM,FW950.01 (VL950_047) hv:phyp pSeries
[ 8.808924] Workqueue: kaluad alua_rtpg_work
[ 8.808931] NIP: c000000000236c18 LR: c0000000009ee680 CTR: =
00000000007088ec
[ 8.808936] REGS: c000000007c37870 TRAP: 0700 Tainted: G E =
(6.1.0-rc4-next-20221109)
[ 8.808942] MSR: 800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: =
88002884 XER: 20040007
[ 8.808957] CFAR: c000000000236c04 IRQMASK: 0=20
[ 8.808957] GPR00: c0000000009ee680 c000000007c37b10 c00000000137ec00 =
c008000001d3a500=20
[ 8.808957] GPR04: 0000000000000000 0000000000000000 0000000000000000 =
00000000000000ff=20
[ 8.808957] GPR08: 0000000000000001 0000000000000001 c008000001d3a8c0 =
c0000000029674a8=20
[ 8.808957] GPR12: 0000000000002000 c00000000d5cf300 c00000000018f3d8 =
c000000003ce4d00=20
[ 8.808957] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 8.808957] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 8.808957] GPR24: c0000000092b0e00 0000000000000000 c00000008ee81000 =
c0000000092b0fc0=20
[ 8.808957] GPR28: c000000007c37c10 c000000007c37c10 c008000001d3a500 =
c00000008ee81000=20
[ 8.809018] NIP [c000000000236c18] module_put+0x48/0x100
[ 8.809024] sd 1:0:0:1: [sdc] Write cache: disabled, read cache: =
enabled, supports DPO and FUA
[ 8.809024] LR [c0000000009ee680] scsi_device_put+0x50/0x70
[ 8.809035] Call Trace:
[ 8.809038] [c000000007c37b10] [c000000007c37b50] 0xc000000007c37b50 =
(unreliable)
[ 8.809045] [c000000007c37b50] [c0000000009ee674] =
scsi_device_put+0x44/0x70
[ 8.809053] [c000000007c37b80] [c000000000a10c70] =
alua_rtpg_work+0x210/0x920
[ 8.809059] [c000000007c37c90] [c000000000182314] =
process_one_work+0x2b4/0x5b0
[ 8.809066] [c000000007c37d30] [c000000000182688] =
worker_thread+0x78/0x600
[ 8.809072] [c000000007c37dc0] [c00000000018f4f4] kthread+0x124/0x130
[ 8.809079] [c000000007c37e10] [c00000000000cffc] =
ret_from_kernel_thread+0x5c/0x64
[ 8.809086] Instruction dump:
[ 8.809090] f821ffc1 41820034 395e03c0 7c0004ac 7d205028 2c090001 =
3929ffff 41c00010=20
[ 8.809101] 7d20512d=20
[ 8.809101] sd 1:0:0:1: [sdc] Preferred minimum I/O size 32768 bytes
[ 8.809102] 40c2ffec 7c0004ac 79290fe2 <0b090000> 60000000 38210040 =
ebc1fff0=20
[ 8.809115] ---[ end trace 0000000000000000 ]=E2=80=94

-next-20221108 was good. Git bisect points to following

commit 0b25e17e9018a0ea68a9f0b4787672e8c68fa8d5
Date:   Mon Oct 31 15:47:25 2022 -0700
    scsi: alua: Move a scsi_device_put() call out of alua_check_vpd()

Reverting this patch gets rid of the warning.

- Sachin

