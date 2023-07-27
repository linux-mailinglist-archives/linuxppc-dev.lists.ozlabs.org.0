Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C087645CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 07:38:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jg/EpOQj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBKLn6gPsz3cLn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 15:38:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jg/EpOQj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBKKq42Lbz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 15:37:51 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R570jK019782;
	Thu, 27 Jul 2023 05:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=vbyv7nK0/rWN25g6iD37vzdBj3oerzs3+vVJE7cXvQk=;
 b=jg/EpOQjdruf0SmmsTgd41z0XjcU3t9fbp458LD2qCPM/nSIZMm+0VoBKmFkOS0dIWJr
 RV+4LLxzM/uNVk1Fn9407Tswzbss3wCp2yLnP1lI6GBuLnPA5FdXTQUTIi+PXAwoBVL6
 mpqlT4JYIwUdBYuHHXXEw9UMTgumImQm3azf0KMca8Uk5kyYoaB+JGsPXtgGtRC2wUK3
 wnhvKt9pDgV4lX7RJfe/2zTvV2eSCvxVDl9dGSO4LA6psjN1HoJnG1aX4Nfeg08AaRpb
 BEErZwk3pAWbTrOGCt+rtOCP6Pqf14KUX8v5oAvDj4Kk7o2CqW9mgS1EsrBlndan3nMT 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3hyqgxby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 05:37:27 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36R5RoGw030778;
	Thu, 27 Jul 2023 05:37:26 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3hyqgxb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 05:37:26 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36R5W9mL026197;
	Thu, 27 Jul 2023 05:37:25 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0sesbaww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 05:37:25 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36R5bOZC2687734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jul 2023 05:37:24 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA8BF58058;
	Thu, 27 Jul 2023 05:37:24 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE3EF5805C;
	Thu, 27 Jul 2023 05:37:19 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.109.212.144])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Jul 2023 05:37:19 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v6 00/13] Add support for DAX vmemmap optimization for
 ppc64
In-Reply-To: <20230726115246.b6ed2a08aa7b648671107a8a@linux-foundation.org>
References: <20230724190759.483013-1-aneesh.kumar@linux.ibm.com>
 <20230725122959.e9b79e7528cd3084802fa6d0@linux-foundation.org>
 <47feb4fe-f461-a2c2-1368-5480d00d0f1d@linux.ibm.com>
 <20230726115246.b6ed2a08aa7b648671107a8a@linux-foundation.org>
Date: Thu, 27 Jul 2023 11:07:18 +0530
Message-ID: <87bkfxx6cx.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nIwoOtlKwJTvi1kcSRXRmZFKi1hg4oTG
X-Proofpoint-GUID: oAgcM2EyFWLcbuT3yAplzmhZRYeBgtf9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=881 bulkscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307270049
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

Andrew Morton <akpm@linux-foundation.org> writes:

> On Wed, 26 Jul 2023 10:59:32 +0530 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com> wrote:
>
>> On 7/26/23 12:59 AM, Andrew Morton wrote:
>> > On Tue, 25 Jul 2023 00:37:46 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:
>> > 
>> >> This patch series implements changes required to support DAX vmemmap
>> >> optimization for ppc64.
>> > 
>> > Do we have any measurements to help us understand the magnitude
>> > of this optimization?
>> > 
>> > And any documentation which helps users understand whether and
>> > why they should enable this feature?
>> 
>> That is memory space optimization due to kernel reusing the tail page struct pages. The details
>> of the optimization is documented in patch 11. We document there the impact with both 4k and
>> 64K page size.
>
> I suppose that with sufficient arithmetic one could use
> Documentation/powerpc/vmemmap_dedup.rst to figure out the bottom-line
> savings.
>
> I was more expecting a straightforward statement in the [0/N] overview
> to help people understand why they're reading this patchset at all.
> Like "saves 5% of total memory on my XXX machine".

This is specific to devdax usage and also depends on devdax alignment.
The actual saving details are also documented in mm/vmemmap_dedup.rst.
The saving will be based on the devdax device memory size and aligment.

With 64K page size for 16384 pages added (1G) we save 14 pages
With 4K page size for 262144 pages added (1G) we save 4094 pages
With 4K page size for 512 pages added (2M) we save 6 pages

-aneesh
