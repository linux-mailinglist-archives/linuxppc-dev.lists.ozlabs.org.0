Return-Path: <linuxppc-dev+bounces-17399-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMVCCkq4oWkYwAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17399-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 16:29:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB8E1B9C79
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 16:29:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMsgR31ymz3c95;
	Sat, 28 Feb 2026 02:29:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772206147;
	cv=none; b=I3sNED1RONLSJzlQ7qIbFOV0EjNjzj09gSZyfvIr4ByhgyZVJgKvHlW76Y76xG6o2Ucgliyfgu0utV0O7VkCjdWYVmII1pLqWS+wC9u9YkZ9fweOnBy28P97Ky2xj/hu14XpbEi66n/n7ek7uFZCtk4hBDCocGYUMzvZkKlCWVgYcxfDDFYoesabVJJ+i05OiQi7MXnhrua6jNiBcZ77/I6yk6n+lt104ain+rexJNG2MLzlU2lZ5IfWRHKK/c9nVj3ty0mEkkygs9rDqmiZJXWt2FRhpRT3MqmshZsuQnDDPdKLGeZ7h9BvbEb2MXxh97h1HWJ4aaN/YjreNpKqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772206147; c=relaxed/relaxed;
	bh=kIbzSGqhhdlxl+7UUOcZIEyJPullP3O8/Dx7rRjrPi0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=JxzcBUdFNEL754ex9cyXJhtOJUX9DC5o+IjYmGMOZupxsrDUUd5YowfsvmTP6TNTaCocn59B6VhPKT/UjETebArOGO46WKWURxz12Ttpx2DpjqB2mvrST2A2MZnO1AO+2ADAC4QAW+dLttxwPk0gCqcEI824AwN2cSAjXcjsbmgqMNn++QQf32LbPYVO2fVms4FeE/s0b5CUDyKmaJawVenDoVArWNu4XWmy2ot8v3UQalfZK7UDowo8RMaKA25qtPqjnEnbW3kAB9veZKZSZYTMIP9s2LJ2SEtvPCX03B2hX5wfvlQw5F0zMHyjjCaY/VfUMOVeWuloOL8pe+QZNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HMVvWosJ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HMVvWosJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMsgQ54W9z2xYw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 02:29:06 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9lpGX733353;
	Fri, 27 Feb 2026 15:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kIbzSG
	qhhdlxl+7UUOcZIEyJPullP3O8/Dx7rRjrPi0=; b=HMVvWosJswVeeViN8D/g7j
	+hJjYP4L9gnW5ylKVdgEWVyGY0H9xSGb8tIZWZF+YWG7Xu1R72oLUo+J/jcR1xrh
	CJ+7jDBQxVd/ttCpHe1/AM0CXMtTOeqgQU4t0veHGXMCU2S37lnlG+HUdSihMR17
	IWK+eZesRV1g1grQTnCmORRuo7+XUUdbttAoMNlsvJPZ7ubSH8lng7fNcCw9ODy2
	aj12k052TwMP09GmkjMmnltHTH/QMGmEjEsiJagWHXVQutEJ9YX4T63YBzcGZvtr
	eF49YZokBwQNdcuMwH0mutEvoesyjTwNP6XFiJvKJq0Pxt4eAwNQf+hWvUtWEmgw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf24gvhc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 15:28:52 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61RF8V4U030259;
	Fri, 27 Feb 2026 15:28:52 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfrhktqj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 15:28:52 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61RFSoZg24838864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Feb 2026 15:28:50 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8278458056;
	Fri, 27 Feb 2026 15:28:50 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4C2B58052;
	Fri, 27 Feb 2026 15:28:47 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.223])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 27 Feb 2026 15:28:47 +0000 (GMT)
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
Subject: Re: [PATCH v2 0/4] powerpc64/bpf: Add support for instruction array
 and indirect jump
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260227014315.39980-1-adubey@linux.ibm.com>
Date: Fri, 27 Feb 2026 20:58:29 +0530
Cc: linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, hbathini@linux.ibm.com,
        ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        maddy@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <72C902E6-BE4E-4C47-9F4A-D8095E7BEDE2@linux.ibm.com>
