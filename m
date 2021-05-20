Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0615F38AFE8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:24:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm9S501Hzz3brt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:24:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J391MNd8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J391MNd8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm9RV6lK7z2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:23:34 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KD39xN031621; Thu, 20 May 2021 09:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZHASfIHMuDTKSWoa/Eltfhocg2O9MUkKTNAbdBxqjyc=;
 b=J391MNd8BOXpS9cCuSVf9eFOfU0gMUn+S10+4AgsEGnJ9QkEQzF2+9DeVcuJ/ss/XH15
 rYYgOVM9aWKAyoyMhFTlgfxkXpR3FlYvlGFJ5uJgBdxiXxAQw4h+yzb9aXZESUcE8wuQ
 KSu9F0bK3c64j94bakJ0hr5HghDzlGQ+oQndWqxs29hwJoIVN1Ve+nn4/Crj/N3GrdOf
 Yz4BCFzmaFkCgCQ+F7DRtGkl96JSHa5v4WmYaAxtqswVlNhFvQMh5MGPYjYokHKDa1QC
 5EtIvOXtCyt8eFubi00hcO5KhRG3/z4Vz6sJbo9uIr5YkL8Sl6uEjON+7LtAozVSAZUk hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38nr1k98nj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 09:23:16 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14KD3Icc032848;
 Thu, 20 May 2021 09:23:15 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38nr1k98fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 09:23:15 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14KDJWF6010192;
 Thu, 20 May 2021 13:23:07 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 38m1gv0uas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 13:23:07 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14KDN5IG57606556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 13:23:05 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E622AA405B;
 Thu, 20 May 2021 13:23:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C234CA4053;
 Thu, 20 May 2021 13:23:02 +0000 (GMT)
Received: from [9.85.101.109] (unknown [9.85.101.109])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 May 2021 13:23:02 +0000 (GMT)
Subject: Re: [PATCH v5 3/9] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
To: Peter Xu <peterx@redhat.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-4-aneesh.kumar@linux.ibm.com>
 <YKQdxpHVYB9H0M0j@Ryzen-9-3900X.localdomain> <87mtsrqqk0.fsf@linux.ibm.com>
 <YKXHA8/HmP6HXngO@t490s> <6e0dbb76-2b33-53f1-246e-30cec2b871e2@linux.ibm.com>
 <YKZaLHurH9nJWvbj@t490s>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <e6525655-2e51-a0c0-fe54-596cfae9ce21@linux.ibm.com>
Date: Thu, 20 May 2021 18:53:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YKZaLHurH9nJWvbj@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0NefKFqc_RrteoODt-XNaqjUeFfSwJb7
X-Proofpoint-GUID: gNLOnfwhuZ6StLcViYF3ETu0IAh8eLSt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_03:2021-05-20,
 2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105200097
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
Cc: npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/20/21 6:16 PM, Peter Xu wrote:
> On Thu, May 20, 2021 at 01:56:54PM +0530, Aneesh Kumar K.V wrote:
>>> This seems to work at least for my userfaultfd test on shmem, however I don't
>>> fully understand the commit message [1] on: How do we guarantee we're not
>>> moving a thp pte?
>>>
>>
>> move_page_tables() checks for pmd_trans_huge() and ends up calling
>> move_huge_pmd if it is a THP entry.
> 
> Sorry to be unclear: what if a huge pud thp?
> 

I am still checking. Looking at the code before commit 
c49dd340180260c6239e453263a9a244da9a7c85, I don't see kernel handling 
huge pud thp. I haven't studied huge pud thp enough to understand 
whether c49dd340180260c6239e453263a9a244da9a7c85 intent to add that 
support.

We can do a move_huge_pud() like we do for huge pmd thp. But I am not 
sure whether we handle those VMA's earlier and restrict mremap on them?

Are huge pud thp only allowed with DAX vmas?


-aneesh
