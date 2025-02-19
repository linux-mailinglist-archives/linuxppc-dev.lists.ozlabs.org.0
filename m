Return-Path: <linuxppc-dev+bounces-6337-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7147BA3B0DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 06:24:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyPvN6fVNz2yGM;
	Wed, 19 Feb 2025 16:24:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739942640;
	cv=none; b=E0Bv+CP3bAqvHxi6KtCjvhdGINhdGjoHt9lg0SOGqO51X3C94rLOMjORCHvyhYeORXkrX+SpY7Ri8tz6IX6YTZV4n0ODGJubdXJ8Wnxa7f+6iDL7bpdObnC25W6B+hqctI0yAOoQ+i+nsXeYHqKMpNDrid107fIo+0/VSIlB97Cc0jg/xIhORORCltpntY156TwhDHgIUaL9f6LNfZ9ugwBYsNM9EskQXf4UvqvDPPvx63fJqfBvsqyqaCkOtbcBHopEXFuYbcsSERpRSI6ypFa5rXlzVDjouNlsZ8t52ojGb/vkosWhfKnt3YsDzlBTAevsZ2JhxEA6TbaCgAaO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739942640; c=relaxed/relaxed;
	bh=kk7+QVEj19NZp6WkIhyvV8dyYoqmsPfwZQd5jboUv10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ift+4PZQrAVy52tHrnIZ5fl3Mdn+e1kvvDO0kGaxYey2yHagmfh5x/1enuJYRVWbLGclDBgmgsbq69/cSnYsCFBF71gFO/J6/86PSdcY7AKh+11nvL9Ei/gJShJELWOPy2K/wq4l9HzOJOrERyEAJ6rZ08O3+DA68Ekmf2JiP1LCQpS0fxO6Q2Q/yDHXzsrSh8TLcoqPk5a2DIVmROiyno9ijs25Kqd+sVBGaDieWEb1JScASm7SAtxkDtFNsF6ljx8A1GSKuyVgF7B3j2zozksO3FK7SJpslR5DK+m85SMy359g97tvzuxVG/EYWPy+tlLgRRSzv/JcZzW9MbI25g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FXedfW88; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FXedfW88;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyPvM5Xpvz2xtK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 16:23:59 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J20dwm029252;
	Wed, 19 Feb 2025 05:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kk7+QV
	Ej19NZp6WkIhyvV8dyYoqmsPfwZQd5jboUv10=; b=FXedfW88sgZ16A+UOXtxN6
	z0kEbh60ly20s8kEPj9Sr54Un/95N27kHFrZvNfGCqIen5bYBm5pdWOsPx96cw+U
	MRIRWxq277azCge6C8QR7367CeykjHLt8IU2G4V8B5FdfdZBQ0BMF3lHhfYRqqUy
	qeMC7Au/cupAmTOq3AqoLB+jGrwBVX25g2xjUnLXfT+jXZAO+zvnqqrmHsCKQzD4
	bmdsy+ZLm8JYYQkAO+flFbRnC1ey0BNfrS9fbXX/hUAtInl8ugcaliSluaQUktr+
	3Aab8CCwNEHjmU9X0Yl3p2tGxOd26wUnPnzTciNaylMlznsL/YS8HY/ni2ti70yQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44w6508kw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 05:23:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51J2obEO005776;
	Wed, 19 Feb 2025 05:23:45 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44w02xaag0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 05:23:45 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51J5NibM28181060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 05:23:44 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F9AC58052;
	Wed, 19 Feb 2025 05:23:44 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB4B15805A;
	Wed, 19 Feb 2025 05:23:39 +0000 (GMT)
Received: from [9.43.108.86] (unknown [9.43.108.86])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Feb 2025 05:23:39 +0000 (GMT)
Message-ID: <6d17f7d6-a508-4e81-bfaa-c8cf45a71a3e@linux.ibm.com>
Date: Wed, 19 Feb 2025 10:53:36 +0530
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
Subject: Re: linux-next: build warning after merge of the powerpc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>, martin.petersen@oracle.com
Cc: Andrew Donnellan <ajd@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250219154649.49986660@canb.auug.org.au>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250219154649.49986660@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5_8__2iVXqbKYg8q0frquZGcAvjmXywZ
X-Proofpoint-GUID: 5_8__2iVXqbKYg8q0frquZGcAvjmXywZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_02,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=942 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1011 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190036
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2/19/25 10:16 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> WARNING: Documentation/ABI/testing/sysfs-class-cxl not found
> 
> Introduced by commit
> 
>   5731d41af924 ("cxl: Deprecate driver")
> 
> The reference is from Documentation/arch/powerpc/cxl.rst
> 
> I don't know why this has appeared just now.

Ok IIUC, 

There is a 2 patch series to remove the cxl and cxlflash driver

https://lore.kernel.org/lkml/20250203072801.365551-1-ajd@linux.ibm.com/T/

Now Martin has already applied first patch (cxlflasg driver removal) in 
his staging tree

https://lore.kernel.org/lkml/20250203072801.365551-1-ajd@linux.ibm.com/T/#r8d7bb4c05256551cdcd6b7b563a8255409b07d70

Now, I was looking at applying the second patch in my tree,
But it is not apply cleanly and has dependency.

So Martin, I can send my Acked-by for the second patch, 
can you take the second patch also via your tree?
which will resolve the issue here 

Maddy
> 


