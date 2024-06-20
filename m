Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F36910E85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 19:29:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVcqiT+w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4nYR5f51z3cW3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 03:29:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVcqiT+w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=anjalik@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4nXk4HPNz2xQH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 03:29:09 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHNfQ2027602;
	Thu, 20 Jun 2024 17:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:references:from:cc
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=K
	PgZHHVvAK0axNiwszzouRlojRjrzPlwUds8KQtAlAA=; b=TVcqiT+wPmikXB36s
	SQpBfvDOWou5h/5IHkkIu8tI4586TOSWjQipSSrudFaHCGpuLCYgxNh5Ss8pWdhG
	/I2dlBUSD26JdKfohJU/vPNlbUFHgfVDpupZPAZlPs/CUBLLQO85Q/qJ5Hdkehwn
	YKeE/+ZTnLIWJYg1sxqsMekeBqyntZA42KZdE5J0F1CP6tuB9OGt0XQan6k5gCCs
	R6oU7wk1Kt8hqM2H7r7i16QncqPGHFjXuENi5S+vn+OVWDN1VPGCCJqCofTMW5bY
	W4OLrISHiF8JqVTBLJuAV5Qi67Vo0x31rRe403S+ZfdfukLT3enwSRzU3IiKqBd7
	C8Ieg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yvrsa00d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 17:28:59 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45KHSxdi002315;
	Thu, 20 Jun 2024 17:28:59 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yvrsa00cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 17:28:58 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45KHO4xe030990;
	Thu, 20 Jun 2024 17:28:57 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yvrssr11m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 17:28:57 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45KHSrf843450710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Jun 2024 17:28:55 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9892C2004D;
	Thu, 20 Jun 2024 17:28:53 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8686B20043;
	Thu, 20 Jun 2024 17:28:50 +0000 (GMT)
Received: from [9.43.118.41] (unknown [9.43.118.41])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Jun 2024 17:28:50 +0000 (GMT)
Message-ID: <499f5305-eb54-43a7-9864-d032f29c445d@linux.ibm.com>
Date: Thu, 20 Jun 2024 22:58:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries: Whitelist dtl slub object for copying to
 userspace
To: Kees Cook <kees@kernel.org>
References: <20240614173844.746818-1-anjalik@linux.ibm.com>
 <202406171053.F72BF013@keescook>
Content-Language: en-US
From: Anjali K <anjalik@linux.ibm.com>
In-Reply-To: <202406171053.F72BF013@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hSHIVAqWlPT1dUIHbtX2dql1Gz58Vaib
X-Proofpoint-ORIG-GUID: ho-T4Yvw-1zeRwfjQ00d0UxwRakVqu6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_08,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406200126
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
Cc: naveen@kernel.org, christophe.leroy@csgroup.eu, gustavoars@kernel.org, npiggin@gmail.com, vishalc@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kees
Thank you for your review.

