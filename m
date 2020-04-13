Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 709F61A6BDA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 20:04:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491Ght3bmCzDqPK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 04:04:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=uHwvjP11; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491Gfv4kGpzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 04:02:31 +1000 (AEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03DHxGn2083583;
 Mon, 13 Apr 2020 18:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=xhydZCkjlWOIFYyyTGKGxjkr1dP6ftMJcpLbzCmVOzQ=;
 b=uHwvjP11jr+/4Yoyf/lQn/TjPhHVKkEf5lNbjPmaqTkmaGQy2j7vGUypEDGtIlnjy5GZ
 L2+R8trEe7BguDSOinuFzIUQveiSKFB5PxNN+jL9uSw9SFovPKFc7N+vcQm3pGANBycS
 /rayvGm/jgL8xNFv0ahJpjyApo7+I9AhwsN6p+BqJHcFFB4Z3JEgbPoIcHOe89UjqJa9
 374aVh4NETOU/lpgLAcsNWK/Z/8dVRySnek2k5W7qWeBA4CRm7DxbyooZu3bHkdhcnSa
 ivD89dD6PR63R/rj3/F6uHqziFkrZ8+4Rg2qZ7dG1H5/jMGbR6xf4jZ4/2Hgj8OhLbAb Bg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 30b6hpg0qw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Apr 2020 18:01:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03DHvtmr082332;
 Mon, 13 Apr 2020 17:59:38 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 30bqpcs09f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Apr 2020 17:59:38 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03DHxUvA003953;
 Mon, 13 Apr 2020 17:59:31 GMT
Received: from [192.168.1.206] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 13 Apr 2020 10:59:30 -0700
Subject: Re: [PATCH v2 4/4] hugetlbfs: clean up command line processing
To: Peter Xu <peterx@redhat.com>
References: <20200401183819.20647-1-mike.kravetz@oracle.com>
 <20200401183819.20647-5-mike.kravetz@oracle.com>
 <20200410203730.GG3172@xz-x1>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <ce42fa12-023b-7ed2-a60e-7dbf9c530981@oracle.com>
Date: Mon, 13 Apr 2020 10:59:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200410203730.GG3172@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9590
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004130137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9590
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004130137
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
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Mina Almasry <almasrymina@google.com>, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Longpeng <longpeng2@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S.Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/10/20 1:37 PM, Peter Xu wrote:
> On Wed, Apr 01, 2020 at 11:38:19AM -0700, Mike Kravetz wrote:
>> With all hugetlb page processing done in a single file clean up code.
>> - Make code match desired semantics
>>   - Update documentation with semantics
>> - Make all warnings and errors messages start with 'HugeTLB:'.
>> - Consistently name command line parsing routines.
>> - Check for hugepages_supported() before processing parameters.
>> - Add comments to code
>>   - Describe some of the subtle interactions
>>   - Describe semantics of command line arguments
>>
>> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
>> ---
>>  .../admin-guide/kernel-parameters.txt         | 35 ++++---
>>  Documentation/admin-guide/mm/hugetlbpage.rst  | 44 +++++++++
>>  mm/hugetlb.c                                  | 96 +++++++++++++++----
>>  3 files changed, 142 insertions(+), 33 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 1bd5454b5e5f..de653cfe1726 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -832,12 +832,15 @@
>>  			See also Documentation/networking/decnet.txt.
>>  
>>  	default_hugepagesz=
>> -			[same as hugepagesz=] The size of the default
>> -			HugeTLB page size. This is the size represented by
>> -			the legacy /proc/ hugepages APIs, used for SHM, and
>> -			default size when mounting hugetlbfs filesystems.
>> -			Defaults to the default architecture's huge page size
>> -			if not specified.
>> +			[HW] The size of the default HugeTLB page size. This
> 
> Could I ask what's "HW"?  Sorry this is not a comment at all but
> really a pure question I wanted to ask... :)

kernel-parameters.rst includes kernel-parameters.txt and included the meaning
for these codes.

       HW      Appropriate hardware is enabled.

Previously, it listed an obsolete list of architectures.

