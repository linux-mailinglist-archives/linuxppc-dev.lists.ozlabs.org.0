Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36157762ACE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 07:30:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZFSnJbIB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9jDG2LKKz3cM5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 15:30:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZFSnJbIB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9jCK6nC4z2yh0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 15:30:05 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q5NFIS021884;
	Wed, 26 Jul 2023 05:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ftq0KhxaGBwO5g0s72Z/qk0VchyD9N3H7MwXRRnN6b0=;
 b=ZFSnJbIBDNnyLrTnSXMsU5XGNbPDwREXF/FnVRgM21FwSs/owEeagVJzk5ilT2JN/p/o
 BDRdPkJCHGY/tAMN/M3O1273njSgBxEnbCw15IfGsnBzK8I/DcHqgTakIw5W9np0HFTI
 8ZH09xwrGhVo4XWKTst3TlPmr4AAgB6n3OM1XWIN3PUFijhpqEtWkZ5F4MaGId53Hb6U
 B1Z3kM5IbrA/HVHH1qfnBjB/2sNlrGx7/3vAA3nJHJdhsWeP25DOfo30/iHIOFhM6Ku9
 CUDJBHxbHHtVTsR0y1h0TRgyRqhfB0sU1dwyq1h/e/Q6ZIFlLCysaZZ/dM9W7D3uO9cG hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s2w9sg3tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 05:29:39 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36Q5PYag027699;
	Wed, 26 Jul 2023 05:29:39 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s2w9sg3t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 05:29:39 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q4ekAI026189;
	Wed, 26 Jul 2023 05:29:38 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0ses2mwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 05:29:38 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36Q5TaWc19792598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jul 2023 05:29:36 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5841120043;
	Wed, 26 Jul 2023 05:29:36 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 445A220040;
	Wed, 26 Jul 2023 05:29:33 +0000 (GMT)
Received: from [9.43.89.11] (unknown [9.43.89.11])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Jul 2023 05:29:32 +0000 (GMT)
Message-ID: <47feb4fe-f461-a2c2-1368-5480d00d0f1d@linux.ibm.com>
Date: Wed, 26 Jul 2023 10:59:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 00/13] Add support for DAX vmemmap optimization for
 ppc64
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
References: <20230724190759.483013-1-aneesh.kumar@linux.ibm.com>
 <20230725122959.e9b79e7528cd3084802fa6d0@linux-foundation.org>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230725122959.e9b79e7528cd3084802fa6d0@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mh1BfZWWov14B13RHnprQ-dgVT7UJcGr
X-Proofpoint-ORIG-GUID: jWIvwFR1TKpmylsgApLpJBaMM3Dk2rio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_14,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307260043
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
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org, npiggin@gmail.com, Catalin Marinas <catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>, Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org, Joao Martins <joao.m.martins@oracle.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/26/23 12:59 AM, Andrew Morton wrote:
> On Tue, 25 Jul 2023 00:37:46 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:
> 
>> This patch series implements changes required to support DAX vmemmap
>> optimization for ppc64.
> 
> Do we have any measurements to help us understand the magnitude
> of this optimization?
> 
> And any documentation which helps users understand whether and
> why they should enable this feature?

That is memory space optimization due to kernel reusing the tail page struct pages. The details
of the optimization is documented in patch 11. We document there the impact with both 4k and
64K page size.

-aneesh
