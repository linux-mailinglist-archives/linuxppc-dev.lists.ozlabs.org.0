Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BF9486419
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 13:03:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JV4jx1CPPz3cCw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 23:03:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m5+KkZdn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m5+KkZdn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JV4j66XFPz2x9T
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 23:02:18 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2069odTh028396; 
 Thu, 6 Jan 2022 12:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5ZprtjbV/QR3QSKTYw0UtXUoMTyJoBPKWwbTKYOWUu8=;
 b=m5+KkZdnxevb+Lxg3xyUIYNEvVwOCwWjohH1oq6Yg4KEOwH2OMYFPuGVjq9a8bDDCalw
 xxrcCKhax5iwloCm0QQ3v6ReyhzyzQv7Z789AllmCZW3KPIRlOTiO+GkwcVzlFzlubrb
 UGopiLKQXUrS3iNibDm5usbUkdt8LjTEnPPd9DOxMDws5utq3psINlD/qSG2vFHcFbsq
 kzXeQI6FETNhuE05QMVYd3tfSseY2++66kIRwOsQkbHaXaZlEU4pFPHDVqWPLibnyWkm
 r448YIZSnDQInOz+wjZadrZyc+2zBuibJITzBEALjflt0E4Z1EAQwfVAs5wG13O2T11c oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ddx5b2aeh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 12:02:10 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 206Bn0GZ003154;
 Thu, 6 Jan 2022 12:02:10 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ddx5b2adj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 12:02:09 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206Bvaw3014416;
 Thu, 6 Jan 2022 12:02:07 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3ddmsvmw8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 12:02:07 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 206C24Mq37749138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 12:02:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E69EC5204E;
 Thu,  6 Jan 2022 12:02:03 +0000 (GMT)
Received: from [9.163.12.49] (unknown [9.163.12.49])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9EC2B5205F;
 Thu,  6 Jan 2022 12:01:59 +0000 (GMT)
Message-ID: <bc8c2655-d540-5d87-9811-054e87e84487@linux.ibm.com>
Date: Thu, 6 Jan 2022 17:31:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] mm/cma: provide option to opt out from exposing pages
 on activation failure
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
References: <20211220193419.104242-1-hbathini@linux.ibm.com>
 <20211220193419.104242-2-hbathini@linux.ibm.com>
 <e4748b18-3de3-b3f9-464a-e5cfcf9f05d4@redhat.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <e4748b18-3de3-b3f9-464a-e5cfcf9f05d4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GfFPFHyGHg9HO-LKoI_82MhLV_wyhyeY
X-Proofpoint-GUID: ZMlp5uAk3kBJhlhqSv2hc3Dloifv4YRN
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_04,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 clxscore=1011 mlxlogscore=999 malwarescore=0
 spamscore=0 mlxscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2112160000 definitions=main-2201060086
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
Cc: osalvador@suse.de, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 22/12/21 12:18 am, David Hildenbrand wrote:
> On 20.12.21 20:34, Hari Bathini wrote:
>> Commit 072355c1cf2d ("mm/cma: expose all pages to the buddy if
>> activation of an area fails") started exposing all pages to buddy
>> allocator on CMA activation failure. But there can be CMA users that
>> want to handle the reserved memory differently on CMA allocation
>> failure. Provide an option to opt out from exposing pages to buddy
>> for such cases.

Hi David,

Sorry, I could not get back on this sooner. I went out on vacation
and missed this.
.

> 
> Can you elaborate why that is important and what the target user can
> actually do with it?
Previously, firmware-assisted dump [1] used to reserve memory that it 
needs for booting a capture kernel & offloading /proc/vmcore.
This memory is reserved, basically blocked from being used by
production kernel, to ensure kernel crash context is not lost on
booting into a capture kernel from this memory chunk.

But [2] started using CMA instead to let the memory be used at least
in some cases as long as this memory is not going to have kernel pages. 
So, the intention in using CMA was to keep the memory unused if CMA
activation fails and only let it be used for some purpose, if at all,
if CMA activation succeeds. But [3] breaks that assumption reporting
weird errors on vmcore captured with fadump, when CMA activation fails.

To answer the question, fadump does not want the memory to be used for
kernel pages, if CMA activation fails...


[1] 
https://github.com/torvalds/linux/blob/master/Documentation/powerpc/firmware-assisted-dump.rst
[2] https://github.com/torvalds/linux/commit/a4e92ce8e4c8
[3] https://github.com/torvalds/linux/commit/072355c1cf2d

Thanks
Hari
