Return-Path: <linuxppc-dev+bounces-17124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC1SIqsFnmmhTAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 21:10:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F718C4B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 21:10:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL8371wNqz3chF;
	Wed, 25 Feb 2026 07:10:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771963811;
	cv=none; b=DrLBnZWMJgveq3LKmbf/s/kXpH9SKbwi8yw4BtLM8lOm/XiWHyPYVMLWZiaNG+9cd5M7bmJsRbST466BiO1FfBt+iz7dfqpg2vHKfXylwmC12b33/IN3GuEPkJ87zCxufd8v7Xo+jG1/Lp+GfqCTLMV9x0Rtm1iECrNciBS350X+flzU9LNKzyoxYg7eyXV77IE82G9Xdkz9MOkJPbC7mtZQXgtmvnZwDVjDnukbxVVI6GSdhEc8uuQotrI0DyxGuHkETPaxo1S6g4FBHZl3j7Qvn2Uj/Uu8ZaXOhpOdqfGq7wn9R38cxXscqTQ+Ov8X2JFMVThIOdYqtJRijsajLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771963811; c=relaxed/relaxed;
	bh=Lz5VK0w8GR0PKAPoWv6xxNv08ZSCAje+2otVBmyY1DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOMQLpZAFGNcLPT5VUF/HA2iy727kLq1ytKcVA8ZoUaqzyurjd82NZuWsEiupWjiI8aewLKevnOwgN6SwDU2nP9D8urkpeMwxzQvs9gYqv8yM5ETDuaUQsJ9bw55rASeJjvKcVWwiz6cZGV3sLBjp9GzCu7RUmvyHPn53Qf5J4iojn0vlSu+ed0Gujym0c3nTOfgQkTwCXpl62nBpmuLdHefbHN7DogSDARYhZmziIvK0edD/yErFHwrlOaOVMO+6U3HzuO4G8uXWKQaqU1AXzf8BnknSY9cC46z1/vzCs5LysbkRPiPKIMWmoVNaoy5CW73Eoitw8zYdJHJVPbeeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d7iKKuiw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d7iKKuiw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL836467Dz3cbQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 07:10:10 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O9HbKw3207066;
	Tue, 24 Feb 2026 20:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Lz5VK0w8GR0PKAPoW
	v6xxNv08ZSCAje+2otVBmyY1DM=; b=d7iKKuiwCE4JOYITJDRBmvRyzVhewyjep
	xhEtI0V5uoNLXtRxWuPH4RBcIN5HY3AQmgP/slR0TE6oUdXvF8MerH5TtX1/Rffx
	UKIG04yTxZHFVQpHU8l8W1qER/KXtRaXzgqBeViTHHvcLq0g/OV/Nx+Bnx7pEsWk
	ZhrgZV39bdmnUet0WC8Y5m+tTc/vgGblG0wxwzbHVeQnDTMfBJJA3DHxBQpE8kAO
	jQh2oeGAZuSVw28MvTNghmczARCX2k2zuBSpBm7xp5dUi/iB6eTP4EijPWh4W0pe
	TyKjRNsuDPyWca6y0xi0wdh+VnzIBHkXNEjnf7mZfWRSdzcAs3EBw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf24gcysq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 20:09:54 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61OGwiCF001646;
	Tue, 24 Feb 2026 20:09:54 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfr1n2fup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 20:09:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61OK9ovg40698238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 20:09:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C17E20043;
	Tue, 24 Feb 2026 20:09:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C09C520040;
	Tue, 24 Feb 2026 20:09:48 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Feb 2026 20:09:48 +0000 (GMT)
From: adubey@linux.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org, hbathini@linux.ibm.com, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, maddy@linux.ibm.com,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH 1/4] powerpc64/bpf: Add support for instruction array
Date: Tue, 24 Feb 2026 20:09:29 -0500
Message-ID: <20260225010950.20218-2-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225010950.20218-1-adubey@linux.ibm.com>
References: <20260225010950.20218-1-adubey@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=TNRIilla c=1 sm=1 tr=0 ts=699e0593 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=lbH7urq3qjFNCEvrvYgA:9
X-Proofpoint-GUID: qXh2ApkJQxJGMx2ivObjJ2Kf3lp2Uz7L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE3MyBTYWx0ZWRfX6dNNfjV7efYg
 bxA89sX/nuPAi7w8SoNS/F41o2mly6XFXvPIxpASTT6zIlnexgXEqmp1MR4COxMMQH5P6P+YPQR
 bC+QZcCuabPg5h4RmvpOtsRgJD0dojhWqSGMGSnBVE5aLQPZfvxgr5v+Uv7qecCs80Hv5KVfxkv
 6lPxmkA8kKese/sx7v1+wOgtfwWWW8VczJJDyRI2/+yQT3vddNUypArfq1mPmnZoUVpJf5Ieaot
 9Gz+NoDOoaBMk7G3cP9RrAq+kgkllJrpm3Ah/JD74UgkhRfxiBS4YU2zrXjzDpHZvDKZc/DaDgc
 lJdrJPWRmXATbw37tIfv5phAjahNgkRETNK7vjeOsex7Y/9FHwPKegTYXgUvwBeiDaBT1YxiPl3
 DvyuO+H+MyvTkQHD9L3UR7LrkYpRkzIzfzh5dO/aY56q2o/4o31iWmE5cY8dW9lrBfn3maY2bZu
 fbHFupbi9RUxkb08j3g==
X-Proofpoint-ORIG-GUID: qXh2ApkJQxJGMx2ivObjJ2Kf3lp2Uz7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602240173
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17124-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E22F718C4B3
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
 arch/powerpc/net/bpf_jit_comp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index ebd21c75ce47..04f51f2c817c 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -379,6 +379,12 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		jit_data->hdr = hdr;
 	}
 
+	/*
+	 * The bpf_prog_update_insn_ptrs function expects addrs to
+	 * point to the first byte of the jitted instruction.
+	 */
+	bpf_prog_update_insn_ptrs(fp, addrs, fimage);
+
 out:
 	if (bpf_blinded)
 		bpf_jit_prog_release_other(fp, fp == org_fp ? tmp_fp : org_fp);
-- 
2.52.0


