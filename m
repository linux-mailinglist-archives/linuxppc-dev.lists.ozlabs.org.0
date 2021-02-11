Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CAF319741
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:01:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcDDH6YvlzDwfy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:01:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Bop3BphW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDBL1SxQzDwpg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 10:59:21 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11BNtv5I061406; Thu, 11 Feb 2021 18:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=6tuxnpSv368pdOo0WjwpdsaB791gBkRKI6kVA07oHWU=;
 b=Bop3BphWAkbIWVK/HYGTx96aeJJV3FcTW4+92F2Afr5wsR6cALLm7jXCS7y1WJubeLRW
 WFDY4zA0ISjV0MQcmjjIPXfAX/fsEFrYgtU7uj9Ix9oZk+75cOE3TyMNf+amwqNTM+oO
 4udZ9v0sksJ+rYql6jEBVIKxpKbqV58Odo5NjyBZDullujR5ZYxEjRKGiHibRq0pOJ4A
 dm0TLBviLoF6xfSKsDCwfErsTNhA+q1TcQb8Dow3n25Gedvh7Fez54vND70G7QZGR8Uu
 CQT1kOv/dGPOhGOOmIwQRdFAX21zuqLjk1QaZ8NlCoSlJ9rIrnWg/T5efhdwNQWKKkb3 8A== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36nepfr1as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 18:59:14 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11BNvZiV017261;
 Thu, 11 Feb 2021 23:59:13 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 36hjra3m2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 23:59:13 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11BNxC9v24707454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Feb 2021 23:59:12 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8463DBE04F;
 Thu, 11 Feb 2021 23:59:12 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C05E3BE056;
 Thu, 11 Feb 2021 23:59:10 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.85.204.73])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 11 Feb 2021 23:59:10 +0000 (GMT)
References: <202102120032.Bv0MoYv7-lkp@intel.com>
 <40fd1869-dcb4-36ae-e997-b8486dd4846c@linux.microsoft.com>
 <b534117e-333d-097c-a3c0-2a80985bd37f@linux.microsoft.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: Fwd: Re: [PATCH v17 02/10] of: Add a common kexec FDT setup
 function
In-reply-to: <b534117e-333d-097c-a3c0-2a80985bd37f@linux.microsoft.com>
Date: Thu, 11 Feb 2021 20:59:08 -0300
Message-ID: <87mtwap35f.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-11_07:2021-02-11,
 2021-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102110182
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
Cc: Rob Herring <robh@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:

> On 2/11/21 9:42 AM, Lakshmi Ramasubramanian wrote:
>> Hi Rob,
>> [PATCH] powerpc: Rename kexec elfcorehdr_addr to elf_headers_mem
>> This change causes build problem for x86_64 architecture (please see the 
>> mail from kernel test bot below) since arch/x86/include/asm/kexec.h uses
>> "elf_load_addr" for the ELF header buffer address and not 
>> "elf_headers_mem".
>> struct kimage_arch {
>>      ...
>>      /* Core ELF header buffer */
>>      void *elf_headers;
>>      unsigned long elf_headers_sz;
>>      unsigned long elf_load_addr;
>> };
>> I am thinking of limiting of_kexec_alloc_and_setup_fdt() to ARM64 and 
>> PPC64 since they are the only ones using this function now.
>> #if defined(CONFIG_ARM64) && defined(CONFIG_PPC64)
> Sorry - I meant to say
> #if defined(CONFIG_ARM64) || defined(CONFIG_PPC64)
>

Does it build correctly if you rename elf_headers_mem to elf_load_addr?
Or the other way around, renaming x86's elf_load_addr to
elf_headers_mem. I don't really have a preference.

That would be better than adding an #if condition.

>> void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
>>                     unsigned long initrd_load_addr,
>>                     unsigned long initrd_len,
>>                     const char *cmdline)
>> {
>>      ...
>> }
>> #endif /* defined(CONFIG_ARM64) && defined(CONFIG_PPC64) */
>> Please let me know if you have any concerns.
>> thanks,
>>   -lakshmi

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
