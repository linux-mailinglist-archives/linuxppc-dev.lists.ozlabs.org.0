Return-Path: <linuxppc-dev+bounces-3450-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 231519D3E84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2024 16:07:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xtl8P2BTRz2y0K;
	Thu, 21 Nov 2024 02:07:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732115237;
	cv=none; b=i/dSq9D7myOIhvrSI7F33xC2tGiFO+SEaliH35V8OcS5wWWdYSMmGQ8I3eWiD8OTmGIxh0LyVLoAs9fLoJvgBKSTMGatnLhIgV+/S2KDfZcHhF5v5eA1ZsYRBrFveX+OslP4R+ctzIY4BHZKGTLCYrTUsMucJA7Wf+/p4p9zHuB0HMX6XvosqoK7s+wj5eX3dh0y3csa+Mw8oeCcjS8+///2DBUkDWugBEBB9o+Insab3WlmqCzS0T0IVCR9FaX9EMa+bgFzu3OO0y08Z2ARCNzL+77kDWqjxrihxCz3WKuOweIAlxod+oeUKqTVX2dYbi8yMZslhR0CilAwFvxKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732115237; c=relaxed/relaxed;
	bh=MNtJV4GQJxQNjXf05f1XeKL9OhkbYiYRSSqjWf9gb6o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G5HGbKDn8lXEhdeybYQrr7Ol7TaRDTMAPdlp4iWJNuA13evvfKkIL51Rcrt9m0E+IVGLxY1Byh3FtTRhNJXHHO0VZtNlDOqTA/McsPxGamcolbwtQ+iJ2xDW1e0pvYhmQrBOCTDaPZRvB637ThmHlOqVE5RDpQW6MOz3R1Rbx5uIM3qOhf6HsWgHLj4svjlS2TfYl5a1J8V/Y9m15nhvFQuDPEMaafj0UXzkQJ2b+VrHZEhd6OseOfSup/y2cRNAmmVQCb2uH7mF10A/LdrerBYnX4CeNsL/Nfy90CpsxfxOZmrwH1b6sn3FPv3CviU6p/ocyrSaJV1CLqmE4SjCEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M+FUHra/; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M+FUHra/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xtl8M5wrrz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 02:07:15 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK7gCb1027509;
	Wed, 20 Nov 2024 15:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=MNtJV4GQJxQNjXf05f1XeKL9OhkbYi
	YRSSqjWf9gb6o=; b=M+FUHra/I84fgjGUSc0PSMD7gsm+RhVtYoKstFozzAEoz4
	Twrxgym/RTBie3M5Y7XprVWUfaL59JqR/qXe7UvbocVLgYybS0mdkguapv8+6hqA
	h6BeO+22rQjYYKNk9lqiBB4LX9PO9N8XZJeWplwYu61ARGL+fYjh6LnI8tkl5bU1
	hBxW9wvyp7eVBxYBrqmKF+4S2NbMN5UA+scIr8SOk7ky9jZEJTa+3AyCqR9gi+ee
	Swgo013Xc3Lntj6/W+dZAxIU7R9QoGzvHJvzrvk9mkoriZL6SX+7r/p7Afr3mBOr
	T1x/PXkv5NfMrWIkWvrKdR0zxzJu5h4FfyAwS7hA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xhtjwjk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 15:07:01 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AKEZ8x4001403;
	Wed, 20 Nov 2024 15:07:01 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xhtjwjjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 15:07:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKE3o5c030920;
	Wed, 20 Nov 2024 15:07:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42y63yvhr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 15:07:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AKF6ukg54460840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Nov 2024 15:06:56 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CE4A2004B;
	Wed, 20 Nov 2024 15:06:56 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F76020043;
	Wed, 20 Nov 2024 15:06:52 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.221.111])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 20 Nov 2024 15:06:52 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 20 Nov 2024 20:36:51 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Narayana Murty N
 <nnmlinux@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        linux-kernel@vger.kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, maddy@linux.ibm.com, naveen@kernel.org,
        ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries/eeh: Fix get PE state translation
