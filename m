Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF33651B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 07:01:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPWjr59pGz30B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 15:01:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=wwwuUeBY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=wwwuUeBY; 
 dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPWjL4rvGz2xZR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 15:00:54 +1000 (AEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13K4xlwe099815;
 Tue, 20 Apr 2021 05:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=SEJ5hJT1rZy5KrqpbX553PdqtwAkJhD/gbN+EqTQ0pM=;
 b=wwwuUeBYkyI8PiUeT8p0L0SoQaW11u2ng14R328IzwLPYqsP8MAS7NAWRBDSl3WT7dHz
 xOoZirEcfgHvhvM/suM7UIxHSg1E19iIF6M3uZmJrXqc4PrFpT1XjJ05waUjefu5/I1D
 10FwBZcCuEnlO1fQ3D7lgpgubMpsJolWNSjMkFUGYDkTloUS2jYJJEDnHcgkA7QrpYvc
 5esr2xafpowQyre8HvkIAkujWA7nL7YmqoTlg+wzCT0kVbyINzJdMg97lq3NHYyz4bNv
 F6gB0dR5XM9a7NAf4pQjOxtAeJ7VtmolrC0P4Fz4jgxKln+OybZaunXvolC6/J5fTedx iQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 37yn6c5ue8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 05:00:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13K4trRa018061;
 Tue, 20 Apr 2021 05:00:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 3809es1v1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 05:00:35 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13K50ZLF030450;
 Tue, 20 Apr 2021 05:00:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 3809es1v0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 05:00:35 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13K50NkC026650;
 Tue, 20 Apr 2021 05:00:23 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 19 Apr 2021 22:00:23 -0700
Date: Tue, 20 Apr 2021 08:00:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
Message-ID: <20210420050015.GA1959@kadam>
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au>
 <87tuo6eh0j.fsf@mpe.ellerman.id.au>
 <2817d674-d420-580f-a0c1-b842da915a80@linux.microsoft.com>
 <87pmypdf93.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmypdf93.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: 0EOg1N2B9-n1LG6hmribXNvEhEfUTzWY
X-Proofpoint-ORIG-GUID: 0EOg1N2B9-n1LG6hmribXNvEhEfUTzWY
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9959
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104200036
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 robh@kernel.org, Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bauerman@linux.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 20, 2021 at 09:30:16AM +1000, Michael Ellerman wrote:
> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
> > On 4/16/21 2:05 AM, Michael Ellerman wrote:
> >
> >> Daniel Axtens <dja@axtens.net> writes:
> >>>> On 4/15/21 12:14 PM, Lakshmi Ramasubramanian wrote:
> >>>>
> >>>> Sorry - missed copying device-tree and powerpc mailing lists.
> >>>>
> >>>>> There are a few "goto out;" statements before the local variable "fdt"
> >>>>> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
> >>>>> elf64_load(). This will result in an uninitialized "fdt" being passed
> >>>>> to kvfree() in this function if there is an error before the call to
> >>>>> of_kexec_alloc_and_setup_fdt().
> >>>>>
> >>>>> Initialize the local variable "fdt" to NULL.
> >>>>>
> >>> I'm a huge fan of initialising local variables! But I'm struggling to
> >>> find the code path that will lead to an uninit fdt being returned...
> >>>
> >>> The out label reads in part:
> >>>
> >>> 	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
> >>> 	return ret ? ERR_PTR(ret) : fdt;
> >>>
> >>> As far as I can tell, any time we get a non-zero ret, we're going to
> >>> return an error pointer rather than the uninitialised value...
> >
> > As Dan pointed out, the new code is in linux-next.
> >
> > I have copied the new one below - the function doesn't return fdt, but 
> > instead sets it in the arch specific field (please see the link to the 
> > updated elf_64.c below).
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/arch/powerpc/kexec/elf_64.c?h=for-next 
> >
> >>>
> >>> (btw, it does look like we might leak fdt if we have an error after we
> >>> successfully kmalloc it.)
> >>>
> >>> Am I missing something? Can you link to the report for the kernel test
> >>> robot or from Dan?
> >
> > /*
> >           * Once FDT buffer has been successfully passed to 
> > kexec_add_buffer(),
> >           * the FDT buffer address is saved in image->arch.fdt. In that 
> > case,
> >           * the memory cannot be freed here in case of any other error.
> >           */
> >          if (ret && !image->arch.fdt)
> >                  kvfree(fdt);
> >
> >          return ret ? ERR_PTR(ret) : NULL;
> >
> > In case of an error, the memory allocated for fdt is freed unless it has 
> > already been passed to kexec_add_buffer().
> 
> It feels like the root of the problem is that the kvfree of fdt is in
> the wrong place. It's only allocated later in the function, so the error
> path should reflect that. Something like the patch below.
> 
> cheers
> 
> 
> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index 5a569bb51349..02662e72c53d 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -114,7 +114,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>  	ret = setup_new_fdt_ppc64(image, fdt, initrd_load_addr,
>  				  initrd_len, cmdline);
>  	if (ret)
> -		goto out;
> +		goto out_free_fdt;
>  
>  	fdt_pack(fdt);
>  
> @@ -125,7 +125,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>  	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>  	ret = kexec_add_buffer(&kbuf);
>  	if (ret)
> -		goto out;
> +		goto out_free_fdt;
>  
>  	/* FDT will be freed in arch_kimage_file_post_load_cleanup */
>  	image->arch.fdt = fdt;
> @@ -140,18 +140,14 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>  	if (ret)
>  		pr_err("Error setting up the purgatory.\n");
>  
> +	goto out;

This will leak.  It would need to be something like:

	if (ret) {
		pr_err("Error setting up the purgatory.\n");
		goto out_free_fdt;
	}

	goto out;

But we should also fix the uninitialized variable of "elf_info" if
kexec_build_elf_info() fails.

> +
> +out_free_fdt:
> +	kvfree(fdt);
>  out:
>  	kfree(modified_cmdline);
>  	kexec_free_elf_info(&elf_info);
>  
> -	/*
> -	 * Once FDT buffer has been successfully passed to kexec_add_buffer(),
> -	 * the FDT buffer address is saved in image->arch.fdt. In that case,
> -	 * the memory cannot be freed here in case of any other error.
> -	 */
> -	if (ret && !image->arch.fdt)
> -		kvfree(fdt);
> -
>  	return ret ? ERR_PTR(ret) : NULL;
>  }

regards,
dan carpenter

