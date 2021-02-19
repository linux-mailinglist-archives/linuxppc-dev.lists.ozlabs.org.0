Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 425BF31F33D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 01:08:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhX3x2M8Cz3cL1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 11:08:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PHIUdKmm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PHIUdKmm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhX3T2C5sz30N0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 11:08:20 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11J04edt137194; Thu, 18 Feb 2021 19:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Hc7iP0dSCjCglGy8CL0I7K1Mp2bmFJnmdPntjscntUw=;
 b=PHIUdKmmbrq3yFv6zQJdZqijTiJOtkqsmCwwDHsDFGWnX3OW2ooy8J4NExhd4A6+/kd3
 4rvDVpDk7TnlMgazxPv9bW1iujhHifrALZ6J9jZAQk3b63yYTV9L2YqtlA6hHSCEd4B4
 J4UjA5fgGAdlHaNOk4XvYBS1fhzFuePHfxx/SdKwAppg1mC7NlxTYiIS7HfYiFgDk9jb
 rLOgVOmFdZMf7N3d4YO0+DXyuKuVG5S9k/jD/bIwE9TvNLmnaVn2ULXnU6v+TbPZDz0q
 ljCGQweIddjonRkud2pi9DDCXKy9szN7aILJdisbSrVb7lGBEs9J3NfEBglGXE9i75bm lw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36sy3aw41b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 19:07:54 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11J07qIc004692;
 Fri, 19 Feb 2021 00:07:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 36p6d8jp3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 00:07:52 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11J07nYa18809186
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 00:07:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABC4611C04C;
 Fri, 19 Feb 2021 00:07:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8011511C04A;
 Fri, 19 Feb 2021 00:07:45 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.211.66.70]) by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Feb 2021 00:07:45 +0000 (GMT)
Message-ID: <c6490f6a126a2f10e3e3445b51ea552a26f896a9.camel@linux.ibm.com>
Subject: Re: [PATCH] of: error: 'const struct kimage' has no member named
 'arch'
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 bauerman@linux.ibm.com, robh@kernel.org, takahiro.akashi@linaro.org,
 gregkh@linuxfoundation.org, will@kernel.org, joe@perches.com,
 catalin.marinas@arm.com, mpe@ellerman.id.au, sfr@canb.auug.org.au
Date: Thu, 18 Feb 2021 19:07:44 -0500
In-Reply-To: <20210218223305.2044-1-nramas@linux.microsoft.com>
References: <20210218223305.2044-1-nramas@linux.microsoft.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-18_14:2021-02-18,
 2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1011 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180203
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
Cc: sashal@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 james.morse@arm.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2021-02-18 at 14:33 -0800, Lakshmi Ramasubramanian wrote:
> of_kexec_alloc_and_setup_fdt() defined in drivers/of/kexec.c builds
> a new device tree object that includes architecture specific data
> for kexec system call.  This should be defined only if the architecture
> being built defines kexec architecture structure "struct kimage_arch".
> 
> Define a new boolean config OF_KEXEC that is enabled if
> CONFIG_KEXEC_FILE and CONFIG_OF_FLATTREE are enabled, and
> the architecture is arm64 or powerpc64.  Build drivers/of/kexec.c
> if CONFIG_OF_KEXEC is enabled.
> 
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Fixes: 33488dc4d61f ("of: Add a common kexec FDT setup function")
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/of/Kconfig  | 6 ++++++
>  drivers/of/Makefile | 7 +------
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 18450437d5d5..f2e8fa54862a 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -100,4 +100,10 @@ config OF_DMA_DEFAULT_COHERENT
>  	# arches should select this if DMA is coherent by default for OF devices
>  	bool
>  
> +config OF_KEXEC
> +	bool
> +	depends on KEXEC_FILE
> +	depends on OF_FLATTREE
> +	default y if ARM64 || PPC64
> +
>  endif # OF
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index c13b982084a3..287579dd1695 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -13,11 +13,6 @@ obj-$(CONFIG_OF_RESERVED_MEM) += of_reserved_mem.o
>  obj-$(CONFIG_OF_RESOLVE)  += resolver.o
>  obj-$(CONFIG_OF_OVERLAY) += overlay.o
>  obj-$(CONFIG_OF_NUMA) += of_numa.o
> -
> -ifdef CONFIG_KEXEC_FILE
> -ifdef CONFIG_OF_FLATTREE
> -obj-y	+= kexec.o
> -endif
> -endif
> +obj-$(CONFIG_OF_KEXEC) += kexec.o
>  
>  obj-$(CONFIG_OF_UNITTEST) += unittest-data/

Is it possible to reuse CONFIG_HAVE_IMA_KEXEC here?

Mimi


