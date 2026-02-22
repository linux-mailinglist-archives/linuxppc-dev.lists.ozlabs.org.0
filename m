Return-Path: <linuxppc-dev+bounces-17008-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAx+D/r+mmlKpQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17008-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 14:04:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D19816F1C3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 14:04:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJkjL4snvz30T8;
	Mon, 23 Feb 2026 00:04:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771765494;
	cv=none; b=Epe26f3GZyjPOdUtvykwdvK4CJHivTbb1mCAJV8glJStqCUBz/PRoWLtUZ+pSCiMxX/DguANIzxdYzPBpQXNj5gUGY6Fe4i6D+8t+NIGozolzU7d5VtyQjiFO289SEaVdqEs6lmYch3/80mkozvmEJMEqG/zM/H5hDOZ+T6256nMPFui2W8+3Qi899ycu12nOlBJ8krc2M6bupGsIh89PxghFPG5QSe1bfOqeF4dILMCMkdhj4ZiV2WUn1K4m5He+2iwBiWgss7+OErCLuII6V9mfQoKgRzifSH69QKxpyQwWKFr/q3h7dQlqgflqrPI8GN3bldy4jewX5A4gsdHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771765494; c=relaxed/relaxed;
	bh=gaS/dCcdOHspodoa5hNOwWvZFuhwz4vaqABqbrH6ZwU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NYttvmcEM4Vxp5jDGo1jOVceDiBmyLH/JfvNHwJOu5RB0Oxsr7taTenLXUrQIn4F0GSCEA3gZzaaf1/IwVMr7FfIUDq7wxulYZCtx29hDOOtsR5B/FfAgvAraB7SNleOgLa9ejIF/2m1S/T7PIoP9P6U2VQwWwrTWaI7b6Ob0ZqsKlfnOVItXjYloPR6SCUfqPNwwWwj40SaR5eI2I0CVb0myiP9Tnc2UBbkjH8znJjEUZPOqLsqPZ+lyqqjyGf79LAnxcg29x7hUJ1OPknqKf+t2YjxvvyJGKqhLfx87kdizPcFJAT9fO5bcawow5Htt7W5LDMzoGIETOrRQG6clA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BRkj3ziZ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BRkj3ziZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJkjK5kc6z2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 00:04:52 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MCtv8x1574869;
	Sun, 22 Feb 2026 13:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gaS/dC
	cdOHspodoa5hNOwWvZFuhwz4vaqABqbrH6ZwU=; b=BRkj3ziZhghU6zOJ5p6yu1
	jnWuItKxjLUJ8dMcoT21OM3Ul1jBuifMq7GdPBsAdM9pfQuL8R0sWxPV7J1uzbJI
	kUkNQ4LUMgGxlFLSrLRr2L5awRKCGhkhlnTBulven7ph2LTBI0CIpHGxf5dWX6Ka
	/xf4OpFfh4x3lOoZALSQ88fSTpg/hdi9rN7Tu41hhDuNzqpIIvYYGGOI3Nov5k2f
	aONwLv6c1UggR7ZTwBWZ2PrKguAPf7YsWBGMWoHA6uESOalWJUhBwQ8EhwaDJlF7
	ewZjLBJ5odxu2LAvdeOz0GetQmmsZDlwYENccWna+AZrn2VeMfBB4idIMgN/Wpzw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4cqkyxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Feb 2026 13:04:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61M80mcH013438;
	Sun, 22 Feb 2026 13:04:47 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfqdxsgge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Feb 2026 13:04:47 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61MD4k6o24052310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Feb 2026 13:04:46 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16BE45805C;
	Sun, 22 Feb 2026 13:04:46 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB50158051;
	Sun, 22 Feb 2026 13:04:43 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.255.192])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Sun, 22 Feb 2026 13:04:43 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH 2/2] powerpc/selftests/copyloops: extend selftest to
 exercise __copy_tofrom_user_power7_vmx
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260217124457.89219-2-sayalip@linux.ibm.com>
Date: Sun, 22 Feb 2026 18:34:30 +0530
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, chleroy@kernel.org, riteshh@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A10B7798-0C65-4926-A39F-3DB05C4D33B4@linux.ibm.com>
References: <20260217124457.89219-1-sayalip@linux.ibm.com>
 <20260217124457.89219-2-sayalip@linux.ibm.com>
