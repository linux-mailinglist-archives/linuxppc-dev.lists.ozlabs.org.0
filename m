Return-Path: <linuxppc-dev+bounces-8441-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569ABAAF841
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 12:45:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtTKy54jzz30T9;
	Thu,  8 May 2025 20:45:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746701110;
	cv=none; b=CP1Jp1r+Aneq7Pi/X04NzBd8qgJgpou7iboqY20kp2DkCA5b6wyGd0o9OKsYxtF8VY64Qm4g8uFo1ld4JG8HfQjDwG6WozFGG8xr64yJn/hR+9TWJcMANeUW4fj1j+ktOk+AqQqapbsxKLqfRfLXSHnI0lN46JsMSxjjFfCAYb7151IfQMNjjeDJUFVwy9YPvm5m4Nf9Qy1MvLGXoaBE5PSDFDUdM1RbnKr65pFKRZWQhZmaysrtCUirv/fTg6jijednAH75mWFLbbIr2gyV3yPi44euJVKb2n6F54s+z0lu/KSpP08g3CSqb3I8cklYbO+cqpnE7Lplpg4+3vwDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746701110; c=relaxed/relaxed;
	bh=nJT2ggn7bwVZKUtfsOL3vHC4YrRX+weBD8PdIk3jUbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ip1HBcRitSFoAVxSA+3Bry6DIbnXRSyLqvRJIhnwVhI7J/XWmX5N1NUMwxS+7YMlh1sKqpGV8pKIHVrkcpePH/v6SS1h5/cM2MXY/T/xD/zmN9Pk1FIeV3DDJA/SC4EheNEY039/Ly0usAqNpc3M21PpmN2pULg6A+TPbUcOkFRynNpwDnePpO7fWalvlzHXXKMtzq5wBBKEywb9DorYPtuwD+31SQOg/5+0+R0ZBTSOezUNL6HgM5gouKI0bRpH2wIhYo392fKTdu3nBD4PVuf9nlCl50q0aZEXXYI7IkSLBwxSgW3s0R+zC7/5ozsM1nW89/g6q91KJ2Imlj1KaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BAN4lPKD; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BAN4lPKD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtTKx4MNvz30Kg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 20:45:08 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548A45F8025931;
	Thu, 8 May 2025 10:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nJT2gg
	n7bwVZKUtfsOL3vHC4YrRX+weBD8PdIk3jUbE=; b=BAN4lPKDfzNrtN7N1qreHq
	oj+zW4LR5LNwEbZOQ/sjDe9iJlH0iAtEh6VjpZ5fYTO+yRwQKai2Y8VOXfnTZFhH
	hytj1oqqY+pwDM9+vhPPNqs7XUGHAoJONp8nRXyHK2cSTqXj4IVLMYWJBhIwvgKS
	V97Rb69yRLtIQd/T40D4rnCIjvkJhQ9wV9QUkdnitF8st/mTu4dU5Kgk/5Xm31oj
	/VamKRaZihxaGmDoMIn0cR+aqKw1bXdtjWWFWFSXHWDB5xJXOCwq6XWG952iCVIk
	D+e3RMVTo//Dmw76/ZmnyILisTPftHmDuvwyNi6HPyydeHEO+C26FfVelU8YfQKg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46gthk85b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 10:45:03 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 548AbfG0003017;
	Thu, 8 May 2025 10:45:03 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46gthk85b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 10:45:03 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5488uGZD025807;
	Thu, 8 May 2025 10:45:02 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dwv05h3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 10:45:02 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 548Aj14227591198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 10:45:01 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0523E58055;
	Thu,  8 May 2025 10:45:01 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C73B458043;
	Thu,  8 May 2025 10:44:57 +0000 (GMT)
