Return-Path: <linuxppc-dev+bounces-5763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9474FA2477B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2025 08:17:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YlPG66p2qz2xk1;
	Sat,  1 Feb 2025 18:17:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738394222;
	cv=none; b=IbjhOVDUhK6HzGx5rSzybok3Qk+J7m4og6Tyq3G0pyf2AWjBPIczrJMTHH/ZyhNHjeDAg6xEymWm3JZ29D+TNkOuhwV9KhogeTaekm2pZfxBBL7yrrXES1HEkk+ekJv0Jgr6bOKIr/aOitIryyx8K/ELAH/io4d+9ZUVfe2png6Ac6x43ceviSZT0L5mIuZFf3uTcqHXwdPBDwPYFzVo27VcTvmEwwJRNP+VG92wmBWUt5/rtojjiwe0IX/QafFYho3cpA9tWONHp/0eVYhmP1AeVgmRBZCitdxpQOcMjqXqR2awWdYTA5xUC5LSfFBAxhIA4o3TTy/prUsM9olOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738394222; c=relaxed/relaxed;
	bh=D0TqJrPFaCXJx1YuFrFi+B5yfQlPzZfk7qSonBtEN+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4IwjaQaZ3WkeaAAl2XK0KRm2h7s4AIfuz/T3JkD/yZoZIhE56X40QWNByrJHwg9CZVNG+gg5azxW3qesg00Ho7nJsKulgnEE1Ljpbx6aY7ulVAnFIJ4vRYnmQSsxoLPeGBJTW01haQ6gExhcF5oKFwqZgAksDy003Y/nqbu9RNgTC6I6Vg7odNWp0bVJ/fywL2gZ2BdfYUk02qYI8vJC4WTPIgKgGjQsfu387cHqQ7rjlh+VwYxWjcKhmBdZr67Xzn3+fbAhWwWcSHRbWCNO0axmmy8BgrOkzVK4twNttmZK20zBuNzWWf3f2AfFkGSRTXBN+44pDsuKBBi5mUKGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NGdlSk2C; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NGdlSk2C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YlPG55nJtz2xYr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2025 18:17:01 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5115P2Cd023403;
	Sat, 1 Feb 2025 07:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=D0TqJr
	PFaCXJx1YuFrFi+B5yfQlPzZfk7qSonBtEN+c=; b=NGdlSk2CCbM5ZtHVxYY0su
	oY+VLN7+m6hmEuDFS46fDLuzGlIHoLNLAtXba3nV45KEI1T8ITmUjwXxqS82ipFx
	hAXjhzf2rNEGnCn62mnICY/PX7M8FTESnNka6ewtxJvyPJv5CqQok4RzxvHgforK
	kXxzMwSinHjOJQxu1NdIyjYVk8g956pKcNVeCOPrn6+9jKPFUCixKt4cUNaSX3QH
	vVfDO2JrW8jyBReVw5keuBF/4CyyfcgPEz91oDwf5K/5vvoshDYCcib9FJ6fl/Va
	JFjnwlm1Rd37fEHSuQSqakpwJGovNIhOGz+klu6spxVjigHNxzUFeFDlw9WBfVZQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44hdce886b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Feb 2025 07:16:48 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5115Cr40029818;
	Sat, 1 Feb 2025 07:16:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44hd92rb7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Feb 2025 07:16:47 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5117GiRX37880182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 1 Feb 2025 07:16:44 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A73620094;
	Sat,  1 Feb 2025 07:16:44 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5713D20092;
	Sat,  1 Feb 2025 07:16:41 +0000 (GMT)
Received: from [9.43.103.42] (unknown [9.43.103.42])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  1 Feb 2025 07:16:41 +0000 (GMT)
Message-ID: <e7e371cc-cb34-4ba1-8aa5-c18ec3802d9a@linux.ibm.com>
Date: Sat, 1 Feb 2025 12:46:34 +0530
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
Subject: Re: [PATCH v3 3/7] crash: Let arch decide usable memory range in
 reserved area
To: Baoquan he <bhe@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
 <20250131113830.925179-4-sourabhjain@linux.ibm.com> <Z52hUz5/nZhzTUb4@fedora>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <Z52hUz5/nZhzTUb4@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IxliJALJ4rLAy8ZlFpwTVM7tGofSRKlj
X-Proofpoint-GUID: IxliJALJ4rLAy8ZlFpwTVM7tGofSRKlj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=779
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502010059
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Baoquan,


On 01/02/25 09:52, Baoquan he wrote:
> On 01/31/25 at 05:08pm, Sourabh Jain wrote:
>> Although the crashkernel area is reserved, on architectures like
>> PowerPC, it is possible for the crashkernel reserved area to contain
>> components like RTAS, TCE, OPAL, etc. To avoid placing kexec segments
>> over these components, PowerPC has its own set of APIs to locate holes
>> in the crashkernel reserved area.
>>
>> Add an arch hook in the generic locate mem hole APIs so that
>> architectures can handle such special regions in the crashkernel area
>> while locating memory holes for kexec segments using generic APIs.
>> With this, a lot of redundant arch-specific code can be removed, as it
>> performs the exact same job as the generic APIs.
>>
>> To keep the generic and arch-specific changes separate, the changes
>> related to moving PowerPC to use the generic APIs and the removal of
>> PowerPC-specific APIs for memory hole allocation are done in a
>> subsequent patch titled "powerpc/crash: Use generic APIs to locate
>> memory hole for kdump.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: kexec@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   include/linux/kexec.h |  9 +++++++++
>>   kernel/kexec_file.c   | 12 ++++++++++++
>>   2 files changed, 21 insertions(+)
> LGTM,
>
> Acked-by: Baoquan He <bhe@redhat.com>

Thanks for the Ack!

- Sourabh Jain