References: <20260227014315.39980-1-adubey@linux.ibm.com>
To: adubey@linux.ibm.com
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=TNRIilla c=1 sm=1 tr=0 ts=69a1b834 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=navZPS6tSOt6txFWZpkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: W8AZdSkTdZI_hPVtXlyL_5BiPdpPlM0b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEzNSBTYWx0ZWRfX4rC8tCvZbwE8
 daG38qEW0JZ6lZhxU7wXUl6aBGPVj0NYjvn22N/Mqybq36o5V7UWO0xvQCkR5gU8VapLve0kGmA
 qEC4vsPNE1H++sFuVDjrWWG7Jn8Uj4JK3s86W91Q1JxaR/3VuJQV9/ZpbfLgPxJG9BMSYWUaweq
 8yIaoDEzQbWa+2NEg3nJvgogTWwezkaJvmqbfKk/1ZWXiA8Axwp1NhMf60IS6yR2e01iy7xFj2z
 dd8PS1rTKJQ6wuc2pgR6gtw2kApWcp9OSGYEzKX4UYTIwf+zyW5J+eDSimRMXKG2js7XP/e35+S
 6OYPILg8lTaM7Y+O1d7jNEX5J4naqm7SzTnnL7d46sIseXdQuIB0QBUhZ2d4GbWo02iCRDVKarh
 VsGsZNupbFbCMTbo9GPwv95tsJAW5BkcrnACvi2qMLYeeelQflCLo8P6p6m91IxE+RAWeztlZut
 o3BwWr+ZNo6ov00XP5A==
X-Proofpoint-ORIG-GUID: W8AZdSkTdZI_hPVtXlyL_5BiPdpPlM0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602270135
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.10 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MIXED_CHARSET(0.61)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17399-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4CB8E1B9C79
X-Rspamd-Action: no action



