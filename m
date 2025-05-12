Return-Path: <linuxppc-dev+bounces-8500-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A06A0AB3419
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 11:55:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zww3575Ncz2xlM;
	Mon, 12 May 2025 19:55:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747043745;
	cv=none; b=LIw9Gm2hrC8Ofq/hXBI2q8LlyPDd6/blmXt0LrWTuSW6DcDT+Rjp6xzUOLe3zh3dmtEk08yC0BoCuFyrmTILvfMVisagOyAS51zO1PMxHVC3lQ+iQqPPQtlExmYk2bk6nsmgcd04t0oq7zLittXkZnscgtNrZ5C7Hr6CSfz5l1INYbKELgtDXhCRIBHERoO16VNn31oiNu/nZS9F4n1bliqHtp0G9x3GX8Qf0U0Jp9qPadiwKzSKXd10fs0KfNGE+ujvqSmSaJ/klG2IfQ+ELyyIn58rPioJxsvFxefquBiOfmJlnlsu5txZOOqEMWOO+aVHKQUW7qpCfOY6Eq9tZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747043745; c=relaxed/relaxed;
	bh=Kvv1+ZSE/dsOtlAJDZapWjRbPOdw+bosW+WM8y/jiCM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QlP7dfRe0GyyVmdouxn1Hhbk85RPO5GbTiYVhuRPwloKU9UdzNSukzezThI/1g81HQQPiceeYnhULkqD+8j7K5+wZGL82DKrdssnXG+KLqRaHXJfoiXhx1wVA8MU4a8EfFvvx2A0+auQ9ibLIZhZeX59bokoO+cyUurgQ/J1y1GvlvA5jP8Yu3UL/BDeZjZWzC8ZIq7gucPxYK43I88TIYd8TvfQStXtc3vw/rQKQRes8L56x3KTMa4/ZpvLofvZSRoHzA1/VBm1JSuWFkPOurYt5z3HoCTZa7x8UESctfYICAsQblbAQ1sE0hMYchH3Nf170UMX4zwFZGQwuuZBbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gIkjMdUQ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gIkjMdUQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zww351nYyz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 19:55:45 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BIpYET018642;
	Mon, 12 May 2025 09:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Kvv1+Z
	SE/dsOtlAJDZapWjRbPOdw+bosW+WM8y/jiCM=; b=gIkjMdUQvOunmzeVTwzgKP
	07IjPOtDpOZbrlty3sotqT/quvjEhlSZGwM/4M7VFH+5sw9xS6RFCyH7rzvp0GtS
	lxYJbmBQ1eHziBpxMpuK5S6G1UUCHOvN2MiKWFcalbRgndFIR+QUWihWnswORm/y
	HUWLSDP4LYsyGYAGd/itR4C111FsPWnja1ZJd2DBkx7DFZGRxxHTe9ATO2tCkNRW
	mA7/8lhaArTx1xQuML1jBhdvBXRZ5Rb1hfjSEW60Q0IOoCwGZZ3ZjA7eg4eDlbb1
	VoUg7cChLTuRNjPrGY0hgjoD6D/UfYJFYpyfr+DkP5f/KO3vuyqv3g83sq+2w2qQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46k1h8aku0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 09:55:33 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54C9tXrs002118;
	Mon, 12 May 2025 09:55:33 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46k1h8aktw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 09:55:32 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54C6dOJu011544;
	Mon, 12 May 2025 09:55:32 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46jku25185-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 09:55:31 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54C9tT0F55443798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 09:55:29 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FE40200E1;
	Mon, 12 May 2025 09:55:29 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 141C3200E0;
	Mon, 12 May 2025 09:55:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 May 2025 09:55:29 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9B07560125;
	Mon, 12 May 2025 19:55:26 +1000 (AEST)
Message-ID: <9477e99aa57e432b1e55ebd3e903036e60926014.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/pseries: Correct secvar format
 representation for static key management
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        nayna@linux.ibm.com, linux-kernel@vger.kernel.org
Date: Mon, 12 May 2025 19:55:26 +1000
In-Reply-To: <2b7145a2-1cfb-4b1a-929c-10a03747119e@linux.ibm.com>
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
	 <20250430090350.30023-2-ssrish@linux.ibm.com>
	 <87e1185273ce21e5fd69ff071a1be986c2a0301a.camel@linux.ibm.com>
	 <2b7145a2-1cfb-4b1a-929c-10a03747119e@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
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
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=fq3cZE4f c=1 sm=1 tr=0 ts=6821c595 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=etY5_-Iy7x1mbQhKnqsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 0RrYxMeiUTn7C5FFZUm4sp9ErZylhjGC
X-Proofpoint-ORIG-GUID: ijDREITzoh1JWPTJ9roeiJHGPfoUH76v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEwMCBTYWx0ZWRfX8ZtBoNVOi8HA 5qzmEzvf3EZxsxffmvIcyCmY/ruchu02r7Lj1Psak46k9w3jUDnS7vduH6V6Z96gO08wmvEN9Ln Ucioq+iafLOvYybJDZXqQ2tEcQHrRV5DEM6z0Sj98ivhtoav61KGPOBFjJ75jA50M/tD7YeM29k
 W9DwH5D+lNrOB56g+gemS5Hbs3pChfQqvRb2SFbCcR5g9lsOl7lLGK4MEl+9Cfs8C2o2FEVXfbV mx4YenEgTpJQ3hwW4Fn8GXP1Qw/jPia3tDXCRcvdAbH55FfaIAHWa4mnVpYU3XpIg5QfsKO+4GI ojAvOp6Qjmkls+bAdQa+N4ZmXU4HNsTvAJcvmnmq2jjWmPnTFd7cuS1HbZaQOivfun3vxI0U2H6
 MEnrgO/z9IvuEZPW8tVtdeZ3aIHNKkXLKCTyjyWt1vCqQHEZrsmxyqEaM5anLe4C6mDuSrX5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120100
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-05-07 at 00:29 +0530, Srish Srinivasan wrote:
> > I think you should handle this as the existing code does: if it's
> > ENOENT, return 0, and for other codes print an error and return -
> > EIO.
> Currently, the other layers in the boot stack assume static key mode
> for=20
> any failure in reading SB_VERSION. We added the same interpretation
> in the kernel to keep it consistent with the other layers, and
> represent=20
> the same to the user. This is the reason for not parsing the error
> codes
> when trying to read SB_VERSION, and defaulting to the static key=20
> management mode. However, we want the exact error code to be logged
> for debugging purposes. And, it does make sense to have logging only
> for=20
> error codes other than -ENOENT and -EPERM, as you suggested.
> Does this sound okay?

Okay, maybe document explicitly in a comment that we default to static
mode in the event of any weird errors.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

