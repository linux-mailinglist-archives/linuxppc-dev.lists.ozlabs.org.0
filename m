Return-Path: <linuxppc-dev+bounces-7356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFA6A73553
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 16:07:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNn7g6W13z2yTQ;
	Fri, 28 Mar 2025 02:07:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743088031;
	cv=none; b=R7bsgntSMROLCMkEPtrR7L00SxPACIo7j7v9Rc7+ZW0FeeTTMtxgTn/M9322zJRF9h6jGnIH2t0fI9px9O0BDaQGYzJSgoWJwHeQADLPtnWY58rmRSa0Ah2JyWoBVT7Aa+fy5DW3b69EL0Hz609KWB9rBj1zpCWaTm8nzs697jEtNoLZHee1MJw685/B6wJ/wjpZ/EhgO0XXQnJ9sYC4eYHU4KX7hCyvypSODFgnDxL8JdtZLSamlC/nMGVe+FkK0+c69Ob3sxXk3kwm8YVS4jxVfPdEfK9y6VAIhbNvaI3X7OIhD8B+A8Z+9oUPIEI/BkC+ycoc3fPuMWiiPXyPrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743088031; c=relaxed/relaxed;
	bh=5t2FuTUcf8lDWMstNFGFYUYddh7v205+ujjI5wCPz2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U7sCI7LXtnUXGO1mQWaru/lqedTYOIapW3Po0WivKRxfBC5MwuR9SFu0inI1N4xtTVAwIr0PccxRFWEfCC2hhsCXkV9tzSphIMSD+4DBb9WgodDfpBg6e87IelHjydhNwN1dLQFAulu8YirWxKtq2f4292ITPYvtk3yg1423arF6p2aIJj1zL+zUZYmEvKvQAnoTKi4AoYRcJzNU5lGxxAy0AP5b7GnQ0Sar6kshoAu9g/358DnzultktzfGcxW4oJwQmMg1Rg6YGQyxWAwYovJXgiOkXvJHdvKrkwPp+jzboLtrRadIo1ndzLDB+jIFbV57P7uFbLW1KrEKJxTK7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gzxjZOXz; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gzxjZOXz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNn7f2pPdz2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 02:07:09 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RDUDfZ030057;
	Thu, 27 Mar 2025 15:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5t2FuT
	Ucf8lDWMstNFGFYUYddh7v205+ujjI5wCPz2U=; b=gzxjZOXzHjHbP5KEKbbBp/
	7D/RUZAXYy1y+pgNcwpQI295nobvcx9aZ+rTmSdlJn97YAtFQearaBPdeUV+FqpP
	1QmLWyLFafd8l6bPROKMnrSdhJopDh3hAGEuJzpUZFR16/ikPrzp8vIkkgSkGHRh
	drUdijaJtzjaEZy6v7Ycz6WPLwvZhJpWbsUClW5rEXKtaorYa2Js/By7bxi1HJyb
	CYZo9z7pAAQtaqQFGmBz+tzISIIM6ZxNe9eVwP4izmKXdWIeTyuylhTkOxwCWrlO
	ChiSKNFYHmhI2LeFzDY2pfQJJHcojF7s3/Hw6gfZ0zHxBB8FBUaiFGa9pXFsVo6w
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45my29bc97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 15:07:06 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52RDJFvn005801;
	Thu, 27 Mar 2025 15:07:05 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45ja82nkfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 15:07:05 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52RF74f021168646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 15:07:05 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A455E58059;
	Thu, 27 Mar 2025 15:07:04 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 355215805C;
	Thu, 27 Mar 2025 15:07:02 +0000 (GMT)
Received: from [9.43.55.88] (unknown [9.43.55.88])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Mar 2025 15:07:01 +0000 (GMT)
Message-ID: <38653c58-a5c4-496f-9b52-e7bc3e447423@linux.ibm.com>
Date: Thu, 27 Mar 2025 20:36:55 +0530
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
Subject: Re: [main-line]Build warnings on PowerPC system
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com>
 <8797a1c4-dc58-4a85-bc51-a3d4131e7930@linux.ibm.com>
 <b5713b0b-a278-424c-8ba3-3aec01454e94@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <b5713b0b-a278-424c-8ba3-3aec01454e94@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CRp_ufsxd0MvTwnIpfsd0DTLVNXI-OtO
X-Proofpoint-ORIG-GUID: CRp_ufsxd0MvTwnIpfsd0DTLVNXI-OtO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503270102
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 3/27/25 7:31 PM, Venkat Rao Bagalkote wrote:
> 
> On 27/03/25 7:22 pm, Madhavan Srinivasan wrote:
>>
>> On 3/27/25 12:33 AM, Venkat Rao Bagalkote wrote:
>>> Greetings!!!
>>>
>>> I see below build warnings while compiling mainline kernel on IBM Power9 system.
>>>
>>> Repo Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>>>
>>> Head Commit: f6e0150b2003fb2b9265028a618aa1732b3edc8f
>>>
>>> Attached is the .config.
>>>
>>> Machine: IBM Power9
>>>
>>> gcc version 11.5.0
>> What is the ld version in your system.
> 
> Please find the ld version below.
> 
> GNU ld version 2.35.2-59.el9


ah ok that explains. Kindly can you try with this patch and let us know whether 
this fixes the warning in your setup


diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 1db60fe13802..09ceb5a42d81 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -235,7 +235,7 @@ fi
 # suppress some warnings in recent ld versions
 nowarn="-z noexecstack"
 if ! ld_is_lld; then
-       if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
+       if [ "$LD_VERSION" -ge "$(echo 2.35 | ld_version)" ]; then
                nowarn="$nowarn --no-warn-rwx-segments"
        fi
 fi


> 
> 
> Regards,
> 
> Venkat.
> 
>>
>> Reason for asking is that currently with
>>
>> commit  579aee9fc594a ("powerpc: suppress some linker warnings in recent linker versions")
>>
>> ld version greater than >2.39, this warning is being suppressed.
>>
>> Maddy
>>
>>>
>>> Warnings:
>>>
>>> ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions
>>> ld: warning: arch/powerpc/boot/zImage.pseries has a LOAD segment with RWX permissions
>>>
>>>
>>> If you happen to fix this, please add below tag.
>>>
>>>
>>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>>
>>>
>>> Regards,
>>>
>>> Venkat.


