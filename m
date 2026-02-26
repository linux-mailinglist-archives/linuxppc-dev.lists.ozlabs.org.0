Return-Path: <linuxppc-dev+bounces-17228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CUDEeLun2kyfAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 07:57:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597831A1824
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 07:57:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM2Mf75Tnz2yFd;
	Thu, 26 Feb 2026 17:57:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772089054;
	cv=none; b=nj6sDNNfYgLHykWpVqtTtJncNGgd0klznuED1oosfcdTIJdKVQ1YkMp10MDGFu5ff5MdfxpOauIlpBJYXz1XoA2noTKOwz394vXKIdvN+vQoetC/d9KQG37j7y53jrqoPfQc4J4MqQR8LqMoebVQEI7XSgO3OXFVyiJ7G9l42/jqbSxqCrLaJvy6tW7+Cp7iO1mA9YZiTFbm8qp+iSuOPVUClHheyY2cxSXu/U8EtiYabz6dRIAfD9yfjNJg8yFdVQ33en8YkM/3miz9a9/uJS7j1g/iSjGXmg2rH9+koj/9Co/rGU4S77/Rwc9yvtK5E1z8nxvzeDu2pl+auAstBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772089054; c=relaxed/relaxed;
	bh=SqilmPT7i33gSRVp4y9chABduz+0yQMqtB5A911BG0c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eM5naCx6m35FcvEJdGwL31gaH4S2++LnRcQ2rEu7H18+Ykt+PtdwaUSac2qB2dAAGejb1xj4XM5ko73nnMwdgIV5FZeh6v0kKyBXxX+ZCg4llAnPc+T1F+P7VVMYu+072+BH/0DfcmQUr5CIdLsAnUy28/koyWrjkU7OV/UzMBKMI2KinTWsW1TqQCvY3IPyJgrTSxZ1n3oAVAo7kxWVXfdpXwH1X/7OxfhJwctSrVvguWmVFgCLn1xLyJNx11Vq7xflFkeRmd2/zdYTGpa+c7TR/gjuFSslQnM9R5z0IJKUWxncQI9LF1p6J5ZkHoKhSfgqeIiw6NNRvZXYaKj6fA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lqK//VG3; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lqK//VG3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM2Md6z1rz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 17:57:33 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q0KUHP2632518;
	Thu, 26 Feb 2026 06:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SqilmP
	T7i33gSRVp4y9chABduz+0yQMqtB5A911BG0c=; b=lqK//VG3GqT/mpfRXP528N
	iNUrFIFtAA5FzR4MnP/Qz3crImqOuePwcGBxJGM6HAxCURXRxcoXNUSAbp2MFY2p
	3+MdY9R6gWmufnPYZis8OXxHgUuqL5hb6D6OuQa2IvB3xX6r4HShryMPk6cAq3AU
	M8+743nJ4PC590It7WVpLwJasvW4RgvboxslKyAgS/7cvcl6htuFQKIyVkbaKWMQ
	OXakqVye+TYEuI8iO+e0A3SoCuH+LVc9gW0Acw+gVgWKYt1XMEIWqOkRMkTxYu/f
	z2rIola0ijnwd8L6JV4vnholvX3jlU30i5hUu5qiTIQ1nFK7onCzGxRBiXdQGELg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4bs3x9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 06:57:18 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61Q6kKgr001653;
	Thu, 26 Feb 2026 06:57:18 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfr1n9s3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 06:57:18 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61Q6vH1n28574382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 06:57:17 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF72958055;
	Thu, 26 Feb 2026 06:57:16 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 821AC58043;
	Thu, 26 Feb 2026 06:57:14 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.98.108.141])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 26 Feb 2026 06:57:14 +0000 (GMT)
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
Subject: Re: [PATCH v2 2/3] selftest/bpf: Enable get_func_args and get_func_ip
 tests on powerpc64
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260226041217.18059-2-adubey@linux.ibm.com>
Date: Thu, 26 Feb 2026 12:27:02 +0530
Cc: linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, hbathini@linux.ibm.com,
        ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        maddy@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <5E3E8F8D-D40B-4838-BAB4-1A75A90EA9E7@linux.ibm.com>
References: <20260226041217.18059-1-adubey@linux.ibm.com>
 <20260226041217.18059-2-adubey@linux.ibm.com>
