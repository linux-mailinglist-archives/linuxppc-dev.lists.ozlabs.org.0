Return-Path: <linuxppc-dev+bounces-7357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA647A736C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 17:24:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNps66JwDz2yqp;
	Fri, 28 Mar 2025 03:24:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743092682;
	cv=none; b=VNBqjUfui905cAZLmnAH93/rJS7O6q0+9ec5OqPBPG6qn10jrwr/Ap7fqr6iq0L8ZzScKSU/80oHIIlyUsTbTUpUR2aWFJGRcHwFS//DepmpF3mKXHoj0kHia7d2PalXriPQZsmru262Sd4NSejgxQNcpiL5LIo5ma2FShBEZLPMYQt35/H2m940258If8swSNLezvLY3eoJCGs6UvRD2Z104VcYHqleUerxLVFdcAfTpAuUpd43mLym2PKTpMkP18n0CfU7ZVcF+z8z5sA/Z2y50AbeeGXJcO4R+IwG1SxymkZEJpbM2mMRGuSfO061x8YtUotINy6MkNfpsikxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743092682; c=relaxed/relaxed;
	bh=GQ7ivuoqY7MTsplWB8t9QbLTPOQ8dbOUSd+9gIXDayM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TjcpOkktNZSzPbgxdk5YY1yfc+DG/+CvP45oVJ+0eKQLSRx5Xy3D6q59to4WrtMLx20uG7FL73ebjE7K1AGECDL7Fc3rj8hz6+qgSWiRmaOZlZUmPGAsHYUrLYLaS5oRLy/u8l5TlKjGe0LyslSrUGXbuBOAE05icpPrdUyFbHAKkiTWqEo5l5QT5jARl/rUEFh91vQ+tWxydxIE3EbK06TbHnL3f72XPS0iSvfX103vydFTT1J41w7cquBlgSj22mCJ7s6PJokuPoQm+xB4lwqA10JvZO7v1T4Sznpwgw26p7xAmakZ7LL/+p0k5ppOYZyBtiE/fmy6oKYR2CROnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DPNeVo0i; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DPNeVo0i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNps54cDVz2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 03:24:40 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RDvPgC017821;
	Thu, 27 Mar 2025 16:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=GQ7ivu
	oqY7MTsplWB8t9QbLTPOQ8dbOUSd+9gIXDayM=; b=DPNeVo0iZyOK9AI5ESFHMy
	0Zsu5qlorY5RG9hUgw4b0nLuPCAJzqIicNqQuG8AswcipHakP/1Er4UWa2kCI76O
	Y4SodDycbUmQlQdS2WxEes81uH/r9lGwI1qiT9B4WsD4q+gyhWJ5SmBbNaF8QJRO
	fVweFeqFFxtt2yq2gPOrZO4EXGBzQ/z5CbNNCwzfbZ+8C6amBdHSzmNAg3/wFb8z
	7mc5u8aZktTyiKSYbmt5fSZS6vcJFSM6+lLO6/qaDBwB1oCkqAlfke5WFlbmDqj6
	NsIzW3XpzLBbSy5PKzCfSqeHXTlGCzQOK6MfNYyXkWhFUTcAuI2bOs1Dp+prL/gw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45mnrwp4nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 16:24:38 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52RFFbXU025462;
	Thu, 27 Mar 2025 16:24:37 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j7x0eass-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 16:24:37 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52RGOaJ45309038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 16:24:36 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6118D58045;
	Thu, 27 Mar 2025 16:24:36 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3406558052;
	Thu, 27 Mar 2025 16:24:35 +0000 (GMT)
Received: from [9.61.252.80] (unknown [9.61.252.80])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Mar 2025 16:24:34 +0000 (GMT)
Message-ID: <516febac-b2ba-48a0-83a4-ab259e972541@linux.ibm.com>
Date: Thu, 27 Mar 2025 21:54:33 +0530
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
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com>
 <8797a1c4-dc58-4a85-bc51-a3d4131e7930@linux.ibm.com>
 <b5713b0b-a278-424c-8ba3-3aec01454e94@linux.ibm.com>
 <38653c58-a5c4-496f-9b52-e7bc3e447423@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <38653c58-a5c4-496f-9b52-e7bc3e447423@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EGuk4gJJi_iR4eRUC5ynX8DlPgy25Q9v
X-Proofpoint-ORIG-GUID: EGuk4gJJi_iR4eRUC5ynX8DlPgy25Q9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_02,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270109
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 27/03/25 8:36 pm, Madhavan Srinivasan wrote:
>
> On 3/27/25 7:31 PM, Venkat Rao Bagalkote wrote:
>> On 27/03/25 7:22 pm, Madhavan Srinivasan wrote:
>>> On 3/27/25 12:33 AM, Venkat Rao Bagalkote wrote:
>>>> Greetings!!!
>>>>
>>>> I see below build warnings while compiling mainline kernel on IBM Power9 system.
>>>>
>>>> Repo Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>>>>
>>>> Head Commit: f6e0150b2003fb2b9265028a618aa1732b3edc8f
>>>>
>>>> Attached is the .config.
>>>>
>>>> Machine: IBM Power9
>>>>
>>>> gcc version 11.5.0
>>> What is the ld version in your system.
>> Please find the ld version below.
>>
>> GNU ld version 2.35.2-59.el9
>
> ah ok that explains. Kindly can you try with this patch and let us know whether
> this fixes the warning in your setup
>
>
> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
> index 1db60fe13802..09ceb5a42d81 100755
> --- a/arch/powerpc/boot/wrapper
> +++ b/arch/powerpc/boot/wrapper
> @@ -235,7 +235,7 @@ fi
>   # suppress some warnings in recent ld versions
>   nowarn="-z noexecstack"
>   if ! ld_is_lld; then
> -       if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
> +       if [ "$LD_VERSION" -ge "$(echo 2.35 | ld_version)" ]; then
>                  nowarn="$nowarn --no-warn-rwx-segments"
>          fi
>   fi
Above change fixes the issue. No warnings observed. Thank you!!
>
>>
>> Regards,
>>
>> Venkat.
>>
>>> Reason for asking is that currently with
>>>
>>> commit  579aee9fc594a ("powerpc: suppress some linker warnings in recent linker versions")
>>>
>>> ld version greater than >2.39, this warning is being suppressed.
>>>
>>> Maddy
>>>
>>>> Warnings:
>>>>
>>>> ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions
>>>> ld: warning: arch/powerpc/boot/zImage.pseries has a LOAD segment with RWX permissions
>>>>
>>>>
>>>> If you happen to fix this, please add below tag.
>>>>
>>>>
>>>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>>>
>>>>
>>>> Regards,
>>>>
>>>> Venkat.

