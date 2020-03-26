Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF819194B38
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:06:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pJwf0fQLzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 09:06:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=DkZIPKkv; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pJtT3ShBzDqNw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 09:04:32 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02QLn98F086088;
 Thu, 26 Mar 2020 21:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=jJlpHWqDgAaQnn+x/AibIAVJw425RNnEJVeE/H96C6Q=;
 b=DkZIPKkvMhi7MgJ7A6372ctDD6ur875QCwmr9LjM6f/gcN5OLsYztXi/9wp7FD338Eh1
 BcpAaYJlJsPca1+YzPWnvyZLl0/l9jzlAO26D9M2lRz/YnxIOtavH2bdzDl78rbNS7QS
 w/70j06rpqsxG+rvW1byAPFer6qmmn6ntz8ZtvxuNNNNHPQ6CcnDnqC0fhG48N9veZVg
 BCfsiKmD0CdRGaJja5RXf7JXI4W1+6Wfb9/4o4noftsF2yrL4eKSp0J70hpbbeGCvHbP
 j84RfZbN8C8lsTDgCFGpBO0ICKX/8T12IimZxxtb9mIqtc54TXgPLYw1Bv1mXgDOPyi2 vQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2ywavmjcja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 21:56:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02QLpI7M027652;
 Thu, 26 Mar 2020 21:56:24 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2yxw4ufgb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 21:56:23 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02QLuAlh008996;
 Thu, 26 Mar 2020 21:56:10 GMT
Received: from [192.168.1.206] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 26 Mar 2020 14:56:10 -0700
Subject: Re: [PATCH 1/4] hugetlbfs: add arch_hugetlb_valid_size
To: Dave Hansen <dave.hansen@intel.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-2-mike.kravetz@oracle.com>
 <831a0773-1ba6-4d72-44b9-7472123b8528@intel.com>
 <5aceea6a-8dc0-a44b-80c6-94511b5c75ca@oracle.com>
 <1c8b16c7-248e-b75f-96c6-eabc953c5066@intel.com>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <530e6e11-ad1a-55bc-e61e-9da6eb7fea21@oracle.com>
Date: Thu, 26 Mar 2020 14:56:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1c8b16c7-248e-b75f-96c6-eabc953c5066@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9572
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=2
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260159
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9572
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 phishscore=0 suspectscore=2 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003260159
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Longpeng <longpeng2@huawei.com>, Will Deacon <will@kernel.org>,
 "David S.Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/18/20 4:36 PM, Dave Hansen wrote:
> On 3/18/20 3:52 PM, Mike Kravetz wrote:
>> Sounds good.  I'll incorporate those changes into a v2, unless someone
>> else with has a different opinion.
>>
>> BTW, this patch should not really change the way the code works today.
>> It is mostly a movement of code.  Unless I am missing something, the
>> existing code will always allow setup of PMD_SIZE hugetlb pages.
> 
> Hah, I totally skipped over the old code in the diff.
> 
> It looks like we'll disable hugetblfs *entirely* if PSE isn't supported.
>  I think this is actually wrong, but nobody ever noticed.  I think you'd
> have to be running as a guest under a hypervisor that's lying about PSE
> not being supported *and* care about 1GB pages.  Nobody does that.

Actually, !PSE will disable hugetlbfs a little later in the boot process.
You are talking about hugepages_supported() correct?

I think something really bad could happen in this situation (!PSE and
X86_FEATURE_GBPAGES).  When parsing 'hugepages=' for gigantic pages we
immediately allocate from bootmem.  This happens before later checks in
hugetlb_init for hugepages_supported().  So, I think we would end up
allocating GB pages from bootmem and not be able to use or free them. :(

Perhaps it would be best to check hugepages_supported() when parsing
hugetlb command line options.  If not enabled, throw an error.  This
will be much easier to do after moving all command line parsing to
arch independent code.

Is that a sufficient way to address this concern?  I think it is a good
change in any case.
-- 
Mike Kravetz
