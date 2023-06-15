Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F89E730E72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 06:58:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hI9rkmRJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhVRt0g3Xz3bh5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 14:58:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hI9rkmRJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhVQx49MVz301r
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 14:57:45 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F4oA5t016249;
	Thu, 15 Jun 2023 04:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=QRO6qslRxLMBHdrNAEHhlb8acejnUpzeB+PuRGl7aiM=;
 b=hI9rkmRJfazcbCTXR2xp8o6MhdMNJ3xbxeMhItl90Ca0Yk+f8rrjl0CadPm4dyPGkLq0
 E7bSra7iwBEwAVBH9NxdUx61c+LvBBc33pejNAe7s6nEVgr6+nOoTbAu4PW8R1YhvbtX
 RNZAeTNzbzWU+hWrJ2U6KY8SuBTrJkLLaEIzege5nuM0eIC8gavtEksMttqA9OJVaP1W
 I876NM0JY++Syxjn+jNnfvUpqLlgBGpHDkvc1O9TNj2ZJOV5EGnzhdgnx082bsIOcFfu
 SF7RVA8feV1C9XFdxmmweRMltkuCHLs4ozszwaNZcPDu4ay1mJppCt2uNxv/IJ97RIcG KQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r7uy8042u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 04:57:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35ELnEGk028076;
	Thu, 15 Jun 2023 04:57:37 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r4gee3bfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 04:57:36 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35F4vYCC40567068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jun 2023 04:57:34 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90C202004D;
	Thu, 15 Jun 2023 04:57:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 845C420043;
	Thu, 15 Jun 2023 04:57:33 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.192])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jun 2023 04:57:33 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [6.4-rc6] Crash during a kexec operation
 (tpm_amd_is_rng_defective)
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <87o7lhfmoh.fsf@mail.lhotse>
Date: Thu, 15 Jun 2023 10:27:22 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <CA0088E4-2851-4AFF-94F8-2A07C5CDA8D8@linux.ibm.com>
References: <99B81401-DB46-49B9-B321-CF832B50CAC3@linux.ibm.com>
 <87o7lhfmoh.fsf@mail.lhotse>
To: Michael Ellerman <michaele@au1.ibm.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2pyyleCB6dtQ8bl6VTfNFnseYveB8qag
X-Proofpoint-GUID: 2pyyleCB6dtQ8bl6VTfNFnseYveB8qag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_02,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=790 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150037
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
Cc: jarkko@kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>> [ 34.381788] Code: 5463063e 408201c8 38210080 4e800020 60000000 =
60000000 60000000 7c0802a6 fbe10078 7c7f1b78 f8010090 e9230728 =
<e9890050> 2c2c0000 41820020 7d8903a6=20
>=20
>  2c:   28 07 23 e9     ld      r9,1832(r3)
>  30:   50 00 89 e9     ld      r12,80(r9)
>=20
> Where r3 is *chip.
> r9 is NULL, and 80 =3D 0x50.
>=20
> Looks like a NULL chip->ops, which oopses in:
>=20
> static int tpm_request_locality(struct tpm_chip *chip)
> {
> int rc;
>=20
> if (!chip->ops->request_locality)
>=20
>=20
> Can you test the patch below?
>=20

It proceeds further but then run into following crash

[  103.269574] Kernel attempted to read user page (18) - exploit =
attempt? (uid: 0)
[  103.269589] BUG: Kernel NULL pointer dereference on read at =
0x00000018
[  103.269595] Faulting instruction address: 0xc0000000009dcf34
[  103.269599] Oops: Kernel access of bad area, sig: 11 [#1]
[  103.269602] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA =
pSeries
[  103.269606] Modules linked in: dm_mod(E) nft_fib_inet(E) =
nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) =
nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) =
nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) =
nf_defrag_ipv4(E) bonding(E) tls(E) rfkill(E) ip_set(E) sunrpc(E) =
nf_tables(E) nfnetlink(E) pseries_rng(E) aes_gcm_p10_crypto(E) drm(E) =
drm_panel_orientation_quirks(E) xfs(E) libcrc32c(E) sd_mod(E) sr_mod(E) =
t10_pi(E) crc64_rocksoft_generic(E) cdrom(E) crc64_rocksoft(E) crc64(E) =
sg(E) ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) vmx_crypto(E) fuse(E)
[  103.269644] CPU: 18 PID: 6872 Comm: kexec Kdump: loaded Tainted: G    =
        E      6.4.0-rc6-dirty #8
