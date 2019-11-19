Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F14E1026E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 15:35:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HSzK0FKLzDqYC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 01:35:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HSwx1jSWzDqXg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 01:33:19 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJEM3vR004632
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 09:33:15 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wbxncbqdb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 09:33:14 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Tue, 19 Nov 2019 14:33:12 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 19 Nov 2019 14:33:10 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAJEWVaH31129920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 14:32:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EC79A405C;
 Tue, 19 Nov 2019 14:33:09 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C38FA405F;
 Tue, 19 Nov 2019 14:33:09 +0000 (GMT)
Received: from bali.tlslab.ibm.com (unknown [9.101.4.17])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 Nov 2019 14:33:09 +0000 (GMT)
Subject: Re: [PATCH 05/11] powerpc/powernv/ioda: Find opencapi slot for a
 device node
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <20190909154600.19917-6-fbarrat@linux.ibm.com>
 <b85f55e1-fb08-066d-fc50-72b3a1207be8@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Tue, 19 Nov 2019 15:33:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <b85f55e1-fb08-066d-fc50-72b3a1207be8@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19111914-0028-0000-0000-000003BB8B7F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111914-0029-0000-0000-0000247EA940
Message-Id: <f3fe4109-68fa-eb32-2675-221adefec267@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_04:2019-11-15,2019-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxlogscore=796
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911190133
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



Le 19/11/2019 à 02:26, Andrew Donnellan a écrit :
> On 10/9/19 1:45 am, Frederic Barrat wrote:
>> diff --git a/arch/powerpc/platforms/powernv/pci.c 
>> b/arch/powerpc/platforms/powernv/pci.c
>> index 6104418c9ad5..00a79f3c989f 100644
>> --- a/arch/powerpc/platforms/powernv/pci.c
>> +++ b/arch/powerpc/platforms/powernv/pci.c
>> @@ -48,13 +48,14 @@ int pnv_pci_get_slot_id(struct device_node *np, 
>> uint64_t *id)
>>           return -ENXIO;
>>       bdfn = ((bdfn & 0x00ffff00) >> 8);
>> -    while ((parent = of_get_parent(parent))) {
>> +    for (parent = np; parent; parent = of_get_parent(parent)) {
> 
> I think we should rename this pointer from "parent" as it no longer 
> means that.


ok. We still walk the parent list, but we don't start from the first 
parent any more. I'll rename with a more generic "node" to avoid confusion.

   Fred

