Return-Path: <linuxppc-dev+bounces-3918-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F6D9EB4F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 16:29:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y72hd4fmmz2yyR;
	Wed, 11 Dec 2024 02:29:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733844561;
	cv=none; b=IDO4BsA3Ccpu9Na3+EucNWdk9wXqf6XnoSMUpHi95cN2FKIKo0b/R6icHMkLaZL5OrGNyKJ+/gf8iKRogz3VgAF0SUvjdH22JRy8KnEKd8UPr4cU8OTAcCuCW9TWA+1j8KAv13yN7zWkIK7fVriN+4Czkzk2QLk2jPaksyBK+0HQR8pYxtWYsDgGiWeh9ZQ5GDtYLxka0mMd8Ivp2Tu2PKZp/Q+Zr22cOxaKSZ21Uicki+IbNARp878WgmdAvVjfXKNnzgCCgWXO+kO7BAcTjnsYlYbL7bGRhNRokNogZ1Q7vZLLCWaxZuGhsxNfLAo9AyhDsyzLtEuflbvOwTAONA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733844561; c=relaxed/relaxed;
	bh=fFiHhPWccpkjs+zB4a+vGrFniwRBOHqpcWiahmMSLz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T2Cro2llI3o7SDMG9U6z9G397azAQrrir1YVsfZwwLPeO2SRw36SxYXpILOazmalDieaUW6KAlLR3JVU3kd9z7lBTbeMBFaqPoM+3bKLolk4ZZohJHHZkA0eP7y0eZiCrpPFxJ7KsIIgRp+DEgmcNAy6P9MZU1KYEcYuR8KedmpwIpcd8EUjZYNpnh8ilh7J9J6fI76sKzEp7EkzIwhb7gflJIM7ehBKldv1wXLF8rPbKEbSEH9Nd8hgVNZp7G3nvj2xk8N/b79tYX/g9e0GNc7+FeZ6SbC7LbT/u6AbVd8HfiNsgYyRksPuvYNlh/u4wP2kx5TJy75dAcPnhkpFBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LPZ5OBF+; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LPZ5OBF+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y72hc0xhDz2xbS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 02:29:19 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BADrd9U009303;
	Tue, 10 Dec 2024 15:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fFiHhP
	Wccpkjs+zB4a+vGrFniwRBOHqpcWiahmMSLz4=; b=LPZ5OBF+ud+cbmE9rRxEJJ
	zpZ2OmpNNwYg0nPXA9VlhENiODanI0I9lIFaJ8PMLSbyLJcoJ8OwURiU2x+YrWHP
	4C70o6h34vDCUIaK9wlHz2W3JWDCME1fXmg59J72bIvBkjpkjeM3WfioidUZSUB6
	g2IKb+lc2GtnrSAxUtbNDFUNqE2wYs+jVbn/BXmOuovKGmgU8MdQPUDLEXdblUd9
	6B2OD34UxfSKeLjXxa7egMZp9Pf4W1HScI6Cy7HhXSnyMNoqnkGK145yhPkg6yjY
	3wpKjNAWQi3a0gvNeHtDXZvKYSpyDmV72gswGboMIlSMy2K8jGqjCMgaPyw1t4hA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce38qw6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:29:16 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAF1NG7016944;
	Tue, 10 Dec 2024 15:29:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43d12y4cp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:29:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BAFTARM63963574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 15:29:10 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 160DA2004B;
	Tue, 10 Dec 2024 15:29:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2EBF20040;
	Tue, 10 Dec 2024 15:29:09 +0000 (GMT)
Received: from [9.84.194.138] (unknown [9.84.194.138])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Dec 2024 15:29:09 +0000 (GMT)
Message-ID: <2cf0c159-5f29-4098-8fb3-47be4eeea37e@linux.ibm.com>
Date: Tue, 10 Dec 2024 16:29:09 +0100
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
Subject: Re: [PATCH 2/2] cxl: Remove driver
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ukrishn@linux.ibm.com, manoj@linux.ibm.com,
        clombard@linux.ibm.com, vaibhav@linux.ibm.com
References: <20241210072721.157323-1-ajd@linux.ibm.com>
 <20241210072721.157323-3-ajd@linux.ibm.com>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20241210072721.157323-3-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tNZaKKi4QEPnxiSxu1Cz3pgPmbQ_ncPR
X-Proofpoint-ORIG-GUID: tNZaKKi4QEPnxiSxu1Cz3pgPmbQ_ncPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100115
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 10/12/2024 08:27, Andrew Donnellan wrote:
> Remove the cxl driver that provides support for the IBM Coherent
> Accelerator Processor Interface. Revert or clean up associated code in
> arch/powerpc that is no longer necessary.
> 
> cxl has received minimal maintenance for several years, and is not
> supported on the Power10 processor. We aren't aware of any users who are
> likely to be using recent kernels.
> 
> Thanks to Mikey Neuling, Ian Munsie, Daniel Axtens, Frederic Barrat,
> Christophe Lombard, Philippe Bergheaud, Vaibhav Jain and Alastair
> D'Silva for their work on this driver over the years.
> 
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

With the understanding that it would be merged (at least) one release 
cycle after 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=436003&state=* 
:

Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

And many thanks for doing it!

   Fred

