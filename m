Return-Path: <linuxppc-dev+bounces-2401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ED69A44E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:38:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVX384Krmz3c4V;
	Sat, 19 Oct 2024 04:37:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729273060;
	cv=none; b=b24jL8Mj7QY/FIEwqlgU2HAT3mv7Qfg7fZHDyH2FNrIHJ7nXALAw5TPbvtHqY5H9RGPPsLLDolVd3vHryMOGUfaAjCezJDW8lmR7DJcPYirogZFJOp5dntkxKAqN0PsKoXI2pyBRhFTYkde1WzkzgIyrHpk3Fww/kgwKeQqittSCCnpdUGGBvMtOSfQEMA5ckKZ/oJrj0y4jCHBGocJbYcsumJpdcTgkGfqCA+a+IjpTD49FCMWWd1urKQzepEf5paWY5N2tdCcbLQ8Jcr5y3DCUTbvpd57mQF5yOHUbFMB5FuZW6+psny6iaD39BR/KPmJBSwCU89S1ftI6n8qLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729273060; c=relaxed/relaxed;
	bh=fMqU1TC7xuIT8q8DHtbVoyWQNBWznIEINbrSJnudSu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QH6ETWUFSpnFqfvD0YEz/TUB6JQ2btuqpkHdVWJ18ZOgUra5YYy79YWN3U0fXg5tekyuW+MY8GvEiGJTkjOYcHF+G7Da54E53Sm9grwLgRqQ+wbcH8vZpnY7iUuK2mYMRVymekqbywa/B6Ltexzh/Xw8rXJgC0oFvTFKEZNLzDsIEuaJw1junUg0u3KD9Nxcs74f8M+FEVUCs18hpZuQKVaquCdRTCgjmcV2yMyk6VqJsHQa2BMkjzwR4dU2sTW9Ta5s1UUKzW2lyGbHpqL2jA810bcqVM1khj9LrtxTCmMuglY4g9bb6sE/Re5EBgUPn2hsrnpRwLDPO9ub4P51YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=stSJkgv3; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=stSJkgv3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVX3741YSz3c3K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:37:39 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IFPhw5015379;
	Fri, 18 Oct 2024 17:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=fMqU1TC7xuIT8q8DH
	tbVoyWQNBWznIEINbrSJnudSu0=; b=stSJkgv3ttVV4hWAu21LRSjdQP6Xk1UAv
	i6U2AnvdOtFDCvWa4S/xjgIIocsVXWm7DgT6hBmViC/ymsidrc0ohzIoKzPjFeV4
	N3aXfGaycjQa3+KXNj0iuFrmbUdaCR8S7rf0NP2QiP9QGMZRBAJ29L9/3ROBRtK5
	nI6uBH1BqikR8epruwoCb3zSBvFn3iGyDgQjiyma5RSahsZgRafSOSqxGSDzkEl/
	kG+f4gZ9CQkyezxB7URAZuHNmqN+ZmTPJvpNGH69SUreCQwIz3KisWOzSYabixMb
	5fJyAtNAypUk9H4BioVTMyPeENwPtnL/pgfMHx+XXDfq5dpdEQK1w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42as8aa290-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:18 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49IHb08w011544;
	Fri, 18 Oct 2024 17:37:18 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42as8aa28v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:18 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49IEh5Fs006415;
	Fri, 18 Oct 2024 17:37:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4284xknut1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:17 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49IHbD8f34865624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Oct 2024 17:37:13 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89EE120043;
	Fri, 18 Oct 2024 17:37:13 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72D0420040;
	Fri, 18 Oct 2024 17:37:09 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.99.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Oct 2024 17:37:09 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v6 08/17] powerpc/ftrace: Move ftrace stub used for init text before _einittext
Date: Fri, 18 Oct 2024 23:06:23 +0530
Message-ID: <20241018173632.277333-9-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018173632.277333-1-hbathini@linux.ibm.com>
References: <20241018173632.277333-1-hbathini@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RXDrmJO6Dba7OiPPMdD66nYzzlm4KbDc
X-Proofpoint-ORIG-GUID: MI0FUyXISvyuDiZm69u5OB3OblVg9sO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180111
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Naveen N Rao <naveen@kernel.org>

Move the ftrace stub used to cover inittext before _einittext so that it
is within kernel text, as seen through core_kernel_text(). This is
required for a subsequent change to ftrace.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/vmlinux.lds.S | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 7ab4e2fb28b1..b4c9decc7a75 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -265,14 +265,13 @@ SECTIONS
 	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) {
 		_sinittext = .;
 		INIT_TEXT
-
+		*(.tramp.ftrace.init);
 		/*
 		 *.init.text might be RO so we must ensure this section ends on
 		 * a page boundary.
 		 */
 		. = ALIGN(PAGE_SIZE);
 		_einittext = .;
-		*(.tramp.ftrace.init);
 	} :text
 
 	/* .exit.text is discarded at runtime, not link time,
-- 
2.47.0


