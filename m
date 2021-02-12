Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA77531A593
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 20:43:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DckS24xzqzDwtw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Feb 2021 06:42:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N515jA7Z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DckNx5znrzDwt9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Feb 2021 06:40:17 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11CJENFX166330; Fri, 12 Feb 2021 14:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=uR1BW7q++8zN3BabfjrAXxMiXR2w03yYqgEQV8H/kps=;
 b=N515jA7ZlsMh+sjB9NVG9VnPUwvHYDh9IvGAaeEauqnWow9puE3SRXol65MCCAesLzEL
 YYrc7LdGNXbVOfP0jVy/ShW/WMOPuynnDVNqMjLI/E+j9aqDXl+yGJN81GGYfWY9SWJn
 mQyCa/7ZJq3oub7ptZV+RIGJRBGDnhk2OLnuJ5Dd1dxq/JSsquDfzNzt19yz8Ri0uCMx
 A1naqV9J7a/CoOLJyg6fMkX7H1rFYx86UNXVoNt1gw44nsG79JpJp60l+Oz4DWmK+H1v
 VZMsqrXHIzvPA4qiRgr/uBWrJTG552I9HkxxycZe1O08rPzXYF08WaHzD7b5fGQ6F3pG Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36nynd15wa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Feb 2021 14:39:53 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11CJTsMb114646;
 Fri, 12 Feb 2021 14:39:52 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36nynd15v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Feb 2021 14:39:52 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11CJYiO3028320;
 Fri, 12 Feb 2021 19:39:51 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 36hjra7hef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Feb 2021 19:39:51 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11CJdnXC32833914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 19:39:49 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C774112062;
 Fri, 12 Feb 2021 19:39:49 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7AC1112061;
 Fri, 12 Feb 2021 19:39:41 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.160.55.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 12 Feb 2021 19:39:41 +0000 (GMT)
References: <20210209182200.30606-1-nramas@linux.microsoft.com>
 <20210209182200.30606-3-nramas@linux.microsoft.com>
 <87k0reozwh.fsf@manicouagan.localdomain>
 <8a3aa3d2-2eba-549a-9970-a2b0fe3586c9@linux.microsoft.com>
 <CAL_JsqJ3sDzjsJXtb6EzE77BL+PhUxDJYUngLTqcm0popd7Ajw@mail.gmail.com>
 <55685b61-dac0-2f24-f74a-939acf74a4f2@linux.microsoft.com>
 <CAL_JsqKDCgtJngxqMCRdC9evEQpHnryEaMvfgYEh0Mcto6dLHA@mail.gmail.com>
 <11aff288-feaa-8e43-fcda-12bc12fbf4cf@linux.microsoft.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v17 02/10] of: Add a common kexec FDT setup function
In-reply-to: <11aff288-feaa-8e43-fcda-12bc12fbf4cf@linux.microsoft.com>
Date: Fri, 12 Feb 2021 16:39:39 -0300
Message-ID: <87im6xulc4.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-12_07:2021-02-12,
 2021-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102120140
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
Cc: Mark Rutland <mark.rutland@arm.com>, tao.li@vivo.com,
 Mimi Zohar <zohar@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 vincenzo.frascino@arm.com, Frank Rowand <frowand.list@gmail.com>,
 Sasha Levin <sashal@kernel.org>, Rob Herring <robh@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 "AKASHI, Takahiro" <takahiro.akashi@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, devicetree@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Will Deacon <will@kernel.org>,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Matthias Brugger <mbrugger@suse.com>, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:

> On 2/12/21 10:24 AM, Rob Herring wrote:
>> On Fri, Feb 12, 2021 at 11:19 AM Lakshmi Ramasubramanian
>> <nramas@linux.microsoft.com> wrote:
>>>
>>> On 2/12/21 6:38 AM, Rob Herring wrote:
>>>> On Thu, Feb 11, 2021 at 7:17 PM Lakshmi Ramasubramanian
>>>> <nramas@linux.microsoft.com> wrote:
>>>>>
>>>>> On 2/11/21 5:09 PM, Thiago Jung Bauermann wrote:
>>>>>>
>>>>>> There's actually a complication that I just noticed and needs to be
>>>>>> addressed. More below.
>>>>>>
>>>>>
>>>>> <...>
>>>>>
>>>>>>> +
>>>>>>> +/*
>>>>>>> + * of_kexec_alloc_and_setup_fdt - Alloc and setup a new Flattened Device Tree
>>>>>>> + *
>>>>>>> + * @image:          kexec image being loaded.
>>>>>>> + * @initrd_load_addr:       Address where the next initrd will be loaded.
>>>>>>> + * @initrd_len:             Size of the next initrd, or 0 if there will be none.
>>>>>>> + * @cmdline:                Command line for the next kernel, or NULL if there will
>>>>>>> + *                  be none.
>>>>>>> + *
>>>>>>> + * Return: fdt on success, or NULL errno on error.
>>>>>>> + */
>>>>>>> +void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
>>>>>>> +                               unsigned long initrd_load_addr,
>>>>>>> +                               unsigned long initrd_len,
>>>>>>> +                               const char *cmdline)
>>>>>>> +{
>>>>>>> +    void *fdt;
>>>>>>> +    int ret, chosen_node;
>>>>>>> +    const void *prop;
>>>>>>> +    unsigned long fdt_size;
>>>>>>> +
>>>>>>> +    fdt_size = fdt_totalsize(initial_boot_params) +
>>>>>>> +               (cmdline ? strlen(cmdline) : 0) +
>>>>>>> +               FDT_EXTRA_SPACE;
>>>>>>
>>>>>> Just adding 4 KB to initial_boot_params won't be enough for crash
>>>>>> kernels on ppc64. The current powerpc code doubles the size of
>>>>>> initial_boot_params (which is normally larger than 4 KB) and even that
>>>>>> isn't enough. A patch was added to powerpc/next today which uses a more
>>>>>> precise (but arch-specific) formula:
>>>>>>
>>>>>> https://lore.kernel.org/linuxppc-dev/161243826811.119001.14083048209224609814.stgit@hbathini/
>>>>>>
>>>>>> So I believe we need a hook here where architectures can provide their
>>>>>> own specific calculation for the size of the fdt. Perhaps a weakly
>>>>>> defined function providing a default implementation which an
>>>>>> arch-specific file can override (a la arch_kexec_kernel_image_load())?
>>>>>>
>>>>>> Then the powerpc specific hook would be the kexec_fdt_totalsize_ppc64()
>>>>>> function from the patch I linked above.
>>>>>>
>>>>>
>>>>> Do you think it'd better to add "fdt_size" parameter to
>>>>> of_kexec_alloc_and_setup_fdt() so that the caller can provide the
>>>>> desired FDT buffer size?
>>>>
>>>> Yes, I guess so. But please define the param as extra size, not total
>>>> size. The kernel command line size addition can be in the common code.
>>>
>>> Will do. Just to clarify -
>>>
>>> The common code will do:
>>>
>>> fdt_totalsize(initial_boot_params) + strlen(cmdline) + extra_fdt_size
>>>
>>> The caller will pass "extra_fdt_size"
>>> ARM64 => 4KB
>>> PPC64 => fdt_totalsize(initial_boot_params) - which will be updated when
>>> the patch Thiago had referred to is merged.
>> Yes, I'd leave the 4KB in there by default and arm64 use 0.
>> 
>
> Sounds good.
>
> common:
> fdt_totalsize(initial_boot_params) + strlen(cmdline) + 0x1000 + extra
>
> arm64 => 0 for extra
> ppc => fdt_totalsize(initial_boot_params) for extra.

Looks good to me.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
