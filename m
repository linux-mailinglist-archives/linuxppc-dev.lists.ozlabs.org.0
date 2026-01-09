Return-Path: <linuxppc-dev+bounces-15447-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A407D0772D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 07:49:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnXSg60Dfz2yHD;
	Fri, 09 Jan 2026 17:49:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767941379;
	cv=none; b=FDYe7QOFvc2Y4ZFkN/kZA/rEhgdaC3Urn6VicNW2+i8zdn7/MI5bkUh8EdmOXTzbhthyxAh6Q9tM1iZDY+4oY8WYVH3cp3xo+3hABqw7JQiYbtBmb2tuIidXmHo7R3lLg+vDGqTN5YX3OKSFtFzVLDlnrdi8/vzTyJ7q0iAVJgOedXaiHdifLG83r326m176q38k0A+Rgug37jwtblPKlE0eFeVoJ78rY7vMcyR4EdTOlp8Qakz4RbV/SsBZNQVpPsmV5vOkHn6SH+2k90+tU1bGa3rM5nMhcV3mEQq5/Uw8x5wX8Vz6Lo9kdhlh7LVMol9xVomu+Pfn5gVy0PN1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767941379; c=relaxed/relaxed;
	bh=14BcCnfO7sAFQzuZgPbfjhmejvUA8Ml6rax6uF9u4m4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JphwIWefanv3ZV5DXSMBCm1xcAL5zjiJFAhDp8B8M92cSiNfyaVdCN+LWy8w01JviOfyTloJgGEBIBgrSNoX3Ue9aV/xMZsWLzOE76peJf16oNEZvh/JylGI7tvnjD0WhrBHEFz4kpwqaQEyRhm6c7xwfXh8x8QHgkGXAe6SWEoLJ6p6nvIxloKe709B5y9O0bPWWvoGUgNn7TS7mt/r6cseZA0s9Y6axWdGXqTwLiUWLl8Z33AGtXHeMZDeMFLXYm2z7OskzMOPMaBmDjf4vtTuPJ9tIl2lVLatX3DOvXiPpdGAU+xD1tlRcOTnnl3fHZ6RytRui76zGl3LAYNrVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dMcC403o; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dMcC403o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnXSg06Bdz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 17:49:38 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6090j4kf010621;
	Fri, 9 Jan 2026 06:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=14BcCnfO7sAFQzuZgPbfjhmejvUA8Ml6rax6uF9u4
	m4=; b=dMcC403ooVo7F0rYX+VZwwMeHGsvEVcggqiV1e1JMNJI3YF9HNmtI0LsT
	GifDVorV33+5YktCPBW+pEEKcAdomd6t71gfej4Ctfw+0LgY8WqH8/fbtteedk80
	sVD3r4A8Mi9qCLuXnghb5Stj8Be4KaMfKNq0iZ1taQSxpyQxfNnbJJDwyyqcExDA
	fxM8viJl4X5rvvPKQQXA3Z1bit+pGLnYlq4D5HiU3nWPuLdFGkMp9hn5S/X8HCaz
	SQbpAVk0yfGNmjfqPjy61uNNIernRz//KShYEtDHRmYr5gcLKA54LHFS4prBwS5N
	gn5tsxwNufz26Uj73F3Xj2J14ToMQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4beshf8guu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 06:49:26 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6093mADu019177;
	Fri, 9 Jan 2026 06:49:25 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bfg51k359-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 06:49:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6096nLdO52035958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jan 2026 06:49:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C403420043;
	Fri,  9 Jan 2026 06:49:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D46B920040;
	Fri,  9 Jan 2026 06:49:19 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.17.37])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Jan 2026 06:49:19 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org,
        mhiramat@kernel.org
Cc: sshegde@linux.ibm.com, chleroy@kernel.org, riteshh@linux.ibm.com,
        linux-kernel@vger.kernel.org, hbathini@linux.ibm.com
Subject: [PATCH 0/1] powerpc: Fix kuap warnings
Date: Fri,  9 Jan 2026 12:19:16 +0530
Message-ID: <20260109064917.777587-1-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA0MiBTYWx0ZWRfXzuQxuhDDO5PA
 z28aAM/MDqcxPTCV34DRw1bj3pGXcff4UthkypslHavZNE94eObUulertBYgEa1kJlJChALaQT+
 J8RsnbFtL97Q75nVZAbL47q/e5b/sben85MRhSjdkFWNQoKhX1t2UvCL2vWSdq5FUPtPxUVaG21
 WWAgsyZ3BrHjme18WMa+SCqclkP44vL7iDAFcfzFTtxG00FuHb1v+EnM54QGCmAdgGMouBriHBl
 4u5EO9QP2a+8Ap2Fvqt5zVUCVW+qpYQEmLKDI27QKF2+JlWbU4q9qvo/ioUu/ol4ISD/TU8Iipz
 BdBPf/1+nuJBiaFCuq5IjJaO8nnYzUg73f5cLtrzAw9a2lCt06YtmZEjhSRVF3VCmKTiYS9rITB
 fir3I4Z5txkZ+XhzwHre3G5vtL4mn4XGPOiNe23BFBdEwxzi4Y5jSa6r0XNnYUpXZnf5hseu2G/
 hv2x/pqLfW/WSsbklLQ==
X-Proofpoint-GUID: DFUX0v5V_-JluZu-0HxgScJT_cTnz0_M
X-Proofpoint-ORIG-GUID: DFUX0v5V_-JluZu-0HxgScJT_cTnz0_M
X-Authority-Analysis: v=2.4 cv=AOkvhdoa c=1 sm=1 tr=0 ts=6960a4f6 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ihlndRiG9AZkRag6FYgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601090042
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Recently stumbled upon these kuap warnings. This happens with
preempt=full/lazy kernel with function tracing enabled. What irked
me was kernel compilation was getting failed when i had tracing 
enabled. It doesn't fail everytime. While running stress-ng memory class
it threw same warnings. So that helped to narrow it down.
 
So one possible way is to disable tracing for these enter/exit
vmx_usercopy. That seems to fix the bug/warnings. But that will make
them as non trace-able. If there is a better way to fix these warning while
keeping them as trace-able, please let me know. 

Anyone with insights on amr, vmx and tracing, please advise.

Shrikanth Hegde (1):
  powerpc: Fix kuap warnings on lazy/full preemption with tracing

 arch/powerpc/kernel/process.c | 10 +++++-----
 arch/powerpc/lib/vmx-helper.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.47.3