>> +			is the size represented by the legacy /proc/ hugepages
>> +			APIs.  In addition, this is the default hugetlb size
>> +			used for shmget(), mmap() and mounting hugetlbfs
>> +			filesystems.  If not specified, defaults to the
>> +			architecture's default huge page size.  Huge page
>> +			sizes are architecture dependent.  See also
>> +			Documentation/admin-guide/mm/hugetlbpage.rst.
>> +			Format: size[KMG]
>>  
>>  	deferred_probe_timeout=
>>  			[KNL] Debugging option to set a timeout in seconds for
>> @@ -1480,13 +1483,19 @@
>>  			If enabled, boot-time allocation of gigantic hugepages
>>  			is skipped.
>>  
>> -	hugepages=	[HW,X86-32,IA-64] HugeTLB pages to allocate at boot.
>> -	hugepagesz=	[HW,IA-64,PPC,X86-64] The size of the HugeTLB pages.
>> -			On x86-64 and powerpc, this option can be specified
>> -			multiple times interleaved with hugepages= to reserve
>> -			huge pages of different sizes. Valid pages sizes on
>> -			x86-64 are 2M (when the CPU supports "pse") and 1G
>> -			(when the CPU supports the "pdpe1gb" cpuinfo flag).
>> +	hugepages=	[HW] Number of HugeTLB pages to allocate at boot.
>> +			If this follows hugepagesz (below), it specifies
>> +			the number of pages of hugepagesz to be allocated.
> 
> "... Otherwise it specifies the number of pages to allocate for the
> default huge page size." ?

Yes, best to be specific.  I suspect this is the most common way this
parameter is used.

> 
>> +			Format: <integer>
> 
> How about add a new line here?

Sure

>> +	hugepagesz=
>> +			[HW] The size of the HugeTLB pages.  This is used in
>> +			conjunction with hugepages (above) to allocate huge
>> +			pages of a specific size at boot.  The pair
>> +			hugepagesz=X hugepages=Y can be specified once for
>> +			each supported huge page size. Huge page sizes are
>> +			architecture dependent.  See also
>> +			Documentation/admin-guide/mm/hugetlbpage.rst.
>> +			Format: size[KMG]
>>  
>>  	hung_task_panic=
>>  			[KNL] Should the hung task detector generate panics.
>> diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
>> index 1cc0bc78d10e..de340c586995 100644
>> --- a/Documentation/admin-guide/mm/hugetlbpage.rst
>> +++ b/Documentation/admin-guide/mm/hugetlbpage.rst
>> @@ -100,6 +100,50 @@ with a huge page size selection parameter "hugepagesz=<size>".  <size> must
>>  be specified in bytes with optional scale suffix [kKmMgG].  The default huge
>>  page size may be selected with the "default_hugepagesz=<size>" boot parameter.
>>  
>> +Hugetlb boot command line parameter semantics
>> +hugepagesz - Specify a huge page size.  Used in conjunction with hugepages
>> +	parameter to preallocate a number of huge pages of the specified
>> +	size.  Hence, hugepagesz and hugepages are typically specified in
>> +	pairs such as:
>> +		hugepagesz=2M hugepages=512
>> +	hugepagesz can only be specified once on the command line for a
>> +	specific huge page size.  Valid huge page sizes are architecture
>> +	dependent.
>> +hugepages - Specify the number of huge pages to preallocate.  This typically
>> +	follows a valid hugepagesz parameter.  However, if hugepages is the
>> +	first or only hugetlb command line parameter it specifies the number
>> +	of huge pages of default size to allocate.  The number of huge pages
>> +	of default size specified in this manner can be overwritten by a
>> +	hugepagesz,hugepages parameter pair for the default size.
>> +	For example, on an architecture with 2M default huge page size:
>> +		hugepages=256 hugepagesz=2M hugepages=512
>> +	will result in 512 2M huge pages being allocated.  If a hugepages
>> +	parameter is preceded by an invalid hugepagesz parameter, it will
>> +	be ignored.
>> +default_hugepagesz - Specify the default huge page size.  This parameter can
>> +	only be specified once on the command line.  No other hugetlb command
>> +	line parameter is associated with default_hugepagesz.  Therefore, it
>> +	can appear anywhere on the command line.  If hugepages= is the first
>> +	hugetlb command line parameter, the specified number of huge pages
>> +	will apply to the default huge page size specified with
>> +	default_hugepagesz.  For example,
>> +		hugepages=512 default_hugepagesz=2M
> 
> No strong opinion, but considering to the special case of gigantic
> huge page mentioned below, I'm thinking maybe it's easier to just ask
> the user to always use "hugepagesz=X hugepages=Y" pair when people
> want to reserve huge pages.

