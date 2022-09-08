Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AFA5B241F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 19:01:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNlkp3yHJz3bnV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 03:01:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cKtuK38q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cKtuK38q;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNlk42HMXz2xfs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 03:00:28 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288Fo80F031133;
	Thu, 8 Sep 2022 17:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8AW4KlqyJt539Sq/UiKumFe+LFsf0MsnpKLzYAns/mg=;
 b=cKtuK38q53h/v7XUNMryLT1+qSS2p0CZ5zY3y+bR49QcEmWo9zNOdG9zDBBSlvdDs38R
 KjAYf5ImTdTc/9O1nsoWjEq0+MHO15HPIaMYTB17ieFz3eupvnbDw0pzKKYKapvfKWKd
 +n/RJPX18ECr7Zi/xbCmnCrIB3Hm4E4tr4m6khDmYoq9VYebcScYFQHaiVK9MRaOOlIp
 YINFK164cYNvqWF3uQIkDR47x9jVs6z0K3BQzUF9py7tS4pnTYgX1+8vjh6/GA2N/UYk
 MxaOVaZsJjJjVZALmoCPHU86u2rFeRaIyQpdzNFwjjLvEcyt0TvS7JBjdLQ10BZaSMQb 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jfjampc8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Sep 2022 17:00:08 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 288EbSXI031823;
	Thu, 8 Sep 2022 17:00:08 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jfjampc6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Sep 2022 17:00:08 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 288Goexi006923;
	Thu, 8 Sep 2022 17:00:05 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04ams.nl.ibm.com with ESMTP id 3jbxj8xv7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Sep 2022 17:00:05 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 288H03tR36897048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Sep 2022 17:00:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B74A11C052;
	Thu,  8 Sep 2022 17:00:03 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7688511C04C;
	Thu,  8 Sep 2022 17:00:00 +0000 (GMT)
Received: from [9.43.97.195] (unknown [9.43.97.195])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  8 Sep 2022 17:00:00 +0000 (GMT)
Message-ID: <6e8246ae-c420-df00-c1d1-03c49c0ab1f1@linux.ibm.com>
Date: Thu, 8 Sep 2022 22:29:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH] fs/hugetlb: Fix UBSAN warning reported on hugetlb
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
References: <20220908072659.259324-1-aneesh.kumar@linux.ibm.com>
 <YxoeFUW5HFP/3/s1@casper.infradead.org>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <YxoeFUW5HFP/3/s1@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FMbPsgOwhsIocIP-GmBJf4Sv-eoTvw7H
X-Proofpoint-GUID: ppeyt1aZMBSqFvKG2fYMkZe-o4CL7I5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_10,2022-09-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209080059
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
Cc: David Howells <dhowells@redhat.com>, linux-mm@kvack.org, npiggin@gmail.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/8/22 10:23 PM, Matthew Wilcox wrote:
> On Thu, Sep 08, 2022 at 12:56:59PM +0530, Aneesh Kumar K.V wrote:
>> +++ b/fs/dax.c
>> @@ -1304,7 +1304,7 @@ EXPORT_SYMBOL_GPL(dax_zero_range);
>>  int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
>>  		const struct iomap_ops *ops)
>>  {
>> -	unsigned int blocksize = i_blocksize(inode);
>> +	size_t blocksize = i_blocksize(inode);
>>  	unsigned int off = pos & (blocksize - 1);
> 
> If blocksize is larger than 4GB, then off also needs to be size_t.
> 
>> +++ b/fs/iomap/buffered-io.c
>> @@ -955,7 +955,7 @@ int
>>  iomap_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
>>  		const struct iomap_ops *ops)
>>  {
>> -	unsigned int blocksize = i_blocksize(inode);
>> +	size_t blocksize = i_blocksize(inode);
>>  	unsigned int off = pos & (blocksize - 1);
> 
> Ditto.
> 
> (maybe there are others; I didn't check closely)

Thanks. will check those. 

Any feedback on statx? Should we really fix that?

I am still not clear why we chose to set blocksize = pagesize for hugetlbfs.
Was that done to enable application find the hugetlb pagesize via stat()? 

-aneesh
