Return-Path: <linuxppc-dev+bounces-9582-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8AFAE1775
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 11:27:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNsZB5qbrz2yf3;
	Fri, 20 Jun 2025 19:27:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750411634;
	cv=none; b=fyf47BOavhttf9tckJFLrSdrSS3sUHODpNx+jsZCL5oi3NhfqeQ8OOPHmjnVyUAPcBrzAVObd//NJPLYq88a+CoeD8/2mltAf4NqqX6nAR1n2LLaVGwMySievV0NAGTNzDq3rPHJPNP6FpUGhpxYJjkqNN6tIgArHnCQ9ajQrjbCTZlryCpGNTxmnEpJ0QKOSL6sqBMKJaXHaJdXWx00cSThkpYKtT5ArVZYM/BanbxKXR4I0frgohMR35f/yzpkyU1+TrWFPcGwvDLoBiUU7Fp2XEqdF7yTenMm5RkKpE/ecWwZK/YPtRZFfvXofPEpAQQtto+uTAvfvnh8oXLv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750411634; c=relaxed/relaxed;
	bh=xs4GwtZhq/RZpg0ApqIdO1ibqn3rjOuW0IdI803an9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=SZfuCQt+4vABH5Fkoe25p9CtB9dOaqwQEzfJDuPTNX/ZtyCGJDXQqa0pQw1o8UKpsn2d2ZW5s1ZXc+JiP+FXSHl1Iy+Nbgc/eJ7mUET5LpO437I56NCOp82uko6npITYbyQbpD+Sn1bPBma2FyNVIXoUU60z3BpGkkKPHnMsNoCm+mGa6kNEkZdpKzYz4e0L0tKOPqd9fluioW7vAoaAHYL8B3QJ4Ek9AX+0MAqoJcIgAXhfL8hFEMNKYILuZl+YCMweSthjHPPTg6ZV2JTv4p+av6ID5YRnCBBYSTbbYM9RAFmI4odoWwdozJ0h686QpvpL0fcTk0SptqNGqqa7IQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tqljnBD8; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tqljnBD8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNsZ94TsPz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 19:27:13 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K2inRn003480;
	Fri, 20 Jun 2025 09:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xs4Gwt
	Zhq/RZpg0ApqIdO1ibqn3rjOuW0IdI803an9Y=; b=tqljnBD8glea6ilpaQASVt
	NdT0sMx+zhAPC4XkpLeorg3e0H6/qWgQUdQIEevgiWBvpxTNc9yjbqQWQLN4Qnhu
	N4OOy7vMWejfkNkKbABJPhlWUkicxwV8uBeyP7aiTFOPqiCkFDF7YDShE5qBlPTP
	yBKKhdnULf1qeE8lK5N2Z8sjKizOGGbHzC/nuK+/lMNBWM/T6IiX617nJqVHMawn
	F+Im2ugjr5Bnag1v1IIO+MGFMlPXUOxHfTR8NCFA/xgROm94Nq5DwF6XqAZaSWYD
	SvTvgraBzazf5r5hIe5NUKZwWFuYLGbSZfzmEkaDVb1b4hacgd9cMMAEP0uqeYRg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47cy4jspuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 09:27:00 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55K9JHFJ003146;
	Fri, 20 Jun 2025 09:27:00 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47cy4jspus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 09:27:00 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55K95We1021600;
	Fri, 20 Jun 2025 09:26:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 47cahwe8e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 09:26:59 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55K9QvAJ55640484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 09:26:57 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62C7520043;
	Fri, 20 Jun 2025 09:26:57 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7183920040;
	Fri, 20 Jun 2025 09:26:55 +0000 (GMT)
Received: from [9.109.241.85] (unknown [9.109.241.85])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jun 2025 09:26:55 +0000 (GMT)
Message-ID: <19689b53-ac23-4b48-97c7-b26f360a7b75@linux.ibm.com>
Date: Fri, 20 Jun 2025 14:56:51 +0530
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
Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention
 indicator
To: linuxppc-dev@lists.ozlabs.org,
        Timothy Pearson <tpearson@raptorengineering.com>,
        Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20250618190146.GA1213349@bhelgaas>
 <1469323476.1312174.1750293474949.JavaMail.zimbra@raptorengineeringinc.com>
