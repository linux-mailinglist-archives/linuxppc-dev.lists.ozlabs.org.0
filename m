Return-Path: <linuxppc-dev+bounces-8272-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B81AA83BE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 May 2025 05:22:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZqqhF2X4bz2yqf;
	Sun,  4 May 2025 13:21:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746328909;
	cv=none; b=aQPtcx7lI2KZg1GA0R/wohkCP3fF9fma/UUkZhTtrcwst70ACRoRzDpIcWybT30LpHCsTVcWFG+2wYVJNW7WITwDgfdjiObjq7oEuzh+/SS+2u9mHR7Z2Ef+koX5YfrMNyEiwlP5uOsVu/xEqjdQZmpUeaHyKwS0harMoJVIEMFGeA7LkeB1h89pP+3Vzv764EGoB5Wrh8wh3QDaIYKM6NmpTAWgStS7AZ3IuPLmNGglrD/e8RETCm2hvYkju98SeZWcfxz/WFlarwXkFeMq6TCwD8dR2E8SWezq0tTK6l+B4HXPAwamEx7LtS2HamxfXvKvx7lPQPduA+gDumo2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746328909; c=relaxed/relaxed;
	bh=049eM6yuHcAq0fB9qDTdhtbELa2b2PosHJAHBSzyqrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SaNtFQS/BUr2DfZrwjoU5bRSndMLqij2xHjHCWOgPXMu0FC5RKvaXq2N3MN/T7FTYTd4OlJYx43xCsC4eSnJ9YQWfDcLRNzgILLIn4ZRvBHC5kri5KSE6Llxl6a9nMfLQiX9YL2N+nOBNBOUSpKrHxTs6tGVapDMPB3HEgw4X69Nfz3xV4oUf4708nFJ8LTZmjyt/BElCDSn8fM9SLwsIQ1Ydd4UHSch1KMgyjGpsyfMaOSJOukj6ZxTavbuR1OFlANKD4U/BmFltBLuj4vz4KViSsaSrdBLVb6lRdJD5mX4xv11BQBrv/SRs5tqP0+wLepTwoLq9TXixeWodPAVog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lu/EC0ax; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lu/EC0ax;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZqqhD4nS2z2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 May 2025 13:21:48 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543JO1Gt022692;
	Sun, 4 May 2025 03:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=049eM6
	yuHcAq0fB9qDTdhtbELa2b2PosHJAHBSzyqrs=; b=Lu/EC0axgHsuP1D8ywT8uE
	9HshKwbU72UeiViuBnoWsRtVFfb6DY/sK5fTAznMYubHy2wEQ/iblQEKtMIYu1nR
	BA2M3ISVyZQLU2rXAwmLYp+3AvSqZ/SAYJXyU0glnmSU1ZxP5PlN9FDGF2zaqF1f
	MrAH1flYwU59iX1PlyTOsshuxP2Wmti+nFifB7AP8X5XEVwpgc3K9pHg6mqPew/9
	oz33aZVNYOV9UUC40TYR4h5two5K4sbmiTA4yQfAfhRGiGLh+VtDxihhuyLm3kQN
	u/y/uFXy/FH2X6TC4LC1GS/jdCL21cELbH/is4DvOlCxd5FVuOEMjM2j5vI2s9Ag
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dh2ktbys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:40 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5440BSvB001313;
	Sun, 4 May 2025 03:21:39 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dwft0hkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:39 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5443LZDa34669150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 03:21:36 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E21FE20043;
	Sun,  4 May 2025 03:21:35 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CAF720040;
	Sun,  4 May 2025 03:21:32 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.78])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 03:21:31 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>
Cc: sfr@canb.auug.org.au, tyreld@linux.ibm.com, linux-next@vger.kernel.org,
        hbabu@us.ibm.com
Subject: Re: [PATCH] powerpc/pseries: Include linux/types.h in papr-platform-dump.h
Date: Sun,  4 May 2025 08:51:29 +0530
Message-ID: <174632869190.233894.13264364429035388504.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429211419.1081354-1-haren@linux.ibm.com>
References: <20250429211419.1081354-1-haren@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=fLE53Yae c=1 sm=1 tr=0 ts=6816dd44 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=IJ5uNYSzlZeX1pgoDwQA:9 a=QEXdDO2ut3YA:10
 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: szN0peu7zDLhaVqNeR9kNtclkP7uBoR7
X-Proofpoint-ORIG-GUID: szN0peu7zDLhaVqNeR9kNtclkP7uBoR7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyNyBTYWx0ZWRfXycLrlYNgGivR VrjNHIrd4erJBws9p+7q8okStZUlsdivR9HQ+yIbn6aXkWLM+iQU9nxoTmBCnn6+3DtEypxCudy mG+/C5gFp9sxd8X2x//7PPzhB1iG0RKKBVhOJgN+0w2Qte7mYgfmScDHXt/e8qmMl90+/Dv6LxT
 aOm6WJthA9FVAEMENIDl4rW1cilPAQDWPk20mF9/RdxG5pWj5ZMIxxpoPipC3lyD7dv55Yaql50 B65n790+/1OdHhhxIhLe/rX8+CCnujZ6XSTqNFQFhc0eZL7kT7V8EtmJdvesRgHbwE3yLcyCMN8 heDoryHeXLq8d/gWz1zmjk0Yt1I1up2Wat0RtTGMNFGtuzUtPOMivKOqa3JaWrorOKxE+ewQdRZ
 eL0VD7q49a/35f2mXmPuY6Br7iK7j35GbP3BofqQvjEBfAaaUF8pQUoFQfpWtC0Z5CAjRYBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 mlxlogscore=931
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040027
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 29 Apr 2025 14:14:18 -0700, Haren Myneni wrote:
> Fix the following build warning:
> usr/include/asm/papr-platform-dump.h:12: found __[us]{8,16,32,64} type without #include <linux/types.h>
> 
> Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
> Closes: https://lore.kernel.org/linux-next/20250429185735.034ba678@canb.auug.org.au/
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: Include linux/types.h in papr-platform-dump.h
      https://git.kernel.org/powerpc/c/925e8620db51ca6bd5c87256dc71c38770b8f6e1

Thanks

