Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC223FEF8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Aug 2020 17:06:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BPj8s3jVTzDq6l
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 01:06:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=a3GdnM8F; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BPj5s4b6MzDqQk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 01:03:29 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 079F24XK112234; Sun, 9 Aug 2020 11:03:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=pp1;
 bh=3NlsIyoEr3uYgjsPf/a/fdiHrbPyGHLEmvFwxM9GeWc=;
 b=a3GdnM8FYoyTDTDkP9hHQXfNWubxhgJCDWq7Rxx0spXAOU3xoMSUrhZcbeB3ud/miVMe
 p7ew1KI1UkB249POPEfJxordJruPfHLdFdbzfEoCrkCQ4vJnsWbkizFm1ABKKHOoDPto
 fwSw+aJaeRQOB2p8L9M8boM8QxQOQPSY/N3FVgPpTLBhqjPnzzV1byQheiuOrLbhEDIh
 bBtJ6+KgH+OBB8KWsf6UeD2PERH5JnHJ1ZKzNvuMKXGPdf7YT8T/crk8WBqqmK3i4sim
 aXa30cQbq9rXSKrhKLwjENvwM0oZWkGKmlApqCS4//IE0DEYEF9QoGLvVkNTL7711HVb xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32sr7tupdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Aug 2020 11:03:26 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 079F2vxJ114545;
 Sun, 9 Aug 2020 11:03:26 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32sr7tupd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Aug 2020 11:03:25 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 079EwKvL007476;
 Sun, 9 Aug 2020 15:03:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 32skah9amu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Aug 2020 15:03:23 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 079F3LPp57016704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 9 Aug 2020 15:03:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD4A44203F;
 Sun,  9 Aug 2020 15:03:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61F5642041;
 Sun,  9 Aug 2020 15:03:20 +0000 (GMT)
Received: from [9.102.2.152] (unknown [9.102.2.152])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun,  9 Aug 2020 15:03:20 +0000 (GMT)
Subject: Re: [PASEMI] Nemo board doesn't boot anymore after the commit
 "powerpc/book3s64/pkeys: Simplify pkey disable branch"
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson"
 <rtd2@xtra.co.nz>, Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>, Olof Johansson <olof@lixom.net>
References: <8f4c1afc-89cf-749b-2b2d-4efa5ef3acff@xenosoft.de>
 <bdce9b19-a59c-26e3-3fa8-03774e09bca1@linux.ibm.com>
Message-ID: <70d9db6f-2baf-49e8-6009-67f4d3ae5653@linux.ibm.com>
Date: Sun, 9 Aug 2020 20:33:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bdce9b19-a59c-26e3-3fa8-03774e09bca1@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-09_08:2020-08-06,
 2020-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008090110
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/9/20 8:04 PM, Aneesh Kumar K.V wrote:
> On 8/9/20 7:42 PM, Christian Zigotzky wrote:
>> Hello,
>>
>> The Nemo board (A-EON AmigaOne X1000) [1] doesn't start with the 
>> latest Git kernel anymore after the commit "powerpc/book3s64/pkeys: 
>> Simplify pkey disable branch" [2].
>>
>> I bisected today [3].
>>
>> Result: powerpc/book3s64/pkeys: Simplify pkey disable branch 
>> (a4678d4b477c3d2901f101986ca01406f3b7eaea) [2] is the first bad commit.
>>
>> Unfortunately I wasn't able to revert the first bad commit. The first 
>> bad commit depends on many other commits, which unfortunately I don't 
>> know. I tried to remove the modifications of the files from the first 
>> bad commit but without any success. There are just too many dependencies.
>>
>> Additionally I reverted the commit "selftests/powerpc: Fix pkey 
>> syscall redefinitions" [4] and compiled a new kernel but without any 
>> success.
>>
>> Could you please check the first bad commit?
>>
>> Thanks,
>> Christian
>>
> 
> 
> Can you share a successful boot log of the system so that i can double 
> check the cpu_feature and mmu_feature reported ? I am looking for 
> details similar to below.
> 
> [    0.000000] cpu_features      = 0x0001c07f8f5f91a7
> [    0.000000]   possible        = 0x0001fbffcf5fb1a7
> [    0.000000]   always          = 0x00000003800081a1
> [    0.000000] cpu_user_features = 0xdc0065c2 0xefe00000
> [    0.000000] mmu_features      = 0x7c006001
> [    0.000000] firmware_features = 0x0000001fc45bfc57
> [    0.000000] vmalloc start     = 0xc008000000000000
> [    0.000000] IO start          = 0xc00a000000000000
> [    0.000000] vmemmap start     = 0xc00c000000000000
> 
> 
> IIUC this is P5+? (ISA 2.04). On that pkey should be marked disabled via
> 
> static int scan_pkey_feature(void)
> {
>      int ret;
>      int pkeys_total = 0;
> 
>      ....
> 
>      /*
>       * Only P7 and above supports SPRN_AMR update with MSR[PR] = 1
>       */
>      if (!early_cpu_has_feature(CPU_FTR_ARCH_206))
>          return 0;
> 
> 
> }
> 
> Can you boot with CONFIG_PPC_MEM_KEYS=n ?


Can you try this change on top of master?


modified   arch/powerpc/mm/book3s64/pkeys.c
@@ -215,10 +215,6 @@ void __init pkey_early_init_devtree(void)

  	pr_info("Enabling pkeys with max key count %d\n", num_pkey);
  out:
-	/*
-	 * Setup uamor on boot cpu
-	 */
-	mtspr(SPRN_UAMOR, default_uamor);

  	return;
  }

-aneesh
