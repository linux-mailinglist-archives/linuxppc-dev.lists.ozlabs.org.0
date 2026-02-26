Return-Path: <linuxppc-dev+bounces-17227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JGBLF/un2nYewQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 07:55:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3201A17C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 07:55:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM2K80Wn6z2yFd;
	Thu, 26 Feb 2026 17:55:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772088923;
	cv=none; b=Sx49BFBkgeHwmurboMXLsqxz4FsOglNQvTOiBa5oze0Xp/jfFFIGMgA3muqcDRpMRatQ32xiOUaKZE1CUGHRsa9ZrUGxn+G/9Nq/y7LDljSngLjTauvuZdgv25O8358LtOswLBMv4d7VCMoY8j+28oTPAArCpTp766WI6A3LiNNzbpbqAEJ2MdBX8FRP8pJ7WA3/82wreKJzoTNO6pR23YdrTMRl5H+cVhK1tlQHRXJzItsFpWIOHBOx4yC3S4vIwX1/hVfzdaGbUSSE5hUrgi7hCawjn6r/6EOcUf3Hsi+VQYDkXsV3YaiRt5w4J6M8NWebFDv4WsZyIOKc8yXG3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772088923; c=relaxed/relaxed;
	bh=uWyBrefH+ORzt5V7gbI1UY7SXQfbZSHGO5+cTdOyT8I=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LdArkDstNeUuSqJYsJUAOfvj5TIfQOJmiXUBJVnr7QYh3ZqGpDvtw3Bisqp9BLkGwzjfjVn2yoKEQyola1/WQOCWHkcJrDaB1L+WF7re3nQPkbBpbTxuYwKl4FnRzGks7rPFGHOKDYaxegUQP2bvvE4v44FO3E6w02MGlGzlQN681/wOJbZZjJINsEwWDiQHpQvVDdEM/HOwEwIyALCdpk+4ltzmVaN2tIvSRl20byt82Gihj5ibXnfsKVRnzBL6h/z5xNQI12+Bc6JUrsOn4jaNglnzXQaf7AKTSlCD6UDbxVd4RtIigoHrKxRqfJxjusBCf/b0ikc1eKrpybT5nQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KXGbo7Fi; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KXGbo7Fi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM2K71ZRHz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 17:55:22 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q5Zgso2236900;
	Thu, 26 Feb 2026 06:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=uWyBre
	fH+ORzt5V7gbI1UY7SXQfbZSHGO5+cTdOyT8I=; b=KXGbo7Fi3RvTsjTAg7Z7Zn
	CnEaR24xsXgoZUilIMFRyNBaZQ5zZ/UhIjvbU5gl5E7Klweb/U3cJTEB9NyZrBET
	jWL1yGmdW1qG9rujI+wFbCnkXZKt11ebLJDFhhgmjr5mQbtLM6oRYW3BIaZhxzSV
	/Y5Ng8Ozzl12Hwv7VJS6MnkLLr3o3ZKqZlQGcpq95Julir2IH962ZqqO7VudF6HS
	A0oHkldWLbDJF0N4Wx7jKz1lcOTBo5EsQe95KU1Nj5ubFiblJVzH3CMpW4GyOg3H
	UKWN7SLkhNuOTrmamHF92ss8rEaOcQWcm7i2Mj/HetMcMPwWJaTmTog84GZylmzg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4bs3wxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 06:55:06 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61Q6drcJ015750;
	Thu, 26 Feb 2026 06:55:05 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfq1ssve6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 06:55:05 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61Q6t4v730999288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 06:55:04 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F20958059;
	Thu, 26 Feb 2026 06:55:04 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DDB258063;
	Thu, 26 Feb 2026 06:55:01 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.98.108.141])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 26 Feb 2026 06:55:01 +0000 (GMT)
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
Subject: Re: [PATCH v4 2/2] selftests/bpf: Enable private stack tests for
 powerpc64
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260226031324.17352-2-adubey@linux.ibm.com>
Date: Thu, 26 Feb 2026 12:24:48 +0530
Cc: linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, hbathini@linux.ibm.com,
        ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        maddy@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <0D287760-5EE6-4F98-A91A-DA018BCAC3CB@linux.ibm.com>
References: <20260226031324.17352-1-adubey@linux.ibm.com>
 <20260226031324.17352-2-adubey@linux.ibm.com>
