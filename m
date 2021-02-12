Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8A1319839
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 03:13:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcH9J0Mq2zDwwZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 13:13:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j32QtqsV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcH7S5zQFzDwvC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 13:12:03 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11C273W7005732; Thu, 11 Feb 2021 21:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=I7Bevbp6dN6ajpOSIm2gBrXXewG69+AwhsynkQIrTKU=;
 b=j32QtqsVElKK/pgZ5bDDoOnm7D372QJgudZgxkkdCaKcB/s7wmPfeBoTbf8Xp8pg2H7E
 FCiqzi0WInFpzt1+7DzMvQUNoSfMcw2xm0l1TXhYc1kgFRc05/kg6GpbxCXC8Ylst0sk
 dbFsGfGXqZQ4zt45Ot1Nr6gOmim2d+RMe1JCTV9h591brDuxwKzhb1WGWpBVaB4uyfJ8
 CggstFqZ8Gjbu40rv4QzqzfidtmS0o5ob9DXkW1PmGSP40JjaW1VeTJAQxTIH6ilOC2W
 XERgFOI73wf9xmfBZUB3Mg7VmCVD6BWsz81oqQ1U1aaOih7JbDs2jY+k3d5AXV7eWgx0 pg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36ng8prhu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 21:11:56 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11C2BYrL017675;
 Fri, 12 Feb 2021 02:11:55 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 36hjr9t1wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Feb 2021 02:11:55 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11C2BtC029032708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 02:11:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B4AA112066;
 Fri, 12 Feb 2021 02:11:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71A5A112063;
 Fri, 12 Feb 2021 02:11:53 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.85.204.73])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 12 Feb 2021 02:11:53 +0000 (GMT)
References: <202102120032.Bv0MoYv7-lkp@intel.com>
 <40fd1869-dcb4-36ae-e997-b8486dd4846c@linux.microsoft.com>
 <b534117e-333d-097c-a3c0-2a80985bd37f@linux.microsoft.com>
 <87mtwap35f.fsf@manicouagan.localdomain>
 <b4ebf962-4210-5d17-2149-6b152d587f95@linux.microsoft.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: Fwd: Re: [PATCH v17 02/10] of: Add a common kexec FDT setup
 function
In-reply-to: <b4ebf962-4210-5d17-2149-6b152d587f95@linux.microsoft.com>
Date: Thu, 11 Feb 2021 23:11:51 -0300
Message-ID: <87eehmox08.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-11_07:2021-02-11,
 2021-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102120007
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

> On 2/11/21 3:59 PM, Thiago Jung Bauermann wrote:
>> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
>> 
>>> On 2/11/21 9:42 AM, Lakshmi Ramasubramanian wrote:
>>>> Hi Rob,
>>>> [PATCH] powerpc: Rename kexec elfcorehdr_addr to elf_headers_mem
>>>> This change causes build problem for x86_64 architecture (please see the
>>>> mail from kernel test bot below) since arch/x86/include/asm/kexec.h uses
>>>> "elf_load_addr" for the ELF header buffer address and not
>>>> "elf_headers_mem".
>>>> struct kimage_arch {
>>>>       ...
>>>>       /* Core ELF header buffer */
>>>>       void *elf_headers;
>>>>       unsigned long elf_headers_sz;
>>>>       unsigned long elf_load_addr;
>>>> };
>>>> I am thinking of limiting of_kexec_alloc_and_setup_fdt() to ARM64 and
>>>> PPC64 since they are the only ones using this function now.
>>>> #if defined(CONFIG_ARM64) && defined(CONFIG_PPC64)
>>> Sorry - I meant to say
>>> #if defined(CONFIG_ARM64) || defined(CONFIG_PPC64)
>>>
>> Does it build correctly if you rename elf_headers_mem to elf_load_addr?
>> Or the other way around, renaming x86's elf_load_addr to
>> elf_headers_mem. I don't really have a preference.
>
> Yes - changing arm64 and ppc from "elf_headers_mem" to "elf_load_addr" builds
> fine.
>
> But I am concerned about a few other architectures that also define "struct
> kimage_arch" such as "parisc", "arm" which do not have any ELF related fields.
> They would not build if the config defines CONFIG_KEXEC_FILE and
> CONFIG_OF_FLATTREE.
>
> Do you think that could be an issue?

That's a good point. But in practice, arm doesn't support
CONFIG_KEXEC_FILE. And while parisc does support CONFIG_KEXEC_FILE, as
far as I could determine it doesn't support CONFIG_OF.

So IMHO we don't need to worry about them. We'll cross that bridge if we
get there. If they ever implement KEXEC_FILE or OF_FLATTREE support,
then (again, IMHO) the natural solution would be for them to name the
ELF header member the same way the other arches do.

And since no other architecture defines struct kimage_arch, those are
the only ones we need to consider.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
