Return-Path: <linuxppc-dev+bounces-14711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 384C1CB21DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Dec 2025 07:52:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dR5xn4gjCz2yFW;
	Wed, 10 Dec 2025 17:52:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765349549;
	cv=none; b=ibYEF7zPyu3ph2F+deonMWYwocs+EfCKneudLwlBqwH73vJe7WpkCPZFZyXJGYa72cMg0AtQ1nUxoYOgDn0/iosjjjZXJlGgacMEbldFyciKpSeTgiEg92+3ZGx96/l0/RnI1YktylGPcV8yS357d5fkrrzx/irxFnb7oCWvrp8ZjjYKc3Hr0YwTsFHhpY7tnvLRBZUvWARAOcatGYIqNZgxQjrywxKqAWKG2byvjHK40/18UHJZit9B2ERVrmDvrCtg5qAq1FUCAbWLwAwILWVxYJw8jIKqTjp+w1MGZZYUH19SGntAi1MI2ZqUCxSocW+/u9/V4OUNk/is/66iWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765349549; c=relaxed/relaxed;
	bh=S+ItbLvvPfQQUbnRlJuvKz/ZBJgs5LRyq+OLdmyi2/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BEHS/ymYN5CURstcTvmXQUgJctmHSTvB3rG97xv8Gr8997vEdLfiTMX3CHL94oZHhkiEYKK9hOJTmsuy0t4MPFmZcFttQiBL0pIQscNH6Dt0nKdYBkY9mvd6+jo/aNClbyGsGThrfJm3w4NV+86L2faUenAHLyOUIrmL0xBu2l0epboR5PLKyWKl8xwc9VyDA6uPUwQ885Jw/X+c9pgGLbTmQMQ0/fRI1vAHUdcmJi4if4NVDal0hW46zKdrC7MHLF0BN9TdxaP18rEUYrZnex2yCOUaz7XcH/e2j6UtfIUXKldNGnVDRZWO8MMG/nwIetQxpvuVdlxRXQ50zy198Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WxZr+p1V; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WxZr+p1V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dR5xm3hs8z2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Dec 2025 17:52:28 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BA1pZgD012377;
	Wed, 10 Dec 2025 06:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=S+ItbLvvPfQQUbnRlJuvKz/ZBJgs
	5LRyq+OLdmyi2/4=; b=WxZr+p1Vys0ZwrPwADkL/6yy6FfAC0IL0/3nIwzxoZ29
	Jyti5pEq2Ki3YncZmYvOLNYyP4cJf2bdJEDWS5rvVls43xpxotxUCh98AbZdXHsp
	xwudypDXBQQ4sj4j6Tu7fQiVQtvTlH318jcclbG8y63ZMoqpr3HsRG6v3b7ipAC4
	8z3hkZGHpBMGxCwkEMMTwqaiiTNqtrf8Aow8NTEuQ5FLcqZmSuH0wQbiwcY+/Pr6
	b5r/Rul/t0UtnMm6RgYpbtRA7maR6FZSLa4ZFxLYo0FBgDJZ1m0ARdRBbloo+xyW
	qPfUvaOA0oiBnaBW4eL/RhGj+IoN4OqgUdelSGkTdg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc7c0yjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 06:50:44 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BA6dgMQ023884;
	Wed, 10 Dec 2025 06:50:43 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc7c0yjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 06:50:43 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BA4NAXU030242;
	Wed, 10 Dec 2025 06:50:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4avxts7d3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 06:50:42 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BA6ocni60096910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Dec 2025 06:50:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47E7220040;
	Wed, 10 Dec 2025 06:50:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B54820043;
	Wed, 10 Dec 2025 06:50:34 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.106.237])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Dec 2025 06:50:33 +0000 (GMT)
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
Subject: [PATCH bpf-next v4 0/2] powerpc64/bpf: Inline helper in powerpc JIT
Date: Wed, 10 Dec 2025 12:20:31 +0530
Message-ID: <cover.1765343385.git.skb99@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 1qCyGFVynq_hUNIekmwnV8hHajS1GjNv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX22EB5WBWAtxZ
 tjBDn/VvZjwbAUSUkYOmQ0lX/1R3MccciM4ebvb+9BxCXxRcN18c2iNfIhE5+kzP7FfBsTkrok4
 35jsNWBHHqxo4DJaz2OBq6bozEsfof7idjP+mvuBuW2EU6cGE4VZfMmhoWTAxoJbRo9x7Hqps91
 VfQgQxwGoS8ufwJIP49J5ewhf4chWKlXC++AOEcIsGU2C43HtuvZg23anLYPNg3LDqw9KbsYEoW
 w0uwpxXf4gJXqzUG7kEkrDyTBjazFO7v2QPHaX/vbJyIGp7a7MbogX7LUo3BZcfGHBY6qKxVPE/
 JWhtyf0ML+Xf9IPNAf24Xo2jnqvVeXqmHoxL0e9A+b8xYyDg7t1PZmW8ST/7G2KlQKZ+Zbnvvq0
 PIAG5vwI59t8Cd28+WVdssk2l1wiew==
X-Proofpoint-GUID: W0YHzG-o49s83kLEeCFGcftgfZVU0pyG
X-Authority-Analysis: v=2.4 cv=FpwIPmrq c=1 sm=1 tr=0 ts=69391844 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=xaTGKGj_L-QPSGpYTFkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series add support for internal only per-CPU instructions,
inlines the bpf_get_smp_processor_id() and bpf_get_current_task()
helper calls for powerpc BPF JIT.

Changes since v3:
* Added break after computing per cpu address so that the computed 
  address is not overwritten by src_reg as suggested by AI bot.

v3: https://lore.kernel.org/all/cover.1764930425.git.skb99@linux.ibm.com/

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
 arch/powerpc/net/bpf_jit_comp64.c | 21 +++++++++++++++++++++
 2 files changed, 38 insertions(+)

-- 
2.51.0