To: Sayali Patil <sayalip@linux.ibm.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ch8TdR3wriVnNLP1iLvdNoAoQ9O_0WkF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDEyMiBTYWx0ZWRfX4p9E6DElqHWJ
 S7fnA4rHOE5soxiXsjbgKEVxhuEVdMNC2gelVFZ3Bw2NmzrjRsS0WHaaptlcTgSm4gvpexhJ6d1
 Z6AAfFunRvTFxpnZNp0YLZJytwXVIyfBXgmSkjVr2Dc765o4FF7ffr5fSAN4RTTIQjSTYbYPm6+
 w5uf5o5j4SRx8xMLuFO9OtbMLdc6PKig94CkEKX0/vQyntp0fH49bmFSnLZ6lvEV6khuEDuck1D
 rU1uyiQBKmCmlU5C/qFRZJSssZy6JZT+vljCJNr0jpbjcusiZsuuxcgbcU/voOvV0IGnl6h8B8w
 BaTh7FMK+EbSluNsAcvEbP4loJ0O1iFSWLuVW/Jn9DyceGal0ifsJWUeLjHwFQc4AfHQWiKpl+0
 cqYpgsBk2CG64/SqBYJWZK5n9dMVcrrtNoFfE2iyuws2x877aCkymyKQswHQr7yQdKMla+7kjXw
 KWN3Sg5CjuYwdENd9mQ==