We can ask people to do this.  However, I do not think we can force it at
this time.  Why?  Mostly because I have seen many instances where people
only specify 'hugepages=X' on the command line to preallocate X huge pages
of default size.  So, forcing 'hugepagesz=X hugepages=Y' would break those
users.

> For example, some user might start to use this after this series
> legally:
> 
>     default_hugepagesz=2M hugepages=1024

Well, that 'works' today.  You get that silly error message:

HugeTLB: unsupported default_hugepagesz 2097152. Reverting to 2097152

But, it does preallocate 1024 huge pages of size 2M.  Because people
have noticed the silly error message, I suspect this usage,

	default_hugepagesz=X hugepages=Y

is in use today and we need to support it.

> Then the user thinks, hmm, maybe it's good to use 1G pages, by just
> changing some numbers:
> 
>     default_hugepagesz=1G hugepages=2
> 
> Then if it stops working it could really confuse the user.
> 
> (Besides, it could be an extra maintainaince burden for linux itself)

I did not think about/look into the different behavior for gigantic pages
until updating the documentation.  This is not 'new' behavior introduced
by this patch series.  It comes about because we do not definitively set
the default huge page size until after command line processing
(in hugetlb_init).  And, we must preallocate gigantic huge pages during
command line processing because that is when the bootmem allocater is
available.

I really did not want to change the code to handle this (gigantic page)
situation.  There is no indication it is a problem today.  However, the
more I think about it the more I think the code should be changed.  I'll
work on code modifications to support this.

