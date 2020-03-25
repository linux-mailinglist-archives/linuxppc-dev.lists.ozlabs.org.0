Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BC7191E82
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 02:15:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48n9Cc2NRWzDqdL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 12:15:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=X1GYU1zr; 
 dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48n99B0HNgzDqcG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 12:13:17 +1100 (AEDT)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02P1AJ0R048600;
 Wed, 25 Mar 2020 01:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=YRi4mb9uG3tgUWBrs1ed4oarNhqa/no2+uBKt2mPO0I=;
 b=X1GYU1zrtODyAZmLxxSuIi6wF25xK5Iptr9D4zm4crNgbz7mnhhHzl+m0S+8trQNakHO
 qYEeB+QCozDAk9I/dsNJrju1255Y1S2Fp4C41axP5+nvpqKcq10QS8eNGgq3hFZMnfWw
 qkjlxJ0Mw0p4itm90v7itlW+1C8CmcVStLceaCg57w0mQadA37fDItuy4SoUwi81cP90
 WMOyTFu0C78xuUgH/6uvrDH8uuyx1h8IcTXbzX43RQwyH7S/8mtsD7enuYspGGEguPrH
 hqgSR2/2iiP1OmhBFafNzjB9Qz7TKYJ4XRCen1bNINFwCRx6G4E3r3pz5j7CevMrdmI9 DA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2ywabr7anf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Mar 2020 01:12:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02P16oZi062576;
 Wed, 25 Mar 2020 01:12:17 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2yymbuy4n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Mar 2020 01:12:17 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02P1C6e1026545;
 Wed, 25 Mar 2020 01:12:06 GMT
Received: from [192.168.1.206] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 24 Mar 2020 18:12:06 -0700
Subject: Re: [PATCH 4/4] hugetlbfs: clean up command line processing
To: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>, Mina Almasry <almasrymina@google.com>
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-5-mike.kravetz@oracle.com>
 <CAHS8izOhjvNVDXsx_SqP_oUQhCw-i_xcG9hxbvV86fFDeY_SAw@mail.gmail.com>
 <d067c5d1-89b8-a71b-7b71-a8bbbd613efa@huawei.com>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <0cfeecb3-95d6-9fd2-d985-f70f1dd416b9@oracle.com>
Date: Tue, 24 Mar 2020 18:12:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d067c5d1-89b8-a71b-7b71-a8bbbd613efa@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9570
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003250008
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9570
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003250008
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, open list <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S.Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/23/20 8:47 PM, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> 
> 
> On 2020/3/24 8:43, Mina Almasry wrote:
>> On Wed, Mar 18, 2020 at 3:07 PM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>>> +default_hugepagesz - Specify the default huge page size.  This parameter can
>>> +       only be specified on the command line.  No other hugetlb command line
>>> +       parameter is associated with default_hugepagesz.  Therefore, it can
>>> +       appear anywhere on the command line.  Valid default huge page size is
>>> +       architecture dependent.
>>
>> Maybe specify what happens/should happen in a case like:
>>
>> hugepages=100 default_hugepagesz=1G
>>
>> Does that allocate 100 2MB pages or 100 1G pages? Assuming the default
>> size is 2MB.

That will allocate 100 1G pages as 1G is the default.  However, if the
command line reads:

hugepages=100 default_hugepagesz=1G hugepages=200

You will get this warning,

HugeTLB: First hugepages=104857600 kB ignored

>>
>> Also, regarding Randy's comment. It may be nice to keep these docs in
>> one place only, so we don't have to maintain 2 docs in sync.

Let me think about that a bit.  We should probably expand the
kernel-parameters doc.  Or, we should at least make it more clear.  This
doc also talks about the command line parameters and in general goes into
more detail.  However, more people read kernel-parameters doc.

>>> +
>>>  When multiple huge page sizes are supported, ``/proc/sys/vm/nr_hugepages``
>>>  indicates the current number of pre-allocated huge pages of the default size.
>>>  Thus, one can use the following command to dynamically allocate/deallocate
>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>> index cc85b4f156ca..2b9bf01db2b6 100644
>>> --- a/mm/hugetlb.c
>>> +++ b/mm/hugetlb.c
<snip>
>>> -static int __init hugetlb_nrpages_setup(char *s)
>>> +/*
>>> + * hugepages command line processing
>>> + * hugepages must normally follows a valid hugepagsz specification.  If not,
>>
>> 'hugepages must' or 'hugepages normally follows'
>>> + * ignore the hugepages value.  hugepages can also be the first huge page
>>> + * command line option in which case it specifies the number of huge pages
>>> + * for the default size.
>>> + */
>>> +static int __init hugepages_setup(char *s)
>>>  {
>>>         unsigned long *mhp;
>>>         static unsigned long *last_mhp;
>>>
>>>         if (!parsed_valid_hugepagesz) {
>>> -               pr_warn("hugepages = %s preceded by "
>>> +               pr_warn("HugeTLB: hugepages = %s preceded by "
>>>                         "an unsupported hugepagesz, ignoring\n", s);
>>>                 parsed_valid_hugepagesz = true;
>>>                 return 1;
>>>         }
>>>         /*
>>> -        * !hugetlb_max_hstate means we haven't parsed a hugepagesz= parameter yet,
>>> -        * so this hugepages= parameter goes to the "default hstate".
>>> +        * !hugetlb_max_hstate means we haven't parsed a hugepagesz= parameter
>>> +        * yet, so this hugepages= parameter goes to the "default hstate".
>>>          */
>>>         else if (!hugetlb_max_hstate)
>>>                 mhp = &default_hstate_max_huge_pages;
>>
>> We don't set parsed_valid_hugepagesz to false at the end of this
>> function, shouldn't we? Parsing a hugepages= value should 'consume' a
>> previously defined hugepagesz= value, so that this is invalid IIUC:
>>
>> hugepagesz=x hugepages=z hugepages=y
>>
> In this case, we'll get:
> "HugeTLB: hugepages= specified twice without interleaving hugepagesz=, ignoring
> hugepages=y"
> 

Thanks Longpeng (Mike),

I believe that is the desired message in this situation.  The code uses saved
values of mhp (max hstate pointer) to catch this condition.  Setting
parsed_valid_hugepagesz to false would result in the message:

HugeTLB: hugepages=y preceded by an unsupported hugepagesz, ignoring

Thanks for all your comments I will incorporate in v2 and send later this
week.
-- 
Mike Kravetz
