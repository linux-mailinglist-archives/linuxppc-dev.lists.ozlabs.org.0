Return-Path: <linuxppc-dev+bounces-14403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE80FC77481
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 05:44:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCN0T6ZKqz30VZ;
	Fri, 21 Nov 2025 15:44:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763700249;
	cv=none; b=KpFpgt5t4i3qNAioPsx1ppz6lZXc8AjVrCtuXVLYFqY+O/QjJYo/28d3iRMC8EghsqpvMHkccAEIQNmFwn5Tnlo1YMtifISib4YWp0v8iEnd3tFoZr7QQOp2JmkrFKbwVn2PDfEVhLndJRurd+t+fVMyq5Xi+U9VqazYIHxekWNQu7Ahk89xEBg5zGEImw0E7j9a5MnX1eVOWFtBkbpTa85uxGzoFsgUwRghvG5ZCZtV1EbLu93TLWkAa6fvJtjmd4Cu4p965tFXPUseipQKUQ6nJan5SK8rtLNJIqtbRFO7DmASERw4dGnoB9ki+XXNru+1DJV+hY2sSpMmPKN+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763700249; c=relaxed/relaxed;
	bh=fm0DB17Jut9djr4vYmcigm/NwxL0ucQfZJPf/uSD7DY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bBKtT8vnu7RfYKjYNUkunUpfcj3tjO2bXZcYonWm3s5DihsMrVHx994WLqaMJ5eWfkE4U4P+vzk9tDYykrOa4VIkEi9twXcyUDoxQeBeBqBm5MyXm8hyuBdp2i2kGfe4eDVO0BCZVFJ3iQgorU1/TsrPXs2OL5Xg9ZVSOPQduYw9otm7p219v1OSQhSNW77LcTRdkhHue8QrhgsCwEpivuopHCOdfCvvyTD8fxS3pkbkAi3/Locv07SU0b4my7YKTM1uc+1e/72rbvgLrHUR76kwKHc/kIUbO+ArEd8lR03S5y7FZgVe77t1lsIFUqIVy1jViyfO56kfWucE/L/iJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cQvY9GxU; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cQvY9GxU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCN0T0TxMz30VQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 15:44:08 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKNbkEx012620;
	Fri, 21 Nov 2025 04:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fm0DB1
	7Jut9djr4vYmcigm/NwxL0ucQfZJPf/uSD7DY=; b=cQvY9GxUdJxKH7lHEKqhCY
	X0pIJd2+F6IyzZC3Y/feIXte4JbqbJB3gYmGyTLEFv1b7HAJWMwhQEQd61OuESIt
	02BUkzUwwE5EfGAlbg/UuB+IzuLYto/K0D2ZK9M0jk//xTsJ62BqRA3EC9b+5OaK
	uA2lGCB9F6lz6PA79nFmR12Y2Mv6PLM95wc031ysZgQbzx5bnwg6bgMap58ngp2O
	DCusN/zciDLQDPQmQoaUnaIVgF1wlECfthxv+EVJs9CjvoMdTmFDQtN6L7Z8VAAE
	YSbsauNP78pJuReOYDwj+QD7kO3xpJBwmQxLwOi5Qs2CPf5qMgb/IWfZosbq/ZXg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgx8jf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 04:43:57 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL4ZsOH007689;
	Fri, 21 Nov 2025 04:43:57 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgx8jey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 04:43:57 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL1J0K8017335;
	Fri, 21 Nov 2025 04:43:56 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af6j222vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 04:43:56 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL4hsaA34930950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 04:43:54 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EECD20177;
	Fri, 21 Nov 2025 02:54:16 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29D0B2016F;
	Fri, 21 Nov 2025 02:54:15 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:53:56 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/32: Fix unpaired stwcx. on interrupt exit
Date: Fri, 21 Nov 2025 08:23:11 +0530
Message-ID: <176369324782.72695.6792022172636807941.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <6040b5dbcf5cdaa1cd919fcf0790f12974ea6e5a.1757666244.git.christophe.leroy@csgroup.eu>
References: <6040b5dbcf5cdaa1cd919fcf0790f12974ea6e5a.1757666244.git.christophe.leroy@csgroup.eu>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6Bq6XP1gsCSRlvfNwxQT4BCxyZod8Qvh
X-Authority-Analysis: v=2.4 cv=YqwChoYX c=1 sm=1 tr=0 ts=691fee0d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=iv14AmuG69q8u87zfAgA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: ilCvk1jT_FUOBlg0uE3jpUe7MPnfjWC8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX8pBLmdaQ/htj
 tAJc2IkZWHoGBuX9AMNALv5/R0Taj7HXqFyIwhauh2IiLXWWTg8M5xsatCLtA0SjimyymXFFFp/
 rtZLI/C6mXGYXob3MLpMnwG4EVmqIs7GU4BnjnYB+I17TpU/63n649HgmUtyGiOuvYKz4q9L5Aq
 o+BpzXnv5lgZIe0yCIA9/m/hKKTZbpImdVol+jsysQptJ3msOtsJZ9lUQhljl2AP/zncp1Wvc/n
 UbbyH4RNJz8SESyJJcnPxy/XGyvmfBC+2Oq3VkmFl8WM1L16tplukBOlYtFbKPDSdB5t0XSRCdw
 tZgcP2dTWj2OXGgmKmXPU8OGBClzTd8tkNemOy/YSwa/FNEMqEgVnLooVh2XrJG8uleH7/hnBl8
 gGushSY7wYTRtzNx2ANz+NEgiMlENA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 12 Sep 2025 10:37:34 +0200, Christophe Leroy wrote:
> Commit b96bae3ae2cb ("powerpc/32: Replace ASM exception exit by C
> exception exit from ppc64") erroneouly copied to powerpc/32 the logic
> from powerpc/64 based on feature CPU_FTR_STCX_CHECKS_ADDRESS which is
> always 0 on powerpc/32.
> 
> Re-instate the logic implemented by commit b64f87c16f3c ("[POWERPC]
> Avoid unpaired stwcx. on some processors") which is based on
> CPU_FTR_NEED_PAIRED_STWCX feature.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32: Fix unpaired stwcx. on interrupt exit
      https://git.kernel.org/powerpc/c/10e1c77c3636d815db802ceef588522c2d2d947c

Thanks

