Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E2675384
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 12:41:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyyHp4LCfz3fGx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 22:41:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sbi9I4f6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyyFy1pfTz3fJD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 22:39:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sbi9I4f6;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyyFw2rhjz4xyp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 22:39:32 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NyyFw2pqDz4xyy; Fri, 20 Jan 2023 22:39:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sbi9I4f6;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NyyFv6rcFz4xyp
	for <linuxppc-dev@ozlabs.org>; Fri, 20 Jan 2023 22:39:31 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30KB9v8F030681;
	Fri, 20 Jan 2023 11:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=IDtHfVQOttPsAQmpbLkJ6oeyGsd9dVG39eIIRYGOWkc=;
 b=Sbi9I4f6Wi+zsEGHpsM0XuKaKibXM+9A4n2Vf8/1uNEHMff0swl/d85tI6AWuRISRELz
 nWzNP4nTExiHiLuhyUlv4hLCgotBL6clcF6dkizcrvKVUe/CVMCh6UzKeUPtbSr5ECqF
 VFSYH6t1MTsAbNu/swmiTnEfLdHSS/k23W6Hj/xWBADjZ4Vcyfd3vV+WLN9YrCHR5ptC
 Fte2hug1OreiHUHj7+JzdKjd3TUQJdIB/dCtGMpj4jhEg/bSFIuIg23djd1W50t4248O
 CfMpDWLcQHIH1mvoXxhVm1d/w7FZojH4qK32ElvfVApeGwbalqsNU2hxm+IeHUVPoA2Q Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7ruqadu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 11:39:17 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30KBWw9R027278;
	Fri, 20 Jan 2023 11:39:17 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7ruqadtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 11:39:17 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JJE53r004659;
	Fri, 20 Jan 2023 11:39:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3n3m16qwmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 11:39:15 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30KBdBPd40305040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 11:39:11 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 848302004B;
	Fri, 20 Jan 2023 11:39:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E18DE2004F;
	Fri, 20 Jan 2023 11:39:10 +0000 (GMT)
Received: from [9.179.22.90] (unknown [9.179.22.90])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jan 2023 11:39:10 +0000 (GMT)
Message-ID: <e12d2441-576a-d049-3cd8-523b7c41b15e@linux.ibm.com>
Date: Fri, 20 Jan 2023 12:39:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v7 4/8] crash: add phdr for possible CPUs in elfcorehdr
Content-Language: fr
From: Laurent Dufour <ldufour@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230115150206.431528-1-sourabhjain@linux.ibm.com>
 <20230115150206.431528-5-sourabhjain@linux.ibm.com>
 <51fa22e4-efab-a931-fb8f-48180baaac61@linux.ibm.com>
In-Reply-To: <51fa22e4-efab-a931-fb8f-48180baaac61@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0NINLJq5deG4D4Rxrt2XjjklSu-WKMIc
X-Proofpoint-GUID: FZ68rYpEkhv0Ar_GOos254J5UBBMNUJL
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_07,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301200110
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19/01/2023 19:29:52, Laurent Dufour wrote:
> On 15/01/2023 16:02:02, Sourabh Jain wrote:
>> On architectures like PowerPC the crash notes are available for all
>> possible CPUs. So let's populate the elfcorehdr for all possible
>> CPUs having crash notes to avoid updating elfcorehdr during in-kernel
>> crash update on CPU hotplug events.
>>
>> The similar technique is used in kexec-tool for kexec_load case.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>  kernel/crash_core.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> This patch is not applying on ppc/next (53ab112a9508).
> 
> As far as I could see, crash_prepare_elf64_headers() is defined in the file
> kernel/kexec_file.c and that's not recent, see babac4a84a88 (kexec_file,
> x86: move re-factored code to generic side, 2018-04-13)
> 
> Am I missing something?

My mistake, sounds that your series is based on top of the Eric's one (not yet upstream):

https://lore.kernel.org/lkml/20230118213544.2128-1-eric.devolder@oracle.com/

> 
>>
>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>> index 910d377ea317e..19f987b3851e8 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -364,8 +364,8 @@ int crash_prepare_elf64_headers(struct kimage *image, struct crash_mem *mem,
>>  	ehdr->e_ehsize = sizeof(Elf64_Ehdr);
>>  	ehdr->e_phentsize = sizeof(Elf64_Phdr);
>>  
>> -	/* Prepare one phdr of type PT_NOTE for each present CPU */
>> -	for_each_present_cpu(cpu) {
>> +	/* Prepare one phdr of type PT_NOTE for possible CPU with crash note. */
>> +	for_each_possible_cpu(cpu) {
>>  #ifdef CONFIG_CRASH_HOTPLUG
>>  		if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
>>  			/* Skip the soon-to-be offlined cpu */
>> @@ -373,8 +373,11 @@ int crash_prepare_elf64_headers(struct kimage *image, struct crash_mem *mem,
>>  				continue;
>>  		}
>>  #endif
>> -		phdr->p_type = PT_NOTE;
>>  		notes_addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpu));
>> +		if (!notes_addr)
>> +			continue;
>> +
>> +		phdr->p_type = PT_NOTE;
>>  		phdr->p_offset = phdr->p_paddr = notes_addr;
>>  		phdr->p_filesz = phdr->p_memsz = sizeof(note_buf_t);
>>  		(ehdr->e_phnum)++;
> 

