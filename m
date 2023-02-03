Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C89688CDB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 03:04:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7JqP1z05z3f64
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 13:04:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=olxP4JbF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=olxP4JbF;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7JpQ5J4Qz3c66
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 13:03:10 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312NHuCe003201;
	Fri, 3 Feb 2023 02:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=XqH+7sZpoJspDjg6Y2VwEnu5GoFjxo2uIyKA5ppRpC4=;
 b=olxP4JbFcHRRYFxlE0CNvC9kPddbHSJig3aMOSSYpwtY15Hgzg19MikK7ktWPwuxWp/Y
 YVdMN5+0mrfJ6gFsbg/+eSQMRAswsTjY2AwCf3VoH3FsAS6Z50WzWmDvl5PtA2g2izm6
 ssaJpi0rDsOV/pnKGwLs+RLgjNiT/t4uwF/QKYkuL94FT5qRH8u1+kEdSmrx/PYHAeWj
 zG9m3sFuM3jtzoxnOt+vn1cx/AHOohGOhtKIui8gULevp13A8MG33IqqfB9B21FeP8n6
 OaGLIdBZFMgJl/kVcY3t7UF1DG3f2JYLiI1+YthA/FzfM+1mJpeSICFDtSTcrBIJu7rk tg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngpqntstr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 02:03:07 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312CO3sl013356;
	Fri, 3 Feb 2023 02:03:04 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtyeuad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 02:03:04 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3132325D23528026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Feb 2023 02:03:02 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7007920040;
	Fri,  3 Feb 2023 02:03:02 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7342320043;
	Fri,  3 Feb 2023 02:03:01 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  3 Feb 2023 02:03:01 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B765A60418;
	Fri,  3 Feb 2023 13:02:59 +1100 (AEDT)
