Return-Path: <linuxppc-dev+bounces-6657-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3168CA4D2DF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 06:13:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6P2x0K21z3024;
	Tue,  4 Mar 2025 16:13:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741065192;
	cv=none; b=CTWSvFH3Bbo5suUvjDC77hIcn9nuzwFYnhFQyclojaPFqm+VofKD6g+ZnHeic/tKwHUInlgRSb5qbRkeXPqu6viaXGSFvMh81Sy75j/IFBLNBlPi/OhJvKM6mBs4gzBDmw8464gcFriv5MldOIIRcEnZftXBq3LA5hA6cAIbNvNCRDTktd99Gbnmf517Ze2VuIo/cex3j0USq/jxgiLQbUp/b0aFD+KUq4bfNFVbb2avYKeq5zUrFPSsdhZNLj/i2tTkUF/9t1RzGUbFxKlOQUK98CeBatczJaaig/SZPC+X+0ISrJBkbRTeh9gxaev0pYBkBM7RI6FbjExJ3YK0tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741065192; c=relaxed/relaxed;
	bh=9Mmxx9BzLSCgjqzCorficye9fmMyUXlLEOjHsrOeSiY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=OZkn5tQoMZqTMJiMKEKfvG63YaIbyQATNTSGRv0h1HWtQR2GXgBB5E+r9OyK0IogygOGeYmVPWbjL4khVFyHwf3VuvnOY9YvmTmtNzm1VeYXiNxUCYdsooBYv3XXXpBmuN+L7o346P97OSSXsOyOlM2JKSc52Tq+WzcQJgySRaXGrCsYIDDLODbiX0SMUxB8dwj2IiO4SQvTsc9agNZOPZyL/Yo70KdRUIyAUyeXlwL2E0/GCZzx7COmJrO0T9y/XNy/jgKBDFzJ/7tYLhnXiyzyZQAaDcy3qjTjeQ3cJn1mXZUaKgekL+bwz0rgkS6jUA1CPu82PH6pPw1sSVbpCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g16eaa5V; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g16eaa5V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6P2v5tlHz2yy9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 16:13:11 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523KdBpv018728;
	Tue, 4 Mar 2025 05:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=9Mmxx9BzLSCgjqzCorficye9fmMy
	UXlLEOjHsrOeSiY=; b=g16eaa5VXsPfyR8a9N/tpQBxemJzGX5TOyAex9daLsWp
	XMzFXvXWgxmnJydzG4z1mTr6uWYaiqqcv4h2Q3Gs+rY9iV848qEC5aQHzG9E6DnS
	J+LkGXybHX+3sipx3GeZqjdeKYwAEL/AzH2vw4PLB3S8kbAEbox+nTFoSTcAVDcK
	eexxw09zI+EW6Lt8CcKNspLGy45VS486tyg1+Drc13PE6owjkfqq2RP0QtRipgXi
	g1TU6HVbLePrEWCYeojQZN1m6FavDOyHpsZ9kskK5gGSrZXBzEq0vsEA9BgJULYC
	VSMKqwiNn021PbMGtP8dNQuAwuuQGN/oyGHZMK9EjQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 455kmyht38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 05:12:58 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52458YFS020800;
	Tue, 4 Mar 2025 05:12:57 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 454esjudtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 05:12:57 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5245CvqG43385172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Mar 2025 05:12:57 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 082615805E;
	Tue,  4 Mar 2025 05:12:57 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F04D58052;
	Tue,  4 Mar 2025 05:12:55 +0000 (GMT)
Received: from [9.204.204.161] (unknown [9.204.204.161])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Mar 2025 05:12:55 +0000 (GMT)
Message-ID: <8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com>
Date: Tue, 4 Mar 2025 10:42:53 +0530
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
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>, maddy@linux.ibm.com
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Build Warnings at arch/powerpc/
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _zp1hdzXtHLw7rMRdaRt4D898Jo2Zhi-
X-Proofpoint-GUID: _zp1hdzXtHLw7rMRdaRt4D898Jo2Zhi-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_02,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=746
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040039
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Greetings!!


Observing build warnings with linux-next and powerpc repo's. Issue is 
currently not seen on mainline yet.

PPC Repo: 
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge 
branch

PPC Kernel Version: 6.14.0-rc4-g1304f486dbf1
next Repo: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
master branch

next Kernel Version: 6.14.0-rc5-next-20250303


On linux-next kernel issue got introduced b/w next-20250227 and 
next-20250303


Build Warnings:

arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xe84: 
intra_function_call not a direct call
arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: 
unannotated intra-function call
arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: 
intra_function_call not a direct call


If you fix this issue, please add below tag.


Reported-By: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>


Regards,

Venkat.


