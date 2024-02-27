Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F35EB869C62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 17:39:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PpVnoSPJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkjql5VsSz3vXx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 03:39:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PpVnoSPJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkjq30nnjz3cQj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 03:38:38 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41RGRsiQ002955;
	Tue, 27 Feb 2024 16:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=sSNsOAJ5Up1R7JoYxr3avzcuOpmNGoWPp+gUn6iyGbU=;
 b=PpVnoSPJQ5i8UNQsmY+OwUwUi9xMpeNK6Kb4Mj0pBfKWm120I2vDRmYIXl4A1iEyUDPl
 8NO+mepbszrhgJfyQ7FBKxqqrUd50R9o6Qs6WC+fZYM5gyz5D6jZFGJpUOXuzg+0sDOy
 Z/JRYznROBKI/bbJQM5dFzhQZ6TUNGjHgCB0+TFeqP9a1tB18YDlG/QGAsDWvmZBpQNj
 /9LLXwzsBKxJqY7X9cfAJWiNhH+YsiWLRGoWbMjE8avwfSSeSuX8hQ3sTpRsrrGVC1g3
 f4VoqLjlF/QvwZBYxxdCfz3gs5R5NjU0fqxiYBxmOG8ciZcFT0rijJwcvdwfw9/RK8yP 0g== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3whjpysfu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 16:38:34 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41RGVta6008178;
	Tue, 27 Feb 2024 16:38:34 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfv9m8q6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 16:38:34 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41RGcUKF44761404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Feb 2024 16:38:32 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13A1B20040;
	Tue, 27 Feb 2024 16:38:30 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5129420049;
	Tue, 27 Feb 2024 16:38:29 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.112.249])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Feb 2024 16:38:28 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: Kernel WARNING at lib/vsprintf.c:2721 while running ftrace kernel
 selftests
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20240227112443.0bd9f4b8@gandalf.local.home>
Date: Tue, 27 Feb 2024 22:08:18 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <4A3F2F8E-15D2-48F3-8D59-C11EB0BC7F14@linux.ibm.com>
References: <C7E7AF1A-D30F-4D18-B8E5-AF1EF58004F5@linux.ibm.com>
 <20240226122208.344447f1@gandalf.local.home>
 <129D90CC-6DEB-4953-8061-EAA89F1ED514@linux.ibm.com>
 <20240227091858.7b66f8cc@gandalf.local.home>
 <1F8D4E65-4E23-49FD-B092-980BB1203E19@linux.ibm.com>
 <20240227112443.0bd9f4b8@gandalf.local.home>
To: Steven Rostedt <rostedt@goodmis.org>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RUx6DC9ZG7bt5ifubB3jQ44rQuPxuZ_F
X-Proofpoint-ORIG-GUID: RUx6DC9ZG7bt5ifubB3jQ44rQuPxuZ_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_03,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402270128
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 27-Feb-2024, at 9:54=E2=80=AFPM, Steven Rostedt =
<rostedt@goodmis.org> wrote:
>=20
> On Tue, 27 Feb 2024 21:38:57 +0530
> Sachin Sant <sachinp@linux.ibm.com> wrote:
>=20
>> This warning was not triggered.
>=20
> Interesting.
>=20
>>=20
>> I have attached .config
>=20
> This is what I was looking for:
>=20
>> # CONFIG_PPC_4K_PAGES is not set
>> CONFIG_PPC_64K_PAGES=3Dy
>> CONFIG_PAGE_SIZE_64KB=3Dy
>> CONFIG_PPC_PAGE_SHIFT=3D16
>=20
> So the pages are 64K in size. I wonder if this is causing an issue.
>=20
> Can you apply this, and see if it triggers and if it does, print the =
line
> that has the max size?
>=20

With this I see following trace

[   61.327138] ------------[ cut here ]------------
[   61.327159] MAX OUT OF RANGE 63492
[   61.327167] WARNING: CPU: 1 PID: 5180 at =
kernel/trace/trace_output.c:1592 trace_print_print+0xf4/0x114
[   61.327178] Modules linked in: rpadlpar_io(E) rpaphp(E) xsk_diag(E) =
nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) =
nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) =
nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) =
nf_defrag_ipv4(E) bonding(E) tls(E) rfkill(E) ip_set(E) nf_tables(E) =
nfnetlink(E) sunrpc(E) binfmt_misc(E) pseries_rng(E) =
aes_gcm_p10_crypto(E) drm(E) drm_panel_orientation_quirks(E) xfs(E) =
libcrc32c(E) sd_mod(E) sr_mod(E) t10_pi(E) crc64_rocksoft_generic(E) =
cdrom(E) crc64_rocksoft(E) crc64(E) sg(E) ibmvscsi(E) =
scsi_transport_srp(E) ibmveth(E) vmx_crypto(E) fuse(E)
[   61.327232] CPU: 1 PID: 5180 Comm: awk Kdump: loaded Tainted: G       =
     E      6.8.0-rc5-00329-gab0a97cffa0b-dirty #37