Message-ID: <5f0714428e4c696e3d5c00f3bafb4d2970cb6e2b.camel@linux.ibm.com>
Subject: Re: Bug: Write fault blocked by KUAP! (kernel 6.2-rc6, Talos II)
From: Benjamin Gray <bgray@linux.ibm.com>
To: "Erhard F." <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 03 Feb 2023 13:02:59 +1100
In-Reply-To: <20230203004649.1f59dbd4@yea>
References: <20230203004649.1f59dbd4@yea>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G4a20tZu2-Vc__A3jQXdz0-ViKGITbJw
X-Proofpoint-GUID: G4a20tZu2-Vc__A3jQXdz0-ViKGITbJw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_16,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=750 clxscore=1011 bulkscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030018
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-02-03 at 00:46 +0100, Erhard F. wrote:
> Happened during boot:
>=20
> [...]
> Creating 6 MTD partitions on "flash@0":
> 0x000000000000-0x000004000000 : "PNOR"
> 0x000001b21000-0x000003921000 : "BOOTKERNEL"
> 0x000003a44000-0x000003a68000 : "CAPP"
> 0x000003a88000-0x000003a89000 : "VERSION"
> 0x000003a89000-0x000003ac9000 : "IMA_CATALOG"
> 0x000003e10000-0x000004000000 : "BOOTKERNFW"
> BTRFS info: devid 1 device path /dev/root changed to /dev/nvme0n1p3
> scanned by systemd-udevd (387)
> Kernel attempted to write user page (aa55c280000) - exploit attempt?
> (uid: 0)
> ------------[ cut here ]------------
> Bug: Write fault blocked by KUAP!
> WARNING: CPU: 11 PID: 404 at arch/powerpc/mm/fault.c:228
> ___do_page_fault+0x794/0x920
> Modules linked in: drm_ttm_helper ttm drm_display_helper ofpart
> ghash_generic(+) drm_kms_helper vmx_crypto(+) powernv_flash
> ibmpowernv gf128mul syscopyarea sysfillrect hwmon mtd at24(+)
> sysimgblt usb_common regmap_i2c opal_prd pkcs8_key_parser zram
> zsmalloc powernv_cpufreq drm fuse drm_panel_orientation_quirks
> backlight configfs
> CPU: 11 PID: 404 Comm: systemd-udevd Tainted: G=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 T=C2=A0
> 6.2.0-rc6-P9 #2
> Hardware name: T2P9D01 REV 1.01 POWER9 0x4e1202 opal:skiboot-bc106a0
> PowerNV
> NIP:=C2=A0 c0000000000579c4 LR: c0000000000579c0 CTR: 0000000000000000
> REGS: c000000023b57280 TRAP: 0700=C2=A0=C2=A0 Tainted: G=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 T=C2=A0=C2=A0
> (6.2.0-rc6-P9)
> MSR:=C2=A0 9000000000029032 <SF,HV,EE,ME,IR,DR,RI>=C2=A0 CR: 44242242=C2=
=A0 XER:
> 00000000
> CFAR: c0000000000b6d54 IRQMASK: 3=20
> GPR00: 0000000000000000 c000000023b57520 c000000000e7cc00
> 0000000000000000=20
> GPR04: 0000000000000000 0000000000000000 0000000000000000
> 0000000000000000=20
> GPR08: 0000000000000000 0000000000000000 0000000000000000
> 0000000000000000=20
> GPR12: 0000000000000000 c0000007fbfdcf00 aaaaaaaaaaaaaaab
> c00800000ce2ed98=20
> GPR16: c00800000ce44d00 c00800000ce33fd8 c00800000bd97d08
> c00800000bd29c80=20
> GPR20: c00800000bd97e48 c00800000bd98f48 000000000002dd98
> c000000023545500=20
> GPR24: 00000aa55c27fffc 00000aa55c27f000 0000000002000000
> c000000023545500=20
> GPR28: 0000000000000300 c000000000d80470 00000aa55c280000
> c000000023b57630=20
> NIP [c0000000000579c4] ___do_page_fault+0x794/0x920
> LR [c0000000000579c0] ___do_page_fault+0x790/0x920
> Call Trace:
> [c000000023b57520] [c0000000000579c0] ___do_page_fault+0x790/0x920
> (unreliable)
> [c000000023b575d0] [c000000000057bac] do_page_fault+0x5c/0x170
> [c000000023b57600] [c0000000000088d8]
> data_access_common_virt+0x198/0x1f0
> --- interrupt: 300 at __patch_instruction+0x50/0x70
> NIP:=C2=A0 c000000000064670 LR: c000000000064c2c CTR: c000000000048ee0
> REGS: c000000023b57630 TRAP: 0300=C2=A0=C2=A0 Tainted: G=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 T=C2=A0=C2=A0
> (6.2.0-rc6-P9)
> MSR:=C2=A0 900000000280b032 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI>=C2=A0 CR:
> 24222244=C2=A0 XER: 00000000
> CFAR: c00000000006462c DAR: 00000aa55c280000 DSISR: 42000000 IRQMASK:
> 1=20
> GPR00: 0000000000000000 c000000023b578d0 c000000000e7cc00
> c00800000ce33ffc=20
> GPR04: 041ae13000000000 00000aa55c27fffc 0000000000000000
> 0000000000000000=20
> GPR08: 0000000000000000 00000000041ae130 0000000000000001
> 0000000000000000=20
> GPR12: 0000000000000000 c0000007fbfdcf00 aaaaaaaaaaaaaaab
> c00800000ce2ed98=20
> GPR16: c00800000ce44d00 c00800000ce33fd8 c00800000bd97d08
> c00800000bd29c80=20
> GPR20: c00800000bd97e48 c00800000bd98f48 000000000002dd98
> c000000023545500=20
> GPR24: 00000aa55c27fffc 00000aa55c27f000 041ae13000000000
> c0000000012e1400=20
> GPR28: 0000000000000000 c00800000ce33ffc c000000004a813f8
> 00000000000251bd=20
> NIP [c000000000064670] __patch_instruction+0x50/0x70
> LR [c000000000064c2c] patch_instruction+0x13c/0x280
> --- interrupt: 300
> [c000000023b578d0] [c000000000064bd8] patch_instruction+0xe8/0x280
> (unreliable)
> [c000000023b57950] [c000000000049314] apply_relocate_add+0x9f4/0xb50
> [c000000023b57a70] [c000000000172cbc] load_module+0x20fc/0x2a00
> [c000000023b57c00] [c0000000001738c8]
> __do_sys_finit_module+0xc8/0x180
> [c000000023b57ce0] [c00000000002ae90]
> system_call_exception+0x130/0x2d0
> [c000000023b57e50] [c00000000000c070]
> system_call_vectored_common+0xf0/0x280
> --- interrupt: 3000 at 0x3fffa31d5a28
> NIP:=C2=A0 00003fffa31d5a28 LR: 0000000000000000 CTR: 0000000000000000
> REGS: c000000023b57e80 TRAP: 3000=C2=A0=C2=A0 Tainted: G=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 T=C2=A0=C2=A0
> (6.2.0-rc6-P9)
> MSR:=C2=A0 900000000280f032 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI>=C2=A0 CR=
:
> 48222244=C2=A0 XER: 00000000
> IRQMASK: 0=20
> GPR00: 0000000000000161 00003ffff9bf99f0 00003fffa32d7200
> 000000000000000d=20
> GPR04: 00003fffa3375029 0000000000000000 000000000000000d
> 0000000000000000=20
> GPR08: 0000000000000000 0000000000000000 0000000000000000
> 0000000000000000=20
> GPR12: 0000000000000000 00003fffa379c7e0 0000000000000000
> 000000012cb4a805=20
> GPR16: 0000000040000000 0000000020000000 000000012cb4bcc9
> 00003fffa366da07=20
> GPR20: 0000000000000000 000000015a588320 0000000020000000
> 0000000000000000=20
> GPR24: 0000000020000000 0000000000000000 0000000000000000
> 000000015a561eb0=20
> GPR28: 00003fffa3375029 0000000000020000 0000000000000000
> 000000015a58cc20=20
> NIP [00003fffa31d5a28] 0x3fffa31d5a28
> LR [0000000000000000] 0x0
> --- interrupt: 3000
> Code: e87f0100 48094161 60000000 2c230000 4182fefc 418e00b8 3c82ffee
> 388442a8 3c62ffee 38634398 4805f315 60000000 <0fe00000> fb210078
> 60000000 e93d0650=20
> ---[ end trace 0000000000000000 ]---
> BTRFS: device label g5_sta devid 1 transid 55729 /dev/nvme0n1p5
> scanned by systemd-udevd (467)
> BTRFS: device label g4_musl devid 1 transid 64188 /dev/nvme0n1p8
> scanned by systemd-udevd (425)
> BTRFS: device label aux_p9 devid 1 transid 155143 /dev/nvme0n1p9
> scanned by systemd-udevd (472)
> BTRFS: device label g5_musl devid 1 transid 71824 /dev/nvme0n1p6
> scanned by systemd-udevd (402)
> [...]
>=20
> Regards,
> Erhard

Do you have a QEMU command to boot this? I tried with
  =20
    qemu-system-ppc64 --nographic --vga none --kernel ./vmlinux

But it crashes immediately on booting the kernel (same using KVM on
Power9).

I was concerned this might be caused by the new temporary mm context
for code patching, which does use userspace addresses for the patching,
but it should have failed much earlier if it was that simple. There's a
lot of patching that goes on before starting userspace.

FWIW, I see the config has the experimental
CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 set.
