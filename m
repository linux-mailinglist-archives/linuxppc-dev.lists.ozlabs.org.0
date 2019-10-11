Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 150EBD3BFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 11:12:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qMfR3HWQzDqTb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 20:12:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=clombard@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qMcD5GDjzDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 20:10:19 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9B932LW039507
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 05:10:13 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vjbne23p4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 05:10:11 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <clombard@linux.vnet.ibm.com>;
 Fri, 11 Oct 2019 10:10:05 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 11 Oct 2019 10:10:03 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9B99VbE12583182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Oct 2019 09:09:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8C8C11C050;
 Fri, 11 Oct 2019 09:10:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C315811C04C;
 Fri, 11 Oct 2019 09:10:01 +0000 (GMT)
Received: from [9.134.167.65] (unknown [9.134.167.65])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Oct 2019 09:10:01 +0000 (GMT)
Subject: Re: [PATCH 0/2] ocxl: Move SPA and TL definitions
From: christophe lombard <clombard@linux.vnet.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 fbarrat@linux.vnet.ibm.com
References: <20191009151109.13752-1-clombard@linux.vnet.ibm.com>
 <c54128b1-6576-9758-f9ac-eb748cc98de5@linux.ibm.com>
 <f15fbc65-c14f-a75d-92b0-8f7619dfda36@linux.vnet.ibm.com>
Date: Fri, 11 Oct 2019 11:10:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <f15fbc65-c14f-a75d-92b0-8f7619dfda36@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101109-0012-0000-0000-000003571DD5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101109-0013-0000-0000-0000219229B4
Message-Id: <791d02d6-cf9c-b2da-59a5-669d14451780@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-11_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910110087
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/10/2019 10:06, christophe lombard wrote:
> On 11/10/2019 00:34, Andrew Donnellan wrote:
>> On 10/10/19 2:11 am, christophe lombard wrote:
>>> This series moves the definition and the management of scheduled 
>>> process area
>>> (SPA) and of the templates (Transaction Layer) for an ocxl card, 
>>> using the
>>> OCAPI interface. The code is now located in the specific arch powerpc 
>>> platform.
>>> These patches will help for a futur implementation of the ocxl driver 
>>> in QEMU.
>>
>> Could you explain more about this?
>>
> 
> The Scheduled Processes Area and the configuration of the Transaction
> Layer are specific to the AFU and more generally to the Opencapi
> device.
> Running the ocxl module in a guest environment, and later in several 
> guests in parallel, using the same Opencapi device and the same AFus, 
> involves to have a common code handling the SPA. This explains why these 
> parts of the ocxl driver will move to arch powerpc platform running on 
> the host.
> 
> Thanks.
> 

Implementation of the ocxl driver running on a QEMU guest environment 
will be detailed in the following patches but basically, a new ocxl vfio 
driver, running in the host, will interact, in side, with the SPA, using 
the pnv_ api(s) and on the other hand will interact, through ioctl 
commands, with the guest(s). Ocxl, running in the guest, through hcalls 
(handled by QEMU) will configure the device and interact with the vfio 
through ioctl commands.

> 
>>
>> Andrew
>>
>>
>>>
>>> The Open Coherently Attached Processor Interface (OCAPI) is used to
>>> allow an Attached Functional Unit (AFU) to connect to the Processor
>>> Chip's system bus in a high speed and cache coherent manner.
>>>
>>> It builds on top of the existing ocxl driver.
>>>
>>> It has been tested in a bare-metal environment using the memcpy and
>>> the AFP AFUs.
>>>
>>> christophe lombard (2):
>>>    powerpc/powernv: ocxl move SPA definition
>>>    powerpc/powernv: ocxl move TL definition
>>>
>>>   arch/powerpc/include/asm/pnv-ocxl.h   |  30 +-
>>>   arch/powerpc/platforms/powernv/ocxl.c | 378 +++++++++++++++++++++++---
>>>   drivers/misc/ocxl/afu_irq.c           |   1 -
>>>   drivers/misc/ocxl/config.c            |  89 +-----
>>>   drivers/misc/ocxl/link.c              | 347 +++++++----------------
>>>   drivers/misc/ocxl/ocxl_internal.h     |  12 -
>>>   drivers/misc/ocxl/trace.h             |  34 +--
>>>   7 files changed, 467 insertions(+), 424 deletions(-)
>>>
>>
> 