To: adubey@linux.ibm.com
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _pVcov_Pi0gbNYt9Rg6SyY6a_i_Bg2TJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1NyBTYWx0ZWRfX6sjrETOrVyTr
 cl2ri6xJq2U4FMdU/yFzbatx2/PhUHXS5awbQTsfzCbqugw5Gkx+hvRiZBGoMQ7BYpanuFiefbM
 lNEaz/rqdE+5CroBVnkbcqBlBBeSRpD+Mru4T8f9k//NJaNR3NKfdubzsl9Mi7slQNIafyKYAGv
 ebQAveCNwAdRn3QsWxqCMy64dUq5Cr2HnJ2b8pGwx6bAldNn1cv3RGuztkwYbC0aPn2Y6LyAjJC
 kgQdfWBa230nKpa8U6kDmvi/wMsFMCcal/yCA4VLSVmNJK0Ep2f2wcoEGSG5THk7YE0diwT6lA/
 Txsbc0jdVnYPcSuMgPciTjIKLDyIIV+FE869oHRMi5G8/rveMKRz2AXrCXg8hpwP2Azn0KaUJNt
 Vs/F4CQFzR7d6UPNXMkxBRkKs9OdHc+ULaOZ+4FYvZ1/xUQTiCCrD9eTKgU4o1sHw6Ki53vF9C0
 KQTrs5Vn47Znu6KDJCg==
X-Authority-Analysis: v=2.4 cv=eNceTXp1 c=1 sm=1 tr=0 ts=699fee4a cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=3ngUbzHfdUlpjFJBK1YA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: _pVcov_Pi0gbNYt9Rg6SyY6a_i_Bg2TJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602260057
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17227-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9E3201A17C4
X-Rspamd-Action: no action



> On 26 Feb 2026, at 8:43=E2=80=AFAM, adubey@linux.ibm.com wrote:
>=20
> From: Abhishek Dubey <adubey@linux.ibm.com>
>=20
> With support of private stack, relevant tests must pass
> on powerpc64.
>=20
> #./test_progs -t struct_ops_private_stack
> #434/1   struct_ops_private_stack/private_stack:OK
> #434/2   struct_ops_private_stack/private_stack_fail:OK
> #434/3   struct_ops_private_stack/private_stack_recur:OK
> #434     struct_ops_private_stack:OK
> Summary: 1/3 PASSED, 0 SKIPPED, 0 FAILED
>=20
> v2->v3:
>  Enable testcase using __powerpc64__ instead of __TARGET_ARCH_powerpc,
>  to prevent it getting invoked on powerpc32
>=20
> [v2]: =
https://lore.kernel.org/bpf/20260225153950.15331-1-adubey@linux.ibm.com
>=20
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>

