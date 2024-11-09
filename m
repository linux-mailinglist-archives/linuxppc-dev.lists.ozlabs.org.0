Return-Path: <linuxppc-dev+bounces-3067-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 224D89C2AA6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2024 07:33:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlmGk1Qkfz2yNB;
	Sat,  9 Nov 2024 17:33:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731134014;
	cv=none; b=HelbO4FNKfVxfezy4gt1q5pa6h1NnktwFP18Q9U2t0KfRnK+HLjVaBQj1b3HzRvoV3giDYXCpxCOY4vNTqDnKPwyEDuwuHi9pPwGrvdgU1AhFv2oCWGGckAgqn5afGt/7uL3hPnJNMH8j8qdMdGQ2QzBnnISRyvEu9jOqijswIhr+CFshx8K8jmL7+QStVVvgLbaES5rfu81o5T/6gh1rZqQHWDUjccFcWZo/P7pOj895g1953TtggRPyIqxkKSc2/4xDS6BqtGeNufWNMyBDWpIOQcGKU3L47sF7noTtr7DZA7qszlnGTs08lQksWF2CRt9gNmArFPk+zVDpPneLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731134014; c=relaxed/relaxed;
	bh=5Q69+9oGRE54yyMmqawHKG2eGO9/7UWllYZWui/72b8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IZfwiDKXb8oQsY8uY8SmA13PTSwgDWdfqlUg9FY0rhnPi4sX335qq30etq+RawBUEOsDphm3aURt1unxxsATmwwu31LDovk9S5PPTQ/C3lVxdxABaCDugd7fEfbCG3z8KPAjOEDoLemUT+ptSKUqACxawJ6yF8I1RUeTeEYI1aEnwYu30abd4I7qju+RwIby8N6oRUTZOtBCSjZEUBQjXc486Clop1ebYbrKUHyBqKjXnJn5u2sGcfOMJVzI3oj3DEq7XrXXHgwvNRSVC+Ho6MHM+BJBhWHz3FmZFq+QowOleFHGKqmvSSMYGQ9q74y7tc7at4QRBWcKEcHNVJB6sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=coUNFJlu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=coUNFJlu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlmGh638Zz2yDj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 17:33:32 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A96A846032381;
	Sat, 9 Nov 2024 06:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=5Q69+9oGRE54yyMmqawHKG2eGO9/7UWllYZWui/72
	b8=; b=coUNFJluEn/zfn4XyvSaAv02FPEp6WFxuwO+Cl4GI+xVtPyxuNxKDNqW4
	Drfss9QAzczy5ofJTL6pjx0793u7YDPzhOh08ClZ5VoQY4SjFvCGjr9QDyNJ274a
	+HDJSCTe1GlZVEyR5/q/xiNHmFhRDDk+U6vYbRKOPaT7K3GUllTFfroAoQnHSFxZ
	d0d+YDAuBnFRspGlTcZyCIHXNLmdxKE7NFh3rbdIa0VmN66KriSInR/sw6WMmzku
	1FV5eqb0jPEsQONtMiB4VyiQTEg7YQ7pB37d826bUqEL+XQJRnhW7Ez67WWj1tH5
	wu6vNBcWcHbyR37CYx1xkSu/L1E9g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42t27q02xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 06:33:18 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A96XIEi011215;
	Sat, 9 Nov 2024 06:33:18 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42t27q02xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 06:33:18 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A96T1wx008439;
	Sat, 9 Nov 2024 06:33:16 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nywmschr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 06:33:16 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A96XCe137880160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 9 Nov 2024 06:33:12 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD6B220043;
	Sat,  9 Nov 2024 06:33:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0208220040;
	Sat,  9 Nov 2024 06:33:10 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com.com (unknown [9.124.214.93])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  9 Nov 2024 06:33:09 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, maddy@linux.ibm.com, vaibhav@linux.ibm.com
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Fix doorbell emulation for nested KVM guests in V1 API
Date: Sat,  9 Nov 2024 12:02:54 +0530
Message-ID: <20241109063301.105289-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
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
X-Proofpoint-ORIG-GUID: dDouhbvY5gkioZ8KsDxqTgClwp4wat77
X-Proofpoint-GUID: aRn4XiYbOUABJkFjYpnODVt-LjL-jNo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=527 mlxscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411090049
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Doorbell emulation for nested KVM guests in V1 API is broken because of
2 reasons:
1. L0 presenting H_EMUL_ASSIST to L1 instead of H_FAC_UNAVAIL
2. Broken plumbing for passing around doorbell state.

Fix the trap passed to L1 and the plumbing for maintaining doorbell
state.

Gautam Menghani (3):
  Revert "KVM: PPC: Book3S HV Nested: Stop forwarding all HFUs to L1"
  KVM: PPC: Book3S HV: Stop using vc->dpdes for nested KVM guests
  KVM: PPC: Book3S HV: Avoid returning to nested hypervisor on pending
    doorbells

 arch/powerpc/kvm/book3s_hv.c        | 41 ++++++++---------------------
 arch/powerpc/kvm/book3s_hv_nested.c | 14 +++++++---
 2 files changed, 21 insertions(+), 34 deletions(-)

-- 
2.45.2