On 17/06/24 23:29, Kees Cook wrote:
> On Fri, Jun 14, 2024 at 11:08:44PM +0530, Anjali K wrote:
>> Reading the dispatch trace log from /sys/kernel/debug/powerpc/dtl/cpu-*
>> results in a BUG() when the config CONFIG_HARDENED_USERCOPY is enabled as
>> shown below.
>>
>>     kernel BUG at mm/usercopy.c:102!
>>     Oops: Exception in kernel mode, sig: 5 [#1]
>>     LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>>     Modules linked in: xfs libcrc32c dm_service_time sd_mod t10_pi sg ibmvfc
>>     scsi_transport_fc ibmveth pseries_wdt dm_multipath dm_mirror dm_region_hash dm_log dm_mod fuse
>>     CPU: 27 PID: 1815 Comm: python3 Not tainted 6.10.0-rc3 #85
>>     Hardware name: IBM,9040-MRX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NM1060_042) hv:phyp pSeries
>>     NIP:  c0000000005d23d4 LR: c0000000005d23d0 CTR: 00000000006ee6f8
>>     REGS: c000000120c078c0 TRAP: 0700   Not tainted  (6.10.0-rc3)
>>     MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 2828220f  XER: 0000000e
>>     CFAR: c0000000001fdc80 IRQMASK: 0
>>     [ ... GPRs omitted ... ]
>>     NIP [c0000000005d23d4] usercopy_abort+0x78/0xb0
>>     LR [c0000000005d23d0] usercopy_abort+0x74/0xb0
>>     Call Trace:
>>      usercopy_abort+0x74/0xb0 (unreliable)
>>      __check_heap_object+0xf8/0x120
>>      check_heap_object+0x218/0x240
>>      __check_object_size+0x84/0x1a4
>>      dtl_file_read+0x17c/0x2c4
>>      full_proxy_read+0x8c/0x110
>>      vfs_read+0xdc/0x3a0
>>      ksys_read+0x84/0x144
>>      system_call_exception+0x124/0x330
>>      system_call_vectored_common+0x15c/0x2ec
>>     --- interrupt: 3000 at 0x7fff81f3ab34
>>
>> Commit 6d07d1cd300f ("usercopy: Restrict non-usercopy caches to size 0")
>> requires that only whitelisted areas in slab/slub objects can be copied to
>> userspace when usercopy hardening is enabled using CONFIG_HARDENED_USERCOPY.
>> Dtl contains hypervisor dispatch events which are expected to be read by
>> privileged users. Hence mark this safe for user access.
>> Specify useroffset=0 and usersize=DISPATCH_LOG_BYTES to whitelist the
>> entire object.
>>
>> Co-developed-by: Vishal Chourasia <vishalc@linux.ibm.com>
>> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
>> Signed-off-by: Anjali K <anjalik@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/setup.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
>> index 284a6fa04b0c..cba40d9d1284 100644
>> --- a/arch/powerpc/platforms/pseries/setup.c
>> +++ b/arch/powerpc/platforms/pseries/setup.c
>> @@ -343,8 +343,8 @@ static int alloc_dispatch_log_kmem_cache(void)
>>  {
>>  	void (*ctor)(void *) = get_dtl_cache_ctor();
>>  
>> -	dtl_cache = kmem_cache_create("dtl", DISPATCH_LOG_BYTES,
>> -						DISPATCH_LOG_BYTES, 0, ctor);
>> +	dtl_cache = kmem_cache_create_usercopy("dtl", DISPATCH_LOG_BYTES,
>> +						DISPATCH_LOG_BYTES, 0, 0, DISPATCH_LOG_BYTES, ctor);
>>  	if (!dtl_cache) {
>>  		pr_warn("Failed to create dispatch trace log buffer cache\n");
>>  		pr_warn("Stolen time statistics will be unreliable\n");
> Are you sure you want to universally expose this memory region? It
> sounds like it's only exposed via a debug interface. Maybe it'd be
> better to use a bounce buffer in the debug interface instead
>
> diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
> index 3f1cdccebc9c..3adcff5cc4b2 100644
> --- a/arch/powerpc/platforms/pseries/dtl.c
> +++ b/arch/powerpc/platforms/pseries/dtl.c
> @@ -257,6 +257,22 @@ static int dtl_file_release(struct inode *inode, struct file *filp)
>  	return 0;
>  }
>  
> +static inline int bounce_copy(char __user *buf, void *src, size_t size)
> +{
> +	u8 *bounce;
> +	int rc;
> +
> +	bounce = kmalloc(size, GFP_KERNEL);
> +	if (!bounce)
> +		return -ENOMEM;
> +
> +	memcpy(bounce, src, size);
> +	rc = copy_to_user(buf, bounce, size);
> +
> +	kfree(bounce);
> +	return rc;
> +}
> +
>  static ssize_t dtl_file_read(struct file *filp, char __user *buf, size_t len,
>  		loff_t *pos)
>  {
> @@ -300,7 +316,7 @@ static ssize_t dtl_file_read(struct file *filp, char __user *buf, size_t len,
>  	if (i + n_req > dtl->buf_entries) {
>  		read_size = dtl->buf_entries - i;
>  
> -		rc = copy_to_user(buf, &dtl->buf[i],
> +		rc = bounce_copy(buf, &dtl->buf[i],
>  				read_size * sizeof(struct dtl_entry));
>  		if (rc)
>  			return -EFAULT;
> @@ -312,7 +328,7 @@ static ssize_t dtl_file_read(struct file *filp, char __user *buf, size_t len,
>  	}
>  
>  	/* .. and now the head */
> -	rc = copy_to_user(buf, &dtl->buf[i], n_req * sizeof(struct dtl_entry));
> +	rc = bounce_copy(buf, &dtl->buf[i], n_req * sizeof(struct dtl_entry));                              
>  	if (rc)
>  		return -EFAULT;
>  
>
>
I have verified that the above patch is working.                           
As you mentioned, an advantage of using the bounce buffer approach is that
instead of whitelisting the full dtl slub object at boot, we only whitelist
the subset of entries.                                                     
                                                                               
However given that:                                                        
(i) The dtl buffer is read-only. The dtl trace is a set of metrics which   
are collected to be read by privileged users.                              
(ii) Users usually reads all the dtl entries, not a subset.                                             
(iii) Read overflows are unlikely to expose anything useful to attackers        
since we are whitelisting the complete slub object and there are no        
contiguous memory locations which need to be hidden.                       
Can we go ahead with the whitelisting using kmem_cache_create_usercopy()   
approach?                                                                  
Or are there other reasons to prefer the bounce buffer approach?

Thank you,
Anjali K
