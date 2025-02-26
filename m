Return-Path: <linuxppc-dev+bounces-6486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D7CA454AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 05:47:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2hlg5PyHz3blK;
	Wed, 26 Feb 2025 15:47:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740545231;
	cv=none; b=T7Xs8XiALoHiS4Vkt2RcpGORc+IBQdoEgrVGlGPDV+sPflT/7TMfHAiTu5DrJ4pJSrDbTWSrjJUJBUv4CE0OhYF4fpTwYpOit3ur7j9m0hkEa4/u6XDBSvvngddHDpmGSfZsPYUqu8cCZJvXV+bQhPyA0hg7Hyt/k7Oqja6asfWIZeJOjfHyQiHLRiBBYB/t/utzVuL5O/3qQOIai6i8ZuFfZljDBqTQhdmQmH8RubJXK74+KrwwqR6JQR0mIai6G63iWsxXx5SnrnlkEdndEWHS6uF/OLJ7ob7AX1+fvNUQxfXYiY5k3Squwod5VCO6o4qqm5b28cczqnDcdNjk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740545231; c=relaxed/relaxed;
	bh=wPFcge7BmJqcQZTf9xO13j7qyDoL2Cb3Ljh6aPOkv6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dNPhbiA/+vjvnODK4VstzfKRgzQSreVN+C1AO78vJ2EWymSoze4Xw/4CkqN8yGnuPzfKTa71iagYkzdjZkPhaHARgUFuUv/TbftMYqb6anAgXsoR7AvcbMFzf0/pUD78i32XyRYogswBLiVwQbiB/rwjWN+CuHgZtT3ZSuNafOnXxTQmc0S3fcAkslPgbIQpAoO6gN8MUWbRe71sQUEicCk6jUrWKhkd3MyJ7Su3ebRwFhov2OHOgjV5nzVYWzZ0c9r33l7+4XqJ+1dt4C2jY84ZkozIZIy59qt/OLfYg8FG8HLQHT7IwMMsipWrTMkOUUeEAgqWRQUQNf1ZlTxwwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FYNkmJoJ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FYNkmJoJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2hlg0C35z3bkg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 15:47:10 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q1kxD8012268;
	Wed, 26 Feb 2025 04:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wPFcge
	7BmJqcQZTf9xO13j7qyDoL2Cb3Ljh6aPOkv6k=; b=FYNkmJoJZ07RavuUcrx04k
	wfrcKelogoipabBbQrUtja5M2Zk0hfSn2eDRgQQ2QnIYBEQnT7/QcsPTGB9+kO6o
	jKcZBPYKl7Wu9sA9+r55HcV/Mebab/Re7oti55f8qdFrW9D2RCsy651pwHKjwcGj
	ahMqLr28ip8Q31phAhfy+9bK6QIX6l3b2bIMtHNDlFGJdvd7AbqrgaP83TEqkWcJ
	fz/n36oM3Xw493gilwaMFC4ZXXteoFkIhFmpXBRScoifva3tGEoHW3nDFuT3R+fX
	S9xpfFJVkNMRiqBBRbeEh47Wrpr37KtYNN9eDVoANO0hpxOHfc2YbZRY41UHzzdA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451s198qsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:47:00 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51Q4iWAq000711;
	Wed, 26 Feb 2025 04:47:00 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451s198qsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:47:00 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q2LQwp027372;
	Wed, 26 Feb 2025 04:46:59 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44yum20d0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:59 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51Q4kvEO30605778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 04:46:57 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5EAFE2004D;
	Wed, 26 Feb 2025 04:46:57 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B80820040;
	Wed, 26 Feb 2025 04:46:53 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.65.188])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Feb 2025 04:46:53 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, Gautam Menghani <gautam@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch/powerpc: Remove unused function icp_native_cause_ipi_rm()
Date: Wed, 26 Feb 2025 10:16:51 +0530
Message-ID: <174054508253.1386382.13670617186309588402.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250101134251.436679-1-gautam@linux.ibm.com>
References: <20250101134251.436679-1-gautam@linux.ibm.com>
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
X-Proofpoint-GUID: A992Do0naUMn0S2L8IEPJbmpPsvQZMDx
X-Proofpoint-ORIG-GUID: MxAFWEvv6GWAgqCCVLu1uT0w6hF9NLJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=479 mlxscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260033
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 01 Jan 2025 19:12:49 +0530, Gautam Menghani wrote:
> Remove icp_native_cause_ipi_rm() as it has no callers since
> commit 53af3ba2e819("KVM: PPC: Book3S HV: Allow guest exit path to have
> MMU on")
> 
> 

Applied to powerpc/next.

[1/1] arch/powerpc: Remove unused function icp_native_cause_ipi_rm()
      https://git.kernel.org/powerpc/c/65acbd1285f7fe8c8b82cb90e4db923db5b9fe03

Thanks

