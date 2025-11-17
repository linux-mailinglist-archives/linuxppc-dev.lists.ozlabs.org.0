Return-Path: <linuxppc-dev+bounces-14211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B52CC62985
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 07:54:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d8z4Q597Hz300F;
	Mon, 17 Nov 2025 17:54:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763362454;
	cv=none; b=gvdxrU7vO22pJoY2SeB7k16o8kW6aIiNXNEe3Ge4I4S2xetrRD7X/6v/iLCw7dFq1gfpjxOSW4fs3unLKGN2SzVvZuP4BFoY+29JGe/dQuQf6oOqdPbT+rD0UkD77fXXs3hoWeIgeoAWbMPpHWqpzX46+axNbdSnwhaKRa4A9yfoFLIEQUnflYT1ohEWPI08hgvNSVWiWo9QNy3jswV27ycTHSVS11y4ilXwK5m/3jTDEouhRpnorFk1fwOdGh+/N8z5XKvXxXk3QBv14YMMqeSA5TfPEAAPiaee72oqvqCvR3xYdS/JIbRQXemuAobBlmrUkJFkgrI5RMJr7jkUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763362454; c=relaxed/relaxed;
	bh=FOVCjB6bATzzeeCLzcbsx+ZH7xzceW3ZTHeiPuw8lAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AoE3xi5BXb79+oh37Knxbn1DFyENXf4zdL2rg3vvPPmOyP1n5P5gAnbBH579vVAU21ht+PO2naSVF7PYFtHblJdbWU7WCphVvQqV6G7wafMAoIdqBDXdhmORIyowU7Lwmv7xgTIvCHaUGIcSDxLjxOIUEVlnEpKGEv3JyHFCgZ6TGQJqFHI/EYb+hv+skDxaYfFCqxzreeJ182kRbwk3gjQ2PQFOJUxQ5KJqzhA8Q4aE3k5ESnXSKY9UFuuu88MpF1zoPKSdFg9qbv9+CWZXDAJqbS4HLNkuU/X3ePrKWY8d6MO64CEUH4cy6sLoq+XDm/kNp5ymzLczOZRRjz5wXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wk4j8vYu; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wk4j8vYu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d8z4P5cc7z2ynC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Nov 2025 17:54:13 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH0aQHJ028819;
	Mon, 17 Nov 2025 06:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=FOVCjB6bATzzeeCLzcbsx+ZH7xzceW3ZTHeiPuw8l
	AE=; b=Wk4j8vYuAk2Ns/T9AEdHrfpbXJsSTZPmJY8noMbIs0J6iAa2d3edDZjwJ
	MIgsK29cygLe/Pk0TpoN/pRd8d+fRfMeq5+TmZ708gGmA5V6wGEi//x6+LRnx9bN
	v0A8dJmtl0G5eDdWukz2+i3j6/jFrT3ec0hHbBXKxtq14b1F7/L9pfS/T2Yp6USy
	pSoYenLRy05VsJfz8JMNBpgM+ayVgVv5PRlqlV+wjrksAK+gMcc8Qzn6RjL2RuDE
	gHHKU67nV/fr6DQzPtYW42LNvZGbORyS9w6aRyl8vWPzqAkD/0F0g+Jgm4iDVPXR
	oYbO+SlGQjIBFgVfYxdSM9JPXXxhA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmscq5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 06:52:46 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AH6qjZt029694;
	Mon, 17 Nov 2025 06:52:45 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmscq5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 06:52:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH2WSFb022311;
	Mon, 17 Nov 2025 06:52:45 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4umme96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 06:52:45 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AH6qeAk48824654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 06:52:40 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4A792004E;
	Mon, 17 Nov 2025 06:52:40 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95F4220040;
	Mon, 17 Nov 2025 06:52:36 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.in.ibm.com (unknown [9.109.219.153])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Nov 2025 06:52:36 +0000 (GMT)
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
        andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com
Subject: [PATCH bpf-next v2 0/2] bpf: Inline helper in powerpc JIT
Date: Mon, 17 Nov 2025 12:22:33 +0530
Message-ID: <cover.1762422548.git.skb99@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Proofpoint-ORIG-GUID: p8CNUhvPtohm6Jwc96Z-h4yjFOC7-bBr
X-Authority-Analysis: v=2.4 cv=Rv3I7SmK c=1 sm=1 tr=0 ts=691ac63e cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Kh3Ll-5vp6X81fc8IPUA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 9Vp-nMdO3UtOpSuNraCmLDhiKUMDuetx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX/PLb6/Ja+amk
 BUq4PESu23dliovwzND6ZaBQWgEu9pykQv7QzCJQs8io8uw4BaRm/bZM7y1vCOWh/KXBctplGCU
 fa8koSL+GZsjtgrkoXPLRQ8QvObKVaPRnaconD1yPyAgxDeJvBBuu8LcBo/gOHFvTVmdDDhV8wq
 pjbjf4ku6YXYXVCP0bp2uMf/ZpZhjs4uN4/byHgXE+u4rPdVlZPMODWk7nmPlq8qyF+J3bsri88
 qcrendOYbpfeirhOJYUaCJeBgeRoaQnjrzd8DJPlM14OhED8Cj5kXdy/kw+0ecKOtRtYUe+RMcy
 r+r7c7lN8Fvb7bTc00eT/5phSsU/HaA43WSFufA1WGukQKXRBzXjWzV4ajgl5Vipa/+7/ul926R
 8m5F2oeEWG7MLdAQzkeI2ECwDckwMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series add support for internal only per-CPU instructions,
inlines the bpf_get_smp_processor_id() and bpf_get_current_task()
helper calls for powerpc BPF JIT.

Changes since v1:
* Addressed Christophe's comments.
* Inlined bpf_get_current_task() as well.

v1: https://lore.kernel.org/all/20250311160955.825647-1-skb99@linux.ibm.com/ 

Saket Kumar Bhaskar (2):
  powerpc64/bpf: Support internal-only MOV instruction to resolve
    per-CPU addrs
  powerpc64/bpf: Inline bpf_get_smp_processor_id() and
    bpf_get_current_task()

 arch/powerpc/net/bpf_jit_comp.c   | 16 ++++++++++++++++
 arch/powerpc/net/bpf_jit_comp64.c | 19 +++++++++++++++++++
 2 files changed, 35 insertions(+)

-- 
2.51.0


