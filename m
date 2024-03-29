Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECC9891E4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 15:38:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y+bud6sf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5jh65qn3z3vfQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Mar 2024 01:38:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y+bud6sf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5jgM6ns0z3cRq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Mar 2024 01:37:51 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42TERfAA017474;
	Fri, 29 Mar 2024 14:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=vKefaWdMwBcVLdS1FuMyLE+ur4CqOQmGogvC3qJ8T4Q=;
 b=Y+bud6sfbt0OxC9FtZ8zAjOHTM14+ewp1ha1UkxUyk1qe4WQsSHFkb2npvgWoP4Pc/g4
 mxBTzGu7PRkySD7q5gcsp5xU4G30m52iC7ArlLvqL/ZX97ejw28kY85hBLeZ2XiaVBEt
 hANtUllr3JKu0+mKKwIze8ghT/dNQh8vGzw8ygXsgxhfp9tefooYmr2WMKz4jhIL9hU9
 799CR/cDiPTI7xreiMjj6DNLGL1Z5lXkh0wJtwg3YjXg1MNuMMZOJqR2ALZ1cP65snWy
 Ny/ooTF8Py6o9UWtM2TBTyFyDXYVwmla4imcAH85yjhiquAlZXyUhBoFakusMD8+OzL2 TA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x5ydy00kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 14:37:42 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42TEAKMg011243;
	Fri, 29 Mar 2024 14:37:42 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x2bmmm775-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 14:37:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42TEbcoA44171682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Mar 2024 14:37:40 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1ECF62004B;
	Fri, 29 Mar 2024 14:37:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFDE22005A;
	Fri, 29 Mar 2024 14:37:36 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.7.146])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Mar 2024 14:37:36 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [powerpc] WARN at drivers/scsi/sg.c:2236
 (sg_remove_sfp_usercontext)
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20240329111025.9486-1-Alexander@wetzel-home.de>
Date: Fri, 29 Mar 2024 20:07:24 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <81266270-42F4-48F9-9139-8F0C3F0A6553@linux.ibm.com>
References: <5375B275-D137-4D5F-BE25-6AF8ACAE41EF@linux.ibm.com>
 <20240329111025.9486-1-Alexander@wetzel-home.de>
To: Alexander Wetzel <Alexander@wetzel-home.de>
X-Mailer: Apple Mail (2.3774.400.31)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: V7NNS4aE-Ft2NLM8nu6PukoXe5f5MP6i
X-Proofpoint-ORIG-GUID: V7NNS4aE-Ft2NLM8nu6PukoXe5f5MP6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403290129
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> Can you check the debug patch below and provide output?
> When I'm right the warning should be gone and you should just get the
> "Modification triggered" instead. When I'm wrong we should at least =
see,
> how many references d_ref has left.
>=20

With the debug patch applied, code says d_ref value is 2

# ./ioctl_sg01=20
tst_test.c:1741: TINFO: LTP version: 20210524-2511-g00b497c47
tst_test.c:1625: TINFO: Timeout per run is 1h 00m 30s
ioctl_sg01.c:83: TINFO: Found SCSI device /dev/sg0
[   36.016630] ------------[ cut here ]------------
[   36.016674] WARNING: CPU: 19 PID: 460 at drivers/scsi/sg.c:2238 =
sg_remove_sfp_usercontext+0x270/0x298 [sg]
[   36.016707] Modules linked in: rpadlpar_io rpaphp xsk_diag =
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet =
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat =
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding tls rfkill ip_set =
nf_tables nfnetlink sunrpc binfmt_misc pseries_rng vmx_crypto xfs =
libcrc32c sd_mod sr_mod t10_pi crc64_rocksoft_generic cdrom =
crc64_rocksoft crc64 sg ibmvscsi scsi_transport_srp ibmveth fuse
[   36.016834] CPU: 19 PID: 460 Comm: kworker/19:1 Kdump: loaded Not =
tainted 6.9.0-rc1-next-20240328-dirty #3
[   36.016849] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1060.00 (NH1060_018) hv:phyp pSeries
[   36.016868] Workqueue: events sg_remove_sfp_usercontext [sg]
[   36.016889] NIP:  c008000015cf4110 LR: c008000015cf4000 CTR: =
c0000000005393b0
[   36.016903] REGS: c00000009414fae0 TRAP: 0700   Not tainted  =
(6.9.0-rc1-next-20240328-dirty)
[   36.016921] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 44000448  XER: 00000000
[   36.016962] CFAR: c008000015cf400c IRQMASK: 0  [   36.016962] GPR00: =
c008000015cf4000 c00000009414fd80 c008000015d18900 0000000000000000  [   =
36.016962] GPR04: 00000000c0000000 0000000000000023 c000000008dee000 =
0000000000000022  [   36.016962] GPR08: 000000038a6d0000 =
0000000000000002 0000000000000000 c008000015cf8c10  [   36.016962] =
GPR12: c0000000005393b0 c00000038ffe8b00 c0000000001a2bac =
c000000008e4e980  [   36.016962] GPR16: 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000  [   36.016962] =
GPR20: c00000038c993b00 c000000008dea030 c000000008dea000 =
c0000000a2712000  [   36.016962] GPR24: 0000000000000000 =
c00000000c3bd380 c0000000045ab205 c000000008deb330  [   36.016962] =
GPR28: c00000038c993b00 c000000008dea080 c000000008deb328 =
c00000000c3bd418  [   36.017107] NIP [c008000015cf4110] =
sg_remove_sfp_usercontext+0x270/0x298 [sg]
[   36.017129] LR [c008000015cf4000] =
sg_remove_sfp_usercontext+0x160/0x298 [sg]
[   36.017144] Call Trace:
[   36.017148] [c00000009414fd80] [c008000015cf4000] =
sg_remove_sfp_usercontext+0x160/0x298 [sg] (unreliable)
[   36.017169] [c00000009414fe40] [c00000000019337c] =
process_one_work+0x20c/0x4f4
[   36.017189] [c00000009414fef0] [c0000000001942fc] =
worker_thread+0x378/0x544
[   36.017208] [c00000009414ff90] [c0000000001a2cdc] kthread+0x138/0x140
[   36.017225] [c00000009414ffe0] [c00000000000df98] =
start_kernel_thread+0x14/0x18
[   36.017241] Code: 3bf90098 e8c98310 3d220000 e8698010 48004509 =
e8410018 7ec3b378 48004b15 e8410018 81390098 2c090001 4182ff04 =
<0fe00000> 80990098 3d220000 78840020  [   36.017289] ---[ end trace =
0000000000000000 ]---
[   36.017302] d_ref=3D2
ioctl_sg01.c:124: TPASS: Output buffer is empty, no data leaked
[   44.707319] d_ref=3D2

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0


=E2=80=94 Sachin=