To: adubey@linux.ibm.com
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _Wld7jqjdQocfPdcw6t7N_qdT7BD_ylV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1NyBTYWx0ZWRfX3+EBXQapSV36
 Sfd+uhd3TJqkIiivJCfDqXp974mvL4NrQ0G8j8HWZ5bpXC0oztR57JwH4jzZypuD1lSP2cVEdN9
 LisEtmDXiK1IRb/QZ23y1YamGYRZvNkk/dkIg08Yn+xnEOdsOI9VQJpclX61SA/0u4N9OEaFZe5
 d5ruF5VQKCH/V77PgOgD/EXoY2Vtm979KEU9aT3svaD9dFxkJj2UfbqiUDB9ASmdIzHwdUMr6HZ
 7Puogw3jEL7LPsCIqad6wvxmtO78jH20Uykd8HG1+o7+uXIMWZsRSWfxBudrL/1hBkCmqSZQYgJ
 5CHnLmInYr7hmsrY7zgTA5YkaoF9SiOyPyLw45GvYST0g4HKkhaiOKTT647QefMu/vQBV1wxIqL
 6tpCtpAb77VH44aCZxgfYP4oPxZZ0LMBjrNQ6V1uQrOO6s4XgJA8BlgQK5gGz2owatHnQh6L+65
 gbHKChyWZnjfIrCkXdw==
X-Authority-Analysis: v=2.4 cv=eNceTXp1 c=1 sm=1 tr=0 ts=699feece cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=94qgRYN1easYJoKLEIAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: _Wld7jqjdQocfPdcw6t7N_qdT7BD_ylV
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17228-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 597831A1824
X-Rspamd-Action: no action



> On 26 Feb 2026, at 9:42=E2=80=AFAM, adubey@linux.ibm.com wrote:
>=20
> From: Abhishek Dubey <adubey@linux.ibm.com>
>=20
> Allow get_func_args, get_func_ip & fsession selftests to run on
> powerpc64.
>=20
> # ./test_progs -t fsession
> #135/1   fsession_test/fsession_test:OK
> #135/2   fsession_test/fsession_reattach:OK
> #135/3   fsession_test/fsession_cookie:OK
> #135     fsession_test:OK
> Summary: 1/3 PASSED, 0 SKIPPED, 0 FAILED
>=20
> # ./test_progs -t get_func
> #138     get_func_args_test:OK
> #139     get_func_ip_test:OK
> Summary: 2/0 PASSED, 0 SKIPPED, 0 FAILED
>=20
> v1->v2:
>  Resolve merge conflict
>=20
> [v1]: =
https://lore.kernel.org/bpf/20260216155310.38457-1-adubey@linux.ibm.com
>=20
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>

./test_progs -t fsession
#135/1   fsession_test/fsession_test:OK
#135/2   fsession_test/fsession_reattach:OK
#135/3   fsession_test/fsession_cookie:OK
#135     fsession_test:OK
Summary: 1/3 PASSED, 0 SKIPPED, 0 FAILED


./test_progs -t get_func
#138     get_func_args_test:OK
#139     get_func_ip_test:OK
Summary: 2/0 PASSED, 0 SKIPPED, 0 FAILED


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.
> ---
> tools/testing/selftests/bpf/progs/get_func_args_test.c | 3 ++-
> tools/testing/selftests/bpf/progs/get_func_ip_test.c   | 3 ++-
> 2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/testing/selftests/bpf/progs/get_func_args_test.c =
b/tools/testing/selftests/bpf/progs/get_func_args_test.c
> index 075a1180ec26..1fe1fb0548ea 100644
> --- a/tools/testing/selftests/bpf/progs/get_func_args_test.c
> +++ b/tools/testing/selftests/bpf/progs/get_func_args_test.c
> @@ -167,7 +167,8 @@ int BPF_PROG(tp_test2)
> }
>=20
> __u64 test7_result =3D 0;
> -#if defined(bpf_target_x86) || defined(bpf_target_arm64) || =
defined(bpf_target_riscv)
> +#if defined(bpf_target_x86) || defined(bpf_target_arm64) || \
> + defined(bpf_target_riscv) || defined(bpf_target_powerpc64)
> SEC("fsession/bpf_fentry_test1")
> int BPF_PROG(test7)
> {
> diff --git a/tools/testing/selftests/bpf/progs/get_func_ip_test.c =
b/tools/testing/selftests/bpf/progs/get_func_ip_test.c
> index 45eaa54d1ac7..be6b1a073b11 100644
> --- a/tools/testing/selftests/bpf/progs/get_func_ip_test.c
> +++ b/tools/testing/selftests/bpf/progs/get_func_ip_test.c
> @@ -106,7 +106,8 @@ int BPF_URETPROBE(test8, int ret)
>=20
> __u64 test9_entry_result =3D 0;
> __u64 test9_exit_result =3D 0;
> -#if defined(bpf_target_x86) || defined(bpf_target_arm64) || =
defined(bpf_target_riscv)
> +#if defined(bpf_target_x86) || defined(bpf_target_arm64) || \
> + defined(bpf_target_riscv) || defined(bpf_target_powerpc64)
> SEC("fsession/bpf_fentry_test1")
> int BPF_PROG(test9, int a)
> {
> --=20
> 2.52.0
>=20


