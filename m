Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B2384A1D3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 19:10:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f4OPkUSb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTDtm5sSXz3069
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 05:10:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f4OPkUSb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTDsz3Mt1z2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 05:09:27 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 415I29Io001118;
	Mon, 5 Feb 2024 18:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=H4aL8bR7hMDj/h6uHjjh77Iz3T+5OxbzDFyXjwQXs6Q=;
 b=f4OPkUSbkkt2A1Umox0P3qnBuoFdRKf2KXSmvQnRDx27BXxTSSK5+8n5ONqk35E8aHer
 GODIFs7ls1sdXgQUly3L7bGQl6uZhPf2XGla55ClvfTmVmcku2LNRho4HbrTwJDB4Wqc
 Wbuy5dNsihgvDD3uggL/89cSvDs1xyr50v92ZHiigu/XyZJ1fvoSGt9t04rcJ1ofkvF2
 VejiqwYl0OJlFr2r84S8Q5ZFfWHHNpbe4kbZsFjyaQh0js7U9LZ5vjqcgmQsAlIGTPVI
 ZWl9LBsBgSQCYwvfbNHQRxBA2TBJEGLgHvAAihNXrS1+dkL3OpxciT0ypAcDKVZqYqRZ BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w34kk067u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 18:09:22 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 415I3FBR005114;
	Mon, 5 Feb 2024 18:09:22 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w34kk067j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 18:09:22 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 415I7bdV008539;
	Mon, 5 Feb 2024 18:09:21 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w221jsrbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 18:09:21 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 415I9Ib420841006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Feb 2024 18:09:18 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36BE52004B;
	Mon,  5 Feb 2024 18:09:18 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A118B20040;
	Mon,  5 Feb 2024 18:09:15 +0000 (GMT)
Received: from li-a83676cc-350e-11b2-a85c-e11f86bb8d73.ibm.com (unknown [9.43.55.162])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  5 Feb 2024 18:09:15 +0000 (GMT)
Date: Mon, 5 Feb 2024 23:39:12 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: Re: [PATCH v2] KVM: PPC: Book3S HV: Fix L2 guest reboot failure
 due to empty 'arch_compat'
Message-ID: <z47adbiweldcumlq4uejggkfcvfaw5nrd7v3tbh2e3pcvzjot2@gourfue5ytbl>
Mail-Followup-To: Vaibhav Jain <vaibhav@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Jordan Niethe <jniethe5@gmail.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>
References: <20240205132607.2776637-1-amachhiw@linux.ibm.com>
 <87h6img6g4.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6img6g4.fsf@vajain21.in.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8E9EiS8ihTxe6mGulR4STRg4YndCvuK-
X-Proofpoint-GUID: T-e15VsqzERE4oLBM_2e0CIBfPF2YuaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_12,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=799 impostorscore=0
 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402050136
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
Cc: kvm@vger.kernel.org, Jordan Niethe <jniethe5@gmail.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, kvm-ppc@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vaibhav,

Thanks for looking into the patch.

On 2024/02/05 11:05 PM, Vaibhav Jain wrote:
> Hi Amit,
> 
> Thanks for the patch. Minor comment on the patch below:
> 
> Amit Machhiwal <amachhiw@linux.ibm.com> writes:
> 
> <snip>
> 
> >  
> > +static inline unsigned long map_pcr_to_cap(unsigned long pcr)
> > +{
> > +	unsigned long cap = 0;
> > +
> > +	switch (pcr) {
> > +	case PCR_ARCH_300:
> > +		cap = H_GUEST_CAP_POWER9;
> > +		break;
> > +	case PCR_ARCH_31:
> > +		cap = H_GUEST_CAP_POWER10;
> Though CONFIG_CC_IMPLICIT_FALLTHROUGH and '-Wimplicit-fallthrough'
> doesnt explicitly flag this usage, please consider using the
> 'fallthrough;' keyword here.
> 
> However you probably dont want this switch-case to fallthrough so please
> use a 'break' instead.

Sure, v3 on the way.

> 
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return cap;
> > +}
> > +
> >
> <snip>
> 
> With the suggested change above
> 
> Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>

Thanks!

> 
> -- 
> Cheers
> ~ Vaibhav

~Amit
