Return-Path: <linuxppc-dev+bounces-3542-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A05BB9D7AC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 05:23:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxXcq4hLKz2yZ5;
	Mon, 25 Nov 2024 15:23:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732508587;
	cv=none; b=axxVPjCRtjC5Eku8/jeWgQ4wBkSZnMl/I91dczFqACD18uVReKDBjiIbjMGI2VeIAEUmtBXsefs0KB5o/Sa74g5tHo6u9+Lw5+UYE563vu4iyL+vwZJL+GT5VJ7y2oS26YzQoLFvumnhuHzMVbGSvEb/iVnBi3IFUbB4VC0+EHQ7u7yKDBzBsy5cNDDBzS75h8f3visCA5wBPNiaZDeSU4+wbtbsDqfF3u3fZ4D3eGKZ23BOrsK+SouYdoANRneiVhW4XxadleD3jYHy6GtmPyqUVYXgGSpw120R+j7g0v8AbdTsc+Yi20xQbtKpsosokpaBBUBUhuI2+dw/Ee/Anw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732508587; c=relaxed/relaxed;
	bh=6gYY45rFaWXCTTO7DoA6uYes3Y9Oq5QwfdQWzwDEUW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rv/YjF3oj8gg3VonFOYvsZHNRYa7YN6Be0DBcMyJDFCZe34CT/10JmAWF5LZYSMe/tHK7SHPHgN9F6GbEfczAjNBKb3WtjbmgyS/QnW56p3WvSoQz1k1UU7QVAq/KsBTp7HS4DVaEnnOGIcFe7nUG6dRu/7vk5d76QHNOtBjsVPS1nLaRNc0J2ukFNINRNcACOhim2u2VYDRmh7WFwyAp0iPwA+LCaUtIPZz6zZF20XRKWTfyquHpVSEWq0UwuSOEdaKF7TjcjIZzgTtwiyMiz4WGHswDv/PMmfaoA4xo9MlmDcrbzXvrI6S6kKCJ/am8mW5vk9BoboK6/yebjzahw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aoRnS2RP; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aoRnS2RP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XxXcp24k9z2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 15:23:06 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOF0Mk7012423;
	Mon, 25 Nov 2024 04:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=6gYY45rFaWXCTTO7D
	oA6uYes3Y9Oq5QwfdQWzwDEUW0=; b=aoRnS2RPU8G89xSUOJydlpan7+zcCddaS
	FEwkFzw9J6u2FDv+CV3JheNbhj3fOfraXaaMICRufIqFSTx3DIy0Gj218Ld3Lz4t
	nBFAX2YQ2SXT2rDANJ9j0uL38r0HJPfgoF9hrSbuDYpgN5u/OXJ3VUOaWMwuRCKd
	4Ompjm0U9T2l/NxcolirzE5EGXVW8MX8rdzUt9Jqzdn4eyQLuBi6HovqnVzeAi/Z
	JIxvHKc+1RjvEHh/twWEggoG85kFRFJ8nbUsu/sVVATwCL2NII1+i1AX4B6+7XZA
	DadHJv9l6Vsp3gQV3ESH+rGc1UhHIT/0GgfYq9ApW5qn7zoG8CElA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4338d1x39a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 04:22:43 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AP4K2rK022013;
	Mon, 25 Nov 2024 04:22:43 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4338d1x398-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 04:22:43 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOI0Msn026326;
	Mon, 25 Nov 2024 04:22:42 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 433v30smep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 04:22:42 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AP4MdLg11600296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Nov 2024 04:22:39 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1841220040;
	Mon, 25 Nov 2024 04:22:39 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E140020043;
	Mon, 25 Nov 2024 04:22:36 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Nov 2024 04:22:36 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        maddy@linux.ibm.com, bigeasy@linutronix.de, ankur.a.arora@oracle.com,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        vschneid@redhat.com, peterz@infradead.org
Subject: [PATCH 3/3] powerpc: print right preemption model in die
Date: Mon, 25 Nov 2024 09:52:12 +0530
Message-ID: <20241125042212.1522315-4-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241125042212.1522315-1-sshegde@linux.ibm.com>
References: <20241125042212.1522315-1-sshegde@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mH6RW4zO8Hyrbt-xLOn55y7JYcLQHElp
X-Proofpoint-ORIG-GUID: F4Y9DOw9BeROC3AVPQoftrSnoRJmtpYz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=887
 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250031
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Preemption models can change at runtime with dynamic preemption in 
place. So need to use the right methods instead of relying on
CONFIG_PREEMPT to decide whether its full preemption or not. 

While there, fix it to print preemption model correctly. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com> 
---
 arch/powerpc/kernel/traps.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index edf5cabe5dfd..2556fa8ec019 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -266,7 +266,11 @@ static int __die(const char *str, struct pt_regs *regs, long err)
 	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
 	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
 	       PAGE_SIZE / 1024, get_mmu_str(),
-	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
+	       preempt_model_none()      ? "none" :
+	       preempt_model_voluntary() ? "voluntary" :
+	       preempt_model_full()      ? "full" :
+	       preempt_model_lazy()      ? "lazy" :
+	       "",
 	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
 	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
 	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
-- 
2.39.3


