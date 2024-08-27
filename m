Return-Path: <linuxppc-dev+bounces-587-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D78960426
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 10:15:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtL2l3ByJz2xs4;
	Tue, 27 Aug 2024 18:15:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724746543;
	cv=none; b=NbS01IabfzWKEFnvx3Oaje0r0KQbC5ZuZbhu2i6LKC4aH1luBoScjMiRw1F/tpOFkAWkYmeWFbeAbU28ypJjptriv8DnFKmuLWH7vF1itKqNhfkaQeDVLHtSieJlqqFOYgToJY3/yxNU2v9EErSMJw4xCEtEuzQdAQVwPg0DK93H1WHvw6/mMCYpLdxyaClBm2rjMhnAoD7hJaOjSqHiFPMnaWHn6CWWQYWPeZ9SLfX1bmyiPrjj01l8ZsJdXnRKHGDQf1fzi8t7c+9axwo58HY1enLYjO0kENCFBPmPb43Zs4CfkZbiNsRrZS7vA1EenpWJHuuIVXQYdJow8MSQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724746543; c=relaxed/relaxed;
	bh=yTOu2Pf9GhC7wmbivrcb7Ryf3ynPpRy4DC+KmbPykGo=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
	 Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 X-TM-AS-GCONF:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 Content-Transfer-Encoding:X-Proofpoint-UnRewURL:MIME-Version:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details; b=BYVdSHVb/Lp3X6U9jPIoASXOuU5qa4ACX6dzV8HhhJmBvvEB+hLpfnG9ksMoA7APYz7FmmO5F8/uqGB5wEvWUltLpnUalMdLoKskOO36V4y6cxElJsLa2RsBBifzBqGubGu+5uI7UJtTMPJN3aAIwPNRUqT/DhuvbIGLBM5PW4Ep42cMyc2gvYuxsYNHi3ERnSk4JFmQxuHmCmrozA6aWi2dvZmYENVeXHAeyvRrYwVmjGKUX4H+zBZ9Q4038f2UHSb+5uxT3ck79ye7LIE+OFUua4N7q64JeJFfr0+2ZBOf7oyv7j21rbyya2zfiGx2p8LfL0rVMWzw9vUjlriv4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mw5T+3sl; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mw5T+3sl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtL2k6mqGz2xjh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 18:15:42 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R1xQ7a015375;
	Tue, 27 Aug 2024 08:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	yTOu2Pf9GhC7wmbivrcb7Ryf3ynPpRy4DC+KmbPykGo=; b=Mw5T+3sl+ka0T0Ju
	eqAq9PVfp8Vf0GWJ/0gxTZTvpnAW6euPeNp34nR1jpk2QK4/OYCwdeOB8q7Fk64M
	311CezMdkijCF4WH4/cSC8ggnE4FEsY5cQa5MLWCyTSNwkoMyZA5t8FUCldG5AbY
	Ho9ZnHH+AQ5sPL0BH901qAQj0cPteTkwvny8PvlIzsEQ4DWJr6CYY0cGmKAIRK5C
	Gu5JMccDe74A9W2Ce5WPW9aQwd+0NLnq10ImO9p7+Q/SfW2eEaWw4Tx3Ol1k3LRC
	+eSLOZ+kcNsGTPgKTryzxauNMTyYgOSXsOcVEbqNiuc1XBD/coONxUFdJ0rHehyj
	HIzPLQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 417g51jmcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 08:15:35 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47R839DP008239;
	Tue, 27 Aug 2024 08:15:35 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 417v2mhpcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 08:15:35 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47R8FYiM42336720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Aug 2024 08:15:34 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44C7A58056;
	Tue, 27 Aug 2024 08:15:34 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE34258054;
	Tue, 27 Aug 2024 08:15:32 +0000 (GMT)
Received: from [9.43.108.197] (unknown [9.43.108.197])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Aug 2024 08:15:32 +0000 (GMT)
Message-ID: <e561213f-81b8-4582-8009-b542dc06d88f@linux.ibm.com>
Date: Tue, 27 Aug 2024 13:45:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: powerpc: Add Maddy
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
References: <20240827063651.28985-1-mpe@ellerman.id.au>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20240827063651.28985-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aJ7yhJ2XBUouaq_vRB0cTHSaFX7vLnvA
X-Proofpoint-GUID: aJ7yhJ2XBUouaq_vRB0cTHSaFX7vLnvA
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_05,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1011
 phishscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408270061


On 8/27/24 12:06 PM, Michael Ellerman wrote:
> Maddy will be helping out with upstream maintenance, add him as a
> reviewer.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 878dcd23b331..0ee724dcc05a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12912,6 +12912,7 @@ M:	Michael Ellerman <mpe@ellerman.id.au>
>   R:	Nicholas Piggin <npiggin@gmail.com>
>   R:	Christophe Leroy <christophe.leroy@csgroup.eu>
>   R:	Naveen N Rao <naveen@kernel.org>
> +R:	Madhavan Srinivasan <maddy@linux.ibm.com>
>   L:	linuxppc-dev@lists.ozlabs.org
>   S:	Supported
>   W:	https://github.com/linuxppc/wiki/wiki

