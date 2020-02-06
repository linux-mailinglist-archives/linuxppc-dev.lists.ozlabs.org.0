Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F92153EA7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 07:23:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CpJw2RWTzDqXm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 17:23:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CpHR69ZGzDqQZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 17:21:55 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0166AJw4128125
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Feb 2020 01:21:53 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xyphx5dk9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 01:21:52 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Thu, 6 Feb 2020 06:21:50 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Feb 2020 06:21:46 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0166LkaH56033382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Feb 2020 06:21:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00CEBA4040;
 Thu,  6 Feb 2020 06:21:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C5A0A4053;
 Thu,  6 Feb 2020 06:21:43 +0000 (GMT)
Received: from [9.85.90.213] (unknown [9.85.90.213])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Feb 2020 06:21:43 +0000 (GMT)
Subject: Re: [PATCH 2/5] mm/memremap_pages: Introduce memremap_compat_align()
To: Dan Williams <dan.j.williams@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <158041475480.3889308.655103391935006598.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158041476763.3889308.13149849631980018039.stgit@dwillia2-desk3.amr.corp.intel.com>
 <875zgl3fa9.fsf@mpe.ellerman.id.au>
 <CAPcyv4jVHnJbPYp1gqDnuwtEgt1NNHDt72vby7hK5dP43C+s8Q@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Thu, 6 Feb 2020 11:51:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4jVHnJbPYp1gqDnuwtEgt1NNHDt72vby7hK5dP43C+s8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20020606-4275-0000-0000-0000039E6A61
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020606-4276-0000-0000-000038B296A0
Message-Id: <aecd7276-fb03-5269-6ca1-9a1fb2e23b95@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-05_06:2020-02-04,
 2020-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=980 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002060048
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jeff Moyer <jmoyer@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Vishal L Verma <vishal.l.verma@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/6/20 11:21 AM, Dan Williams wrote:
....

>>>
>>> Link: http://lore.kernel.org/r/CAPcyv4gBGNP95APYaBcsocEa50tQj9b5h__83vgngjq3ouGX_Q@mail.gmail.com
>>> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> Reported-by: Jeff Moyer <jmoyer@redhat.com>
>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> Cc: Paul Mackerras <paulus@samba.org>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
>>> ---
>>>   arch/powerpc/include/asm/io.h |   10 ++++++++++
>>>   drivers/nvdimm/pfn_devs.c     |    2 +-
>>>   include/linux/io.h            |   23 +++++++++++++++++++++++
>>>   include/linux/mmzone.h        |    1 +
>>>   4 files changed, 35 insertions(+), 1 deletion(-)
>>
>> The powerpc change here looks fine to me.
>>
>> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> 
> Thanks Michael, unfortunately the kbuild robot just woke up and said
> that mips does not like including mmzone.h from io.h. The
> entanglements look intractable.
> 
> Is there a file I can stash a strong definition of
> memremap_compat_align(), maybe arch/powerpc/mm/mem.c? Then I can put a
> generic __weak definition in mm/memremap.c rather than play header
> file include games.
> 


arch/powerpc/mm/ioremap.c ?

-aneesh