[   61.327238] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1060.00 (NH1060_018) hv:phyp pSeries
[   61.327243] NIP:  c00000000032eb7c LR: c00000000032eb78 CTR: =
0000000000000000
[   61.327247] REGS: c0000000505cf730 TRAP: 0700   Tainted: G            =
E       (6.8.0-rc5-00329-gab0a97cffa0b-dirty)
[   61.327253] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: =
48008202  XER: 00000005
[   61.327263] CFAR: c000000000161e7c IRQMASK: 0=20
[   61.327263] GPR00: c00000000032eb78 c0000000505cf9d0 c000000001502700 =
0000000000000016=20
[   61.327263] GPR04: 0000000000000000 c0000000505cf7e0 c0000000505cf7d8 =
00000003bd8c0000=20
[   61.327263] GPR08: 0000000000000027 c0000003bfa58110 0000000000000001 =
0000000000000001=20
[   61.327263] GPR12: 0000000000000000 c0000003bffff300 0000000000000000 =
0000000000000000=20
[   61.327263] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
c000000090080000=20
[   61.327263] GPR20: 000000000000064c 0000000000400cc0 c00000005e7377c0 =
c000000002a6ed98=20
[   61.327263] GPR24: c0000000900c0000 c0000000900a0190 c000000009d50008 =
0000000003b54601=20
[   61.327263] GPR28: c000000002a711a8 c0000000900c0000 000000000000f804 =
0000000000000002=20
[   61.327307] NIP [c00000000032eb7c] trace_print_print+0xf4/0x114
[   61.327312] LR [c00000000032eb78] trace_print_print+0xf0/0x114
[   61.327317] Call Trace:
[   61.327319] [c0000000505cf9d0] [c00000000032eb78] =
trace_print_print+0xf0/0x114 (unreliable)
[   61.327325] [c0000000505cfa50] [c00000000031832c] =
print_trace_fmt+0x13c/0x26c
[   61.327331] [c0000000505cfb00] [c000000000328488] s_show+0x5c/0x2cc
[   61.327335] [c0000000505cfb90] [c000000000608e88] =
seq_read_iter+0x500/0x69c
[   61.327342] [c0000000505cfc70] [c000000000609128] =
seq_read+0x104/0x15c
[   61.327348] [c0000000505cfd10] [c0000000005bf79c] vfs_read+0xdc/0x390
[   61.327353] [c0000000505cfdc0] [c0000000005c076c] =
ksys_read+0x84/0x144
[   61.327358] [c0000000505cfe10] [c000000000033328] =
system_call_exception+0x138/0x330
[   61.327365] [c0000000505cfe50] [c00000000000d05c] =
system_call_vectored_common+0x15c/0x2ec
[   61.327372] --- interrupt: 3000 at 0x7fff97933c74
[   61.327376] NIP:  00007fff97933c74 LR: 00007fff97933c74 CTR: =
0000000000000000
[   61.327381] REGS: c0000000505cfe80 TRAP: 3000   Tainted: G            =
E       (6.8.0-rc5-00329-gab0a97cffa0b-dirty)
[   61.327386] MSR:  800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE>  CR: =
44008408  XER: 00000000
[   61.327395] IRQMASK: 0=20
[   61.327395] GPR00: 0000000000000003 00007fffe9723220 0000000106787e00 =
0000000000000003=20
[   61.327395] GPR04: 000000012f0e8150 0000000000010000 fffffffffffffff5 =
000000000012f0e5=20
[   61.327395] GPR08: 0000000000000001 0000000000000000 0000000000000000 =
0000000000000000=20
[   61.327395] GPR12: 0000000000000000 00007fff97f4c940 000000012f0c5a40 =
00007fffe97236d8=20
[   61.327395] GPR16: 000000012f0e3320 000000012f0d3a28 000000012f0e30f0 =
0000000000000001=20
[   61.327395] GPR20: 8000000000000001 0000000000000001 00000000000005d6 =
00007fffe9723447=20
[   61.327395] GPR24: 00007fffe9723448 00007fffe9723448 00007fffe97233a0 =
0000000000000000=20
[   61.327395] GPR28: 00000001066e466c 0000000000000000 00007fffe9723398 =
000000012f0e8030=20
[   61.327437] NIP [00007fff97933c74] 0x7fff97933c74
[   61.327440] LR [00007fff97933c74] 0x7fff97933c74
[   61.327443] --- interrupt: 3000
[   61.327445] Code: 2c090000 4082ffd4 7c0802a6 3c62ffe4 39200001 =
3d420160 7fc407b4 38635608 992a493c f8010090 4be33281 60000000 =
<0fe00000> e8010090 38210080 7be30020=20
[   61.327459] ---[ end trace 0000000000000000 ]=E2=80=94

Thanks
=E2=80=94 Sachin
