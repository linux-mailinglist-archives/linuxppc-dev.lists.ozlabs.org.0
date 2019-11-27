Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D503310ACE5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 10:50:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NGGZ5KnvzDqgD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 20:50:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NGD044T4zDqg3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 20:47:59 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAR9lKWP081723
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 04:47:56 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxf1eyw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 04:47:54 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 27 Nov 2019 09:47:49 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 27 Nov 2019 09:47:47 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAR9lkum53805106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 09:47:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51474A4051;
 Wed, 27 Nov 2019 09:47:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16C36A4040;
 Wed, 27 Nov 2019 09:47:46 +0000 (GMT)
Received: from pic2.home (unknown [9.145.40.227])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Nov 2019 09:47:46 +0000 (GMT)
Subject: Re: [Very RFC 40/46] powernv/npu: Don't drop refcount when looking up
 GPU pci_devs
To: Greg Kurz <groug@kaod.org>
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-41-oohall@gmail.com>
 <6bb90911-54fa-9f26-ec4d-7538f3303475@ozlabs.ru>
 <20191127092408.5a996f41@bahia.w3ibm.bluemix.net>
 <851d7f28-8698-ec0b-7732-423c0926ce94@linux.ibm.com>
 <20191127103354.0758b079@bahia.w3ibm.bluemix.net>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Wed, 27 Nov 2019 10:47:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191127103354.0758b079@bahia.w3ibm.bluemix.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112709-0012-0000-0000-0000036CDCBC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112709-0013-0000-0000-000021A8851D
Message-Id: <e5b52a32-f53e-7a34-01e4-90f8bae9a44c@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 suspectscore=1 adultscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911270084
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Oliver O'Halloran <oohall@gmail.com>, s.miroshnichenko@yadro.com,
 alistair@popple.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/11/2019 à 10:33, Greg Kurz a écrit :
> On Wed, 27 Nov 2019 10:10:13 +0100
> Frederic Barrat <fbarrat@linux.ibm.com> wrote:
> 
>>
>>
>> Le 27/11/2019 à 09:24, Greg Kurz a écrit :
>>> On Wed, 27 Nov 2019 18:09:40 +1100
>>> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>>
>>>>
>>>>
>>>> On 20/11/2019 12:28, Oliver O'Halloran wrote:
>>>>> The comment here implies that we don't need to take a ref to the pci_dev
>>>>> because the ioda_pe will always have one. This implies that the current
>>>>> expection is that the pci_dev for an NPU device will *never* be torn
>>>>> down since the ioda_pe having a ref to the device will prevent the
>>>>> release function from being called.
>>>>>
>>>>> In other words, the desired behaviour here appears to be leaking a ref.
>>>>>
>>>>> Nice!
>>>>
>>>>
>>>> There is a history: https://patchwork.ozlabs.org/patch/1088078/
>>>>
>>>> We did not fix anything in particular then, we do not seem to be fixing
>>>> anything now (in other words - we cannot test it in a normal natural
>>>> way). I'd drop this one.
>>>>
>>>
>>> Yeah, I didn't fix anything at the time. Just reverted to the ref
>>> count behavior we had before:
>>>
>>> https://patchwork.ozlabs.org/patch/829172/
>>>
>>> Frederic recently posted his take on the same topic from the OpenCAPI
>>> point of view:
>>>
>>> http://patchwork.ozlabs.org/patch/1198947/
>>>
>>> He seems to indicate the NPU devices as the real culprit because
>>> nobody ever cared for them to be removable. Fixing that seems be
>>> a chore nobody really wants to address obviously... :-\
>>
>>
>> I had taken a stab at not leaking a ref for the nvlink devices and do
>> the proper thing regarding ref counting (i.e. fixing all the callers of
>> get_pci_dev() to drop the reference when they were done). With that, I
>> could see that the ref count of the nvlink devices could drop to 0
>> (calling remove for the device in /sys) and that the devices could go away.
>>
>> But then, I realized it's not necessarily desirable at this point. There
>> are several comments in the code saying the npu devices (for nvlink)
>> don't go away, there's no device release callback defined when it seems
>> there should be, at least to handle releasing PEs.... All in all, it
>> seems that some work would be needed. And if it hasn't been required by
>> now...
>>
> 
> If everyone is ok with leaking a reference in the NPU case, I guess
> this isn't a problem. But if we move forward with Oliver's patch, a
> pci_dev_put() would be needed for OpenCAPI, correct ?


No, these code paths are nvlink-only.

   Fred



>>     Fred
>>
>>
>>>>
>>>>
>>>>>
>>>>> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
>>>>> ---
>>>>>    arch/powerpc/platforms/powernv/npu-dma.c | 11 +++--------
>>>>>    1 file changed, 3 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
>>>>> index 72d3749da02c..2eb6e6d45a98 100644
>>>>> --- a/arch/powerpc/platforms/powernv/npu-dma.c
>>>>> +++ b/arch/powerpc/platforms/powernv/npu-dma.c
>>>>> @@ -28,15 +28,10 @@ static struct pci_dev *get_pci_dev(struct device_node *dn)
>>>>>    			break;
>>>>>    
>>>>>    	/*
>>>>> -	 * pci_get_domain_bus_and_slot() increased the reference count of
>>>>> -	 * the PCI device, but callers don't need that actually as the PE
>>>>> -	 * already holds a reference to the device. Since callers aren't
>>>>> -	 * aware of the reference count change, call pci_dev_put() now to
>>>>> -	 * avoid leaks.
>>>>> +	 * NB: for_each_pci_dev() elevates the pci_dev refcount.
>>>>> +	 * Caller is responsible for dropping the ref when it's
>>>>> +	 * finished with it.
>>>>>    	 */
>>>>> -	if (pdev)
>>>>> -		pci_dev_put(pdev);
>>>>> -
>>>>>    	return pdev;
>>>>>    }
>>>>>    
>>>>>
>>>>
>>>
>>
> 

