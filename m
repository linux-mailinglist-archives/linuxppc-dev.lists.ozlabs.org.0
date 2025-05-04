Return-Path: <linuxppc-dev+bounces-8274-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614E5AA83C1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 May 2025 05:22:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zqqht2WFBz2yqc;
	Sun,  4 May 2025 13:22:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746328942;
	cv=none; b=AlxPDnpl2yjmc0DcJuvTkz7LKbTe1PoUIyDsWVlVl1B70M7PaoSLq0TkQYaNH8opZfvEFIE2o6HjLHthHNTz2mullCo1E0BpLCFohDWxWl+qctCJk//APqgqaoueDnejU5bvf1HLRxT6tCQHq3NPKRu4EX+q/xQPH35GsfMSUd2zIG1lhVhX2dB9Hi0J6ysdO0bpyjY2TOwd97oaYkKUVPxkZlr2rpkq1NpAyNfFlqi4FkCy2Kp4oQZdKu4TfnqdGNfFtQeYJ9iiQ7+Xg3pNbCiF3CHlCxemfHbHDLbuMSbc9b7P8fg267uf71mi2AqU5UZ6GvpWl0npneS4e8pdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746328942; c=relaxed/relaxed;
	bh=2IJwWIcC2GXJ5qxdlZFd8bCuUrclbR4sO/f9KLtfXmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azy/rc0GjRlpSymfuGKllb0PR72sfCwqZT9rEDOacgaVIt3sOF84+OrFYu2wS2GnZD9egP6SAG5LBpuShF4tRDGzY6xTzsuM7G6bWcWYm4VwqGAdfsOhsYCd7pCtic0FSnkWHlv6yp/hA0IbNRrNZ5k9+r+h/UcDZkJiNZoFntolpTQQCyKEeLbHhoIxRjw77xtlIStROtrvCCIvoVkaSte/3SPqvtxOVumbALjuk3d29IIhmz/+HQJbBElb4yTMvZn9SmtC1l+/xFWAFWjnZmldxKAVvq2LCegSnLFEQsepizLA6XFhl9bLgvCvjhzpk0XlHbfG0WBJ0c83uuqfdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MVDliMjV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MVDliMjV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zqqhs3s8dz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 May 2025 13:22:21 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5442tbWj003043;
	Sun, 4 May 2025 03:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2IJwWI
	cC2GXJ5qxdlZFd8bCuUrclbR4sO/f9KLtfXmw=; b=MVDliMjVlcWkREdfyVr92w
	eOZfaQZ3uYd01YmfcTbsMAs+aaFUkxwE6JGOZCIQNhgecBqZAN9DyBPaoNWeZTTp
	s9/Js5zR4ET8Y2GtGKzaJl2QWoP3h79qEJC8XU1/NOxUqt4we4CHL5owV4enE/oP
	c2N19ytAKUwHOSMGfGkqxwNgi6UehvqHKnD+rZnYqWrJyZF2v6iBk1DgAoJd4GW7
	qdCDXV0woFrPvh4wSfZAHsOmb3nnJqzBu3V41NfjBqsZe3RltamWgfqdoLFoWTRY
	Qvon3tzUpMmI6/ooVZX8/WXE63glpYCX1gl7nvQ2PHbiI8z+J9YR6ap3vFF8eXNg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dw400dky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:22:05 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5443M4Bv017249;
	Sun, 4 May 2025 03:22:05 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dw400dkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:22:04 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5441rO2f032018;
	Sun, 4 May 2025 03:22:04 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxym880g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:22:04 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5443M2HB42402056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 03:22:02 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CBC520043;
	Sun,  4 May 2025 03:22:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F23C920040;
	Sun,  4 May 2025 03:21:57 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.78])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 03:21:57 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: do not build ppc_save_regs.o always
Date: Sun,  4 May 2025 08:51:55 +0530
Message-ID: <174632869189.233894.17327433330282160163.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417105305.397128-1-jirislaby@kernel.org>
References: <20250417105305.397128-1-jirislaby@kernel.org>
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
X-Authority-Analysis: v=2.4 cv=KefSsRYD c=1 sm=1 tr=0 ts=6816dd5d cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=Jr149zEfbG_pFFu6KToA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GjWhigNnAKvimmrFS6NGyOzkmK0i_KQd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyMyBTYWx0ZWRfX8aCT9ijyTpKN AO2Zcq7f50ZmjGf0WpoMPWc3jMhLDzeutdUjXO+G8k7T3oOEJNLMvnzmA+r6EK4ijsNxKQwVwgE AdPaWOCC5zqdXdcnsbKpj/Zo5MqScVUCweAaYPCFP8Pumve0LYiv4Jq+zsUuhhqWswK9A5UHPuS
 3deTIFHroPDG0dFnbCnYMHTUckMx2H8wRbzaSyKiw9p6DzqrVKrC9lRL6erMeCtkD96eByfZTX3 esL/3Z2CgFfmLBmodjg6/tZs1/A/IFeoYLulCKwJYSQpyDU5D5IGlucAKRv7ah1JRJNiJSqa+7t mYk2NSOGliqthkciUKfD8MJGMGKNG+ZkVAst+T/XdamYCiynfQ0+iqjTsbuIXmb5iwfYGpApb+q
 0ydxaG8REq6EsYlzekQ/mI/RzYajXcyN1kalvUMDFbe/pB+4x9qfA/GR/zknoyoHwSM9QB4i
X-Proofpoint-GUID: hssWibf1N6YpkbyXrTvKaLw4tElQwzld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=474
 adultscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 17 Apr 2025 12:53:05 +0200, Jiri Slaby (SUSE) wrote:
> The Fixes commit below tried to add CONFIG_PPC_BOOK3S to one of the
> conditions to enable the build of ppc_save_regs.o. But it failed to do
> so, in fact. The commit omitted to add a dollar sign.
> 
> Therefore, ppc_save_regs.o is built always these days (as
> "(CONFIG_PPC_BOOK3S)" is never an empty string).
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: do not build ppc_save_regs.o always
      https://git.kernel.org/powerpc/c/497b7794aef03d525a5be05ae78dd7137c6861a5

Thanks