> On 27 Feb 2026, at 7:13=E2=80=AFAM, adubey@linux.ibm.com wrote:
>=20
> From: Abhishek Dubey <adubey@linux.ibm.com>
>=20
> The first 2 patch enable support for instruction array. Now, the=20
> instruction offset map maintain the mapping:
> original inst -> xlated inst -> jited inst
>=20
> The last two patch enable support for indirect jump. Any eligile
> register can store jump target address for control flow to jump.
>=20
> The features will be enabled on ppc32 in a separate series.
>=20
> The patch series is rebased over:
> =
https://lore.kernel.org/bpf/20260226031324.17352-1-adubey@linux.ibm.com
>=20
> All selftest related to instruction array and indirect jump
> are passing.
>=20
> ./test_progs-cpuv4 -n 20
> #21/1=C3=82 =C3=82 =C3=82  bpf_insn_array/one2one:OK
> #21/2=C3=82 =C3=82 =C3=82  bpf_insn_array/simple:OK
> #21/3=C3=82 =C3=82 =C3=82  bpf_insn_array/deletions:OK
> #21/4=C3=82 =C3=82 =C3=82  bpf_insn_array/deletions-with-functions:OK
> #21/5=C3=82 =C3=82 =C3=82  bpf_insn_array/blindness:OK
> #21/6=C3=82 =C3=82 =C3=82  bpf_insn_array/incorrect-index:OK
> #21/7=C3=82 =C3=82 =C3=82  bpf_insn_array/load-unfrozen-map:OK
> #21/8=C3=82 =C3=82 =C3=82  bpf_insn_array/no-map-reuse:OK
> #21/9=C3=82 =C3=82 =C3=82  bpf_insn_array/bpf-side-ops:OK
> #21=C3=82 =C3=82 =C3=82 =C3=82 =C3=82  bpf_insn_array:OK
> Summary: 1/9 PASSED, 0 SKIPPED, 0 FAILED
>=20
> ./test_progs-cpuv4 -n 21 =20
> #20/1=C3=82 =C3=82 =C3=82  bpf_gotox/one-switch:OK
> #20/2=C3=82 =C3=82 =C3=82  bpf_gotox/one-switch-non-zero-sec-offset:OK
> #20/3=C3=82 =C3=82 =C3=82  bpf_gotox/two-switches:OK
> #20/4=C3=82 =C3=82 =C3=82  bpf_gotox/big-jump-table:OK
> #20/5=C3=82 =C3=82 =C3=82  bpf_gotox/static-global:OK
> #20/6=C3=82 =C3=82 =C3=82  bpf_gotox/nonstatic-global:OK
> #20/7=C3=82 =C3=82 =C3=82  bpf_gotox/other-sec:OK
> #20/8=C3=82 =C3=82 =C3=82  bpf_gotox/static-global-other-sec:OK
> #20/9=C3=82 =C3=82 =C3=82  bpf_gotox/nonstatic-global-other-sec:OK
> #20/10=C3=82 =C3=82  bpf_gotox/one-jump-two-maps:OK
> #20/11=C3=82 =C3=82  bpf_gotox/one-map-two-jumps:OK
> #20=C3=82 =C3=82 =C3=82 =C3=82 =C3=82  bpf_gotox:OK
> Summary: 1/11 PASSED, 0 SKIPPED, 0 FAILED
>=20
> v1->v2:
> Handle image offset for ABIv1
>=20
> [v1]: =
https://lore.kernel.org/bpf/20260225010950.20218-1-adubey@linux.ibm.com
>=20
> Abhishek Dubey (4):
> powerpc64/bpf: Add support for instruction array
> selftest/bpf: Enable instruction array test for powerpc64
> powerpc64/bpf: Add support for indirect jump
> selftest/bpf: Enable gotox tests for powerpc64
>=20
> arch/powerpc/net/bpf_jit_comp.c                        | 10 ++++++++++
> arch/powerpc/net/bpf_jit_comp64.c                      |  8 ++++++++
> .../testing/selftests/bpf/prog_tests/bpf_insn_array.c  |  2 +-
> tools/testing/selftests/bpf/progs/verifier_gotox.c     |  4 ++--
> 4 files changed, 21 insertions(+), 3 deletions(-)
>=20
> --=20
> 2.52.0

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Tested this series and below are the results.

./test_progs-cpuv4 -n 21=20
#21/1    bpf_insn_array/one2one:OK
#21/2    bpf_insn_array/simple:OK
#21/3    bpf_insn_array/deletions:OK
#21/4    bpf_insn_array/deletions-with-functions:OK
#21/5    bpf_insn_array/blindness:OK
#21/6    bpf_insn_array/incorrect-index:OK
#21/7    bpf_insn_array/load-unfrozen-map:OK
#21/8    bpf_insn_array/no-map-reuse:OK
#21/9    bpf_insn_array/bpf-side-ops:OK
#21      bpf_insn_array:OK
Summary: 1/9 PASSED, 0 SKIPPED, 0 FAILED


./test_progs-cpuv4 -n 20
#20/1    bpf_gotox/one-switch:SKIP
#20/2    bpf_gotox/one-switch-non-zero-sec-offset:SKIP
#20/3    bpf_gotox/two-switches:SKIP
#20/4    bpf_gotox/big-jump-table:SKIP
#20/5    bpf_gotox/static-global:SKIP
#20/6    bpf_gotox/nonstatic-global:SKIP
#20/7    bpf_gotox/other-sec:SKIP
#20/8    bpf_gotox/static-global-other-sec:SKIP
#20/9    bpf_gotox/nonstatic-global-other-sec:SKIP
#20/10   bpf_gotox/one-jump-two-maps:SKIP
#20/11   bpf_gotox/one-map-two-jumps:SKIP
#20/12   bpf_gotox/check-ldimm64-off:SKIP
#20/13   bpf_gotox/check-ldimm64-off-gotox:SKIP
#20      bpf_gotox:SKIP
Summary: 1/0 PASSED, 13 SKIPPED, 0 FAILED

Regards,
Venkat.


