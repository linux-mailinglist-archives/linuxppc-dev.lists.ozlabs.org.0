Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A5D5C026D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:52:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXjbr0c1Cz3bwr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 01:52:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UpNM/ZsU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UpNM/ZsU;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXjb71lhgz306m
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 01:52:02 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LFAqhK014955;
	Wed, 21 Sep 2022 15:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=VywHRex4evCrg+QTGWMZtJ7qFBTfQFnUY/rWqKGsqSI=;
 b=UpNM/ZsUcRVkFxW0uQKiASZ89r5JI2VJj7qt/fbqlqkHiAStmgw9VgCfcgWCRTQnnzxv
 W+jDI5bR2gniGG1yMyaCOuzn1OFSER+TBibkOrAvsFGaJO1pgRvTMnZQ4aqjCQq5YRM4
 FksgTEbaUnUeNeiDqN//yHao0MWnFd0m904A+Wfn1aH1edg1sx+Gh5amb2GXwgkYuYGz
 rIbcm7y8806sSmS22vjsMMIEyamfoM6tTSfxCVneyLhyLrM3N/5cUb+BHnc6jCLejPdM
 XG+7zV5evkgGRWSu/crVqfeqjYJd7jDLXpFYuSHpLhWh0M9iP/PDY5GaqgAeWTEuJWsD Dg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqw5g9mjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 15:51:58 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28LFpPIc001198;
	Wed, 21 Sep 2022 15:51:56 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3jn5gj5eee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 15:51:56 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28LFpsKv36569360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 15:51:54 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E17F5204E;
	Wed, 21 Sep 2022 15:51:54 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.56.226])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 56B7B5204F;
	Wed, 21 Sep 2022 15:51:53 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: [powerpc] memcpy warning drivers/scsi/scsi_transport_fc.c:581
 (next-20220921)
Message-Id: <42404B5E-198B-4FD3-94D6-5E16CF579EF3@linux.ibm.com>
Date: Wed, 21 Sep 2022 21:21:52 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-scsi@vger.kernel.org
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YuXtyQVWZFbW1UVCoC72vM8jDKqh44SF
X-Proofpoint-ORIG-GUID: YuXtyQVWZFbW1UVCoC72vM8jDKqh44SF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_09,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 mlxlogscore=705 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210103
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
Cc: linux-next@vger.kernel.org, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While booting recent linux-next kernel on a Power server following
warning is seen:

[    6.427054] lpfc 0022:01:00.0: 0:6468 Set host date / time: Status =
x10:
[    6.471457] lpfc 0022:01:00.0: 0:6448 Dual Dump is enabled
[    7.432161] ------------[ cut here ]------------
[    7.432178] memcpy: detected field-spanning write (size 8) of single =
field "&event->event_data" at drivers/scsi/scsi_transport_fc.c:581 (size =
4)
[    7.432201] WARNING: CPU: 0 PID: 16 at =
drivers/scsi/scsi_transport_fc.c:581 fc_host_post_fc_event+0x214/0x300 =
[scsi_transport_fc]
[    7.432228] Modules linked in: sr_mod(E) cdrom(E) sd_mod(E) sg(E) =
lpfc(E+) nvmet_fc(E) ibmvscsi(E) nvmet(E) scsi_transport_srp(E) =
ibmveth(E) nvme_fc(E) nvme(E) nvme_fabrics(E) nvme_core(E) t10_pi(E) =
scsi_transport_fc(E) crc64_rocksoft(E) crc64(E) tg3(E) ipmi_devintf(E) =
ipmi_msghandler(E) fuse(E)
[    7.432263] CPU: 0 PID: 16 Comm: kworker/0:1 Tainted: G            E  =
    6.0.0-rc6-next-20220921 #38
[    7.432270] Workqueue: events work_for_cpu_fn
[    7.432277] NIP:  c008000001366a2c LR: c008000001366a28 CTR: =
00000000007088ec
[    7.432282] REGS: c00000000380b6d0 TRAP: 0700   Tainted: G            =
E       (6.0.0-rc6-next-20220921)
[    7.432288] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 48002824  XER: 00000005
[    7.432304] CFAR: c0000000001555b4 IRQMASK: 0=20
               GPR00: c008000001366a28 c00000000380b970 c008000001388300 =
0000000000000084=20
               GPR04: 00000000ffff7fff c00000000380b730 c00000000380b728 =
0000000000000027=20
               GPR08: c000000db7007f98 0000000000000001 0000000000000027 =
c000000002947378=20
               GPR12: 0000000000002000 c000000002dc0000 c00000000018e3d8 =
c000000003045740=20
               GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
               GPR20: 0000000000000000 0000000000000030 01000000000010df =
c00000000380ba90=20
               GPR24: 0000000000000001 c0000000030ea000 000000000000ffff =
c000000002da2a08=20
               GPR28: 0000000000000040 c000000073f52400 0000000000000008 =
c0000000940b9834=20
[    7.432365] NIP [c008000001366a2c] fc_host_post_fc_event+0x214/0x300 =
[scsi_transport_fc]
[    7.432374] LR [c008000001366a28] fc_host_post_fc_event+0x210/0x300 =
[scsi_transport_fc]
[    7.432383] Call Trace:
[    7.432385] [c00000000380b970] [c008000001366a28] =
fc_host_post_fc_event+0x210/0x300 [scsi_transport_fc] (unreliable)
[    7.432396] [c00000000380ba30] [c008000001c23028] =
lpfc_post_init_setup+0xc0/0x1f0 [lpfc]
[    7.432429] [c00000000380bab0] [c008000001c24e00] =
lpfc_pci_probe_one_s4.isra.59+0x428/0xa10 [lpfc]
[    7.432455] [c00000000380bb40] [c008000001c255a4] =
lpfc_pci_probe_one+0x1bc/0xb70 [lpfc]
[    7.432480] [c00000000380bbe0] [c0000000007fdc7c] =
local_pci_probe+0x6c/0x110
[    7.432489] [c00000000380bc60] [c00000000017bdf8] =
work_for_cpu_fn+0x38/0x60
[    7.432494] [c00000000380bc90] [c0000000001812d4] =
process_one_work+0x2b4/0x5b0
[    7.432501] [c00000000380bd30] [c000000000181820] =
worker_thread+0x250/0x600
[    7.432508] [c00000000380bdc0] [c00000000018e4f4] kthread+0x124/0x130
[    7.432514] [c00000000380be10] [c00000000000cdf4] =
ret_from_kernel_thread+0x5c/0x64
[    7.432521] Instruction dump:
[    7.432524] 2f890000 409eff5c 3ca20000 e8a58170 3c620000 e8638178 =
39200001 38c00004=20
[    7.432535] 7fc4f378 992a0000 4800414d e8410018 <0fe00000> 7fa3eb78 =
38800001 480044d1=20
[    7.432546] ---[ end trace 0000000000000000 ]---
[    7.471075] lpfc 0022:01:00.0: 0:3176 Port Name 0 Physical Link is =
functional
[    7.471405] lpfc 0022:01:00.1: enabling device (0144 -> 0146)

The warning was added by the following patch
commit 54d9469bc515dc5fcbc20eecbe19cea868b70d68
    fortify: Add run-time WARN for cross-field memcpy()

Should this be fixed in the driver or is this a false warning?

Thanks
- Sachin=