[  103.269649] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
[  103.269653] NIP:  c0000000009dcf34 LR: c0000000009dd2bc CTR: =
c0000000009eaa60
[  103.269656] REGS: c0000000a113f510 TRAP: 0300   Tainted: G            =
E       (6.4.0-rc6-dirty)
[  103.269660] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 88484886  XER: 00000001
[  103.269669] CFAR: c0000000009dd2b8 DAR: 0000000000000018 DSISR: =
40000000 IRQMASK: 0  [  103.269669] GPR00: c0000000009dd2bc =
c0000000a113f7b0 c0000000014a1500 c000000090310000  [  103.269669] =
GPR04: c00000009f770000 0000000000000016 0000060000007a01 =
0000000000000016  [  103.269669] GPR08: c00000009f770000 =
0000000000000000 0000000000000000 0000000000008000  [  103.269669] =
GPR12: c0000000009eaa60 c00000135fab7f00 0000000000000000 =
0000000000000000  [  103.269669] GPR16: 0000000000000000 =
0000000000000000 0000000000000000 0000000000000000  [  103.269669] =
GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000  [  103.269669] GPR24: 0000000000000000 =
0000000000000016 c000000090310000 0000000000001000  [  103.269669] =
GPR28: c00000009f770000 000000007a010000 c00000009f770000 =
c000000090310000  [  103.269707] NIP [c0000000009dcf34] =
tpm_try_transmit+0x74/0x300
[  103.269713] LR [c0000000009dd2bc] tpm_transmit+0xfc/0x190
[  103.269717] Call Trace:
[  103.269718] [c0000000a113f7b0] [c0000000a113f880] 0xc0000000a113f880 =
(unreliable)
[  103.269724] [c0000000a113f840] [c0000000009dd2bc] =
tpm_transmit+0xfc/0x190
[  103.269727] [c0000000a113f900] [c0000000009dd398] =
tpm_transmit_cmd+0x48/0x110
[  103.269731] [c0000000a113f980] [c0000000009df1b0] =
tpm2_get_tpm_pt+0x140/0x230
[  103.269736] [c0000000a113fa20] [c0000000009db208] =
tpm_amd_is_rng_defective+0xb8/0x250
[  103.269739] [c0000000a113faa0] [c0000000009db828] =
tpm_chip_unregister+0x138/0x160
[  103.269743] [c0000000a113fae0] [c0000000009eaa94] =
tpm_ibmvtpm_remove+0x34/0x130
[  103.269748] [c0000000a113fb50] [c000000000115738] =
vio_bus_remove+0x58/0xd0
[  103.269754] [c0000000a113fb90] [c000000000a01dcc] =
device_shutdown+0x21c/0x39c
[  103.269758] [c0000000a113fc20] [c0000000001a2684] =
kernel_restart_prepare+0x54/0x70
[  103.269762] [c0000000a113fc40] [c000000000292c48] =
kernel_kexec+0xa8/0x100
[  103.269766] [c0000000a113fcb0] [c0000000001a2cd4] =
__do_sys_reboot+0x214/0x2c0
[  103.269770] [c0000000a113fe10] [c000000000034adc] =
system_call_exception+0x13c/0x340
[  103.269776] [c0000000a113fe50] [c00000000000d05c] =
system_call_vectored_common+0x15c/0x2ec
[  103.269781] --- interrupt: 3000 at 0x7fff805459f0
[  103.269784] NIP:  00007fff805459f0 LR: 0000000000000000 CTR: =
0000000000000000
[  103.269786] REGS: c0000000a113fe80 TRAP: 3000   Tainted: G            =
E       (6.4.0-rc6-dirty)
[  103.269790] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 42422884  XER: 00000000
[  103.269799] IRQMASK: 0  [  103.269799] GPR00: 0000000000000058 =
00007fffc07a68c0 0000000110437f00 fffffffffee1dead  [  103.269799] =
GPR04: 0000000028121969 0000000045584543 0000000000000000 =
0000000000000003  [  103.269799] GPR08: 0000000000100000 =
0000000000000000 0000000000000000 0000000000000000  [  103.269799] =
GPR12: 0000000000000000 00007fff8089b2c0 000000011042f598 =
0000000000000000  [  103.269799] GPR16: ffffffffffffffff =
0000000000000000 000000011040fcc0 0000000000000000  [  103.269799] =
GPR20: 0000000000008913 0000000000008914 0000000149c61020 =
0000000000000003  [  103.269799] GPR24: 0000000000000000 =
0000000000000001 0000000000000003 00007fffc07a6a40  [  103.269799] =
GPR28: 0000000110409f10 00007fff806419c0 0000000149c61080 =
0000000149c61040  [  103.269833] NIP [00007fff805459f0] 0x7fff805459f0
[  103.269836] LR [0000000000000000] 0x0
[  103.269838] --- interrupt: 3000
[  103.269839] Code: 83a40006 2c090000 41820208 7c0802a6 79250020 =
7c25d840 f80100a0 41810224 fbe10088 f8410018 7c7f1b78 e9230728 =
<e9890018> 7d8903a6 4e800421 e8410018  [  103.269852] ---[ end trace =
0000000000000000 ]=E2=80=94

- Sachin