Content-Language: en-US
From: Krishna Kumar <krishnak@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "\"linux-pci\"," <linux-pci@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        christophe leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        "\"Bjorn Helgaas\","
 <bhelgaas@google.com>,
        Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <1469323476.1312174.1750293474949.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H5gm5CuRg5G1vL8RnfCBsF8H5nEiiA25
X-Authority-Analysis: v=2.4 cv=a7ww9VSF c=1 sm=1 tr=0 ts=68552964 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=_AprYWD3AAAA:8 a=voM4FWlXAAAA:8 a=VnNF1IyMAAAA:8 a=1UX6Do5GAAAA:8
 a=1XWaLZrsAAAA:8 a=l-zMBAn9ipa4B3h1PFYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=fKH2wJO7VO9AkD4yHysb:22 a=IC2XNlieTeVoXbcui8wp:22 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA2OCBTYWx0ZWRfXztuPp7Hmqghr 98gbmuDSvnfmXzBjLf9FY5ZDg1UEfltV+FYLasqzwXEfi6it0ilw1iXa7wJRm4ed1MK0UznOnPd 20FR3xZsgaCsA+7nFA6iSbzRPfNy+Ohf2HND1ChjMGP6H1KDRHHGPnDbIvMT2JOORD3V2kL7S6b
 URA+ebAFIEWt9hoLTBWL+F2XRKUVlx/+Hs25DW5+P0Avi+ZeZ3qId2XtGEPke4brhcSwhWWWBer joR/R0/Ieo1QRusCM2hiXSJ+9Hjw0z63rjiNf+9IxgeUKshhqGSP7tyZM2E5FdyJDldBeH7Z7LU sEiFVuiYkxNB+An9MproBX8WlLgCgioaSHUQmlekwULfktUZ6GgQ+P6qznStxFRyEKkdtjvPbaQ
 vRHB0Kb/HC4BPLLWTNWvNYZg1A6m4YrUSuxWHsf5lZP5PcXSoanI0/qO50F2311LwSadJ3lK
X-Proofpoint-ORIG-GUID: 3PPcyUxRJT5_vYdplbgsuscFw7Wby9Ox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200068
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Shawn, Timothy:

Thanks for posting the series of patch. Few things I wanted to do better understand Raptor problem -


1. Last time my two patches solved all the hotunplug operation and Kernel crash issue except nvme case. It did not work with

    NVME since dpc support was not there. I was not able to do that due to being  occupied in some other work.

2. I want to understand the delta from last yr problem to this problem. Is the PHB freeze or hotunplug failure happens

    only for particular Microsemi switch or it happens with all the switches. When did this problem started coming ? Till last yr 

    it was not there. Is it specific to particular Hardware ? Can I get your setup to test this problem and your patch ?

3. To me, hot unplug opertaion  --> AER triggering --> DPC support, this flow should mask the error to reach root port/cpu and it 

    should solve the PHB freeze/ hot unplug failure operation. If there are AER/EEH related synchronization issue we need to solve them. 

    Can you pls list the issue, I will pass it to EEH/AER team. But yeah, to me if AER implementation is correct and we add DPC support,

    all the error will be contained by switch itself. The PHB/root port/cpu will not be impacted by this and there should not be any freeze.

4. Ofcourse we can pick some of the fixes from pciehp driver if its missing in pnv_php.c. Also at the same time you have done

    some cleanup in hot unplug path and fixed the attenuation button related code. If these works fine, we can pick it. But I want to test it.

     Pls provide me setup.

5. If point 3 and 4 does not solve the problem, then only we should move to pciehp.c. But AFAIK, PPC/Powernv is DT based while pciehp.c

     may be only supporting acpi (I have to check it on this).  We need to provide PHB related information via DTB and maintain the related 

     topology information via dtb and then it can be doable. Also , we need to do thorough planning/testing if we think to choose pciehp.c. 

     But yeah, lets not jump here and lets try to fix the current issues via point 3 & 4. Point 5 will be our last option.


Best Regards,

Krishna




