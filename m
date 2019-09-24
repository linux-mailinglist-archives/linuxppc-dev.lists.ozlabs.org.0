Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6605BC1DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 08:41:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cs6r66dLzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 16:41:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cs4c5wDtzDq61
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 16:39:59 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8O6bd11123995
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 02:39:56 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v7aaexf2g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 02:39:56 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Tue, 24 Sep 2019 07:39:54 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 24 Sep 2019 07:39:53 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8O6dpai53280892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Sep 2019 06:39:51 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 827534C044;
 Tue, 24 Sep 2019 06:39:51 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E45B4C040;
 Tue, 24 Sep 2019 06:39:51 +0000 (GMT)
Received: from pic2.home (unknown [9.145.71.39])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 Sep 2019 06:39:51 +0000 (GMT)
Subject: Re: [PATCH 00/11] opencapi: enable card reset and link retraining
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <7e29a072-f212-5d09-05b5-dbc1ee0916f0@ozlabs.ru>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Tue, 24 Sep 2019 08:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <7e29a072-f212-5d09-05b5-dbc1ee0916f0@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19092406-0020-0000-0000-00000370DBEC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092406-0021-0000-0000-000021C69A7D
Message-Id: <9ccce9b5-bba8-2fab-6d82-59bf03bf8b36@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-24_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=21 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909240065
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
Cc: groug@kaod.org, alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/09/2019 à 06:24, Alexey Kardashevskiy a écrit :
> Hi Fred,
> 
> what is this made against of? It does not apply on the master. Thanks,

It applies on v5.3. And I can see there's a conflict with the current 
state in the merge window. I'll resubmit.

   Fred



> On 10/09/2019 01:45, Frederic Barrat wrote:
>> This is the linux part of the work to use the PCI hotplug framework to
>> control an opencapi card so that it can be reset and re-read after
>> flashing a new FPGA image. I had posted it earlier as an RFC and this
>> version is mostly similar, with just some minor editing.
>>
>> It needs support in skiboot:
>> http://patchwork.ozlabs.org/project/skiboot/list/?series=129724
>> On an old skiboot, it will do nothing.
>>
>> A virtual PCI slot is created for the opencapi adapter, and its state
>> can be controlled through the pnv-php hotplug driver:
>>
>>    echo 0|1 > /sys/bus/pci/slots/OPENCAPI-<...>/power
>>
>> Note that the power to the card is not really turned off, as the card
>> needs to stay on to be flashed with a new image. Instead the card is
>> in reset.
>>
>> The first part of the series mostly deals with the pci/ioda state, as
>> the opencapi devices can now go away and the state needs to be cleaned
>> up.
>>
>> The second part is modifications to the PCI hotplug driver on powernv,
>> so that a virtual slot is created for the opencapi adapters found in
>> the device tree.
>>
>>
>>
>> Frederic Barrat (11):
>>    powerpc/powernv/ioda: Fix ref count for devices with their own PE
>>    powerpc/powernv/ioda: Protect PE list
>>    powerpc/powernv/ioda: set up PE on opencapi device when enabling
>>    powerpc/powernv/ioda: Release opencapi device
>>    powerpc/powernv/ioda: Find opencapi slot for a device node
>>    pci/hotplug/pnv-php: Remove erroneous warning
>>    pci/hotplug/pnv-php: Improve error msg on power state change failure
>>    pci/hotplug/pnv-php: Register opencapi slots
>>    pci/hotplug/pnv-php: Relax check when disabling slot
>>    pci/hotplug/pnv-php: Wrap warnings in macro
>>    ocxl: Add PCI hotplug dependency to Kconfig
>>
>>   arch/powerpc/include/asm/pnv-pci.h        |   1 +
>>   arch/powerpc/platforms/powernv/pci-ioda.c | 107 ++++++++++++++--------
>>   arch/powerpc/platforms/powernv/pci.c      |  10 +-
>>   drivers/misc/ocxl/Kconfig                 |   1 +
>>   drivers/pci/hotplug/pnv_php.c             |  82 ++++++++++-------
>>   5 files changed, 125 insertions(+), 76 deletions(-)
>>
> 

