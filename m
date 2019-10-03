Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 558CEC978B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 06:53:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kLH62KGGzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 14:53:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kLF960XCzDqWs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 14:51:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46kLF85s6Bz8svr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 14:51:24 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46kLF85gZ6z9sPL; Thu,  3 Oct 2019 14:51:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hegdevasant@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46kLF810Thz9sPJ
 for <linuxppc-dev@ozlabs.org>; Thu,  3 Oct 2019 14:51:23 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x934kSgP107942
 for <linuxppc-dev@ozlabs.org>; Thu, 3 Oct 2019 00:51:20 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vd3wfrqst-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 03 Oct 2019 00:51:20 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hegdevasant@linux.vnet.ibm.com>;
 Thu, 3 Oct 2019 05:51:18 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 3 Oct 2019 05:51:16 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x934pFIp50856164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Oct 2019 04:51:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FED3A4040;
 Thu,  3 Oct 2019 04:51:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DF39A404D;
 Thu,  3 Oct 2019 04:51:14 +0000 (GMT)
Received: from [9.193.108.153] (unknown [9.193.108.153])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  3 Oct 2019 04:51:14 +0000 (GMT)
Subject: Re: [PATCH] powerpc/powernv/prd: Validate whether address to be
 mapped is part of system RAM
To: Jeremy Kerr <jk@ozlabs.org>, linuxppc-dev@ozlabs.org
References: <20191002074856.15014-1-hegdevasant@linux.vnet.ibm.com>
 <2bb75b409a1159d5524be2d661e548e32fed152e.camel@ozlabs.org>
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Date: Thu, 3 Oct 2019 10:21:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2bb75b409a1159d5524be2d661e548e32fed152e.camel@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19100304-0008-0000-0000-0000031D8791
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100304-0009-0000-0000-00004A3C8D29
Message-Id: <0e8a4057-fbe7-9b1a-6613-ad500ebe8b67@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-03_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910030045
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
Cc: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/3/19 7:17 AM, Jeremy Kerr wrote:
> Hi Vasant,

Jeremy,

> 
>> Add check to validate whether requested page is part of system RAM
>> or not before mmap() and error out if its not part of system RAM.
> 
> opal_prd_range_is_valid() will return false if the reserved memory range
> does not have an ibm,prd-label property. If this you're getting invalid
> memory mapped through the PRD interface, that means the device tree is
> incorrectly describing those ranges.

Correct. We will have `ibm,prd-label` property. That's not the issue. Here issue
is HBRT is loaded into NVDIMM memory.


Copy-pasting Vaidy's explanation from internal bugzilla here:

------------------
The root-cause of the problem seem to be in HBRT using NVDIMM area/addresses for 
firmware operation.

Linux maps the required address for HBRT to read, write and execute. This all 
works fine for normal RAM addresses.  However NVDIMM is not normal RAM, it is 
device memory which can be used as RAM or through other layers and subsystem.

Linux kernel memory manager set page table attributes as 0b10 non-idempotent I/O 
instead of normal RAM 0b00 since this is a special type of device memory 
initialized and used by a firmware device driver.  This prevented instruction 
execution from that mapped page.  Since instruction could not be fetched, 
opal-prd application could not complete init and start.

------------------

Hostboot should detect NVDIMM areas and avoid using those areas for any firmware 
purposes including HBRT. Hostboot will fix this issue.

In this patch we are adding additional check to make sure mmap() fails 
gracefully and we log proper error log. That way opal-prd will fail to start 
instead of looping forever .

-Vasant

