Return-Path: <linuxppc-dev+bounces-5151-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20946A0B762
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 13:47:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWsTy2kpkz3c85;
	Mon, 13 Jan 2025 23:47:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736772438;
	cv=none; b=Jr2DyVDX0gk1QUtom7uVHfaVN0JjIjFOzETm7qbvnmEkbzoTr1hVyaiGVBjQvX911ARCVfUTWezeeow09yOQHAHdagEc/yR+Q3jn29yJrUL71sIEXTKr+wp97MUX/sK4h84oPIzrHRdtuFvxLJ0ufHpXfk71e467ZxX2ESX+UtXsa+JbxnS/DENcW8/2JfUBOQ1zoHDXyusypZukgIcu3Jv8FDFuKxko4U7N6FRgsv1GNuuIaZpokl2hDlzE39y0rFnULUqadNokuBvwQdfWbwiPt3ajUt53niB0c3K3RWY7j6qVEX7i89X3YBHHMG3CbqsMR/1zxEqtAtOuVjx1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736772438; c=relaxed/relaxed;
	bh=lhit7wqBm//ON2HZjCuRyqnPskgRuHmdI5K0p/afqcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n9EXcHy21mAAf8pqUxBF8RJfTd6SpEJwQUyHopgORMXD9z1iszJeP+FEmUUa+t4d0O2JCxj1cz7ZWDRwTungU+d2Hif+0PPCobKTvT+27wl7BM233JpOfVUrdvoBcUidjKgD9sHU1UNdGU7LFwqK56U5sfIyU1wBUBzRT9N+yv7VWTLVUhl+9hdMcdrH7WYKyoIYxSdwprnn3tTMsv7qPTE6/kxhfQySS/TE8JnNU3ZicN+q81F/4wPvOpiYJbxprhlzJCVch4Jp2l1/QLjPQyDW5vySA4F0erXXURmxDkf3FrV8xuin3wL4fraLibtHTfuqgJRJ3DwLLxzyvpPxYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DbWMsamp; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DbWMsamp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWsTw6lcHz3cWB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 23:47:16 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CNDGCc001059;
	Mon, 13 Jan 2025 12:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lhit7w
	qBm//ON2HZjCuRyqnPskgRuHmdI5K0p/afqcw=; b=DbWMsampGz6nrLzt6+e8cQ
	76qr9YQAd4s5ihXkYvlCb0t/le8J94+Qizzzmm8ulVNBwrUsUmQQguGnTd692m3w
	L1cA91aIP3w0Kdh0hGzmj/z8lw7czHtdoYMZ5YHn5FnultMS+oQEq9+ilymb70/Q
	IVfG9mwt/Ld93Txar8wiIPPc6XggUy4t1mP7QKBZHKk1ltPVw3de0XxZ7Bj9pbmb
	q63HdnSOAD6gXWVA3c5mdfMyqMHaseGeLkvTQ72eGpbTOBpdGOhgnHUaEJEBEDu0
	LJFW8QyP0KHZ8wdnBMpciY7rCVmhIcU7DceZHBuYC4TfT5CJ5Ojkx71RQFdYlmvA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444f74kqk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:47:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50DBxi2E004540;
	Mon, 13 Jan 2025 12:47:07 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4442ysec0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:47:07 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DCl6Q665732890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 12:47:06 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02CED20043;
	Mon, 13 Jan 2025 12:47:06 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D620520040;
	Mon, 13 Jan 2025 12:47:03 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.10.47])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 12:47:03 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: ye.xingchen@zte.com.cn
Subject: Re: [PATCH] selftests/powerpc: Fix argument order to timer_sub()
Date: Mon, 13 Jan 2025 18:17:01 +0530
Message-ID: <173677229439.52314.17452944744013014521.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218114347.428108-1-mpe@ellerman.id.au>
References: <20241218114347.428108-1-mpe@ellerman.id.au>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pZxjrA-uIsQCy9SSJMjpQplwP_1qCWsj
X-Proofpoint-ORIG-GUID: pZxjrA-uIsQCy9SSJMjpQplwP_1qCWsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=885 bulkscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501130105
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 18 Dec 2024 22:43:47 +1100, Michael Ellerman wrote:
> Commit c814bf958926 ("powerpc/selftests: Use timersub() for
> gettimeofday()"), got the order of arguments to timersub() wrong,
> leading to a negative time delta being reported, eg:
> 
>   test: gettimeofday
>   tags: git_version:v6.12-rc5-409-gdddf291c3030
>   time = -3.297781
>   success: gettimeofday
> 
> [...]

Applied to powerpc/next.

[1/1] selftests/powerpc: Fix argument order to timer_sub()
      https://git.kernel.org/powerpc/c/2bf66e66d2e6feece6175ec09ec590a0a8563bdd

Thanks

