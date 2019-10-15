Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C1FD807E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 21:43:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t5T36lRGzDqyk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 06:43:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t5R86GKHzDqyg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 06:41:55 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9FJb9b6133178
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 15:41:51 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vnkx793fw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 15:41:51 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Tue, 15 Oct 2019 20:41:49 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 15 Oct 2019 20:41:46 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9FJfjCi40305116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Oct 2019 19:41:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40DD5AE045;
 Tue, 15 Oct 2019 19:41:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 131A4AE053;
 Tue, 15 Oct 2019 19:41:45 +0000 (GMT)
Received: from pic2.home (unknown [9.145.66.182])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Oct 2019 19:41:45 +0000 (GMT)
Subject: Re: [EXTERNAL] [RFC PATCH] powernv/eeh: Fix oops when probing cxl
 devices
To: Sam Bobroff <sbobroff@linux.ibm.com>
References: <20190927124510.15518-1-fbarrat@linux.ibm.com>
 <20191015054219.GA16918@osmium>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Tue, 15 Oct 2019 21:41:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191015054219.GA16918@osmium>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101519-0028-0000-0000-000003AA55B8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101519-0029-0000-0000-0000246C6CB9
Message-Id: <8bf2ff79-e3a1-89cd-98af-dfddf9056d01@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-15_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910150167
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
Cc: clombard@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/10/2019 à 07:42, Sam Bobroff a écrit :
> On Fri, Sep 27, 2019 at 02:45:10PM +0200, Frederic Barrat wrote:
>> Recent cleanup in the way EEH support is added to a device causes a
>> kernel oops when the cxl driver probes a device and creates virtual
>> devices discovered on the FPGA:
>>
>>      BUG: Kernel NULL pointer dereference at 0x000000a0
>>      Faulting instruction address: 0xc000000000048070
>>      Oops: Kernel access of bad area, sig: 7 [#1]
>>      ...
>>      NIP [c000000000048070] eeh_add_device_late.part.9+0x50/0x1e0
>>      LR [c00000000004805c] eeh_add_device_late.part.9+0x3c/0x1e0
>>      Call Trace:
>>      [c000200e43983900] [c00000000079e250] _dev_info+0x5c/0x6c (unreliable)
>>      [c000200e43983980] [c0000000000d1ad0] pnv_pcibios_bus_add_device+0x60/0xb0
>>      [c000200e439839f0] [c0000000000606d0] pcibios_bus_add_device+0x40/0x60
>>      [c000200e43983a10] [c0000000006aa3a0] pci_bus_add_device+0x30/0x100
>>      [c000200e43983a80] [c0000000006aa4d4] pci_bus_add_devices+0x64/0xd0
>>      [c000200e43983ac0] [c00800001c429118] cxl_pci_vphb_add+0xe0/0x130 [cxl]
>>      [c000200e43983b00] [c00800001c4242ac] cxl_probe+0x504/0x5b0 [cxl]
>>      [c000200e43983bb0] [c0000000006bba1c] local_pci_probe+0x6c/0x110
>>      [c000200e43983c30] [c000000000159278] work_for_cpu_fn+0x38/0x60
>>
>> The root cause is that those cxl virtual devices don't have a
>> representation in the device tree and therefore no associated pci_dn
>> structure. In eeh_add_device_late(), pdn is NULL, so edev is NULL and
>> we oops.
>>
>> We never had explicit support for EEH for those virtual
>> devices. Instead, EEH events are reported to the (real) pci device and
>> handled by the cxl driver. Which can then forward to the virtual
>> devices and handle dependencies. The fact that we try adding EEH
>> support for the virtual devices is new and a side-effect of the recent
>> cleanup.
>>
>> This patch fixes it by skipping adding EEH support on powernv for
>> devices which don't have a pci_dn structure.
>>
>> Fixes: b905f8cdca77 ("powerpc/eeh: EEH for pSeries hot plug")
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>> ---
>>
>> Sending as an RFC, as I'm afraid of hiding potential issues and would
>> be interested in comments. The powernv eeh code expects a struct
>> pci_dn, so the fix seems safe. I'm wondering if there could be cases
>> (other than capi virtual devices) where we'd want to blow up and fix
>> instead of going undetected with this patch.
> 
> Looks good to me.
> 
> I do think it would be good to detect a missing pci_dn (WARN_ONCE()
> might be appropriate).  However to implement it,
> pnv_pcibios_bus_add_device() would need a way to detect that a struct
> pci_dev is a cxl virtual device. I don't see an easy way to do that; do
> you know if it's possible?


I think I found a solution. There's a cxl_pci_is_vphb_device() which is 
fairly cheap and would do the job. Sorry, I didn't think about it at first.


> One last thing: pseries_pcibios_bus_add_device() also requires a pci_dn.
> Do you know if it's possible to trigger a similar issue there, or is it
> not possible for some reason?


I don't think anybody is using capi in a lpar, but it should theorically 
be possible to hit it. I'll dig some more tomorrow and adjust the patch 
when resubmitting.

Thanks!

   Fred


> 
> Cheers,
> Sam.
> 
>>   arch/powerpc/platforms/powernv/eeh-powernv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
>> index 6bc24a47e9ef..6f300ab7f0e9 100644
>> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
>> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
>> @@ -42,7 +42,7 @@ void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
>>   {
>>   	struct pci_dn *pdn = pci_get_pdn(pdev);
>>   
>> -	if (eeh_has_flag(EEH_FORCE_DISABLED))
>> +	if (!pdn || eeh_has_flag(EEH_FORCE_DISABLED))
>>   		return;
>>   
>>   	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
>> -- 
>> 2.21.0
>>

