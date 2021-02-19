Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7831F389
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 02:14:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhYWb1rmZz3cKS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 12:14:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CAziGYVZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CAziGYVZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhYW66yg0z30Hp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 12:13:54 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11J13XDI040538; Thu, 18 Feb 2021 20:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=Ol+KgWWKRtwuv1OC4+AQN+FF1AU19KJg+Ck4dmIKSDI=;
 b=CAziGYVZMQVAWN2zL50PRtEUhCVQt13b00RPNlJbvpkc0sg8U62G1edPNACJtZt/pmTd
 afJJeUDoIjyZkVoBlXgKo9WGKNPe1HIaBaYMoCl6UYFuv3bDK5yPPHwDPHnTFRJcJuIy
 82szrLrwYleH2LLiCVGGjHhkjqvhsMD9NvNzGgggMt30dxy1Tk1HbD1MYXgFeLQh6qEf
 5IjAJNZnlkiVA4Zcg13B2EhfWCILRwjQqZuktiBNptCUrOj3zSgJO07kVBLH6WRPQ1Fk
 FUm9JZGTryprxGMztZB6oWCkbYI7Q8D3Z4jN29Wv1GAfYvS4w9XkDZvgEFWaRj3qF1Cr yQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36t2899qee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 20:13:31 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11J0vnvh015090;
 Fri, 19 Feb 2021 01:13:30 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 36p6d9j2d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 01:13:30 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11J1DTxe16056632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 01:13:29 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C267AC059;
 Fri, 19 Feb 2021 01:13:29 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6177CAC05B;
 Fri, 19 Feb 2021 01:13:25 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.85.141.141])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 19 Feb 2021 01:13:25 +0000 (GMT)
References: <20210218223305.2044-1-nramas@linux.microsoft.com>
 <c6490f6a126a2f10e3e3445b51ea552a26f896a9.camel@linux.ibm.com>
 <8b8c0b70-c7ab-33f3-b66c-9ea03388497b@linux.microsoft.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH] of: error: 'const struct kimage' has no member named
 'arch'
In-reply-to: <8b8c0b70-c7ab-33f3-b66c-9ea03388497b@linux.microsoft.com>
Date: Thu, 18 Feb 2021 22:13:23 -0300
Message-ID: <87k0r4yi4s.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-18_14:2021-02-18,
 2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102190004
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
Cc: sashal@kernel.org, robh@kernel.org, sfr@canb.auug.org.au,
 gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 takahiro.akashi@linaro.org, devicetree@vger.kernel.org, james.morse@arm.com,
 catalin.marinas@arm.com, joe@perches.com, linux-integrity@vger.kernel.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:

> On 2/18/21 4:07 PM, Mimi Zohar wrote:
>
> Hi Mimi,
>
>> On Thu, 2021-02-18 at 14:33 -0800, Lakshmi Ramasubramanian wrote:
>>> of_kexec_alloc_and_setup_fdt() defined in drivers/of/kexec.c builds
>>> a new device tree object that includes architecture specific data
>>> for kexec system call.  This should be defined only if the architecture
>>> being built defines kexec architecture structure "struct kimage_arch".
>>>
>>> Define a new boolean config OF_KEXEC that is enabled if
>>> CONFIG_KEXEC_FILE and CONFIG_OF_FLATTREE are enabled, and
>>> the architecture is arm64 or powerpc64.  Build drivers/of/kexec.c
>>> if CONFIG_OF_KEXEC is enabled.
>>>
>>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>>> Fixes: 33488dc4d61f ("of: Add a common kexec FDT setup function")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> ---
>>>   drivers/of/Kconfig  | 6 ++++++
>>>   drivers/of/Makefile | 7 +------
>>>   2 files changed, 7 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
>>> index 18450437d5d5..f2e8fa54862a 100644
>>> --- a/drivers/of/Kconfig
>>> +++ b/drivers/of/Kconfig
>>> @@ -100,4 +100,10 @@ config OF_DMA_DEFAULT_COHERENT
>>>   	# arches should select this if DMA is coherent by default for OF devices
>>>   	bool
>>>   +config OF_KEXEC
>>> +	bool
>>> +	depends on KEXEC_FILE
>>> +	depends on OF_FLATTREE
>>> +	default y if ARM64 || PPC64
>>> +
>>>   endif # OF
>>> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
>>> index c13b982084a3..287579dd1695 100644
>>> --- a/drivers/of/Makefile
>>> +++ b/drivers/of/Makefile
>>> @@ -13,11 +13,6 @@ obj-$(CONFIG_OF_RESERVED_MEM) += of_reserved_mem.o
>>>   obj-$(CONFIG_OF_RESOLVE)  += resolver.o
>>>   obj-$(CONFIG_OF_OVERLAY) += overlay.o
>>>   obj-$(CONFIG_OF_NUMA) += of_numa.o
>>> -
>>> -ifdef CONFIG_KEXEC_FILE
>>> -ifdef CONFIG_OF_FLATTREE
>>> -obj-y	+= kexec.o
>>> -endif
>>> -endif
>>> +obj-$(CONFIG_OF_KEXEC) += kexec.o
>>>     obj-$(CONFIG_OF_UNITTEST) += unittest-data/
>> Is it possible to reuse CONFIG_HAVE_IMA_KEXEC here?
>> 
>
> For ppc64 CONFIG_HAVE_IMA_KEXEC is selected when CONFIG_KEXEC_FILE is enabled.
> So I don't see a problem in reusing CONFIG_HAVE_IMA_KEXEC for ppc.
>
> But for arm64, CONFIG_HAVE_IMA_KEXEC is enabled in the final patch in the patch
> set (the one for carrying forward IMA log across kexec for arm64). arm64 calls
> of_kexec_alloc_and_setup_fdt() prior to enabling CONFIG_HAVE_IMA_KEXEC and hence
> breaks the build for arm64.

One problem is that I believe that this patch won't placate the robot,
because IIUC it generates config files at random and this change still
allows hppa and s390 to enable CONFIG_OF_KEXEC.

Perhaps a new CONFIG_HAVE_KIMAGE_ARCH option? Not having that option
would still allow building kexec.o, but would be used inside kexec.c to
avoid accessing kimage.arch members.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