X-Proofpoint-GUID: Ch8TdR3wriVnNLP1iLvdNoAoQ9O_0WkF
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=699afef0 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8
 a=xtvLraR0ur4_u77ESH0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602220122
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_FROM(0.00)[bounces-17008-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3D19816F1C3
X-Rspamd-Action: no action



> On 17 Feb 2026, at 6:14=E2=80=AFPM, Sayali Patil =
<sayalip@linux.ibm.com> wrote:
>=20
> The new PowerPC VMX fast path (__copy_tofrom_user_power7_vmx) is not
> exercised by existing copyloops selftests. This patch updates
> the selftest to exercise the VMX variant, ensuring the VMX copy path
> is validated.
>=20
> Changes include:
>  - COPY_LOOP=3Dtest___copy_tofrom_user_power7_vmx with -D VMX_TEST is =
used
>    in existing selftest build targets.
>  - Inclusion of ../utils.c to provide get_auxv_entry() for hardware
>    feature detection.
>  - At runtime, the test skips execution if Altivec is not available.
>  - Copy sizes above VMX_COPY_THRESHOLD are used to ensure the VMX
>    path is taken.
>=20
> This enables validation of the VMX fast path without affecting systems
> that do not support Altivec.
>=20
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---
> .../selftests/powerpc/copyloops/.gitignore        |  4 ++--
> .../testing/selftests/powerpc/copyloops/Makefile  | 11 ++++++++---
> tools/testing/selftests/powerpc/copyloops/stubs.S |  8 --------
> .../selftests/powerpc/copyloops/validate.c        | 15 ++++++++++++++-
> 4 files changed, 24 insertions(+), 14 deletions(-)
>=20
> diff --git a/tools/testing/selftests/powerpc/copyloops/.gitignore =
b/tools/testing/selftests/powerpc/copyloops/.gitignore
> index 7283e8b07b75..80d4270a71ac 100644
> --- a/tools/testing/selftests/powerpc/copyloops/.gitignore
> +++ b/tools/testing/selftests/powerpc/copyloops/.gitignore
> @@ -2,8 +2,8 @@
> copyuser_64_t0
> copyuser_64_t1
> copyuser_64_t2
> -copyuser_p7_t0
> -copyuser_p7_t1
> +copyuser_p7
> +copyuser_p7_vmx
> memcpy_64_t0
> memcpy_64_t1
> memcpy_64_t2
> diff --git a/tools/testing/selftests/powerpc/copyloops/Makefile =
b/tools/testing/selftests/powerpc/copyloops/Makefile
> index 42940f92d832..0c8efb0bddeb 100644
> --- a/tools/testing/selftests/powerpc/copyloops/Makefile
> +++ b/tools/testing/selftests/powerpc/copyloops/Makefile
> @@ -1,6 +1,6 @@
> # SPDX-License-Identifier: GPL-2.0
> TEST_GEN_PROGS :=3D copyuser_64_t0 copyuser_64_t1 copyuser_64_t2 \
> - copyuser_p7_t0 copyuser_p7_t1 \
> + copyuser_p7 copyuser_p7_vmx \
> memcpy_64_t0 memcpy_64_t1 memcpy_64_t2 \
> memcpy_p7_t0 memcpy_p7_t1 copy_mc_64 \
> copyuser_64_exc_t0 copyuser_64_exc_t1 copyuser_64_exc_t2 \
> @@ -28,10 +28,15 @@ $(OUTPUT)/copyuser_64_t%: copyuser_64.S =
$(EXTRA_SOURCES)
> -D SELFTEST_CASE=3D$(subst copyuser_64_t,,$(notdir $@)) \
> -o $@ $^
>=20
> -$(OUTPUT)/copyuser_p7_t%: copyuser_power7.S $(EXTRA_SOURCES)
> +$(OUTPUT)/copyuser_p7: copyuser_power7.S $(EXTRA_SOURCES)
> $(CC) $(CPPFLAGS) $(CFLAGS) \
> -D COPY_LOOP=3Dtest___copy_tofrom_user_power7 \
> - -D SELFTEST_CASE=3D$(subst copyuser_p7_t,,$(notdir $@)) \
> + -o $@ $^
> +
> +$(OUTPUT)/copyuser_p7_vmx:       copyuser_power7.S $(EXTRA_SOURCES) =
../utils.c
> + $(CC) $(CPPFLAGS) $(CFLAGS) \
> + -D COPY_LOOP=3Dtest___copy_tofrom_user_power7_vmx \
> + -D VMX_TEST \
> -o $@ $^
>=20
> # Strictly speaking, we only need the memcpy_64 test cases for =
big-endian
> diff --git a/tools/testing/selftests/powerpc/copyloops/stubs.S =
b/tools/testing/selftests/powerpc/copyloops/stubs.S
> index ec8bcf2bf1c2..3a9cb8c9a3ee 100644
> --- a/tools/testing/selftests/powerpc/copyloops/stubs.S
> +++ b/tools/testing/selftests/powerpc/copyloops/stubs.S
> @@ -1,13 +1,5 @@
> #include <asm/ppc_asm.h>
>=20
> -FUNC_START(enter_vmx_usercopy)
> - li r3,1
> - blr
> -
> -FUNC_START(exit_vmx_usercopy)
> - li r3,0
> - blr
> -
> FUNC_START(enter_vmx_ops)
> li r3,1
> blr
> diff --git a/tools/testing/selftests/powerpc/copyloops/validate.c =
b/tools/testing/selftests/powerpc/copyloops/validate.c
> index 0f6873618552..fb822534fbe9 100644
> --- a/tools/testing/selftests/powerpc/copyloops/validate.c
> +++ b/tools/testing/selftests/powerpc/copyloops/validate.c
> @@ -12,6 +12,10 @@
> #define BUFLEN (MAX_LEN+MAX_OFFSET+2*MIN_REDZONE)
> #define POISON 0xa5
>=20
> +#ifdef VMX_TEST
> +#define VMX_COPY_THRESHOLD 3328
> +#endif
> +
> unsigned long COPY_LOOP(void *to, const void *from, unsigned long =
size);
>=20
> static void do_one(char *src, char *dst, unsigned long src_off,
> @@ -81,8 +85,12 @@ int test_copy_loop(void)
> /* Fill with sequential bytes */
> for (i =3D 0; i < BUFLEN; i++)
> fill[i] =3D i & 0xff;
> -
> +#ifdef VMX_TEST
> + /* Force sizes above kernel VMX threshold (3328) */
> + for (len =3D VMX_COPY_THRESHOLD + 1; len < MAX_LEN; len++) {
> +#else
> for (len =3D 1; len < MAX_LEN; len++) {
> +#endif
> for (src_off =3D 0; src_off < MAX_OFFSET; src_off++) {
> for (dst_off =3D 0; dst_off < MAX_OFFSET; dst_off++) {
> do_one(src, dst, src_off, dst_off, len,
> @@ -96,5 +104,10 @@ int test_copy_loop(void)
>=20
> int main(void)
> {
> +#ifdef VMX_TEST
> + /* Skip if Altivec not present */
> + SKIP_IF_MSG(!have_hwcap(PPC_FEATURE_HAS_ALTIVEC), "ALTIVEC not =
supported");
> +#endif
> +
> return test_harness(test_copy_loop, str(COPY_LOOP));
> }
> --=20
> 2.52.0
>=20
>=20

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

# timeout set to 130
# selftests: powerpc/copyloops: copyuser_64_t2
# test: test___copy_tofrom_user_base
# tags: git_version:v6.19-2410-g27ede8cb60bb
# success: test___copy_tofrom_user_base
ok 3 selftests: powerpc/copyloops: copyuser_64_t2
# timeout set to 130
# selftests: powerpc/copyloops: copyuser_p7
# test: test___copy_tofrom_user_power7
# tags: git_version:v6.19-2410-g27ede8cb60bb
# success: test___copy_tofrom_user_power7
ok 4 selftests: powerpc/copyloops: copyuser_p7
# timeout set to 130
# selftests: powerpc/copyloops: copyuser_p7_vmx
# test: test___copy_tofrom_user_power7_vmx
# tags: git_version:v6.19-2410-g27ede8cb60bb
# success: test___copy_tofrom_user_power7_vmx
ok 5 selftests: powerpc/copyloops: copyuser_p7_vmx

Regards,
Venkat.


