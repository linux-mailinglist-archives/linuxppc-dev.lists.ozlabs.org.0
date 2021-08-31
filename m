Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1193FCEB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 22:40:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzfFp1yHgz2yK2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 06:40:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hTdfVYBP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=drc@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hTdfVYBP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzfF10RZHz2yHt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Sep 2021 06:39:32 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17VKX9KD185496; Tue, 31 Aug 2021 16:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6U5dxe6OU/Y7m5tOCk336aORKANirTgpEHhfWD9z0R4=;
 b=hTdfVYBPYH3m0XjiU2fbeKvGVJzMC1RHj7IGGQ5quaDCmzntfkqNuR1k1IkbxEVYsf7Q
 9WTsTufEZNY+Z0pskBNUxWGPWahp0L0Bh3dBCflpcSFu89kMFvM4Az7D8sWmnMt16kHY
 63H2bfcx77GE5ikcuOTF18MTQc0sRjmCd3hDZnthGUCUlavMCJRidyQYnQ+ocAAZN1XT
 FurepDwT+g2a2XAc6/euYCGFlw0VmgrtbC+PU3152JQ5a11Wi9GmCp0VpFgd0Z59UmOf
 fffF0VPgjcqje5cwY9VhorHiw2/Bzy1mynyMd1t16TakComGMpDpXW63ojP7uAGv+w+/ Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3asrd8w597-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 16:39:12 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17VKYEiu188060;
 Tue, 31 Aug 2021 16:39:12 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3asrd8w58q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 16:39:12 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17VKXlre002349;
 Tue, 31 Aug 2021 20:39:11 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3astd0t1nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 20:39:11 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17VKd9SJ45220212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Aug 2021 20:39:09 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCC1AB206E;
 Tue, 31 Aug 2021 20:39:09 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDDB8B2068;
 Tue, 31 Aug 2021 20:39:06 +0000 (GMT)
Received: from Davids-MBP.randomparity.org (unknown [9.211.151.69])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 31 Aug 2021 20:39:06 +0000 (GMT)
Subject: Re: [PATCH v6 00/11] DDW + Indirect Mapping
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>
References: <20210817063929.38701-1-leobras.c@gmail.com>
 <82ca56ab-6a0a-7cbb-a5e7-facc40f35c3c@linux.vnet.ibm.com>
 <e867b4ddce01adf318bc8837c997ceb64e44c1c5.camel@gmail.com>
From: David Christensen <drc@linux.vnet.ibm.com>
Message-ID: <311ece8f-bedc-b3f7-0d1b-2cb78438890f@linux.vnet.ibm.com>
Date: Tue, 31 Aug 2021 13:39:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
In-Reply-To: <e867b4ddce01adf318bc8837c997ceb64e44c1c5.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PF-tJvB9jy-_Xj8UTzykmc8zk-RM-QnI
X-Proofpoint-GUID: u8McKu4wIzX_1ITn5VA1naiUNRjRuUmI
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-31_09:2021-08-31,
 2021-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108310111
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



On 8/31/21 1:18 PM, Leonardo Brás wrote:
> Hello David,
> 
> Sorry for the delay, I did not get your mail because I was not CC'd
> in your reply (you sent the mail just to the mailing list).
> 
> Replies bellow:
> 
> On Mon, 2021-08-30 at 10:48 -0700, David Christensen wrote:
>> On 8/16/21 11:39 PM, Leonardo Bras wrote:
>>> So far it's assumed possible to map the guest RAM 1:1 to the bus,
>>> which
>>> works with a small number of devices. SRIOV changes it as the user
>>> can
>>> configure hundreds VFs and since phyp preallocates TCEs and does not
>>> allow IOMMU pages bigger than 64K, it has to limit the number of TCEs
>>> per a PE to limit waste of physical pages.
>>>
>>> As of today, if the assumed direct mapping is not possible, DDW
>>> creation
>>> is skipped and the default DMA window "ibm,dma-window" is used
>>> instead.
>>>
>>> Using the DDW instead of the default DMA window may allow to expand
>>> the
>>> amount of memory that can be DMA-mapped, given the number of pages
>>> (TCEs)
>>> may stay the same (or increase) and the default DMA window offers
>>> only
>>> 4k-pages while DDW may offer larger pages (4k, 64k, 16M ...).
>>
>> So if I'm reading this correctly, VFIO applications requiring hugepage
>> DMA mappings (e.g. 16M or 2GB) can be supported on an LPAR or DLPAR
>> after this change, is that correct?
> 
> Different DDW IOMMU page sizes were already supported in Linux (4k,
> 64k, 16M) for a while now, and the remaining page sizes in LoPAR were
> enabled in the following patch:
> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210408201915.174217-1-leobras.c@gmail.com/
> (commit 472724111f0f72042deb6a9dcee9578e5398a1a1)
> 
> The thing is there are two ways of using DMA:
> - Direct DMA, mapping the whole memory space of the host, which
> requires a lot of DMA space if the guest memory is huge. This already
> supports DDW and allows using the bigger pagesizes.
> This happens on device/bus probe.
> 
> - Indirect DMA with IOMMU, mapping memory regions on demand, and un-
> mapping after use. This requires much less DMA space, but causes an
> overhead because an hcall is necessary for mapping and un-mapping.
> Before this series, Indirect DMA was only possible with the 'default
> DMA window' which allows using only 4k pages.
> 
> This series allow Indirect DMA using DDW when available, which usually
> means bigger pagesizes and more TCEs, and so more DMA space.

How is the mapping method selected?  LPAR creation via the HMC, Linux 
kernel load parameter, or some other method?

The hcall overhead doesn't seem too worrisome when mapping 1GB pages so 
the Indirect DMA method might be best in my situation (DPDK).

Dave
