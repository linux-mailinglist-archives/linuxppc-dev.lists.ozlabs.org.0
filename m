Return-Path: <linuxppc-dev+bounces-8558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CAEAB61F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 07:07:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy1Yc0Tlbz2yfS;
	Wed, 14 May 2025 15:07:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747199251;
	cv=none; b=oR6fPTwysfyQ2qIHwFS5clNFnhqlqZb6zlOPDrfdXA2GnGy2BTsjIoiw7f1yLenjrg+hqZHqudLtEo6oeu1zFbAdA1ecBKvh+CwNQryA0lYybN0DzMrNE11glFfAAGIRYJlcwgROtA2ybxnNtG1drILzLqm/TTgeC5e+fHVc6S9+yEM1V1Yfunpm6Qrq9TMsFV16HtscZkSdvK8JG3pdrKgK4t1Ic4QsW9OvUdGnJ9yQ/GAasun1HlLQVCdLbxVYmNIDsPWL2+hd8JYucbPy41UfO/yWARSDLnNXb+MZ+UEjYKSJtF60RrsVQ3oI0mq6ZdiHfe+0+gQwIRd4qyi2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747199251; c=relaxed/relaxed;
	bh=l0rsmeLZcW0BgyjLX0rETps/KiAqAXxNtF7yFCkcCHI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWON6kZNSBc3WW1BHJc8NV8LHvOdLy66APUTabzDqXDPIkHDHUTGplFkX6zkUzMexKjVoHMEYMf6R9MZaOLH69v1REv33ARqRT6sFKcKPhl6BPx+9QCx5952wTflZb+Inr3anx+y06jWNjZLgpexIaEtqbqVGSNL8cu7CHlA1rCWS7bE946AzdB0BdIR87sBFgYwZiPdA7C5uIU6W996FcoqdqD5qY5JvdkFgxMvhWTxGIiaEGiVPlp9h+1geTFORUPGQ18Uajr1vr/+02QGfqhKk5s7G6eWIn//BQjwXwrSQHv5hNmamOMhYKVCJJBAIfld2k30Cvw6gr+AGioyew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CiuFrx6r; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CiuFrx6r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy1Yb0kd1z2ySg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 15:07:30 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIbM6g019820;
	Wed, 14 May 2025 05:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=l0rsmeLZcW0BgyjLX0rET
	ps/KiAqAXxNtF7yFCkcCHI=; b=CiuFrx6ruoVfj0LTgoDhCPGEyklamqooLVW6B
	uQC3naN+Lvp9ONUNg3JpSKlcmk4EClZGIM+3HeUGsddDhmPIIVhp+vzO1oXv2vNK
	Nb3Yt1KLldGSkSsc4mQvXHJji1FRq0hZPSqPZ0isokKYNJrqmNV0+w4ooBvf4rzq
	QBxbr4AtfUFCGz/SAboNwsqXlABvLBJgY+ZtPBszHp1Mcom9PQH4mqjkt9xtIg5G
	IvBQc8On0MDQjaKRrBzvix5Ls20EmnmDsUuIUASKNBgF6ma1Y22EmFSswUAkTfQC
	znsMtgCv/Vi+1XkHcpSGf6coueeWpenlRakV4mZHhAOKFUpBA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbh7a824-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 05:07:15 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54E57E5f014948;
	Wed, 14 May 2025 05:07:14 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbh7a820-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 05:07:14 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54E2AF62021396;
	Wed, 14 May 2025 05:07:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfrje3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 05:07:13 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54E57Btx19005886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 05:07:11 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C387E201DC;
	Wed, 14 May 2025 05:07:11 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A970201D5;
	Wed, 14 May 2025 05:07:09 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.39.25.27])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 14 May 2025 05:07:09 +0000 (GMT)
Date: Wed, 14 May 2025 10:37:06 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, maddy@linux.ibm.com,
        tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] irqdomain: ppc: Switch to of_fwnode_handle()
Message-ID: <yco6uagqpygo7s4icnoxi2lgbkkyzt6np55xuwxxzu2ofdewly@3s7f42kca7nq>
Reply-To: mahesh@linux.ibm.com
References: <20250415104758.106890-1-jirislaby@kernel.org>
 <zofmgipjaniwwwb43quo6eoct66cnq65g36dgnk2qbrs4p5kxr@ge5gilezyu6g>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zofmgipjaniwwwb43quo6eoct66cnq65g36dgnk2qbrs4p5kxr@ge5gilezyu6g>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=YbW95xRf c=1 sm=1 tr=0 ts=68242503 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=1UX6Do5GAAAA:8 a=voM4FWlXAAAA:8
 a=zV99UXuDujEc2avMx1sA:9 a=CjuIK1q_8ugA:10 a=Et2XPkok5AAZYJIKzHr1:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: Vt5L8Oo1zVNyWrCe8At7iBMpmTRVRb7E
X-Proofpoint-ORIG-GUID: dJrdu2pCHddCAQkBEw2u--NnLgKDyGSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA0MyBTYWx0ZWRfX4G0X5eUHw9BK lC2AN4XV78uPs6GkHPhHdNlAxUvgZoO674LAs5DmJIhnnIw5LWwzjer7yexlRWfjKB2c1qb5WdR voFDZGnQCDcCROI2QHDkOmXiHJ/y/sDi88RWQ1LQ5jBOx8OdynaUDVE0j3UoQfdmMl8QKZ9OTdG
 XJei02OP0OfIlZUwRVTNWCKjAEwmzAkjik4hOktiw/UYCjLt1ozVGuJNDs1RpNKi5SyGzKCZtWU UQYSbQo9YQ+bsQlNqbWndP3sxf0GAu7VpJcqLmYrwYxj2Vu6AsaD1GZq6Khae4i5LWOSfSjTX6i KSCRId8pTw2pNTQ7Ug+KBPIZBKzgGcy4V4vBkEe7TY/mm0eVwWooBWMgvYWnQtHkArS1SzSOAwb
 AYl5L8VrhyQxf5QggrZAxbJ4DZwpFYc4bL23IE8i2ht07F9VbGLpTuQ9n5MCRbYvwHgFaSPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=299 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140043
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-05-14 09:54:46 Wed, Mahesh J Salgaonkar wrote:
> On 2025-04-15 12:47:58 Tue, Jiri Slaby (SUSE) wrote:
> > of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
> > defined of_fwnode_handle(). The former is in the process of being
> > removed, so use the latter instead.
> > 
> > Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> > Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: Naveen N Rao <naveen@kernel.org>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > ---
> > This is an indepent patch, please apply directly.
> > 
> > The patch was previously a part of a large series [1], but I would like
> > maintainers to feed the independent parts through their trees.
> 
> Looks good to me.
> 
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>

Sorry for old email id. Please read it as

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

> 
> Thanks,
> -Mahesh.

