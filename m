Return-Path: <linuxppc-dev+bounces-8556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A8CAB6167
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 06:04:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy08W3t2wz2yrf;
	Wed, 14 May 2025 14:04:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747195451;
	cv=none; b=kdWhHg1wU+5eFBkt7oCRnTLu77mAqvLzaD1yE4WjiLwdAcQ+h+ZqCs907BWAMG4FRl+o8bvcHyLyIM0NQEJcuOZZ0fD4r7rF+1NnuZQdg7wRd01ORm5LAOkAreB8gBUbGl76IT82Xq1tPe/+XJiOkVbkeNdCnWwdxrigtBCH9NinjsQ5B2NytMWxGZDOGhUGmYQvkWVimGRTzmshvWFmdMpMsA6WkAtwR9e5c7JyUCKL0tYTjsg8EPU6iWJ0Km0XGHVSIk1DR8yB0A8goJiq+TCQ3yhAdDPBdZVXhAUKyhtkCN+q4caphE++LnB6Z9Vv0H0CVf4Cuhk3Duz3TzPoeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747195451; c=relaxed/relaxed;
	bh=Ad7aBptmgZxCHDuEJOpWxolJQLRC9j++XV27KJH6caI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ibNU9YR60fIq3jcVGQ8uDbZ2eEBhSzAJHc5a5yvSFsknuLr45EM0dNiyqvmyPcfVx5G3EC/0RWsdaXivIRIIjNwYm4ECx0XMNCgAnlpMfkrTvsQ4xOQnJhez+7wi14WcoXtexp4T98dW+9cB7jwmFDTGgWJMG92OOzpBhw80Z6m4IAm5Bl/5BimDxHoQfPPQCgaj/EYoeaC6yJXuA3KyP/fxlj1x0oa17AXIG12n7DYevQr3Nn79oStbvCpuquvAMvx+v0Pm/4GlJHTgV4f1KnBWB9x6Em9E57XSjxVV0Z3oLrvTWfzNrN392EF7KAMfPBgsqcrstdf6JWpiZucK2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bHyCUhco; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bHyCUhco;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy08V5fSXz2ydj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 14:04:10 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIoGg6016967;
	Wed, 14 May 2025 04:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ad7aBp
	tmgZxCHDuEJOpWxolJQLRC9j++XV27KJH6caI=; b=bHyCUhcosr7QUoxIiFzeLi
	rAcyb5AwRReXyW5FIQG21mdjjXN2bGiQa3oVJB8FhhVo2fd3hGDT0GAtKrMUdsw6
	CiLcqjQTtY129oDvw4WdEniY1DJfXNnHG/1TyVLcx8TDLnDfu2nlj+8ClfhJH4XY
	L8x/SZ//YbsveJOauHJY5/6A+WVgHdke4jldTncE6n4J8bLa8ncvA3ftEzlSJSHq
	dAGLgPgOkhk4itspoPeFE/LQmytrmftUB7ToK3CDp/92SvOhM1xGcZFnVgjpJlob
	IUjaU1rqPreB8m/tJZUayR8/DybWMtC612gInz5L7slKX7A0Iufxg5aScO5oUyoQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbq8j12s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:03:52 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54E43q2l010667;
	Wed, 14 May 2025 04:03:52 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbq8j12h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:03:52 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54E22HPQ021822;
	Wed, 14 May 2025 04:03:51 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfpj727-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:03:50 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54E43mQP23396674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 04:03:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D197A201F5;
	Wed, 14 May 2025 04:03:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DB5D201ED;
	Wed, 14 May 2025 04:03:46 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 May 2025 04:03:46 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Michal Suchanek <msuchanek@suse.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
        "Nysal Jan K.A." <nysal@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/boot: Fix build with gcc 15
Date: Wed, 14 May 2025 09:33:44 +0530
Message-ID: <174719490578.1067444.3484989459995732535.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331105722.19709-1-msuchanek@suse.de>
References: <875xjsjj6b.fsf@mpe.ellerman.id.au> <20250331105722.19709-1-msuchanek@suse.de>
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
X-Proofpoint-ORIG-GUID: hxncHW4O_taoIVdqCINcMn9VC_5Yp0jh
X-Authority-Analysis: v=2.4 cv=GrRC+l1C c=1 sm=1 tr=0 ts=68241628 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=lsjnmln3yub5hIkKMwcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAyOSBTYWx0ZWRfXzyi8L/fQhF8d LOytMZRPqETiTCKybNCrUTjX75U/Q8MUQMmmGQQlEccibe4Bc9We9ycOi6PezmuWhLuyvCRnaY7 fgnn1kYEaHqE4UiFL5bfBqZI+u6H7EpkfDIKUkRi7Ti1kg5NWUF+/FAvR/LSiTOEC//+x7YhfXb
 blBDYoXlYkBGA39qKTFP6vCmQSOR1rJAkN0WsxG6W7q0Ry97bJC/iQSPRyICCT+/v5K3BeVYxAJ IUHczwo5L9Brpw3RyEgXM8gC6yQv7hlbxQOygvN0I44V4D9BsucbAANWXLwWvRCI/8htMyRrkOh bK1YZeuiBVxUJKt2rXt7wjtlCL9RItCSFeSArCWcQMXEE7xDIrKCYyU03B3pMiMnJT53euP3JiH
 RCV3nwGFmQMBhkQliEOorJz3Uco+YLFJqcKQOqALcKMH08kVGBuEEMLuXElfj/eF0hUKDAJ1
X-Proofpoint-GUID: F_82pmsV2Rpr06YLwUiusd4p7cGngwZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 clxscore=1011
 mlxlogscore=708 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140029
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 31 Mar 2025 12:57:19 +0200, Michal Suchanek wrote:
> Similar to x86 the ppc boot code does not build with GCC 15.
> 
> Copy the fix from
> commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")
> 
> 

Applied to powerpc/next.

[1/1] powerpc/boot: Fix build with gcc 15
      https://git.kernel.org/powerpc/c/5a821e2d69e26b51b7f3740b6b0c3462b8cacaff

Thanks

