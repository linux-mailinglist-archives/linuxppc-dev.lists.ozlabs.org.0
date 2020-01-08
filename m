Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C6B1344C3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 15:14:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tB7n4LM8zDqVL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 01:14:13 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tB5P2H4xzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 01:12:07 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 008E7UZs063367
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 8 Jan 2020 09:12:04 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xde0nnu1x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 09:12:04 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 8 Jan 2020 14:12:02 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 Jan 2020 14:11:59 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 008EBvUa58917088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jan 2020 14:11:57 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B111442041;
 Wed,  8 Jan 2020 14:11:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66AD64203F;
 Wed,  8 Jan 2020 14:11:57 +0000 (GMT)
Received: from pic2.home (unknown [9.145.47.190])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jan 2020 14:11:57 +0000 (GMT)
Subject: Re: [PATCH v2 01/11] powerpc/powernv/ioda: Fix ref count for devices
 with their own PE
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 clombard@linux.ibm.com
References: <20191121134918.7155-1-fbarrat@linux.ibm.com>
 <20191121134918.7155-2-fbarrat@linux.ibm.com>
 <f69d65f5-0692-f950-f226-c7925d8ff3cf@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Wed, 8 Jan 2020 15:11:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f69d65f5-0692-f950-f226-c7925d8ff3cf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20010814-4275-0000-0000-00000395CD4A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010814-4276-0000-0000-000038A9BAA7
Message-Id: <449279e4-9c04-7933-41af-95d7a4928c45@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-08_03:2020-01-08,
 2020-01-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=18
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001080121
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
Cc: aik@ozlabs.ru, oohall@gmail.com, groug@kaod.org, alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/01/2020 à 08:33, Andrew Donnellan a écrit :
> On 22/11/19 12:49 am, Frederic Barrat wrote:
>> The pci_dn structure used to store a pointer to the struct pci_dev, so
>> taking a reference on the device was required. However, the pci_dev
>> pointer was later removed from the pci_dn structure, but the reference
>> was kept for the npu device.
>> See commit 902bdc57451c ("powerpc/powernv/idoa: Remove unnecessary
>> pcidev from pci_dn").
>>
>> We don't need to take a reference on the device when assigning the PE
>> as the struct pnv_ioda_pe is cleaned up at the same time as
>> the (physical) device is released. Doing so prevents the device from
>> being released, which is a problem for opencapi devices, since we want
>> to be able to remove them through PCI hotplug.
>>
>> Now the ugly part: nvlink npu devices are not meant to be
>> released. Because of the above, we've always leaked a reference and
>> simply removing it now is dangerous and would likely require more
>> work. There's currently no release device callback for nvlink devices
>> for example. So to be safe, this patch leaks a reference on the npu
>> device, but only for nvlink and not opencapi.
>>
>> CC: aik@ozlabs.ru
>> CC: oohall@gmail.com
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 
> It took me a while to parse exactly what you're doing here.
> 
> - In pnv_ioda_setup_dev_PE(), we take a reference on the pci_dev, this 
> is to protect a pointer in the pci_dn structure, but not to protect the 
> pointer in the pci_dev structure (which doesn't need to be protected by 
> taking a reference, because the lifetime of the pnv_ioda_pe is the same 
> as the pci_dev).
> 
> - The pointer in the pci_dn structure has now been removed, so we should 
> remove the pci_dev_get() accordingly.


Correct. Did I do such a bad job explaining it in the commit message 
that I need to rephrase?

   Fred


> This seems okay to me, though anything PE-related is irritatingly hairy 
> so one can never be truly certain...
> 
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
> 

