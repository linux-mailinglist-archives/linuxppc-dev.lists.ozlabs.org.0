Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F5E100B69
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 19:22:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Gy4J2DFdzDqfC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 05:22:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Gy2R2qNdzDqRn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 05:21:18 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAIIBvor122052
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 13:21:15 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wayepbbtb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 13:21:14 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Mon, 18 Nov 2019 18:21:13 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 18 Nov 2019 18:21:11 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAIIL9hv39125170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Nov 2019 18:21:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85721AE051;
 Mon, 18 Nov 2019 18:21:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D577AE04D;
 Mon, 18 Nov 2019 18:21:09 +0000 (GMT)
Received: from pic2.home (unknown [9.145.185.128])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Nov 2019 18:21:09 +0000 (GMT)
Subject: Re: [PATCH 01/11] powerpc/powernv/ioda: Fix ref count for devices
 with their own PE
To: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <7553103.1BsQ81z3e0@townsend>
 <CAOSf1CEzb_Y4NdXGNPYTOxTR5w7OtBUU+VY46CR6Ou5kwEhJqA@mail.gmail.com>
 <2783297.m1VkgVQdWf@townsend>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Mon, 18 Nov 2019 19:21:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <2783297.m1VkgVQdWf@townsend>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19111818-4275-0000-0000-0000038129DB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111818-4276-0000-0000-000038949AF2
Message-Id: <c07ed277-b527-3b1c-9cf8-aecdb7145a5e@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-18_05:2019-11-15,2019-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911180155
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, Christophe Lombard <clombard@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>, Alastair D'Silva <alastair@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/11/2019 à 03:36, Alistair Popple a écrit :
> On Monday, 18 November 2019 12:24:24 PM AEDT Oliver O'Halloran wrote:
>> On Mon, Nov 18, 2019 at 12:06 PM Alistair Popple <alistair@popple.id.au>
> wrote:
>>>
>>> On Wednesday, 13 November 2019 4:38:21 AM AEDT Frederic Barrat wrote:
>>>>
>>>> However, one question is whether this patch breaks nvlink and if nvlink
>>>> assumes the devices won’t go away because we explicitly take a reference
>>>> forever. In npu_dma.c, there are 2 functions which allow to find the GPU
>>>> associated to a npu device, and vice-versa. Both functions return a
>>>> pointer to a struct pci_dev, but they don’t take a reference on the
>>>> device being returned. So that seems dangerous. I’m probably missing
>>>> something.
>>>>
>>>> Alexey, Alistair: what, if anything, guarantees, that the npu or gpu
>>>> devices stay valid. Is it because we simply don’t provide any means to
>>>> get rid of them ? Otherwise, don’t we need the callers of
>>>> pnv_pci_get_gpu_dev() and pnv_pci_get_npu_dev() to worry about reference
>>>> counting ? I’ve started looking into it and the changes are scary, which
>>>> explains Greg’s related commit 02c5f5394918b.
>>>
>>> To be honest the reference counting looks like it has evolved into
> something
>>> quite suspect and I don't think you're missing anything. In practice
> though we
>>> likely haven't hit any issues because the original callers didn't store
>>> references to the pdev which would make the window quite small (although
> the
>>> pass through work may have changed that). And as you say there simply
> wasn't
>>> any means to get rid of them anyway (EEH, hotplug, etc. has never been
>>> implemented or supported for GPUs and all sorts of terrible things happen
> if
>>> you try).
>>
>> In other words: leaking a ref is the only safe thing to do.
> 
> Correct.
> 
>>> The best solution would likely be to review the reference counting and to
>>> teach callers of get_*_dev() to call pci_put_dev(), etc.
>>
>> The issue is that the two callers of get_pci_dev() are non-GPL
>> exported symbols so we don't know what's calling them or what their
>> expectations are. We be doing whatever makes sense for OpenCAPI and if
>> that happens to cause a problem for someone else, then they can deal
>> with it.
> 
> The issue isn't that it's exported non-GPL vs. GPL, rather that there are
> probably out-of-tree modules like the NVIDIA driver using it. However as you
> say supporting out-of-tree modules is not generally a concern for kernel
> developers so we certainly shouldn't let that prevent us doing a fix.


Thanks Alistair and Oliver. I'll bite the bullet and try do the right 
thing wrt ref counting in npu-dma.c

   Fred

> - Alistair
> 
>> Oliver
> 
> 
> 
> 

