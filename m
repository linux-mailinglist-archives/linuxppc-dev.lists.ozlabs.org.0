Return-Path: <linuxppc-dev+bounces-8641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5602ABADA6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 05:45:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0RXx619gz30V3;
	Sun, 18 May 2025 13:45:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747539921;
	cv=none; b=kHH9zXf6MZmnKXO2Zo703XQSMCz6Z7tjxPM48DcHt5NSftzXw4ctvIZTa6ozvYQFy4BZ2FngzYsH0NxNKGQ3TZ/EYwdgiL4bmB4nRLqnWp058sWQ23KXkkH8foc/VxJ8KNJsIMPsoyvkhXeY2cUJY+rrUWcUIEzBlWuWhm0ycLwoobiltEp+6sk5iVGQpExEpQvvdwQ/C8tEvgQ7wwoLh4NKgQBim3maxgMs5kPf2Rvt7BFfF9NA9GVAh0ZL324Bdw8PeBwgkD6pYEMMkRXqCpS10mgezrRdw3hb/JzpmghrtnMtaAHu0/YHUOi5FuI08GOqfBiM6aNPgmP02wSUaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747539921; c=relaxed/relaxed;
	bh=S5pBXQfiiZWtwj2Z2OcVUVAK9uU5YWfhMwVhMgLBva0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RdNObMky1IFczIimbeHvTt7t0PHuJkemApwFX1KgeDDwdnA3IiOuQVc/cJG5j63wBGFXhZUGW1V1X6vx9lCodvfrJPwQQb4t4uB0Rqh2hlEMyhf5ANDnHrJZYL2R2Q/ZIGX+idooDKFuZLDczSH3zGUBxif2G2kkIQNwOQjI6l58oeXe24vrqofr5gd1QXHU2H62jpYYYK1Kt+WEthqVVLYA6BIiKMQRTvE3xNA96voGDuhydra4tQ8W+IVtddzpT6Cfj9X2pP23D1Sjwf+0WarQVPqxM37S3P9t7TI5m4Y/Y76UKyYGTxu3P0RSckrYQMiWhkDBDER+LYOBgX4nww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oYVc7cdN; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oYVc7cdN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0RXx1j1Jz30Ss
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 13:45:21 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I1LrUF012777;
	Sun, 18 May 2025 03:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=S5pBXQ
	fiiZWtwj2Z2OcVUVAK9uU5YWfhMwVhMgLBva0=; b=oYVc7cdNGr3/+BSS0Qf2Lr
	UFUl9UZA1DItQei12xU9wY8VL8EAldfb9oaVJVgy8maQDsG81KjUycH4MQuVi9LM
	xV1s40sNQ9r7SnkEtpdlwR0E4GER/tPrr3ceUEZXpCnEZid6u42Q+GeiAI0x09qZ
	ns+qjr828/65+TavQ0tdzUSDyNAqCP+ORRepWHwP0g1dYMW/2MokGX2SocFN+m9y
	6DnogxMJaOhbLsjIVc0IqAU3cz2Zo8kwO4OEqSPgF7ty4ZsElWuuZXjiTpSecZRg
	DRz+xG1n821plWh9j9JmCefm+dk97YQgU2fNfhNZXzpp0A5rs0qYLiL9ZJm1x9eA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqagav8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:52 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I3iqOF018021;
	Sun, 18 May 2025 03:44:52 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqagav8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:52 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I2gpxI008244;
	Sun, 18 May 2025 03:44:51 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46q70k05yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:50 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3ilGO51053022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:44:47 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2272220135;
	Sun, 18 May 2025 03:44:47 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49CE820133;
	Sun, 18 May 2025 03:44:41 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:44:40 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Shivaprasad G Bhat <sbhat@linux.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Gaurav Batra <gbatra@linux.ibm.com>,
        Brian King <brking@linux.vnet.ibm.com>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/iommu: Use str_disabled_enabled() helper
Date: Sun, 18 May 2025 09:14:39 +0530
Message-ID: <174753967077.24504.11069922120659244594.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250210224246.363318-1-thorsten.blum@linux.dev>
References: <20250210224246.363318-1-thorsten.blum@linux.dev>
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
X-Proofpoint-ORIG-GUID: FweBwmxxUgchFmuM_-jO3bea6jZuAQ6W
X-Authority-Analysis: v=2.4 cv=LLNmQIW9 c=1 sm=1 tr=0 ts=682957b4 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=zcM4IMS7Y6FqgFCI1eoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: rwPcFImpyFuxi_tuNXgja5cbjkWt88X1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfX9gtNYiHrgO6/ MYAthwgT36oxHojFHA21EywccwaIcBei/XSz5Q2eWbfH0p2PwzA+pbU/ZUmyMA3vkF9289OB5Y0 ZKqHwxQYed/iQ2kNV3KDWtapc+ZX066zAAmktSsWgerA6g9u6tvKEZUvin+PGcvIFjhwe5UTT3G
 TIviWUlj6yaJGBeMj5l+LF2gu7OS99OTTbBG0FZfcNoqLGnnZLgJ9iKfKJlbwkhP3pWFFFscAo7 +VLJaRPJAtfzSc+0P8eb0tlJvcooDdQ64xYSyghpxwz3vYhRDCOiFyMEkt/YuhM4iESCPTAtn8D rTw8DVRi/030wjaNwDYvINGJWrcnDaVMluYPCVxh0CK017Ge+2mxLbCSYNRm4skUzN9ynsIoNix
 mzmJ83Odqrpg4ScUCT7eeZcNeGhL35q8Gyg4UzY/WNPYevkiDjKbik0QGiBqXtTiHXsvWqLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 mlxlogscore=662 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 10 Feb 2025 23:42:44 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_disabled_enabled() helper.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/iommu: Use str_disabled_enabled() helper
      https://git.kernel.org/powerpc/c/f15e87340afd4f5a35575e112aa4bdb0a138aa26

Thanks

