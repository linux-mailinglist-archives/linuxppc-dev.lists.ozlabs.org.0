Return-Path: <linuxppc-dev+bounces-14643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48519CA7CD4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 14:41:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNCG64c8mz2xc2;
	Sat, 06 Dec 2025 00:41:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764942094;
	cv=none; b=ejkosALK+B66kSsCMoRGMn64oAzAVtyrt8Ext21R+ncVA3ojcNYVq9eGdFj2NLP+Rr1aJbiMQWrr4bz293/u07Fc7E1ISNk9L0knUnErNHs5dnFEgsdMcRrFO9aED8opgEdu0KhUKJuG/GmcVMs+nXty7iq9W4w/OYU59eJmE/zVydB+FKfB71986AI7YCjAl6i43wf8HUw0/XYx5NyqVxvu+GWpDE9ntfMqG6YqrQErlUieDIyJyVzhdcNBZ8pxxUIiYuTUmtqgR1e8zenlcD3JgjGQtmAigpvwGvqi/z2x067ZNNsBv1iFfXtQvsSkQGMNKlNoAyjYLuUcjc5gWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764942094; c=relaxed/relaxed;
	bh=YLhyL3IvXOaOUXg9Qsq3itltYFrij1c4ehNNTcsHjvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nw/d/FYQQPhsEHrBYTQitwBjOkgJnpfSclmu7uCvnzJamrZli9/HI0MgzuuW4kdlzw3FmQbcTSR19uOOfp3KXoEtwpHQ/G9rETgMQ58W4xWHQ7giQkojbcQwSVwIv7ilzOU/OL3kuFxL5VWKAiHRyAnY3MHQ5EqpnFT8hhEqZdYrCKAd9RLQ8pSwZPlI7v/GIWGga3vtuKrnPE3fVNFXj09jrTTmUnq3hCCAI0RNjBr+Z+oJQybyEsNG9EOl/Zl+0eQqalqRDoq2E7lKTQdOawI160YRChJ5X1i9VuFNcwxucfXFHtIMbqQmNlW+s2+pymDZIeBzfZqIqyLr6KWeCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A4kk7Zeb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A4kk7Zeb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNCG46cMwz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 00:41:31 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5Ajs1s013242;
	Fri, 5 Dec 2025 13:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=YLhyL3IvXOaOUXg9Qsq3itltYFri
	j1c4ehNNTcsHjvA=; b=A4kk7ZebKzNXRfmEBOMBjEO3ZS3qgoNJ1DueH6S1FrM2
	uyPz4+yWGNS8lk4IWotk89ag303O04E3Dz7HLufR91v7IvfNpnQyRajIsrxxRpgo
	oeZckoj0CXjO1a8Mc4AlCO0IQKcaMWyi7BTbm6THHnCy9EAyaGF1kSA87FNzUzq1
	Sn88fadNfylNpv42hOcXIzGPIlFO3Fn1B9RcQxthzTcVfMFKIXAl/v8rQ9DXW6ij
	DydA2aOwmvF8md9LBwSdR5RnTlvw+5XiLOsswBRoNdP2iMjJdsEeO5r/Dwj6KSpo
	X9abK23DWmzliSRR4VgogCFHBldHcDyQ60QufY4J5w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqq8v5795-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:40:52 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B5DZ4jx005493;
	Fri, 5 Dec 2025 13:40:51 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqq8v5792-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:40:51 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5AP3Qj019133;
	Fri, 5 Dec 2025 13:40:50 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4arbhydhf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:40:50 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B5DekJb38666746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Dec 2025 13:40:46 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD4AD2004B;
	Fri,  5 Dec 2025 13:40:46 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63E1920043;
	Fri,  5 Dec 2025 13:40:42 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.65.165])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Dec 2025 13:40:42 +0000 (GMT)
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
Subject: [PATCH bpf-next v3 0/2] powerpc64/bpf: Inline helper in powerpc JIT
Date: Fri,  5 Dec 2025 19:10:39 +0530
Message-ID: <cover.1764930425.git.skb99@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VQYKML7JH8kUl66KVGxABaAeI6Y16Ig-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwOCBTYWx0ZWRfX+K90K2A2vcXV
 KrwRZ+uYv9l4apOqOKYSfUK3S5cDrXDKwKnQv+kB4MsGPym++JcES7egXawdhnO5KYkpa6hVW+z
 JyugvBlKtTM4RPaHXrSHI8u5IA76uVUqSJB/YWIXqqNziJ2dRKX+TgwPDiemRduQxPmd2HtdYbX
 D9ZU7j5pPwuJP4hRqblKMeopRXlk22JLJiqlTua0k7thMheNBMpQsw0Logk67IzVeo3bzs2Wq3h
 g9KQcUmc+urPXVP1dRlozkwnFmHAT8I6xewc2281/GNGbz0F6ymvgdjndBfA7uymAaHtUUqzmy4
 7DSBpf7lmr8KV92ffhsbxkUXnxhI0qoaTUTXNmN7Z+4BvsZr0j9Mcv273hVooseStu2I1vhQFwj
 bg+YNaE+YVziVVa6Gg0pd2On8vUNIQ==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=6932e0e4 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=u2jAAMxGmqqbKrY86BEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZeaUm8ft7PYqmLoM4K0n4FcQEgNctKYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511290008
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series add support for internal only per-CPU instructions,
inlines the bpf_get_smp_processor_id() and bpf_get_current_task()
helper calls for powerpc BPF JIT.

Changes since v2:
* Collected Reviewed-by tag.
* Inlined bpf_get_current_task/btf().
* Fixed addressing of src_reg and BPF_REG_0. (Christophe) 
* Fixed condition for non smp case as suggested by Christophe.

v2: https://lore.kernel.org/all/cover.1762422548.git.skb99@linux.ibm.com/

Changes since v1:
* Addressed Christophe's comments.
* Inlined bpf_get_current_task() as well.

v1: https://lore.kernel.org/all/20250311160955.825647-1-skb99@linux.ibm.com/ 
Saket Kumar Bhaskar (2):
  powerpc64/bpf: Support internal-only MOV instruction to resolve
    per-CPU addrs
  powerpc64/bpf: Inline bpf_get_smp_processor_id() and
    bpf_get_current_task/_btf()

 arch/powerpc/net/bpf_jit_comp.c   | 17 +++++++++++++++++
 arch/powerpc/net/bpf_jit_comp64.c | 20 ++++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.51.0


