Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D0826FC0C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 14:06:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtCHB3gfCzDqpy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 22:06:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HawmHELL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtCDt6bgbzDqnW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 22:04:30 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08IC1rnL079186; Fri, 18 Sep 2020 08:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dpEECxRtUjdSBys3ANpeENejJFB07seGA5Dg7OprAHc=;
 b=HawmHELLxANGJmflqxQeSNQ8feG8kRJnPuFv3+Na7pMDrFiRtQ2Jo/psH2El5X8EYQ8O
 JBQOpRYrSSgjD9IJSVNiTEcUVO/63q09gqTgrk/ZZmH1fcsfhzYphLT5Hk7xMso8UrY2
 Ar4XqpvWSThYZqn7zfyxHnQKRIYUoapeDzeX17RQv/738VlylCx6qPgPYmEhfSqGHR0J
 0LEN+dAaNbhQhLuF0aug/2f5/YzUSmQL8sqSjEoNweK2Ura5UH7i/G1Axumk1rQVZJdK
 VkX/srfeRpaN8fO97eNpj0Xh4pkOobK5YJONJkMgBiDDhhJos9o8PzpTdqMH9QBid2q8 Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33muxt93kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 08:04:25 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08IC1whL079805;
 Fri, 18 Sep 2020 08:04:24 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33muxt93hx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 08:04:24 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08IBwB8G016345;
 Fri, 18 Sep 2020 12:04:22 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 33ku33t1d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 12:04:22 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08IC2jBW30998944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2020 12:02:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B9B95204F;
 Fri, 18 Sep 2020 12:04:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.209.154])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 00AA95204E;
 Fri, 18 Sep 2020 12:04:17 +0000 (GMT)
Subject: Re: [PATCH 1/3] powerpc/mce: remove nmi_enter/exit from real mode
 handler
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>, npiggin@gmail.com
References: <20200916172228.83271-1-ganeshgr@linux.ibm.com>
 <20200916172228.83271-2-ganeshgr@linux.ibm.com>
 <20200917122028.GP29778@kitsune.suse.cz>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <37edc6de-d55a-ec9e-a6f1-ae4535a3bfd9@linux.ibm.com>
Date: Fri, 18 Sep 2020 17:34:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917122028.GP29778@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_14:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009180096
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
Cc: linuxppc-dev@lists.ozlabs.org, mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/17/20 5:50 PM, Michal Suchánek wrote:

> Hello,
>
> On Wed, Sep 16, 2020 at 10:52:26PM +0530, Ganesh Goudar wrote:
>> Use of nmi_enter/exit in real mode handler causes the kernel to panic
>> and reboot on injecting slb mutihit on pseries machine running in hash
>> mmu mode, As these calls try to accesses memory outside RMO region in
>> real mode handler where translation is disabled.
>>
>> Add check to not to use these calls on pseries machine running in hash
>> mmu mode.
>>
>> Fixes: 116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounting")
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/mce.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
>> index ada59f6c4298..1d42fe0f5f9c 100644
>> --- a/arch/powerpc/kernel/mce.c
>> +++ b/arch/powerpc/kernel/mce.c
>> @@ -591,10 +591,15 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
>>   long notrace machine_check_early(struct pt_regs *regs)
>>   {
>>   	long handled = 0;
>> -	bool nested = in_nmi();
>> +	bool nested;
>> +	bool is_pseries_hpt_guest;
>>   	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
>>   
>>   	this_cpu_set_ftrace_enabled(0);
>> +	is_pseries_hpt_guest = machine_is(pseries) &&
>> +			       mmu_has_feature(MMU_FTR_HPTE_TABLE);
>> +	/* Do not use nmi_enter/exit for pseries hpte guest */
>> +	nested = is_pseries_hpt_guest ? true : in_nmi();
> As pointed out already in another comment nesting is supported natively
> since 69ea03b56ed2c7189ccd0b5910ad39f3cad1df21. You can simply do
> nmi_enter and nmi_exit unconditionally - or only based on
> is_pseries_hpt_guest.
ok
> The other question is what is the value of calling nmi_enter here at
> all. It crashes in one case, we simply skip it for that case, and we are
> good. Maybe we could skip it altogether?
Not sure why nmi_enter/exit is needed here, Again, Nick may have a reason.
> Thanks
>
> Michal
