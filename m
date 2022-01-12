Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2E848C19C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 10:51:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYjWW69Jrz30Mr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 20:51:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cdl1uwFC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cdl1uwFC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYjVj3DSZz2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 20:50:51 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20C7QTlQ017254; 
 Wed, 12 Jan 2022 09:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OBQFEbRX7vS7SRjntuk/9gX7EVtlY4nJJY60J+1eMx0=;
 b=cdl1uwFC+vkdzS+J1H3TISe8KyIm29IlakDlnU5tSdWozcAYXkNJMyGIkSrijvQgZVUX
 RJVLGc7scoNBhn9pNQSao0f+lRtIBwRZw0//L+gqEoSONe6a3eHwVYMaoKA7xsbU5c1X
 VQNH2/AMXLLk0jg33ZYKpwEzWwgoMRKJYFzIubAWUd7XQMo4Il4iNNAEdTzX6S1G8/7N
 vdz3WXiOI8QKY+DFdcnAUrUN7pOsJSOBfouBuilZhdG6a0vUw2bTemvTMuDKEiNj1+6k
 o+yhQtAeZFnFqnkKUVJrmH3br47lhgfkHpX6Xbr22YGkoJqk/7Wm86A//rdr2ksyirWE 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhtkr2gpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 09:50:42 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20C9Vja1020835;
 Wed, 12 Jan 2022 09:50:42 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhtkr2gnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 09:50:42 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20C9gRGI030828;
 Wed, 12 Jan 2022 09:50:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3df289e79j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 09:50:40 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20C9obAI38207978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 09:50:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C5C14C050;
 Wed, 12 Jan 2022 09:50:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A5A34C04E;
 Wed, 12 Jan 2022 09:50:32 +0000 (GMT)
Received: from [9.163.9.101] (unknown [9.163.9.101])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 09:50:31 +0000 (GMT)
Message-ID: <4eafb016-8b80-dae5-cd93-69adca33bfb7@linux.ibm.com>
Date: Wed, 12 Jan 2022 15:20:29 +0530
MIME-Version: 1.0
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
 <bc8c2655-d540-5d87-9811-054e87e84487@linux.ibm.com>
 <21364354-83d1-5a56-378e-8ca07ccf9957@redhat.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <21364354-83d1-5a56-378e-8ca07ccf9957@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Izr7lUSFYi7ivtarlHQOEdYZwe3jNepZ
X-Proofpoint-ORIG-GUID: _q2cqel33x_f-hYUMaJgZ06jRn8GVq3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120061
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
Cc: mike.kravetz@oracle.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 osalvador@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/01/22 8:06 pm, David Hildenbrand wrote:
> On 06.01.22 13:01, Hari Bathini wrote:
>>
>> To answer the question, fadump does not want the memory to be used for
>> kernel pages, if CMA activation fails...
> 
> Okay, so what you want is a reserved region, and if possible, let CMA
> use that memory for other (movable allocation) purposes until you
> actually need that area and free it up by using CMA. If CMA cannot use
> the region because of zone issues, you just want that region to stay
> reserved.
> 

Right.

> I guess the biggest different to other CMA users is that it can make use
> of the memory even if not allocated via CMA -- because it's going to
> make use of the the physical memory range indirectly via a HW facility,
> not via any "struct page" access.
> 
> 
> I wonder if we can make the terminology a bit clearer, the freeing part
> is a bit confusing, because init_cma_reserved_pageblock() essentially
> also frees pages, just to the MIGRATE_CMA lists ... what you want is to
> treat it like a simple memblock allocation/reservation on error.

> What about:
> * cma->reserve_pages_on_error that defaults to false
> * void __init cma_reserve_pages_on_error(struct cma *cma)

Yeah, this change does make things bit more clearer.
Will send out a v2 with the change..

