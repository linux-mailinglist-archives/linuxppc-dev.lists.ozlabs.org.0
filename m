Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D95F18BDA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 18:09:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jtgZ52SgzDrPp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 04:09:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=kekiTGkN; 
 dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jtdr0w7dzDrPF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:08:15 +1100 (AEDT)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02JGmttO114276;
 Thu, 19 Mar 2020 17:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=NPUm1EQJVtgWLM+t8BAch1GSQ3QvGTbOEaPKJ5CUYgc=;
 b=kekiTGkNqqwLecdSsDCvWSDHKiPSanlqw799v3S5DFviUWnOQ3ztxRngAFS7QVKVuacE
 H9fypgtnLfqIpxFhavkZBD1a0KagmuckYo9UcETMNO1iP4WtlY9820y30sxTyZBU/QAl
 w9Wn//zIzJHveGw/tKV6XN1dfwnJLt2KSUiQCTHSuoCDrQz6ImC0G3g1DYmT4pRJzde+
 lcbcd88a8M0kwISscWrYGjsJfKQEoBaxGtyAWoSsXZqwEYYjfirWeePzu2C0uf3zIBOA
 9A9/jYT1gvE+okRihBVBTU1phAcMxT9JD8fHCQnGjn0ZMFVm1KXd5kFQ6mqgsPmZ5dOY Tg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2yrpprhk34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 17:00:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02JGoqSX138311;
 Thu, 19 Mar 2020 17:00:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2ys8twc791-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 17:00:45 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02JH0aeb016891;
 Thu, 19 Mar 2020 17:00:36 GMT
Received: from [192.168.1.206] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Mar 2020 10:00:36 -0700
Subject: Re: [PATCH 2/4] hugetlbfs: move hugepagesz= parsing to arch
 independent code
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-3-mike.kravetz@oracle.com>
 <2ca058dc-47e6-1d08-154b-77d2cbe98e34@c-s.fr>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <bb1c86b0-5d06-8999-5e3a-f9d20ca46fa1@oracle.com>
Date: Thu, 19 Mar 2020 10:00:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2ca058dc-47e6-1d08-154b-77d2cbe98e34@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9565
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003190073
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9565
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1011
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003190073
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "David S.Miller" <davem@davemloft.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Longpeng <longpeng2@huawei.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/19/20 12:04 AM, Christophe Leroy wrote:
> 
> 
> Le 18/03/2020 à 23:06, Mike Kravetz a écrit :
>> Now that architectures provide arch_hugetlb_valid_size(), parsing
>> of "hugepagesz=" can be done in architecture independent code.
>> Create a single routine to handle hugepagesz= parsing and remove
>> all arch specific routines.  We can also remove the interface
>> hugetlb_bad_size() as this is no longer used outside arch independent
>> code.
>>
>> This also provides consistent behavior of hugetlbfs command line
>> options.  The hugepagesz= option should only be specified once for
>> a specific size, but some architectures allow multiple instances.
>> This appears to be more of an oversight when code was added by some
>> architectures to set up ALL huge pages sizes.
>>
>> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
>> ---
>>   arch/arm64/mm/hugetlbpage.c   | 15 ---------------
>>   arch/powerpc/mm/hugetlbpage.c | 15 ---------------
>>   arch/riscv/mm/hugetlbpage.c   | 16 ----------------
>>   arch/s390/mm/hugetlbpage.c    | 18 ------------------
>>   arch/sparc/mm/init_64.c       | 22 ----------------------
>>   arch/x86/mm/hugetlbpage.c     | 16 ----------------
>>   include/linux/hugetlb.h       |  1 -
>>   mm/hugetlb.c                  | 24 ++++++++++++++++++------
>>   8 files changed, 18 insertions(+), 109 deletions(-)
>>
> 
> [snip]
> 
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 2f99359b93af..cd4ec07080fb 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -3149,12 +3149,6 @@ static int __init hugetlb_init(void)
>>   }
>>   subsys_initcall(hugetlb_init);
>>   -/* Should be called on processing a hugepagesz=... option */
>> -void __init hugetlb_bad_size(void)
>> -{
>> -    parsed_valid_hugepagesz = false;
>> -}
>> -
>>   void __init hugetlb_add_hstate(unsigned int order)
>>   {
>>       struct hstate *h;
>> @@ -3224,6 +3218,24 @@ static int __init hugetlb_nrpages_setup(char *s)
>>   }
>>   __setup("hugepages=", hugetlb_nrpages_setup);
>>   +static int __init hugepagesz_setup(char *s)
>> +{
>> +    unsigned long long size;
>> +    char *saved_s = s;
>> +
>> +    size = memparse(s, &s);
> 
> You don't use s after that, so you can pass NULL instead of &s and avoid the saved_s

Thanks!

I'll incorporate in v2.

-- 
Mike Kravetz
