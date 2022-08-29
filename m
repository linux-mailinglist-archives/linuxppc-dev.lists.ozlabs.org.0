Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 723965A4A18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 13:33:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGSxB4pPcz3c23
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 21:33:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TgIucK2F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TgIucK2F;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGSwR48BHz3bd6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 21:32:39 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TBAc4X008210;
	Mon, 29 Aug 2022 11:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=ylcZLCxBaQI7dD6pBBoV6/4Udaf91hLHQyQSDw/2xT8=;
 b=TgIucK2Fitc9OmBqqd4PMlVipII/Tck/ymnlBSnH8ArY0lSNYw8plPrE8aG/2VzL1rT7
 B1sKMjTNqHDmZPeqdqCw4TgrecMaoM3okNtTvh3KMDIIhJFsSUVJz0dm/csVx/4PIMWe
 lykGHa9ZxxX+ZOH3ijQ9+XbvHmCzOsQjpUBQ2ADq/V02WDpLUxQq9/ZUZ4lzMByRFMzu
 V5EwJ16ODv796sQDiIW4WcIaNS1DlF2e/LqoE0Vuipg1TNz9wUuAcECjrS+37TxVpFv6
 9MHeq9Yf8vgBR8bl5uYfctUqnUvvXtrdCAf6AjglqhNNVs6j8CHtQlqBYgu6xgBQSxp+ Bg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8v0m0vht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 11:32:32 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27TBLfNn015374;
	Mon, 29 Aug 2022 11:32:29 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3j7aw8t87m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 11:32:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27TBWl4S43385304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Aug 2022 11:32:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F7AF11C04A;
	Mon, 29 Aug 2022 11:32:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 209C111C050;
	Mon, 29 Aug 2022 11:32:25 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.92.230])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 29 Aug 2022 11:32:24 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] powerpc/pseries/mce: Avoid instrumentation in realmode
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220829074522.443439-1-ganeshgr@linux.ibm.com>
Date: Mon, 29 Aug 2022 17:02:23 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <65A5D2E6-96A7-44E8-8418-B4B5D566D676@linux.ibm.com>
References: <20220829074522.443439-1-ganeshgr@linux.ibm.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nQbawgwip3khyYyXRmHOe6LcLyRKJWhk
X-Proofpoint-ORIG-GUID: nQbawgwip3khyYyXRmHOe6LcLyRKJWhk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_05,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=720 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208290055
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
Cc: linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 29-Aug-2022, at 1:15 PM, Ganesh Goudar <ganeshgr@linux.ibm.com> =
wrote:
>=20
> Part of machine check error handling is done in realmode,
> As of now instrumentation is not possible for any code that
> runs in realmode.
> When MCE is injected on KASAN enabled kernel, crash is
> observed, Hence force inline or mark no instrumentation
> for functions which can run in realmode to avoid KASAN
> instrumentation.
>=20
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
> arch/powerpc/include/asm/interrupt.h | 2 +-
> arch/powerpc/include/asm/rtas.h      | 4 ++--
> arch/powerpc/kernel/rtas.c           | 4 ++--
> 3 files changed, 5 insertions(+), 5 deletions(-)

Thanks for the patch. I tested it on top of 6.0.0-rc3. It proceeds =
further but
eventually crashes after arch_local_save_flags


# selftests: powerpc/mce: inject-ra-err
[  111.183705] BUG: Unable to handle kernel data access on read at =
0xc00e00027fffe706
[  111.183735] Faulting instruction address: 0xc0000000006b724c
[  111.183744] Oops: Kernel access of bad area, sig: 11 [#1]
[  111.183750] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA =
pSeries
[  111.183761] Modules linked in: rpadlpar_io(E) rpaphp(E) dm_mod(E) =
xsk_diag(E) nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) =
nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) =
nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) =
nf_defrag_ipv4(E) bonding(E) rfkill(E) ip_set(E) tls(E) nf_tables(E) =
nfnetlink(E) sunrpc(E) binfmt_misc(E) pseries_rng(E) drm(E) =
drm_panel_orientation_quirks(E) xfs(E) libcrc32c(E) sd_mod(E) t10_pi(E) =
sr_mod(E) crc64_rocksoft_generic(E) cdrom(E) crc64_rocksoft(E) crc64(E) =
sg(E) ibmvscsi(E) ibmveth(E) scsi_transport_srp(E) vmx_crypto(E) fuse(E)
[  111.183872] CPU: 16 PID: 6290 Comm: inject-ra-err Tainted: G          =
  E      6.0.0-rc3-dirty #1