>> +	will result in 512 2M huge pages being allocated.  However, specifying
>> +	the number of default huge pages in this manner will not apply to
>> +	gigantic huge pages.  For example,
>> +		hugepages=10 default_hugepagesz=1G
>> +				or
>> +		default_hugepagesz=1G hugepages=10
>> +	will NOT result in the allocation of 10 1G huge pages.  In order to
>> +	preallocate gigantic huge pages, there must be hugepagesz, hugepages
>> +	parameter pair.  For example,
>> +		hugepagesz=1G hugepages=10 default_hugepagesz=1G
>> +				or
>> +		default_hugepagesz=1G hugepagesz=1G hugepages=10
>> +	will result 10 1G huge pages being allocated and the default huge
>> +	page size will be set to 1G.  Valid default huge page size is
>> +	architecture dependent.
>> +
>>  When multiple huge page sizes are supported, ``/proc/sys/vm/nr_hugepages``
>>  indicates the current number of pre-allocated huge pages of the default size.
>>  Thus, one can use the following command to dynamically allocate/deallocate
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 72a4343509d5..74ef53f7c5a7 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -3054,7 +3054,7 @@ static void __init hugetlb_sysfs_init(void)
>>  		err = hugetlb_sysfs_add_hstate(h, hugepages_kobj,
>>  					 hstate_kobjs, &hstate_attr_group);
>>  		if (err)
>> -			pr_err("Hugetlb: Unable to add hstate %s", h->name);
>> +			pr_err("HugeTLB: Unable to add hstate %s", h->name);
>>  	}
>>  }
>>  
>> @@ -3158,7 +3158,7 @@ static void hugetlb_register_node(struct node *node)
>>  						nhs->hstate_kobjs,
>>  						&per_node_hstate_attr_group);
>>  		if (err) {
>> -			pr_err("Hugetlb: Unable to add hstate %s for node %d\n",
>> +			pr_err("HugeTLB: Unable to add hstate %s for node %d\n",
>>  				h->name, node->dev.id);
>>  			hugetlb_unregister_node(node);
>>  			break;
>> @@ -3209,19 +3209,35 @@ static int __init hugetlb_init(void)
>>  	if (!hugepages_supported())
>>  		return 0;
>>  
>> -	if (!size_to_hstate(default_hstate_size)) {
>> -		if (default_hstate_size != 0) {
>> -			pr_err("HugeTLB: unsupported default_hugepagesz %lu. Reverting to %lu\n",
>> -			       default_hstate_size, HPAGE_SIZE);
>> -		}
>> -
>> +	/*
>> +	 * Make sure HPAGE_SIZE (HUGETLB_PAGE_ORDER) hstate exists.  Some
>> +	 * architectures depend on setup being done here.
>> +	 *
>> +	 * If a valid default huge page size was specified on the command line,
>> +	 * add associated hstate if necessary.  If not, set default_hstate_size
>> +	 * to default size.  default_hstate_idx is used at runtime to identify
>> +	 * the default huge page size/hstate.
>> +	 */
>> +	hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
>> +	if (default_hstate_size)
>> +		hugetlb_add_hstate(ilog2(default_hstate_size) - PAGE_SHIFT);
>> +	else
>>  		default_hstate_size = HPAGE_SIZE;
>> -		hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
>> -	}
>>  	default_hstate_idx = hstate_index(size_to_hstate(default_hstate_size));
>> +
>> +	/*
>> +	 * default_hstate_max_huge_pages != 0 indicates a count (hugepages=)
>> +	 * specified before a size (hugepagesz=).  Use this count for the
>> +	 * default huge page size, unless a specific value was specified for
>> +	 * this size in a hugepagesz/hugepages pair.
>> +	 */
>>  	if (default_hstate_max_huge_pages) {
> 
> Since we're refactoring this - Could default_hstate_max_huge_pages be
> dropped directly (in hugepages= we can create the default hstate, then
> we set max_huge_pages of the default hstate there)?  Or did I miss
> anything important?

I do not think that works for 'hugepages=X default_hugepagesz=Y' processing?
It seems like there will need to be more work done on default_hugepagesz
processing.

>>  		if (!default_hstate.max_huge_pages)
>> -			default_hstate.max_huge_pages = default_hstate_max_huge_pages;
>> +			default_hstate.max_huge_pages =
>> +				default_hstate_max_huge_pages;
>> +		else
>> +			pr_warn("HugeTLB: First hugepages=%lu ignored\n",
>> +				default_hstate_max_huge_pages);
>>  	}
>>  
>>  	hugetlb_init_hstates();
>> @@ -3274,20 +3290,31 @@ void __init hugetlb_add_hstate(unsigned int order)
>>  	parsed_hstate = h;
>>  }
>>  
>> -static int __init hugetlb_nrpages_setup(char *s)
>> +/*
>> + * hugepages command line processing
>> + * hugepages normally follows a valid hugepagsz specification.  If not, ignore
>> + * the hugepages value.  hugepages can also be the first huge page command line
>> + * option in which case it specifies the number of huge pages for the default
>> + * size.
>> + */
>> +static int __init hugepages_setup(char *s)
>>  {
>>  	unsigned long *mhp;
>>  	static unsigned long *last_mhp;
>>  
>> +	if (!hugepages_supported()) {
>> +		pr_warn("HugeTLB: huge pages not supported, ignoring hugepages = %s\n", s);
>> +		return 0;
>> +	}
>> +
>>  	if (!parsed_valid_hugepagesz) {
>> -		pr_warn("hugepages = %s preceded by "
>> -			"an unsupported hugepagesz, ignoring\n", s);
>> +		pr_warn("HugeTLB: hugepages = %s preceded by an unsupported hugepagesz, ignoring\n", s);
> 
> s/preceded/is preceded/?

Thanks

> 
>>  		parsed_valid_hugepagesz = true;
>> -		return 1;
>> +		return 0;
>>  	}
>>  	/*
>> -	 * !hugetlb_max_hstate means we haven't parsed a hugepagesz= parameter yet,
>> -	 * so this hugepages= parameter goes to the "default hstate".
>> +	 * !hugetlb_max_hstate means we haven't parsed a hugepagesz= parameter
>> +	 * yet, so this hugepages= parameter goes to the "default hstate".
>>  	 */
>>  	else if (!hugetlb_max_hstate)
>>  		mhp = &default_hstate_max_huge_pages;
>> @@ -3295,8 +3322,8 @@ static int __init hugetlb_nrpages_setup(char *s)
>>  		mhp = &parsed_hstate->max_huge_pages;
>>  
>>  	if (mhp == last_mhp) {
>> -		pr_warn("hugepages= specified twice without interleaving hugepagesz=, ignoring\n");
>> -		return 1;
>> +		pr_warn("HugeTLB: hugepages= specified twice without interleaving hugepagesz=, ignoring hugepages=%s\n", s);
>> +		return 0;
>>  	}
>>  
>>  	if (sscanf(s, "%lu", mhp) <= 0)
>> @@ -3314,12 +3341,24 @@ static int __init hugetlb_nrpages_setup(char *s)
>>  
>>  	return 1;
>>  }
>> -__setup("hugepages=", hugetlb_nrpages_setup);
>> +__setup("hugepages=", hugepages_setup);
>>  
>> +/*
>> + * hugepagesz command line processing
>> + * A specific huge page size can only be specified once with hugepagesz.
>> + * hugepagesz is followed by hugepages on the command line.  The global
>> + * variable 'parsed_valid_hugepagesz' is used to determine if prior
>> + * hugepagesz argument was valid.
>> + */
>>  static int __init hugepagesz_setup(char *s)
>>  {
>>  	unsigned long size;
>>  
>> +	if (!hugepages_supported()) {
>> +		pr_warn("HugeTLB: huge pages not supported, ignoring hugepagesz = %s\n", s);
>> +		return 0;
>> +	}
>> +
>>  	size = (unsigned long)memparse(s, NULL);
>>  
>>  	if (!arch_hugetlb_valid_size(size)) {
>> @@ -3329,19 +3368,31 @@ static int __init hugepagesz_setup(char *s)
>>  	}
>>  
>>  	if (size_to_hstate(size)) {
>> +		parsed_valid_hugepagesz = false;
>>  		pr_warn("HugeTLB: hugepagesz %s specified twice, ignoring\n", s);
>>  		return 0;
>>  	}
>>  
>> +	parsed_valid_hugepagesz = true;
>>  	hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
>>  	return 1;
>>  }
>>  __setup("hugepagesz=", hugepagesz_setup);
>>  
>> +/*
>> + * default_hugepagesz command line input
>> + * Only one instance of default_hugepagesz allowed on command line.  Do not
>> + * add hstate here as that will confuse hugepagesz/hugepages processing.
>> + */
>>  static int __init default_hugepagesz_setup(char *s)
>>  {
>>  	unsigned long size;
>>  
>> +	if (!hugepages_supported()) {
>> +		pr_warn("HugeTLB: huge pages not supported, ignoring default_hugepagesz = %s\n", s);
>> +		return 0;
>> +	}
>> +
>>  	size = (unsigned long)memparse(s, NULL);
>>  
>>  	if (!arch_hugetlb_valid_size(size)) {
>> @@ -3349,6 +3400,11 @@ static int __init default_hugepagesz_setup(char *s)
>>  		return 0;
>>  	}
>>  
>> +	if (default_hstate_size) {
>> +		pr_err("HugeTLB: default_hugepagesz previously specified, ignoring %s\n", s);
>> +		return 0;
>> +	}
> 
> Nitpick: ideally this can be moved before memparse().
> 
> Thanks,

Thanks you.

Unless someone thinks otherwise, I believe more work is needed to handle
preallocation of gigantic huge page sizes in instances like:

hugepages=128 default_hugepagesz=1G
or
default_hugepagesz=1G hugepages=128

I'll work on making such changes.
-- 
Mike Kravetz