./test_progs -t struct_ops_private_stack
#440/1   struct_ops_private_stack/private_stack:OK
#440/2   struct_ops_private_stack/private_stack_fail:OK
#440/3   struct_ops_private_stack/private_stack_recur:OK
#440     struct_ops_private_stack:OK
Summary: 1/3 PASSED, 0 SKIPPED, 0 FAILED


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.
> ---
> .../bpf/prog_tests/struct_ops_private_stack.c | 29 +++++++++----------
> .../bpf/progs/struct_ops_private_stack.c      |  6 ----
> .../bpf/progs/struct_ops_private_stack_fail.c |  6 ----
> .../progs/struct_ops_private_stack_recur.c    |  6 ----
> 4 files changed, 13 insertions(+), 34 deletions(-)
>=20
> diff --git =
a/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c =
b/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
> index 4006879ca3fe..afad3522b772 100644
> --- =
a/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
> +++ =
b/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
> @@ -5,6 +5,7 @@
> #include "struct_ops_private_stack_fail.skel.h"
> #include "struct_ops_private_stack_recur.skel.h"
>=20
> +#if defined(__x86_64__) || defined(__aarch64__) || =
defined(__powerpc64__)
> static void test_private_stack(void)
> {
> struct struct_ops_private_stack *skel;
> @@ -15,11 +16,6 @@ static void test_private_stack(void)
> if (!ASSERT_OK_PTR(skel, "struct_ops_private_stack__open"))
> return;
>=20
> - if (skel->data->skip) {
> - test__skip();
> - goto cleanup;
> - }
> -
> err =3D struct_ops_private_stack__load(skel);
> if (!ASSERT_OK(err, "struct_ops_private_stack__load"))
> goto cleanup;
> @@ -48,11 +44,6 @@ static void test_private_stack_fail(void)
> if (!ASSERT_OK_PTR(skel, "struct_ops_private_stack_fail__open"))
> return;
>=20
> - if (skel->data->skip) {
> - test__skip();
> - goto cleanup;
> - }
> -
> err =3D struct_ops_private_stack_fail__load(skel);
> if (!ASSERT_ERR(err, "struct_ops_private_stack_fail__load"))
> goto cleanup;
> @@ -72,11 +63,6 @@ static void test_private_stack_recur(void)
> if (!ASSERT_OK_PTR(skel, "struct_ops_private_stack_recur__open"))
> return;
>=20
> - if (skel->data->skip) {
> - test__skip();
> - goto cleanup;
> - }
> -
> err =3D struct_ops_private_stack_recur__load(skel);
> if (!ASSERT_OK(err, "struct_ops_private_stack_recur__load"))
> goto cleanup;
> @@ -95,7 +81,7 @@ static void test_private_stack_recur(void)
> struct_ops_private_stack_recur__destroy(skel);
> }
>=20
> -void test_struct_ops_private_stack(void)
> +static void __test_struct_ops_private_stack(void)
> {
> if (test__start_subtest("private_stack"))
> test_private_stack();
> @@ -104,3 +90,14 @@ void test_struct_ops_private_stack(void)
> if (test__start_subtest("private_stack_recur"))
> test_private_stack_recur();
> }
> +#else
> +static void __test_struct_ops_private_stack(void)
> +{
> + test__skip();
> +}
> +#endif
> +
> +void test_struct_ops_private_stack(void)
> +{
> + __test_struct_ops_private_stack();
> +}
> diff --git =
a/tools/testing/selftests/bpf/progs/struct_ops_private_stack.c =
b/tools/testing/selftests/bpf/progs/struct_ops_private_stack.c
> index dbe646013811..3cd0c1a55cbd 100644
> --- a/tools/testing/selftests/bpf/progs/struct_ops_private_stack.c
> +++ b/tools/testing/selftests/bpf/progs/struct_ops_private_stack.c
> @@ -7,12 +7,6 @@
>=20
> char _license[] SEC("license") =3D "GPL";
>=20
> -#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)
> -bool skip __attribute((__section__(".data"))) =3D false;
> -#else
> -bool skip =3D true;
> -#endif
> -
> void bpf_testmod_ops3_call_test_2(void) __ksym;
>=20
> int val_i, val_j;
> diff --git =
a/tools/testing/selftests/bpf/progs/struct_ops_private_stack_fail.c =
b/tools/testing/selftests/bpf/progs/struct_ops_private_stack_fail.c
> index 3d89ad7cbe2a..1442728f5604 100644
> --- =
a/tools/testing/selftests/bpf/progs/struct_ops_private_stack_fail.c
> +++ =
b/tools/testing/selftests/bpf/progs/struct_ops_private_stack_fail.c
> @@ -7,12 +7,6 @@
>=20
> char _license[] SEC("license") =3D "GPL";
>=20
> -#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)
> -bool skip __attribute((__section__(".data"))) =3D false;
> -#else
> -bool skip =3D true;
> -#endif
> -
> void bpf_testmod_ops3_call_test_2(void) __ksym;
>=20
> int val_i, val_j;
> diff --git =
a/tools/testing/selftests/bpf/progs/struct_ops_private_stack_recur.c =
b/tools/testing/selftests/bpf/progs/struct_ops_private_stack_recur.c
> index b1f6d7e5a8e5..faaa0f8d65a4 100644
> --- =
a/tools/testing/selftests/bpf/progs/struct_ops_private_stack_recur.c
> +++ =
b/tools/testing/selftests/bpf/progs/struct_ops_private_stack_recur.c
> @@ -7,12 +7,6 @@
>=20
> char _license[] SEC("license") =3D "GPL";
>=20
> -#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)
> -bool skip __attribute((__section__(".data"))) =3D false;
> -#else
> -bool skip =3D true;
> -#endif
> -
> void bpf_testmod_ops3_call_test_1(void) __ksym;
>=20
> int val_i, val_j;
> --=20
> 2.52.0
>=20


