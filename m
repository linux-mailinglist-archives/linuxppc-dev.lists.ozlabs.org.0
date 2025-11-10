Return-Path: <linuxppc-dev+bounces-13986-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4F5C44ECE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 05:44:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4cWt0tJ8z2xqM;
	Mon, 10 Nov 2025 15:44:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762749866;
	cv=none; b=XMVEG3RosEBRNsTRCZ+N2E/az/sOBatLZhzMQeBHz4+tIvc7bknBX727kfqA80eag3b3sARj7EYhnZeh/9znwJbJiEYczKjhiSp/FNJQ+MPQjj+SWD9sKRwX2pkBlfl4BA75R+p+KFBrx1+VxWi/O+Ie+CvjGRx/IrrwHDoUH5JdoodUFJGLaeJzlleOstWiVFw93UTJYvOUOuoQOspvZQsy0wWfD5jwIsFz3lqRZ0L3llDMqY+7gcg54ae0r4OBExntF3fxMyjW12z8tmr5x7+LvfcKyucHLTOSifQ9G/hn3FiF5oHBiSezJwtayikvzD0Pg5cUD1W2GrTkht7Exg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762749866; c=relaxed/relaxed;
	bh=iLOa2c00F111K6/ewY+KuYeVS5jPBTxjJdw+OjbJPXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8xhLLJo1FhvUdLrUvg7Mibkj7zp3yHnUV09NrvIvG/jhW6SwzH3f4E/7sV4Q2xztEyKbAn5a+wC06MNdr/8y4Hjocvo15GF7NafGFZVuY3B4R0y+SBuye36k1EBoTikjYJ7sKdUBPLONzbop1WlrhrJz7xO7zAoZzSntUcvd7v/SE/8dWnilowrgGDXB05OtVFLh59vvVS/CbgXtXN22O/KT0y0I5KkmGlOpns+2oRAafVPvLb+GGZmSEw96c4G/0/q/pA6DIwsxrs8uoOSEqHZU9xlq8hWbVqQG/xdkOemQDx7lGDQPt23I6XyDuMwIU0VVOIjoCBb2b3LD1rRyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s7WkGRgT; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s7WkGRgT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4cWs1Dr1z2xFT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 15:44:24 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9JNDLh019381;
	Mon, 10 Nov 2025 04:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=iLOa2c00F111K6/ewY+KuYeVS5jPBT
	xjJdw+OjbJPXs=; b=s7WkGRgTYVUdso/+OntinDJ4LtLMswECC+RqhZfECdeQDC
	u3yfAWcTgDP3GWo+n9UMncQ+6dwvPymntm+Dde00nfKnKI5InEYt8F7rMjdfZv8Y
	ApzuDSQ7i54q/LfnCGrtR9BmwFBWuRgQoy5sHFmN4o7PhBrUeZ+jTefrVd8TvQpC
	qK1Sy4O/+3W4SXSYRPk0c9tUx5Agj6mK89+aFXXymGAT/d3F7mvvegnBkgg6hqTu
	KrTnJ0/2mLFiIMmKusHJTJfQAYZWZlTKNkszF9ncMQ7FojzAWCRFRd4NtrUR3u8o
	G0dnvfgeBijU3NzVECssDbFPZIq+JkGut4fQPf4g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5tjmer7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:44:21 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AA4fxK1023851;
	Mon, 10 Nov 2025 04:44:21 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5tjmer6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:44:21 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9NJJ15011605;
	Mon, 10 Nov 2025 04:44:20 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aajw13m84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:44:18 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AA4iExJ61341968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Nov 2025 04:44:15 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D810D20043;
	Mon, 10 Nov 2025 04:44:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A124F20040;
	Mon, 10 Nov 2025 04:44:13 +0000 (GMT)
Received: from mac.in.ibm.com (unknown [9.43.55.27])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 10 Nov 2025 04:44:13 +0000 (GMT)
Date: Mon, 10 Nov 2025 10:14:08 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: Gautam Menghani <gautam@linux.ibm.com>
Cc: maddy@linux.ibm.com, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS : Add myself as reviewer for PPC KVM
Message-ID: <20251110101329.ec2380a2-c0-amachhiw@linux.ibm.com>
Mail-Followup-To: Gautam Menghani <gautam@linux.ibm.com>, 
	maddy@linux.ibm.com, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251103094243.57593-1-gautam@linux.ibm.com>
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
In-Reply-To: <20251103094243.57593-1-gautam@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xlrIlckMt4y5ynY84qLoBuCmi1S9PTM4
X-Proofpoint-ORIG-GUID: TbGYaeb4lm2bDUaIRysIET2x0FmuPnzT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA5OSBTYWx0ZWRfX285U4tSFwe4P
 txlWA1vHP42EKGgLrAkoPVhPMLUHm+EhCViZrkzEYleX+dhc3XfO5/DHlWfhDiKGMuXs32EHyXK
 vdfpex+5FoXF/0Hlor//5Lctr+HyxOfMarHccxI8QWUFDfegyDmp/otdeSjNxZEUvu1oxs/1rsN
 Db84NOtK5XqPMQ21FXd+Nk81owJK7lPa8X3ugN/HX4EcqwXw4kYtgQRiFFYHvv5IfHTvC/RF4lN
 cRRuKLboDCD6vCwo0a7pkINdTPAtMXF+wmOIibIm0vt8Wr8mTnZVMdb6Gvqd0nJUKbtoYuB3c7z
 pX4IIr8RAXZwAtmPd2fTlJpDw7ilCOKN2Gaan6H3vQcR/XcTfIEgR7bJSyvpsGMO1GOTQwA6PT0
 +zsGaJJTc4t7T4UREiO1LF6CTdSX7g==
X-Authority-Analysis: v=2.4 cv=V6xwEOni c=1 sm=1 tr=0 ts=69116da5 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8
 a=tdM2vFJyyvqnMuV-wiAA:9 a=CjuIK1q_8ugA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080099
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025/11/03 03:12 PM, Gautam Menghani wrote:
> I have been contributing to PPC KVM for sometime now and would like to get
> notified of incoming changes to help with code reviews as well.
> 
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>

Reviewed-by: Amit Machhiwal <amachhiw@linux.ibm.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46bd8e033042..3f2f60486222 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13701,6 +13701,7 @@ F:	arch/mips/kvm/
>  KERNEL VIRTUAL MACHINE FOR POWERPC (KVM/powerpc)
>  M:	Madhavan Srinivasan <maddy@linux.ibm.com>
>  R:	Nicholas Piggin <npiggin@gmail.com>
> +R:	Gautam Menghani <gautam@linux.ibm.com>
>  L:	linuxppc-dev@lists.ozlabs.org
>  L:	kvm@vger.kernel.org
>  S:	Maintained (Book3S 64-bit HV)
> -- 
> 2.51.0
> 
> 