On 6/19/25 6:07 AM, Timothy Pearson wrote:
>
> ----- Original Message -----
>> From: "Bjorn Helgaas" <helgaas@kernel.org>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-pci"
>> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
>> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Bjorn Helgaas"
>> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>
>> Sent: Wednesday, June 18, 2025 2:01:46 PM
>> Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention indicator
>> On Wed, Jun 18, 2025 at 11:58:59AM -0500, Timothy Pearson wrote:
>>>  state
>> Weird wrapping of last word of subject to here.
> I'll need to see what's up with my git format-patch setup. Apologies for that across the multiple series.
>
>>> The PCIe specification allows three attention indicator states,
>>> on, off, and blink.  Enable all three states instead of basic
>>> on / off control.
>>>
>>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>>> ---
>>>  drivers/pci/hotplug/pnv_php.c | 15 ++++++++++++++-
>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
>>> index 0ceb4a2c3c79..c3005324be3d 100644
>>> --- a/drivers/pci/hotplug/pnv_php.c
>>> +++ b/drivers/pci/hotplug/pnv_php.c
>>> @@ -440,10 +440,23 @@ static int pnv_php_get_adapter_state(struct hotplug_slot
>>> *slot, u8 *state)
>>>  	return ret;
>>>  }
>>>  
>>> +static int pnv_php_get_raw_indicator_status(struct hotplug_slot *slot, u8
>>> *state)
>>> +{
>>> +	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
>>> +	struct pci_dev *bridge = php_slot->pdev;
>>> +	u16 status;
>>> +
>>> +	pcie_capability_read_word(bridge, PCI_EXP_SLTCTL, &status);
>>> +	*state = (status & (PCI_EXP_SLTCTL_AIC | PCI_EXP_SLTCTL_PIC)) >> 6;
>> Should be able to do this with FIELD_GET().
> I used the same overall structure as the pciehp_hpc driver here.  Do you want me to also fix up that driver with FIELD_GET()?
>
>> Is the PCI_EXP_SLTCTL_PIC part needed?  It wasn't there before, commit
>> log doesn't mention it, and as far as I can tell, this would be the
>> only driver to do that.  Most expose only the attention status (0=off,
>> 1=on, 2=identify/blink).
>>
>>> +	return 0;
>>> +}
>>> +
>>> +
>>>  static int pnv_php_get_attention_state(struct hotplug_slot *slot, u8 *state)
>>>  {
>>>  	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
>>>  
>>> +	pnv_php_get_raw_indicator_status(slot, &php_slot->attention_state);
>> This is a change worth noting.  Previously we didn't read the AIC
>> state from PCI_EXP_SLTCTL at all; we used php_slot->attention_state to
>> keep track of whatever had been previously set via
>> pnv_php_set_attention_state().
>>
>> Now we read the current state from PCI_EXP_SLTCTL.  It's not clear
>> that php_slot->attention_state is still needed at all.
> It probably isn't.  It's unclear why IBM took this path at all, given pciehp's attention handlers predate pnv-php's by many years.
>
>> Previously, the user could write any value at all to the sysfs
>> "attention" file and then read that same value back.  After this
>> patch, the user can still write anything, but reads will only return
>> values with PCI_EXP_SLTCTL_AIC and PCI_EXP_SLTCTL_PIC.
>>
>>>  	*state = php_slot->attention_state;
>>>  	return 0;
>>>  }
>>> @@ -461,7 +474,7 @@ static int pnv_php_set_attention_state(struct hotplug_slot
>>> *slot, u8 state)
>>>  	mask = PCI_EXP_SLTCTL_AIC;
>>>  
>>>  	if (state)
>>> -		new = PCI_EXP_SLTCTL_ATTN_IND_ON;
>>> +		new = FIELD_PREP(PCI_EXP_SLTCTL_AIC, state);
>> This changes the behavior in some cases:
>>
>>  write 0: previously turned indicator off, now writes reserved value
>>  write 2: previously turned indicator on, now sets to blink
>>  write 3: previously turned indicator on, now turns it off
> If we're looking at normalizing with pciehp with an eye toward eventually deprecating / removing pnv-php, I can't think of a better time to change this behavior.  I suspect we're the only major user of this code path at the moment, with most software expecting to see pciehp-style handling.  Thoughts?
>

