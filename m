Return-Path: <linuxppc-dev+bounces-4884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F31EA06BFE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 04:24:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YT9Bv1vR1z302P;
	Thu,  9 Jan 2025 14:24:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736393095;
	cv=none; b=M7oGBwE8fl22zskmiPavhwpa1uk9HrdplzHDsHglUEU7vx5B5RYINNIqqVj7mZjAnEeRjD2V2hghSEnXn4Gdgi0I6gO0lQpYCSwubj01m2v4TDpJDKS2o/+bI1MVaBC4tt7zZ2zMT8QoscNVpUA3klXbpmlq0LVWljoMH8R+CzDrm4pWY4rnw5ptgiSfN1ElDjdS/IXO+4jcX5u8onDfvfKbgUYkxWG0ay5IFZw8vFomSorWJQGWTqvol+TkIrgrutNfqd+QM0WTfK6SMeFqrit44y0HwJYkkXWasYw2ePCVYmA+197hWiLJ6yYCTUA2W6WxQnxFqTETBdMde8vA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736393095; c=relaxed/relaxed;
	bh=Ev41nye3EYCrH/8qKuYkTcjX/MgP5c6SOfM76NspYuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S60YGzn0sjhA/obJqGto+KNv+hJ4F0zAdXNaZzqGnnKCEnSOGq/z2SGJOvlcHnX/VT6ernK3q9KwtKKt/tHyl/2vEiJ4rphvCCbZwvhbQhdKGWl3D4n+J0InR41uxbMASAbgyV22jodIudBYcLY9la63NNKlWLMHCitjWN//zeA6IjQNxwOZQ66RDIqr6YzgwUqZF+/S7GJDu5EJwHUxs9pMESGtzBiEptDuKPFn+aFl1zkQA/zBdnLkr4YiH5MrEFnlqzkiMdxAMMKHSq13unAOxeSG/0g3736Q4+qmP1YQirzTKwv71PwbBwP8utODyYbTextr7w52bOR7lb/o/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IfKc/qRH; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IfKc/qRH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YT9Bs652Lz3024
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 14:24:53 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5090lRFL016024;
	Thu, 9 Jan 2025 03:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ev41ny
	e3EYCrH/8qKuYkTcjX/MgP5c6SOfM76NspYuQ=; b=IfKc/qRHSi3too9zjUGngr
	yd5Whg+EMcZmvDUFrUhW0Vvr/nJUD1aLtTTlMT+em4RdcDGZa2UCn7tINV1yewaC
	gmvbQSrvi3qySpIONBfn0BSI+s/rKIxzByrmgTVAAXwwAUBD2mKHuMi++XORau0+
	DstnVuMrpaC+CByzxeAT2B4ucghcNdUJDbqnIsn3hZiCS+FsOB1ll0evW1ncdCNa
	FSd06hoWxqCdGrX9Bjv7CM/kTZ2mFd716aw1920yBcjoCS2d9jTr+DFUmPWFeLn6
	bV3sJJsmEydfmTmv9eiN84o+BYpizEAdfWz5rBK1ZjDadOhE+h9WBE8RIuIOsMig
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441huc5st0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 03:24:40 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5091oCht027963;
	Thu, 9 Jan 2025 03:24:39 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yhhkawqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 03:24:39 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5093OZ2Y56099216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 03:24:35 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAEAC20049;
	Thu,  9 Jan 2025 03:24:35 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E983E20040;
	Thu,  9 Jan 2025 03:24:32 +0000 (GMT)
Received: from [9.43.18.121] (unknown [9.43.18.121])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jan 2025 03:24:32 +0000 (GMT)
Message-ID: <bbad32bd-20fb-4d7b-8744-25d4c3fa7f8e@linux.ibm.com>
Date: Thu, 9 Jan 2025 08:54:31 +0530
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
Subject: Re: [PATCH RESEND v1 3/5] powerpc/kdump: preserve user-specified
 memory limit
To: mahesh@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
        Baoquan he <bhe@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
 <20250108101458.406806-4-sourabhjain@linux.ibm.com>
 <k2eoi22mh5lod4nzee3qfbaagh36yljcqwxcyvvewmzbktcual@mzleqvtlojj3>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <k2eoi22mh5lod4nzee3qfbaagh36yljcqwxcyvvewmzbktcual@mzleqvtlojj3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bZFNVDDvboEUw35uLegZ6MU7qopIFoUk
X-Proofpoint-GUID: bZFNVDDvboEUw35uLegZ6MU7qopIFoUk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=850
 bulkscore=0 mlxscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090022
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Mahesh,


On 08/01/25 22:36, Mahesh J Salgaonkar wrote:
> On 2025-01-08 15:44:56 Wed, Sourabh Jain wrote:
>> Commit 59d58189f3d9 ("crash: fix crash memory reserve exceed system
>> memory bug") fails crashkernel parsing if the crash size is found to be
>> higher than system RAM, which makes the memory_limit adjustment code
>> ineffective due to an early exit from reserve_crashkernel().
>>
>> Regardless lets not violated the user-specified memory limit by
>> adjusting it. Remove this adjustment to ensure all reservations stay
>> within the limit. Commit f94f5ac07983 ("powerpc/fadump: Don't update
>> the user-specified memory limit") did the same for fadump.
> Agreed.
>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks for the review.

- Sourabh Jain

