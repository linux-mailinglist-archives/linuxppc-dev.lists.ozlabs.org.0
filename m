Return-Path: <linuxppc-dev+bounces-6903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E361A5CBC9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 18:12:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZC0g82ncnz3bsP;
	Wed, 12 Mar 2025 04:12:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741709448;
	cv=none; b=ShtuzlgbJ4fvxuYDOpAKfZM85SBYPvju90qnlbxvbcTAdyWTjNe/FTGheL2i84A87w0JlX3eV7NbWmU6HFsmIUGn4sF0AqN5oYobiW801Lq3fdNRPDvnwBTL6acq6sawHAsdxJSlD+4SA9ywajzqiiH7OvQoHmxaUw50deq0TLspqDWN6fZfbt2XZoWlW0hTkPr0WT//4qIryIwZyTHAqpHt8jhPPSubGQtkd3avwrJBXr9DWi6nMaeilJwRsZI1zjO6YkQBXVkNh3NmHbQGTndpf2BExRzP/9a1OgTxaviDP0zojAz1dH9Umtbo3cQTCACF1NQMILNNvixjt4VT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741709448; c=relaxed/relaxed;
	bh=+EYvGae0hUZazAuE3CRV9Jcwx3/xvzbbDFE9F3IqSqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ot6ORnckI6f2HBcP9tQKSl+CTUO8PX1XdTO2RbXRoqQHVqPALYMN2R5L1wCiTsp4Hwcruhmts/EZDdennmMh2uuFm/jbPUQd2a0fXXww3BfOBxW8nN3bvn5faf/4a4AHppr1ZqGN1XytXDBBNkCkht07E+IBx115Fnmkqf2f9iqMUULOSEQMWuAwVQ9Aop/uPaH4OnbeQMHrMbZLGauDa7n47oA3MV8X8DR8jl4QOAlCB5wQnm2+aRwzBQ2f8MjMj646UOjnDvXaQJ+Gn9oMuffqcH4gMYELsjvIsGGXhx/xHwEIDs49TBDKL48XqI1BWXzmtmpVVXwq+lHVl5dVMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CyMoNZl4; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CyMoNZl4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBzJS131Jz3brt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 03:10:47 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BFa5UX002558;
	Tue, 11 Mar 2025 16:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=+EYvGae0hUZazAuE3CRV9Jcwx3/x
	vzbbDFE9F3IqSqU=; b=CyMoNZl4kNGF9bC1jK90dFGspBsNOpm02YYG3Vs6PBxB
	yiHoIyS0F84z3RXEZqF3YIRUYewDnxtzYB6WfEDNPs+SLAyxItk5JjPfH4e6yJx9
	V0MIZKJQJFGQW9v6EcSgrq8y6YF2JvYH6a2qZD5WTJ5jpqoJwpAt16zCEZNB/DqE
	so250dvgvopiKWJHll8xygNCMRD+0idZrdWXTIc3bIDbG1cz1HD1zSSr50SW5KZZ
	xV2is58p7n3YzgVmJSCqv2ePGdxoO+5rEBEBLU72G7a84vYGZVEc/LsP+gim7ACb
	t6OsaFtSQmRJYxeJuatFV6hPk3IjuPyr3+2Hd6SO5g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45adjb3s7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 16:10:11 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52BGAAti004508;
	Tue, 11 Mar 2025 16:10:10 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45adjb3s78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 16:10:10 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52BEuDG5014024;
	Tue, 11 Mar 2025 16:10:08 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4592x1vn1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 16:10:08 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52BGA4Q742467590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 16:10:04 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5E4B2004B;
	Tue, 11 Mar 2025 16:10:04 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1410F20040;
	Tue, 11 Mar 2025 16:09:59 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.96.240])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Mar 2025 16:09:58 +0000 (GMT)
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: ast@kernel.org, hbathini@linux.ibm.com, andrii@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, eddyz87@gmail.com,
        song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
        kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
        jolsa@kernel.org, christophe.leroy@csgroup.eu, naveen@kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
Subject: [PATCH 0/2] bpf: Inline helper in powerpc JIT
Date: Tue, 11 Mar 2025 21:39:53 +0530
Message-ID: <20250311160955.825647-1-skb99@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JWlkCi8MDw4l5HkEgkNu3WyNvcPKmcpC
X-Proofpoint-GUID: 1zIAZMVI6pxa4sSIdY96VTyY4Rg_CK-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=296
 spamscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 adultscore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110101
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This series adds the support of internal only per-CPU instructions
and inlines the bpf_get_smp_processor_id() helper call for powerpc
BPF JIT.


Saket Kumar Bhaskar (2):
  powerpc, bpf: Support internal-only MOV instruction to resolve per-CPU
    addrs
  powerpc, bpf: Inline bpf_get_smp_processor_id()

 arch/powerpc/net/bpf_jit_comp.c   | 15 +++++++++++++++
 arch/powerpc/net/bpf_jit_comp64.c | 13 +++++++++++++
 2 files changed, 28 insertions(+)

-- 
2.43.5


