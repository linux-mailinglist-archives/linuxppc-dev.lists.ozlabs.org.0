Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C88362926
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 22:21:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMSKj057Jz3c5B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 06:21:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qMqB4Mdh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qMqB4Mdh; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMSKF0lmBz3bqg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 06:21:20 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GK3Ra5095602; Fri, 16 Apr 2021 16:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EXbZeS34P+SiTyeIevH74JohvMoAWHhbNDjOk0wj1yk=;
 b=qMqB4MdhnwZTma4lXPYmUBMlDrsgLtsfwxOkSpgrOgpK2kyDjYih5EAXctQ4CmZWVKCL
 wz79+BPE41lCmR6949/nv+Ewd+/sKpbaUqjfc4bNnm7aG+oTz29EbU/CjFugQvhFoDg2
 /uxSrXxYAyErDyu2mWQtarH9c8XIRyY2Oo8vc9hYWi7q5CFFmHL1DNXvVKsOFzBCr/Sw
 Dk9e9f53tZGQ/yK7IrphECnxxszZeEcezwt4ppOYUogoxtjyrkJgsRJQ+Xk205e1Gkw/
 CjpDv+eW6IjbDUdz9dHzk69VJffqnT0FpCsLMDdl415Ivt+sDS1cmCLnxiVdGwhrF3k4 7g== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37yecx586q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 16:21:12 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GKIANc021101;
 Fri, 16 Apr 2021 20:21:12 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 37u3nah3m3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 20:21:12 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13GKLBMA10223886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 20:21:11 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31D1BB206B;
 Fri, 16 Apr 2021 20:21:11 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83A26B2064;
 Fri, 16 Apr 2021 20:21:10 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.122.125])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 20:21:10 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: extract host bridge from pci_bus prior
 to bus removal
To: Daniel Axtens <dja@axtens.net>, mpe@ellerman.id.au
References: <20210211182435.47968-1-tyreld@linux.ibm.com>
 <878s5ig0p7.fsf@linkitivity.dja.id.au>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <9ff72ca1-debd-9bc5-c445-db68e673f3ef@linux.ibm.com>
Date: Fri, 16 Apr 2021 13:21:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <878s5ig0p7.fsf@linkitivity.dja.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SWU3kPdSE_fHBZtWaq6ahJVrfr8XNqfA
X-Proofpoint-GUID: SWU3kPdSE_fHBZtWaq6ahJVrfr8XNqfA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_09:2021-04-16,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160140
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/16/21 12:15 AM, Daniel Axtens wrote:
> Hi Tyrel,
> 
>> The pci_bus->bridge reference may no longer be valid after
>> pci_bus_remove() resulting in passing a bad value to device_unregister()
>> for the associated bridge device.
>>
>> Store the host_bridge reference in a separate variable prior to
>> pci_bus_remove().
>>
> The patch certainly seems to do what you say. I'm not really up on the
> innards of PCI, so I'm struggling to figure out by what code path
> pci_bus_remove() might invalidate pci_bus->bridge? A quick look at
> pci_remove_bus was not very illuminating but I didn't chase down every
> call it made.

remove_phb_dynamic()
|--> pci_remove_bus(bus)
     |--> device_unregister(&bus->dev)
          |--> put_device(dev)
               |--> device_release(kobj)
                    |--> dev->class->dev_release(dev) == release_pci_bus(dev)
                         |--> kfree(bus)

We have the above call chain that takes place in the when put_device() triggers
the kobject ref count to go zero. The kobject_release function in this case is
device_release() which in turn calls dev->class->dev_release(dev). For a pci_bus
the class is appropriately pcibus_class whose dev_release() callback points to
release_pci_bus(). This in turn calls kfree() on the bus. Which means we can no
longer safely dereference any fields of the pci_bus struct.

-Tyrel

> 
> Kind regards,
> Daniel
> 
>> Fixes: 7340056567e3 ("powerpc/pci: Reorder pci bus/bridge unregistration during PHB removal")
>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/pci_dlpar.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
>> index f9ae17e8a0f4..a8f9140a24fa 100644
>> --- a/arch/powerpc/platforms/pseries/pci_dlpar.c
>> +++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
>> @@ -50,6 +50,7 @@ EXPORT_SYMBOL_GPL(init_phb_dynamic);
>>  int remove_phb_dynamic(struct pci_controller *phb)
>>  {
>>  	struct pci_bus *b = phb->bus;
>> +	struct pci_host_bridge *host_bridge = to_pci_host_bridge(b->bridge);
>>  	struct resource *res;
>>  	int rc, i;
>>  
>> @@ -76,7 +77,8 @@ int remove_phb_dynamic(struct pci_controller *phb)
>>  	/* Remove the PCI bus and unregister the bridge device from sysfs */
>>  	phb->bus = NULL;
>>  	pci_remove_bus(b);
>> -	device_unregister(b->bridge);
>> +	host_bridge->bus = NULL;
>> +	device_unregister(&host_bridge->dev);
>>  
>>  	/* Now release the IO resource */
>>  	if (res->flags & IORESOURCE_IO)
>> -- 
>> 2.27.0

