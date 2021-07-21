Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EABAD3D11E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 17:05:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVJmP6l7pz3bdf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 01:05:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZwohY/8r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZwohY/8r; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVJlp0Bhfz2yP4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jul 2021 01:04:53 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LF3HK6175709; Wed, 21 Jul 2021 11:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YIoED6AauQ4yitAFa7xjRwIfW+sUM7Fu4FYDva3JiaE=;
 b=ZwohY/8rtCFqvBzi+p3AaHntuvl+NBYH2jcovL/KQz6kwKZRIbape0DnCpicxXsABIxd
 yKLFsda9CZv41ki1aWIjZ/d3fAMUXAxUrHiwAMcj+gbr4A63Jtz6BmLMAfvN5QABmfQD
 KY7fiphNb/JoR4LAI5lf2e+jOBF9daCd/z9NOszmufQO4gwOgTndMzpIW9osLglZk604
 jYOzeGbywgxEwwDWGb1aq+tD3qF7FqBRgygRYk8vcA7OXNqhT1GHUGONVlSybOFV2ZQ8
 NUnwBdp2+8q9pz/JAhnx9eQcp/7Z+4AoJxTe6VYOxCX2jHbdddqDdJh5DVBDLuvMWMRI yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39xkeen3rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 11:04:40 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16LF4O48182099;
 Wed, 21 Jul 2021 11:04:39 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39xkeen3q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 11:04:39 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16LF4IiQ019772;
 Wed, 21 Jul 2021 15:04:37 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 39upu895rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 15:04:37 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16LF4ZPs28311978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 15:04:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB2B64C05E;
 Wed, 21 Jul 2021 15:04:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 637144C040;
 Wed, 21 Jul 2021 15:04:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.171.74.114])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Jul 2021 15:04:34 +0000 (GMT)
Subject: Re: [PATCH v5 10/11] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Leonardo Bras <leobras.c@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, David Gibson
 <david@gibson.dropbear.id.au>, kernel test robot <lkp@intel.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-11-leobras.c@gmail.com>
 <b98f696a-ed64-4c9e-ccb6-549ae8bc7fd6@linux.ibm.com>
 <8dfb28d5-b654-746c-03d8-aeee3d438240@ozlabs.ru>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <994051df-73b3-4dad-76aa-1a03d9afaf6d@linux.ibm.com>
Date: Wed, 21 Jul 2021 17:04:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8dfb28d5-b654-746c-03d8-aeee3d438240@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 64t-t_OYI5dWibQk5RuFJ-01YuYFt3K_
X-Proofpoint-ORIG-GUID: w9ni4Lr0nTcXsDyW-V2JMK6vrmnEZ72J
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_09:2021-07-21,
 2021-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210088
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



On 21/07/2021 05:32, Alexey Kardashevskiy wrote:
>>> +        struct iommu_table *newtbl;
>>> +        int i;
>>> +
>>> +        for (i = 0; i < ARRAY_SIZE(pci->phb->mem_resources); i++) {
>>> +            const unsigned long mask = IORESOURCE_MEM_64 | 
>>> IORESOURCE_MEM;
>>> +
>>> +            /* Look for MMIO32 */
>>> +            if ((pci->phb->mem_resources[i].flags & mask) == 
>>> IORESOURCE_MEM)
>>> +                break;
>>> +        }
>>> +
>>> +        if (i == ARRAY_SIZE(pci->phb->mem_resources))
>>> +            goto out_del_list;
>>
>>
>> So we exit and do nothing if there's no MMIO32 bar?
>> Isn't the intent just to figure out the MMIO32 area to reserve it when 
>> init'ing the table? In which case we could default to 0,0
>>
>> I'm actually not clear why we are reserving this area on pseries.
> 
> 
> 
> If we do not reserve it, then the iommu code will allocate DMA pages 
> from there and these addresses are MMIO32 from the kernel pov at least. 
> I saw crashes when (I think) a device tried DMAing to the top 2GB of the 
> bus space which happened to be a some other device's BAR.


hmmm... then figuring out the correct range needs more work. We could 
have more than one MMIO32 bar. And they don't have to be adjacent. I 
don't see that we are reserving any range on the initial table though 
(on pseries).

   Fred
