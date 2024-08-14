Return-Path: <linuxppc-dev+bounces-80-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1109518C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 12:28:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tG1U1AuQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkPcR3kkFz2yN4;
	Wed, 14 Aug 2024 20:28:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tG1U1AuQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkPcR0sphz2yMP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 20:28:54 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47E9sxES005938;
	Wed, 14 Aug 2024 10:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	wsCflusLTFMVzYZOgZiyUuEPS3Uo+IFUKvfXn6Ev4BE=; b=tG1U1AuQoc5Dm7zs
	sXBLeijeeFMjFi+Ggjy/OJwL1wfKx8ZF8gf2Mxdk1+DffdeuCS1giwTunEymcMWx
	+O/CvaK82NS4t4DpymC8lqnE5vJTU8nacZzxLlAGPCeaBniSzrQnt0irnmw6f7d1
	lpqtfKN2Xec6kZiX+YQLabmq8bitQkVk6ngTFIeUjlp9/2YSfusBaHIoKX7ui82X
	fmPWXxT3M55sY/ZXQTpuzGoTlk8liWYFZvEo61MdbPUXQ+VmBG4BjYzwimfQ6siN
	uFW3gyMJAzceCDWHYw8Nj5WOqeXYPQ0AKVMyU/dYNuQVUQrZZrD2KNZgUF3hSExn
	BTzzLg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 410tc5040g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 10:28:44 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47EASidl007686;
	Wed, 14 Aug 2024 10:28:44 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 410tc5040c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 10:28:44 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47E9UPSd010079;
	Wed, 14 Aug 2024 10:28:43 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40xjx0s0w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 10:28:43 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47EASebx24838718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 10:28:42 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA1D158075;
	Wed, 14 Aug 2024 10:28:38 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FD775805F;
	Wed, 14 Aug 2024 10:28:36 +0000 (GMT)
Received: from [9.43.22.252] (unknown [9.43.22.252])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Aug 2024 10:28:35 +0000 (GMT)
Message-ID: <ba6aa623-5098-4236-a015-33c72a2150f2@linux.ibm.com>
Date: Wed, 14 Aug 2024 15:58:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/xmon: Fix tmpstr length check in scanhex
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
References: <20240814100939.647305-1-maddy@linux.ibm.com>
 <CANiq72=j3Ui_2YTsBUnvg8APJtDbuMRwvzpnDvToeMa98-pNxQ@mail.gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <CANiq72=j3Ui_2YTsBUnvg8APJtDbuMRwvzpnDvToeMa98-pNxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gO8LE3P1ozO-c5H28H1UDJs_2bAVuWpV
X-Proofpoint-ORIG-GUID: hGo-3jh8NbTLn9V2IcURtGzKubwGoiPN
Content-Transfer-Encoding: 8bit
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
 definitions=2024-08-14_07,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0 phishscore=0
 mlxlogscore=612 suspectscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140069


On 8/14/24 3:53 PM, Miguel Ojeda wrote:
> On Wed, Aug 14, 2024 at 12:10 PM Madhavan Srinivasan
> <maddy@linux.ibm.com> wrote:
>> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Link - https://lore.kernel.org/linuxppc-dev/87ilc8ym6v.fsf@mail.lhotse/
> Thanks for fixing this!
>
> The "Link -" should be a tag, i.e. "Link:". And, in this case, since
> it was a report, I think it should be a "Closes:" instead, and thus it
> should be put below the "Reported-by:" and it should point to the
> message of the original report, i.e.
>
>      https://lore.kernel.org/linuxppc-dev/CANiq72=QeTgtZL4k9=4CJP6C_Hv=rh3fsn3B9S3KFoPXkyWk3w@mail.gmail.com/


Ok thats was fast :)
Thanks for the review,  Will fix it in v2 and also will check and add 
"Fixes" tag part.

Maddy

>
> I am not sure if a "Fixes:" tag would apply here, though.
>
> Cheers,
> Miguel

