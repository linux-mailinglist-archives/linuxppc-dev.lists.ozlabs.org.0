Return-Path: <linuxppc-dev+bounces-6661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC04A4D3DC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 07:28:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6Qk44Vgsz305D;
	Tue,  4 Mar 2025 17:28:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741069724;
	cv=none; b=eguJ8MnqEr9/7HM1vUfplsJW7b37vRb2V/EYB5rnAjdL+nT03QbxBjD+M9/zINrxNt9opfiqklF4ZJFMYmKrrCbpU8ieNG1LAWAF6cGKX7RDYIxZVJv7CEPb5bdlhM7w5fR1ILGcAa/1fhOS1yZX8LNhWwF5rWpkyqGXY6uAh882yeK49z7Xccg9UR6qZIKSXpUcvfYAAIRTMUMqoUkEgehvQydoTDtTASfOIGPqATKGgkrxPnpAyTZcGcHkTfg7aQCFTJ/dXVpDpTfof9+P1qJiUCjDaZcRUDAPsKmdT5SV7kTC6gYozvzZo0zrdMwFzhGbvqyGeuY0fn7vypaW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741069724; c=relaxed/relaxed;
	bh=cNUqlSorz0hTRYHCVAT6HlL4WN4AHcrWFBeNm6gRh/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFubEvkmjmAtEeh9CAOTzkv5eg5hM7ttGkMWdPgVOtd1/ZvSXGz31oBp4QHUW+UJ281wtbLFsLEvbdWszKF4ronOA4NH4ev5NRshV7U/ZA6aDb+7Mb1FLmOdqJvtAtLikhtTwx9PjIbp+7qaZlicRO7f5UQElBXaTx83ATtwL5/2LANv+q5U4IOk6kh8JKtrKuU/UqR0AYlkffGTrfVw9edolF4wgwy046J+SYr1QxmbvD4AtV5AV21L1PEfD0LB+EkSla1LUVkV0sFv8pHnxy2aqp+tt/jv40+ZF2o6RX5O/aNVGIaAHNbzZ80o8vRcPkpo15V2PUEyIF61072hfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O84e0bh8; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O84e0bh8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6Qk34j8bz2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 17:28:43 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5243jobs021779;
	Tue, 4 Mar 2025 06:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cNUqlS
	orz0hTRYHCVAT6HlL4WN4AHcrWFBeNm6gRh/0=; b=O84e0bh8lAeRb2J7gJNmeH
	QFkDuo4sdUoGA9+3uo+BwLY/TTnNoXAlr072JzF4Fu/k1Ug/JcW2MTynGOBvY3Dm
	AW9lzlF43I8i/inIxVB3pWKEMNOzfyYLaDLR93T75mfL21Q68H781snqX37G/NxD
	UK7TAIu0a79gF0ZrmKB5myayiQ99eU19u6cRgspKj/2V06ueEwCUMk3UH93z0EIk
	CK4MPXfrub5RkMbx7Ymj0smLnYhFaIAUjGhzYHsfTUJUH0g65TF6QYkMZJrOxdHI
	Htf8VSj/gXCzVPN5zoaQAQjcv/2f1HSwfHsKtVws5ZxYgc9GCl/XsF7DnBE1MCtA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 455sw7gnq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 06:28:40 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52432CmR032219;
	Tue, 4 Mar 2025 06:28:39 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 454cjsv777-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 06:28:39 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5246SdWK17433174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Mar 2025 06:28:39 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F17DB58059;
	Tue,  4 Mar 2025 06:28:38 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9607458055;
	Tue,  4 Mar 2025 06:28:33 +0000 (GMT)
Received: from [9.43.105.169] (unknown [9.43.105.169])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Mar 2025 06:28:33 +0000 (GMT)
Message-ID: <9921ee1a-fbe1-4ffe-9490-5cd62714e3ec@linux.ibm.com>
Date: Tue, 4 Mar 2025 11:58:30 +0530
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
Subject: Re: [PATCH v3 1/1] cxl: Remove driver
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        fbarrat@linux.ibm.com, ukrishn@linux.ibm.com, clombard@linux.ibm.com,
        vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        Andrew Donnellan <ajd@linux.ibm.com>
References: <20250219070007.177725-1-ajd@linux.ibm.com>
 <20250219070007.177725-2-ajd@linux.ibm.com>
 <9190bfed-8ecd-4941-9297-a8b29c9c47f4@linux.ibm.com>
 <yq1frjttt41.fsf@ca-mkp.ca.oracle.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <yq1frjttt41.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TmI2lBxqPyPlv9udpqYAaqVg5ICVAWP6
X-Proofpoint-GUID: TmI2lBxqPyPlv9udpqYAaqVg5ICVAWP6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_03,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=482 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040053
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 3/4/25 8:31 AM, Martin K. Petersen wrote:
> 
> Hi Madhavan!
> 
>> This patch has depenednecy with the first patch 
>>
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2025-February/280990.html
>>
>> Which is already part of your staging tree. Can you please
>> take this patch along with the previous patch. 
> 
> If I merge the main cxl patch we'll have another conflict due to the
> docs patch below:
> 
>>> [0] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20250219064807.175107-1-ajd@linux.ibm.com/
> 
> I don't mind taking both patches but it seems more appropriate for a
> major feature removal like this to go through the relevant architecture
> tree.
> 
> Maybe the path of least resistance is for you to put the cxl removal in
> a separate branch and defer sending the pull request until after Linus
> has merged the initial SCSI bits for 6.15?

Yes, I agree and I was thinking of doing it, but wanted to check. 
I will send a separate PR after SCSI merge PR. 

Thanks for response.

Maddy   

> 


