Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6660722923A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:39:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBS5M30wjzDqSL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:39:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBRdm2nSLzDqr5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 17:18:36 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M71WMu191977; Wed, 22 Jul 2020 03:18:27 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1wkqx6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 03:18:27 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M7C1Wp002112;
 Wed, 22 Jul 2020 07:18:26 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 32brbh4n3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 07:18:25 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06M7INhq65012112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 07:18:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1907FA4053;
 Wed, 22 Jul 2020 07:18:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94437A4051;
 Wed, 22 Jul 2020 07:18:22 +0000 (GMT)
Received: from pomme.local (unknown [9.145.57.80])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jul 2020 07:18:22 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] KVM: PPC: Book3S HV: rework secure mem slot
 dropping
To: Ram Pai <linuxram@us.ibm.com>, paulus@samba.org
References: <20200721104202.15727-1-ldufour@linux.ibm.com>
 <20200721104202.15727-3-ldufour@linux.ibm.com>
 <20200721213736.GG7339@oc0525413822.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <9158d2d7-7446-6eaa-8c88-666264c53dda@linux.ibm.com>
Date: Wed, 22 Jul 2020 09:18:20 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721213736.GG7339@oc0525413822.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_03:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxlogscore=500 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220048
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 bharata@linux.ibm.com, sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 21/07/2020 à 23:37, Ram Pai a écrit :
> On Tue, Jul 21, 2020 at 12:42:02PM +0200, Laurent Dufour wrote:
>> When a secure memslot is dropped, all the pages backed in the secure device
>> (aka really backed by secure memory by the Ultravisor) should be paged out
>> to a normal page. Previously, this was achieved by triggering the page
>> fault mechanism which is calling kvmppc_svm_page_out() on each pages.
>>
>> This can't work when hot unplugging a memory slot because the memory slot
>> is flagged as invalid and gfn_to_pfn() is then not trying to access the
>> page, so the page fault mechanism is not triggered.
>>
>> Since the final goal is to make a call to kvmppc_svm_page_out() it seems
>> simpler to directly calling it instead of triggering such a mechanism. This
>              ^^ call directly instead of triggering..
> 
>> way kvmppc_uvmem_drop_pages() can be called even when hot unplugging a
>> memslot.
>>
>> Since kvmppc_uvmem_drop_pages() is already holding kvm->arch.uvmem_lock,
>> the call to __kvmppc_svm_page_out() is made.
>> As __kvmppc_svm_page_out needs the vma pointer to migrate the pages, the
>> VMA is fetched in a lazy way, to not trigger find_vma() all the time. In
>> addition, the mmap_sem is help in read mode during that time, not in write
> 		          ^^ held
> 
>> mode since the virual memory layout is not impacted, and
>> kvm->arch.uvmem_lock prevents concurrent operation on the secure device.
>>
>> Cc: Ram Pai <linuxram@us.ibm.com>
> 
> Reviewed-by: Ram Pai <linuxram@us.ibm.com>

Thanks for reviewing this series.

Regarding the wordsmithing, Paul, could you manage that when pulling the series?

Thanks,
Laurent.
