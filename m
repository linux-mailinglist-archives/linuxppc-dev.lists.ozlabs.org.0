Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C59AB31FB18
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 15:42:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhvSM34YQz3cJT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 01:42:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XhbDak9E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XhbDak9E; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhvRx1dGyz30HR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 01:42:20 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11JEUstS150662; Fri, 19 Feb 2021 09:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=RSz20VvKXFB5jC+o3AcCQ9ZN5SXc6OoYvDL/W5mSWJk=;
 b=XhbDak9E4D1KTPZu8yr3yC+af5sDrsHvMpoaeKjzTvH+wV7W2coCmcop7berxa3ahZnA
 KrkDnYCHDztdFXCGTkPFxtP5/gAaWChjI2UNkCg1AGJsWwIIYOLCd8GQpwg3F5w66YdY
 Z1ryUaddPNWn4eygUNyVaZ+t2aElXkGSo3+Jp3UnpkyrfDhosGAGP/BKPEIFU9Vs1Gox
 HWq3OTAGlfu648yfUe5JT4t94WHhfe6xwMZ4NpJuarqWwqjptFftXV3FALjjFsNjPz8x
 u+wE4tg43rhPejlfXhJRh9oJpKv85GQUVQ8w/h+gojn2i/m0a6WUO7tfGyQGoke/KTtk 2A== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36tf2aghg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 09:41:56 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11JEbH6v026778;
 Fri, 19 Feb 2021 14:41:54 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 36spsn8k4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 14:41:54 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11JEfpkx36045308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 14:41:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE6C842042;
 Fri, 19 Feb 2021 14:41:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DEAB42041;
 Fri, 19 Feb 2021 14:41:47 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.211.66.70]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Feb 2021 14:41:47 +0000 (GMT)
Message-ID: <7f4cd52440eed369b0ef3a364688171501a42cd0.camel@linux.ibm.com>
Subject: Re: [PATCH] of: error: 'const struct kimage' has no member named
 'arch'
From: Mimi Zohar <zohar@linux.ibm.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, Lakshmi Ramasubramanian
 <nramas@linux.microsoft.com>
Date: Fri, 19 Feb 2021 09:41:46 -0500
In-Reply-To: <87eehcxi88.fsf@manicouagan.localdomain>
References: <20210218223305.2044-1-nramas@linux.microsoft.com>
 <c6490f6a126a2f10e3e3445b51ea552a26f896a9.camel@linux.ibm.com>
 <8b8c0b70-c7ab-33f3-b66c-9ea03388497b@linux.microsoft.com>
 <87k0r4yi4s.fsf@manicouagan.localdomain>
 <3ca0aa87-ca83-8024-4067-c2382a360db9@linux.microsoft.com>
 <87eehcxi88.fsf@manicouagan.localdomain>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_05:2021-02-18,
 2021-02-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1011 malwarescore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102190112
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
 linux-kernel@vger.kernel.org, takahiro.akashi@linaro.org,
 devicetree@vger.kernel.org, james.morse@arm.com, catalin.marinas@arm.com,
 joe@perches.com, linux-integrity@vger.kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2021-02-19 at 11:08 -0300, Thiago Jung Bauermann wrote:
> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
> 
> > On 2/18/21 5:13 PM, Thiago Jung Bauermann wrote:
> >> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
> >> 
> >>> On 2/18/21 4:07 PM, Mimi Zohar wrote:
> >>>
> >>> Hi Mimi,
> >>>
> >>>> On Thu, 2021-02-18 at 14:33 -0800, Lakshmi Ramasubramanian wrote:
> >>>>> of_kexec_alloc_and_setup_fdt() defined in drivers/of/kexec.c builds
> >>>>> a new device tree object that includes architecture specific data
> >>>>> for kexec system call.  This should be defined only if the architecture
> >>>>> being built defines kexec architecture structure "struct kimage_arch".
> >>>>>
> >>>>> Define a new boolean config OF_KEXEC that is enabled if
> >>>>> CONFIG_KEXEC_FILE and CONFIG_OF_FLATTREE are enabled, and
> >>>>> the architecture is arm64 or powerpc64.  Build drivers/of/kexec.c
> >>>>> if CONFIG_OF_KEXEC is enabled.
> >>>>>
> >>>>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> >>>>> Fixes: 33488dc4d61f ("of: Add a common kexec FDT setup function")
> >>>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>>> ---
> >>>>>    drivers/of/Kconfig  | 6 ++++++
> >>>>>    drivers/of/Makefile | 7 +------
> >>>>>    2 files changed, 7 insertions(+), 6 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> >>>>> index 18450437d5d5..f2e8fa54862a 100644
> >>>>> --- a/drivers/of/Kconfig
> >>>>> +++ b/drivers/of/Kconfig
> >>>>> @@ -100,4 +100,10 @@ config OF_DMA_DEFAULT_COHERENT
> >>>>>    	# arches should select this if DMA is coherent by default for OF devices
> >>>>>    	bool
> >>>>>    +config OF_KEXEC
> >>>>> +	bool
> >>>>> +	depends on KEXEC_FILE
> >>>>> +	depends on OF_FLATTREE
> >>>>> +	default y if ARM64 || PPC64
> >>>>> +
> >>>>>    endif # OF
> >>>>> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> >>>>> index c13b982084a3..287579dd1695 100644
> >>>>> --- a/drivers/of/Makefile
> >>>>> +++ b/drivers/of/Makefile
> >>>>> @@ -13,11 +13,6 @@ obj-$(CONFIG_OF_RESERVED_MEM) += of_reserved_mem.o
> >>>>>    obj-$(CONFIG_OF_RESOLVE)  += resolver.o
> >>>>>    obj-$(CONFIG_OF_OVERLAY) += overlay.o
> >>>>>    obj-$(CONFIG_OF_NUMA) += of_numa.o
> >>>>> -
> >>>>> -ifdef CONFIG_KEXEC_FILE
> >>>>> -ifdef CONFIG_OF_FLATTREE
> >>>>> -obj-y	+= kexec.o
> >>>>> -endif
> >>>>> -endif
> >>>>> +obj-$(CONFIG_OF_KEXEC) += kexec.o
> >>>>>      obj-$(CONFIG_OF_UNITTEST) += unittest-data/
> >>>> Is it possible to reuse CONFIG_HAVE_IMA_KEXEC here?
> >>>>
> >>>
> >>> For ppc64 CONFIG_HAVE_IMA_KEXEC is selected when CONFIG_KEXEC_FILE is enabled.
> >>> So I don't see a problem in reusing CONFIG_HAVE_IMA_KEXEC for ppc.
> >>>
> >>> But for arm64, CONFIG_HAVE_IMA_KEXEC is enabled in the final patch in the patch
> >>> set (the one for carrying forward IMA log across kexec for arm64). arm64 calls
> >>> of_kexec_alloc_and_setup_fdt() prior to enabling CONFIG_HAVE_IMA_KEXEC and hence
> >>> breaks the build for arm64.
> >> One problem is that I believe that this patch won't placate the robot,
> >> because IIUC it generates config files at random and this change still
> >> allows hppa and s390 to enable CONFIG_OF_KEXEC.
> >
> > I enabled CONFIG_OF_KEXEC for s390. With my patch applied, CONFIG_OF_KEXEC is
> > removed. So I think the robot enabling this config would not be a problem.
> >
> >> Perhaps a new CONFIG_HAVE_KIMAGE_ARCH option? Not having that option
> >> would still allow building kexec.o, but would be used inside kexec.c to
> >> avoid accessing kimage.arch members.
> >> 
> >
> > I think this is a good idea - a new CONFIG_HAVE_KIMAGE_ARCH, which will be
> > selected by arm64 and ppc for now. I tried this, and it fixes the build issue.
> >
> > Although, the name for the new config can be misleading since PARISC, for
> > instance, also defines "struct kimage_arch". Perhaps,
> > CONFIG_HAVE_ELF_KIMAGE_ARCH since of_kexec_alloc_and_setup_fdt() is 
> > accessing ELF specific fields in "struct kimage_arch"?
> 
> Ah, right. I should have digged into the code before making my
> suggestion. CONFIG_HAVE_KIMAGE_ARCH isn't appropriate, indeed.
> 
> >
> > Rob/Mimi - please let us know which approach you think is better.
> 
> Ah! We can actually use the existing CONFIG_HAVE_IMA_KEXEC, no? I don't
> know why I didn't think of it before.

Including kexec.o based on CONFIG_HAVE_IMA_KEXEC is a bisect issue on
ARM64, as Lakshmi pointed out.   Defining a new, maybe temporary, flag
would solve the problem.

Mimi


