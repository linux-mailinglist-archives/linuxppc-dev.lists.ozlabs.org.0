Return-Path: <linuxppc-dev+bounces-17317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFZmHW+woGnUlgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 21:43:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA21AF3DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 21:43:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMNhR2q4cz30hP;
	Fri, 27 Feb 2026 07:43:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772138599;
	cv=none; b=YRQTAsr0ejjer+BVYiVusbk7Of4ncn73j2xvEMLmzo5qY0CSjmGXWJ/JOeJVrh2Jw0J2xK6rlbTfSwncuGnTbUApqTLTmJuqC9ogqiNqJmly/8rccVDbmQJo4exHNNbjL4px0BPX0TZiabyfBgBprs2oY2T1CH2g83DylQvmriMm0KQ3dWMfxpBFr3zuzMi+a5KhXKuz5vmX+xaZ/a+pAR7kgbsWxSNJZD0pNzLfF53VXR+36feut5PK7YdfrcvWh7ynLreXDCLkS/ySZcQDQX7ZIeJJpLavrPasrkM77pGfVjV/l5GoztUMXbzDh93/vAezCaKm6uXiNB3YIc8Xdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772138599; c=relaxed/relaxed;
	bh=RAegWFHlu3WJtO+UiJTVRC/NeBEUTp4MXWnxS/HkAZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uqfca/FYBln5N7IIOGQDnoIg6zHw73qn5vbMKL3ZwPKqRO/todOCfcxIHkfqPWYL9Ilxq/taSE5t/e9kp2rk1plfM+MOdLMvAIB455hjSwtfXowfoYym9DHObBo0vJ185KQBOhCoYlSm/yU1vigaBLtfs4bIg/5S55WzZTYjTWV8IRm9JpP8kj2gH8TIzO+/jzsPMHrLS6p7rCgFstaDmycQlk/myFDRWDNjUCZPHH42otvDxNhCpWl7CVjlniGDjGXNLUAIA+bj9gh3+R5tnX98ZyQtPBv29G27UDbkGITvijmb+cM71zSsKxaY/MZ6u7C2xxqK25QllLPkIXYPfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g1hkuUq3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g1hkuUq3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMNhQ32Rwz309S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 07:43:18 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QJIP682347116;
	Thu, 26 Feb 2026 20:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=RAegWFHlu3WJtO+Ui
	JTVRC/NeBEUTp4MXWnxS/HkAZE=; b=g1hkuUq33g6eZrhBlje2zt1rOCffUBSVW
	YiQE6Th6oJp+7pYVuEkZ+39GFwtcPjLB5aUGogimzZ7lTjH/H4t9MTmeMTpQPlAO
	6PGM/AyO7EPDEGaH3RSeu7LHVSYE2Dx1rI6DPvuetWhrUzNupctMs+uytklb8xcq
	dm83ftM0pAOJ10fMdj6MR3er3psqHF0i0TRUH0mbkTQZhJB7wk8XoRjPNvQ/HZi2
	9W3dHQgXRm2JGzc3yutI73jbasKfpp+9XtlMlRKcpVWqz65eEiZutWDHN98X97hp
	guNB2M89IfSr0fX3fS3SR2GgtG9YrVOFPYm9+twdcswTzBnSIIgGw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ch858xd4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 20:43:04 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61QIl0he003836;
	Thu, 26 Feb 2026 20:43:03 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfs8k5tnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 20:43:03 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61QKgxCB53543280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 20:42:59 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F01420040;
	Thu, 26 Feb 2026 20:42:59 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C89332004D;
	Thu, 26 Feb 2026 20:42:57 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Feb 2026 20:42:57 +0000 (GMT)
From: adubey@linux.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org, hbathini@linux.ibm.com, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, maddy@linux.ibm.com,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v2 1/4] powerpc64/bpf: Add support for instruction array
Date: Thu, 26 Feb 2026 20:43:08 -0500
Message-ID: <20260227014315.39980-2-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227014315.39980-1-adubey@linux.ibm.com>
References: <20260227014315.39980-1-adubey@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4NCBTYWx0ZWRfX0dKRMYXX1z0P
 aZVMaKcpepsZvd553PhuDvZYCKSwGrJ4ydhWzsYLYhFw1aOXM/aIldhVGZLHpVM/scyDbZ5LMYF
 rngiEJEmHDtS9+GThU6D1opI3fUfRhi569Aw9YaOQDP9Khhdi/gCGAEGeO5oA39UEEjQIH3+rzv
 MGWLbZaC8yldG7w62kR2iYcUFURJM9kPzjrgfZQoxfHgP/KwdMVbGvZwTyTJJTQ8bkT1MowRTwb
 Aae8BsQjQUbcpQWhE4DAPYbuOmOXbXAAaNaxy9FIy7aGBU/dvIJDaAQYEhfA4GSlr7jJm2jUiEu
 QlrBMXyzlGr08cQj2QB1XNPuTcZ+XnDimWPyOhe+LOdtfw9G1uWOVLKanjN5EuJCtmLKoXLmpGo
 Oo7Naj/rMh5s3j0uO0t1Mb68FUp50NEv8s0YwHFu56bsxJ6JThQphL6cJES3iSQgM6k7NyRxINy
 SkPbp06XG7djnE2zOyw==
X-Proofpoint-GUID: tDvbQVyyww5WXtw8wdP36DSiRj8mXkBR
X-Authority-Analysis: v=2.4 cv=S4HUAYsP c=1 sm=1 tr=0 ts=69a0b058 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=7L3SHwMVhhBtGsoEfKUA:9
X-Proofpoint-ORIG-GUID: tDvbQVyyww5WXtw8wdP36DSiRj8mXkBR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602260184
X-Spam-Status: No, score=1.7 required=3.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	DATE_IN_FUTURE(4.00)[4];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17317-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CCFA21AF3DC
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

On loading the BPF program, the verifier might adjust/omit some
instructions. The adjusted instruction offset is accounted in the
map containing original instruction -> xlated mapping. This patch
add ppc64 JIT support to additionally build the xlated->jitted
mapping for every instruction present in instruction array. This
change is needed to enable support for indirect jumps, added in a
subsequent patch.

Invoke bpf_prog_update_insn_ptrs() with offset pair of xlated_offset
and jited_offset. The offset mapping is already available, which is
being used for bpf_prog_fill_jited_linfo() and can be directly used
for bpf_prog_update_insn_ptrs() as well.

Additional details present at:

commit b4ce5923e780 ("bpf, x86: add new map type: instructions array")

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 9ec5ab9b020e..620667c3400b 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -373,6 +373,16 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 			goto out_addrs;
 		}
 		bpf_prog_fill_jited_linfo(fp, addrs);
+		/*
+		 * On ABI V1, executable code starts after the function
+		 * descriptor, so adjust base accordingly.
+		 */
+#ifdef CONFIG_PPC64_ELF_ABI_V1
+		bpf_prog_update_insn_ptrs(fp, addrs,
+				(void *)fimage + FUNCTION_DESCR_SIZE);
+#else
+		bpf_prog_update_insn_ptrs(fp, addrs, fimage);
+#endif
 out_addrs:
 		if (!image && priv_stack_ptr) {
 			fp->aux->priv_stack_ptr = NULL;
-- 
2.52.0