In-Reply-To: <87ttc8d0vf.fsf@gmail.com>
References: <20241107042027.338065-1-nnmlinux@linux.ibm.com>
 <87ttc8d0vf.fsf@gmail.com>
Date: Wed, 20 Nov 2024 20:36:51 +0530
Message-ID: <87cyiq3px0.fsf@vajain21.in.ibm.com>
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
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ch3WGdkmSRlpPittI8EafON0y6XvPe1r
X-Proofpoint-GUID: nDR0RN2ZvcaybgFb48LL70CR94XwNhBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1011 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411200100
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Ritesh,

Thanks for looking into this patch. My responses on behalf of Narayana
below:

"Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:

> Narayana Murty N <nnmlinux@linux.ibm.com> writes:
>
>> The PE Reset State "0" obtained from RTAS calls
>> ibm_read_slot_reset_[state|state2] indicates that
>> the Reset is deactivated and the PE is not in the MMIO
>> Stopped or DMA Stopped state.
>>
>> With PE Reset State "0", the MMIO and DMA is allowed for
>> the PE.
>
> Looking at the PAPR spec - I do agree that it states the same. i.e.
> The "0" Initial PE state means the "Not Reset", "Load/Store allowed" &
> "DMA allowed" (Normal Operations). 
>
>> The function pseries_eeh_get_state() is currently
>> not indicating that to the caller because of  which the
>> drivers are unable to resume the MMIO and DMA activity.
>
> It's new to me, but could you help explain the user visible effect
> of what gets broken. Since this looks like pseries_eeh_get_state() has
> always been like this when it got first implemented.
> Is there also a unit test somewhere which you are testing?
Without this patch a userspace process performing VFIO EEH-Recovery wont
get the correct indication that EEH recovery is completed. Test code at
[2] has an example test case that uses VFIO to inject an EEH error on to
a pci-device and then waits on it to reach 'EEH_PE_STATE_NORMAL' state
. That state is never reached without this patch.

[2] :
https://github.com/nnmwebmin/vfio-ppc-tests/commit/006d8fdc41a4

>
> IIUC eeh_pe_get_state() was implemented[1] for supporting EEH for VFIO PCI
> devices. i.e. the VFIO_EEH_PE_GET_STATE operation of VFIO EEH PE ioctl op
> uses pseries_eeh_get_state() helper to query PE state on pseries LPAR.
> So are you suggesting that EEH functionality for VFIO PCI device was
> never enabled/tested before on pseries?
VFIO-EEH had been broken for pseries for a quite some time and was
recently fixed in kernel. So this issue was probably not discovered
until recently when we started testing with userspace VFIO.

>
> [1]: https://lore.kernel.org/all/1402364517-28561-3-git-send-email-gwshan@linux.vnet.ibm.com/
>
> Checking the powernv side of implementation I do see that it does
> enables the EEH_STATE_[MMIO|DMA]_ENABLED flags in the result mask for
> the callers. So doing the same for pseries eeh get state implementation
> does look like the right thing to do here IMO.
>
>> The patch fixes that by reflecting what is actually allowed.
>
> You say this is "fixes" so I am also assuming you are also looking for
> stable backports of this? If yes - could you please also add the "Fixes"
> tag and cc stable?
Yes, agree will re-send adding the fixes tag.

>
> -ritesh
>
>>
>> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/eeh_pseries.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
>> index 1893f66371fa..b12ef382fec7 100644
>> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
>> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
>> @@ -580,8 +580,10 @@ static int pseries_eeh_get_state(struct eeh_pe *pe, int *delay)
>>  
>>  	switch(rets[0]) {
>>  	case 0:
>> -		result = EEH_STATE_MMIO_ACTIVE |
>> -			 EEH_STATE_DMA_ACTIVE;
>> +		result = EEH_STATE_MMIO_ACTIVE	|
>> +			 EEH_STATE_DMA_ACTIVE	|
>> +			 EEH_STATE_MMIO_ENABLED	|
>> +			 EEH_STATE_DMA_ENABLED;
>>  		break;
>>  	case 1:
>>  		result = EEH_STATE_RESET_ACTIVE |
>> -- 
>> 2.45.2
>

-- 
Cheers
~ Vaibhav

