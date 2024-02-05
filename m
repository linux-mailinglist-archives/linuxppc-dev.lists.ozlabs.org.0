Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0CE84A0E8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 18:36:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VUYpnmZq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTD7x541yz3cPW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 04:36:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VUYpnmZq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTD782f68z3bq0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 04:35:47 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 415H73uW022996;
	Mon, 5 Feb 2024 17:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=/m7ENcWw8jBryuscCbgPp7hzCQ34mIrSeEoKDPRIxks=;
 b=VUYpnmZq8uYLKWiMuY+HaiWasuEGFv+Q2STxO+vIgc42uKNqAIt5sagMNivWBCcH98jn
 Ck1fQ/BFAo63duCwVrRn6I5Rz1fMwF2WBuWug0OH51SdwQnY1Y8fCb2DFa++QwxRijW1
 nA/R+4CgAcWqjlLEvR5Acj6P7ohghZiHSzvnOiBlL+cbfnrjIVpsXePI34cKk5NzJd0p
 0MUxgekfiQ6jUvlT/r6rYGEBFg7HpZyQ8m4lo/iBmUMY1plCkfxfygLVIpz2LVSX7Acu
 KUtDv4ElARcdH29vgLCiBJpv2SV4z34RVQe1hIjnSwYAHkQioBGX7cxyu2+Go039RMrt Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w337chrqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 17:35:36 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 415HQ8q3032430;
	Mon, 5 Feb 2024 17:35:36 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w337chrqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 17:35:36 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 415H5Sov005455;
	Mon, 5 Feb 2024 17:35:35 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w21ak9t5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 17:35:35 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 415HZWqx20316814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Feb 2024 17:35:32 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B08720043;
	Mon,  5 Feb 2024 17:35:32 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E72C2004E;
	Mon,  5 Feb 2024 17:35:27 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.43.112.222])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon,  5 Feb 2024 17:35:26 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 05 Feb 2024 23:05:23 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: Fix L2 guest reboot failure due
 to empty 'arch_compat'
In-Reply-To: <20240205132607.2776637-1-amachhiw@linux.ibm.com>
References: <20240205132607.2776637-1-amachhiw@linux.ibm.com>
Date: Mon, 05 Feb 2024 23:05:23 +0530
Message-ID: <87h6img6g4.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5TnpgDh3nHIvKvMD6hFMeSDCRi2B20hH
X-Proofpoint-ORIG-GUID: uIRLN9AqnSJ7beZNDqSxnZYfllpJf0Ed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_12,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=798 priorityscore=1501
 spamscore=0 phishscore=0 mlxscore=0 clxscore=1011 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402050134
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Amit Machhiwal <amachhiw@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Amit,

Thanks for the patch. Minor comment on the patch below:

Amit Machhiwal <amachhiw@linux.ibm.com> writes:

<snip>

>  
> +static inline unsigned long map_pcr_to_cap(unsigned long pcr)
> +{
> +	unsigned long cap = 0;
> +
> +	switch (pcr) {
> +	case PCR_ARCH_300:
> +		cap = H_GUEST_CAP_POWER9;
> +		break;
> +	case PCR_ARCH_31:
> +		cap = H_GUEST_CAP_POWER10;
Though CONFIG_CC_IMPLICIT_FALLTHROUGH and '-Wimplicit-fallthrough'
doesnt explicitly flag this usage, please consider using the
'fallthrough;' keyword here.

However you probably dont want this switch-case to fallthrough so please
use a 'break' instead.

> +	default:
> +		break;
> +	}
> +
> +	return cap;
> +}
> +
>
<snip>

With the suggested change above

Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>

-- 
Cheers
~ Vaibhav