[  111.183883] NIP:  c0000000006b724c LR: c00000000004f674 CTR: =
0000000000000000
[  111.183890] REGS: c0000000ff7f7880 TRAP: 0300   Tainted: G            =
E       (6.0.0-rc3-dirty)
[  111.183899] MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 48002828  XER: =
00000000
[  111.183916] CFAR: c00000000004f670 DAR: c00e00027fffe706 DSISR: =
40000000 IRQMASK: 3=20
[  111.183916] GPR00: c00000000004f674 c0000000ff7f7b20 c0000000034ad200 =
c0000013ffff3832=20
[  111.183916] GPR04: 0000000000000031 0000000000000000 c00000000004f674 =
000000000000000c=20
[  111.183916] GPR08: 0000000000000000 a80e000000000000 180000027fffe706 =
0000000000000000=20
[  111.183916] GPR12: c0000013ffff2f00 c0000013ffff2f00 0000000000000000 =
0000000000000000=20
[  111.183916] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[  111.183916] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000010000b30=20
[  111.183916] GPR24: 00007fffbc8b0000 00007fffbc8af6d8 00007fffc0604158 =
000000001001fce8=20
[  111.183916] GPR28: c00000116aae0868 0000000000000002 00000000ff7f7c20 =
c0000013ffff2f00=20
[  111.184008] NIP [c0000000006b724c] __asan_load1+0x4c/0xa0
[  111.184023] LR [c00000000004f674] arch_local_save_flags+0x24/0x40
[  111.184033] Call Trace:
[  111.184037] [c0000000ff7f7b40] [c00000000004f674] =
arch_local_save_flags+0x24/0x40
[  111.184048] [c0000000ff7f7b70] [c0000000014d42ac] =
va_rtas_call_unlocked+0x13c/0x1d0
[  111.184062] [c0000000ff7f7ba0] [c000000000051c54] =
rtas_call_unlocked+0x34/0x50
[  111.184072] [c0000000ff7f7bc0] [c00000000012edc8] =
pseries_machine_check_realmode+0x188/0x2c0
[  111.184085] [c0000000ff7f7ca0] [c00000000004b128] =
machine_check_early+0x68/0xc0
[  111.184095] [c0000000ff7f7cf0] [c000000000008364] =
machine_check_early_common+0x134/0x1f8
[  111.184107] --- interrupt: 200 at 0x10000e48
[  111.184115] NIP:  0000000010000e48 LR: 0000000010000e40 CTR: =
0000000000000000
[  111.184121] REGS: c0000000ff7f7d60 TRAP: 0200   Tainted: G            =
E       (6.0.0-rc3-dirty)
[  111.184129] MSR:  8000000002a0f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 82002822  XER: 00000000
[  111.184152] CFAR: 000000000000021c DAR: 00007fffbc810000 DSISR: =
02000008 IRQMASK: 0=20
[  111.184152] GPR00: 0000000010000e40 00007fffc0603a70 0000000010027f00 =
00007fffbc810000=20
[  111.184152] GPR04: 0000000000001000 0000000000000003 0000000000000001 =
0000000000000005=20
[  111.184152] GPR08: 0000000000000000 fffffffffffff000 0000000000000000 =
0000000000000000=20
[  111.184152] GPR12: 0000000000000000 00007fffbc8ba5e0 0000000000000000 =
0000000000000000=20
[  111.184152] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[  111.184152] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000010000b30=20
[  111.184152] GPR24: 00007fffbc8b0000 00007fffbc8af6d8 00007fffc0604158 =
000000001001fce8=20
[  111.184152] GPR28: 00007fffc06042e0 0000000000000001 0000000000000005 =
0000000000000000=20
[  111.184241] NIP [0000000010000e48] 0x10000e48
[  111.184247] LR [0000000010000e40] 0x10000e40
[  111.184252] --- interrupt: 200
[  111.184256] Instruction dump:
[  111.184261] 7cc802a6 4182005c 3d20bfff 6129ffff 792907c6 6529ffff =
6129ffff 7c234840=20
[  111.184278] 40810040 3d20a80e 786ae8c2 792907c6 <7d2a48ae> 7d290775 =
4082001c 38210020=20
[  111.184297] ---[ end trace 0000000000000000 ]=E2=80=94

- Sachin