Received: from [9.61.251.83] (unknown [9.61.251.83])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  8 May 2025 10:44:57 +0000 (GMT)
Message-ID: <3096704a-84ec-4709-89ed-43ab1ed2b7c1@linux.ibm.com>
Date: Thu, 8 May 2025 16:14:56 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next-20250320][btrfs] Kernel OOPs while running btrfs/108
Content-Language: en-GB
To: dsterba@suse.cz, Filipe Manana <fdmanana@kernel.org>
Cc: quwenruo.btrfs@gmx.com, linux-btrfs@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, ritesh.list@gmail.com, disgoel@linux.ibm.com,
        David Sterba <dsterba@suse.com>
References: <0B1A34F5-2EEB-491E-9DD0-FC128B0D9E07@linux.ibm.com>
 <CAL3q7H7PqVRnDuooSr6OhvUQ3G5V2gq6VEDpqTqNX9jHmq97aw@mail.gmail.com>
 <20250507141409.GG9140@suse.cz>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250507141409.GG9140@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA5MiBTYWx0ZWRfXxZhfHbnLKTGo MXT51QjgtpNO+loqTo6x0GPLrojfW+GV6YRxUeASgKgpyMpyrYTdBPy7Gc5phmLQyjMTl0lMBcn 4StsZ4S7V8zdihm3gHi5QMYhmArsuzKtpbJiyhRvFqBrE1osufXcinPahgeN3B0o1KFvramrLoL
 3QdgFJJeUuGTX1Ss1HvnrxP5rlqswzPah9CdXkUygT5AvZiS3JiIZGBZyEt1arWgSYP6F3JhyIQ Zpsblq1uM/QzDOZCOwx83YQmH+q70iIs83/pdQqypoSeUm1V80+tP7ak4LmVKIed6Rq4VZpWyx/ ZSTlgUvXJyzPJ4RfutbGZqZvD+Qg3uCR6BnpdeYquzrSMRxeDGF/plKFoJHYxp4A9t1Azdd66pb
 S9NLrRMymYupF1TbvKLnxM4GNlmmRbw/cpku1HLNainoQeODh1t3ufOVrcurgjSTrEBgOqrq
X-Proofpoint-ORIG-GUID: EJxHnfxn_acDMBKrqGIdfu36KiRKjQW0
X-Authority-Analysis: v=2.4 cv=PvCTbxM3 c=1 sm=1 tr=0 ts=681c8b2f cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=7YfXLusrAAAA:8 a=VnNF1IyMAAAA:8 a=Zg4ZsEA-DVCyg4mgyWsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=SLz71HocmBbuEhFRYD3r:22
X-Proofpoint-GUID: 4jh3IAg_uquEpSCTg-CSJYtPhnNB950_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080092
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 07/05/25 7:44 pm, David Sterba wrote:
> On Wed, May 07, 2025 at 02:04:47PM +0100, Filipe Manana wrote:
>> On Wed, May 7, 2025 at 10:02 AM Venkat <venkat88@linux.ibm.com> wrote:
>>> +Disha,
>>>
>>> Hello Qu,
>>>
>>> I still see this failure on next-20250505.
>>>
>>> May I know, when will this be fixed.
>> The two patches pointed out before by Qu are still being added to linux-next.
>> Qu reported this on the thread for the patches:
>>
>> https://lore.kernel.org/linux-btrfs/0146825e-a1b1-4789-b4f5-a0894347babe@gmx.com/
>>
>> There was no reply from the author and David added them again to
>> for-next/linux-next.
Added again, was this removed? Can you please point me to patch or 
commit id. I was under impression, it never got removed.
>>
>> David, can you drop them out from for-next? Why are they being added
>> again when there were no changes since last time?
> The patches have been there for like 4 -rc kernels without reported
> problems. I will remove them again.


David,


While reverting those patches, please add below tags. And really 
appriciate, if you can keep me in CC.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Reported-by: Disha Goel <disgoel@linux.ibm.com>

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Closes: 
https://lore.kernel.org/all/e4b1ccf8-c626-4683-82db-219354a27e61@linux.ibm.com/



Regards,

Venkat.


