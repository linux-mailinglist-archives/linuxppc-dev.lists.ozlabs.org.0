Return-Path: <linuxppc-dev+bounces-17320-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP2IK4WwoGnUlgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17320-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 21:43:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F217B1AF410
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 21:43:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMNhb5CpMz3c97;
	Fri, 27 Feb 2026 07:43:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772138607;
	cv=none; b=KMJTRqbFBwBYAdsA0Uzeowat5Tt9781sffP/QvsmD7vIDk72hrbcyqbydrhK6cKJCcG+vcDATWUgkvexbOr/fVo+z1TJP0yUG09aaOZwinfE5CoKOAKKonUGcgXIiO3f44BDZFWMpcR2QE3G+uFgZKHgVUQbTyh33+Uri8obQbd58Ga2Tae++eoF4ZR4AfiYKjHfgrckyp9uoWzR+3dZqGtd5+zG52CV8mY4XUXHIPjOolSfpLDpXiRBag05d0DEsCp+4cNhDbltuzAjLnOc172c3h6jSikXhwmHpJ5fzD8Kx22YJOJ//Sas0ZSx9cODcWyCOB3QoNsQD5w5De4VCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772138607; c=relaxed/relaxed;
	bh=zR6NZ+PIQzkOImxuEoIedc+fyLzHwiU5uHKWg9CMDDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDuqFxcX71+B0fltItZ+uDIJYmrAESUlvlSAuUTAscwHLKw3ThY86OPev/KIR86Yep+0/8dotwMuzipqtxeAJ2IHqUN5m+bjDDwkuLbK01dUXvZnG/XNggHPwOj437ri3GbMtIpj0+VjvXg+CFdz+DYfE1nCIMmNi4fcWpsiA2fs1i2SPNC/3HDg07HhWPRQXPaFOo6N2UYrloXXz+/NWN/IcwjELKbowL35SWS3H+HJphNxA3g3tiIKWnbdsScG3VmFvr2Dn5+6WUlsD5PbE5yHTewMmdAQDKkG7hMwLbAv4YzUFWH5tT6FEpYyA6YT89P/7DgRtAzQPKFpbQ2WaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DEdmONkF; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DEdmONkF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMNhb0KBTz309S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 07:43:26 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHpCZT2848171;
	Thu, 26 Feb 2026 20:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=zR6NZ+PIQzkOImxuE
	oIedc+fyLzHwiU5uHKWg9CMDDo=; b=DEdmONkFBdTo+8aMYMI29mLLucLMcTQXv
	cfZ82MN84Mum3sfDz/acKaKp76PV2fi5Vwe3xESYFxI3u5tXboczpO4zGta6cbG6
	HaJmOuVGG1h3eOiDNEtGMYEEqP0haWDtS+w9fsTfVqKuW1odZ/HUhQnbcHgTI4do
	/2OcaZy4ezYD1YM+evapFiRUt0u7Pae4XQKD2KyW5wNvLjU0an8+KDm+ypsm9Fhm
	BHkhVrkcZ8LUpAQqpvdYPKcecm/DC/jRRE4FXJIsIsz13J+LpalIF/Vy8w21F8++
	9T5MdB0Fp/ulAFb0qjTX73ZaChwiE+8K5T1ekyDWEj3lsv7Jw8R2w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf34cg3ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 20:43:13 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61QJ7kJw027887;
	Thu, 26 Feb 2026 20:43:12 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfsr25t4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 20:43:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61QKh9ar41353576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 20:43:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CB6E20040;
	Thu, 26 Feb 2026 20:43:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DB7C20043;
	Thu, 26 Feb 2026 20:43:07 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Feb 2026 20:43:07 +0000 (GMT)
From: adubey@linux.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org, hbathini@linux.ibm.com, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, maddy@linux.ibm.com,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v2 4/4] selftest/bpf: Enable gotox tests for powerpc64
Date: Thu, 26 Feb 2026 20:43:11 -0500
Message-ID: <20260227014315.39980-5-adubey@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4NCBTYWx0ZWRfX+PanbBT8qLYf
 c27pKqpxlOj7ZIey2PWNes76BenyyWbO77Np1wDc2k90g6NaYUlf71eKn/cjmaJC3phPPmsKUbN
 KilQktEs5oH+qF3SlzIv7eKA241eL+pKv1KVLLfbLJjy0ZsFNlMv4+82LizrK7FkNI/eYwad9fH
 dve6L9bC/yY+Q2B42ti0ONQ5zeqr2NT7l1WWnyxUlQpsVQDHMoLxQ8j70VKEEs8lpWA9sdCwvTq
 5kyziNkhSSbcaiGbA71djLEZVodkj3sdy3x/d0B0ctGDGgblUEhc+maZeS9KvU3pJkVa01QHw5r
 6HEzaBiA6qf9ULcQOKqZl/Wgh7GBcIk99oaDVnwB23Is3SLqq/JggYgh7Lr1wGfeYgqSv8nu5lB
 2zVCnUKe4t/9I7pz2WCKOmQLjfyXgmvy+4IaNWvZeseI9QFR2KeIzCbYRMJInFM5JCll3vqqPAJ
 4vA/Vs4KuW/TqrJdboA==
X-Proofpoint-ORIG-GUID: _HiC_SpTgFNhNJMvQPZNyfKULQjHe7J4
X-Authority-Analysis: v=2.4 cv=F9lat6hN c=1 sm=1 tr=0 ts=69a0b061 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=UBUblTJxaNEy-f4YUGgA:9
X-Proofpoint-GUID: _HiC_SpTgFNhNJMvQPZNyfKULQjHe7J4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602260184
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
	TAGGED_FROM(0.00)[bounces-17320-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: F217B1AF410
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

With gotox instruction and jumptable now supported,
enable corresponding bpf selftest on powerpc.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 tools/testing/selftests/bpf/progs/verifier_gotox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_gotox.c b/tools/testing/selftests/bpf/progs/verifier_gotox.c
index 607dad058ca1..0f43b56ec2bc 100644
--- a/tools/testing/selftests/bpf/progs/verifier_gotox.c
+++ b/tools/testing/selftests/bpf/progs/verifier_gotox.c
@@ -6,7 +6,7 @@
 #include "bpf_misc.h"
 #include "../../../include/linux/filter.h"
 
-#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)
+#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_powerpc)
 
 #define DEFINE_SIMPLE_JUMP_TABLE_PROG(NAME, SRC_REG, OFF, IMM, OUTCOME)	\
 									\
@@ -384,6 +384,6 @@ jt0_%=:								\
 	: __clobber_all);
 }
 
-#endif /* __TARGET_ARCH_x86 || __TARGET_ARCH_arm64 */
+#endif /* __TARGET_ARCH_x86 || __TARGET_ARCH_arm64 || __TARGET_ARCH_powerpc*/
 
 char _license[] SEC("license") = "GPL";
-- 
2.52.0


