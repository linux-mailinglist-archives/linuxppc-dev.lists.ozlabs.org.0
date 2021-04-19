Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36412364EA4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 01:30:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPNNR1QbQz30GR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 09:30:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aTcnBG+A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aTcnBG+A; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPNMz62KXz2xYl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 09:30:23 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FPNMx0wMRz9t8j;
 Tue, 20 Apr 2021 09:30:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618875022;
 bh=sNnhdGDN+HHjQNHV3Mru459Lq1hls+4e4amt67I2FYo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aTcnBG+A0UW1DJiLAGpfVGzS2UwtCuQxBZYZZPaw5RQ6LrEiBoaLW8eZfFbo4mviZ
 3irw7rHlVV1zGselzeJL+y373FUNYlUjUILT8uHWcs13JNBL8a7FdmmbdgNWNF1K0u
 O74buVWf+PZtjss2lfXrlN+6mrQUm+IS59Jj+EptGT9kMxa8Sg6/MMz/3qbJLHoGPS
 E1H7aBo8fGc8MZJRLLxsAp0pU+5+1HP+gvDNLqFtrhOQGPkoWV9KMbmlOtH6jpy9wo
 mjM7dhVhI0e/mVkQX0CyEBDxbYzo/s29JqQBovpo8qoGUzMDWiK6ccaC1aYTQttdaN
 KHciV4J1aFxRw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, Daniel Axtens
 <dja@axtens.net>, robh@kernel.org, dan.carpenter@oracle.com
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
In-Reply-To: <2817d674-d420-580f-a0c1-b842da915a80@linux.microsoft.com>
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au> <87tuo6eh0j.fsf@mpe.ellerman.id.au>
 <2817d674-d420-580f-a0c1-b842da915a80@linux.microsoft.com>
Date: Tue, 20 Apr 2021 09:30:16 +1000
Message-ID: <87pmypdf93.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 kbuild-all@lists.01.org, bauerman@linux.ibm.com, lkp@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
> On 4/16/21 2:05 AM, Michael Ellerman wrote:
>
>> Daniel Axtens <dja@axtens.net> writes:
>>>> On 4/15/21 12:14 PM, Lakshmi Ramasubramanian wrote:
>>>>
>>>> Sorry - missed copying device-tree and powerpc mailing lists.
>>>>
>>>>> There are a few "goto out;" statements before the local variable "fdt"
>>>>> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
>>>>> elf64_load(). This will result in an uninitialized "fdt" being passed
>>>>> to kvfree() in this function if there is an error before the call to
>>>>> of_kexec_alloc_and_setup_fdt().
>>>>>
>>>>> Initialize the local variable "fdt" to NULL.
>>>>>
>>> I'm a huge fan of initialising local variables! But I'm struggling to
>>> find the code path that will lead to an uninit fdt being returned...
>>>
>>> The out label reads in part:
>>>
>>> 	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
>>> 	return ret ? ERR_PTR(ret) : fdt;
>>>
>>> As far as I can tell, any time we get a non-zero ret, we're going to
>>> return an error pointer rather than the uninitialised value...
>
> As Dan pointed out, the new code is in linux-next.
>
> I have copied the new one below - the function doesn't return fdt, but 
> instead sets it in the arch specific field (please see the link to the 
> updated elf_64.c below).
>
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/arch/powerpc/kexec/elf_64.c?h=for-next
>
>>>
>>> (btw, it does look like we might leak fdt if we have an error after we
>>> successfully kmalloc it.)
>>>
>>> Am I missing something? Can you link to the report for the kernel test
>>> robot or from Dan?
>
> /*
>           * Once FDT buffer has been successfully passed to 
> kexec_add_buffer(),
>           * the FDT buffer address is saved in image->arch.fdt. In that 
> case,
>           * the memory cannot be freed here in case of any other error.
>           */
>          if (ret && !image->arch.fdt)
>                  kvfree(fdt);
>
>          return ret ? ERR_PTR(ret) : NULL;
>
> In case of an error, the memory allocated for fdt is freed unless it has 
> already been passed to kexec_add_buffer().

It feels like the root of the problem is that the kvfree of fdt is in
the wrong place. It's only allocated later in the function, so the error
path should reflect that. Something like the patch below.

cheers


diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 5a569bb51349..02662e72c53d 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -114,7 +114,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	ret = setup_new_fdt_ppc64(image, fdt, initrd_load_addr,
 				  initrd_len, cmdline);
 	if (ret)
-		goto out;
+		goto out_free_fdt;
 
 	fdt_pack(fdt);
 
@@ -125,7 +125,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	ret = kexec_add_buffer(&kbuf);
 	if (ret)
-		goto out;
+		goto out_free_fdt;
 
 	/* FDT will be freed in arch_kimage_file_post_load_cleanup */
 	image->arch.fdt = fdt;
@@ -140,18 +140,14 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		pr_err("Error setting up the purgatory.\n");
 
+	goto out;
+
+out_free_fdt:
+	kvfree(fdt);
 out:
 	kfree(modified_cmdline);
 	kexec_free_elf_info(&elf_info);
 
-	/*
-	 * Once FDT buffer has been successfully passed to kexec_add_buffer(),
-	 * the FDT buffer address is saved in image->arch.fdt. In that case,
-	 * the memory cannot be freed here in case of any other error.
-	 */
-	if (ret && !image->arch.fdt)
-		kvfree(fdt);
-
 	return ret ? ERR_PTR(ret) : NULL;
 }
 

