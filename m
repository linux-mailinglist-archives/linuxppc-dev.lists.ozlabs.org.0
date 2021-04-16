Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ED2361CB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 11:06:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM9L722s3z3c10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 19:06:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=N5K+P5uI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=N5K+P5uI; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM9Kh4njLz3bSv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 19:05:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FM9KY0PN8z9sRR;
 Fri, 16 Apr 2021 19:05:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618563938;
 bh=ODI74klkPteUtUE2RViGCzX+1GpV6bkKxunEM80VHEQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=N5K+P5uI8zLBgHhpJPdrouDzj3Tny9rxGnD0pO2rxvh6hAcHhkrH2GnJzAHuxkDUY
 QhdfK8K1Z0Pumw3BaNMxLkURu41hYxQScn1jm+DC+Y0/YWQnJDQnggSf+N6VK9MTgy
 xPXEKynNnpM618/eFJ4jzWxZJluP/fyzeYrFH3X6FVIhmKUAHFv5TtBR+JNIgx7IY9
 miVOR70+UkJncVLS75fElHdIOMFkcnkH1Vw1y2NNvol0YkXopOT5kVxkpBbMoBq1Po
 /ksN+pHOxpvoTo5Qrp14GAUQXaHJfklM7hV8vLg8FT/wX73M/5gvI1JxiRSBYFh26h
 peuneCnGS+9Gg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, Lakshmi Ramasubramanian
 <nramas@linux.microsoft.com>, robh@kernel.org, dan.carpenter@oracle.com
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
In-Reply-To: <87eefag241.fsf@linkitivity.dja.id.au>
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au>
Date: Fri, 16 Apr 2021 19:05:32 +1000
Message-ID: <87tuo6eh0j.fsf@mpe.ellerman.id.au>
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

Daniel Axtens <dja@axtens.net> writes:
>> On 4/15/21 12:14 PM, Lakshmi Ramasubramanian wrote:
>>
>> Sorry - missed copying device-tree and powerpc mailing lists.
>>
>>> There are a few "goto out;" statements before the local variable "fdt"
>>> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
>>> elf64_load(). This will result in an uninitialized "fdt" being passed
>>> to kvfree() in this function if there is an error before the call to
>>> of_kexec_alloc_and_setup_fdt().
>>> 
>>> Initialize the local variable "fdt" to NULL.
>>>
> I'm a huge fan of initialising local variables! But I'm struggling to
> find the code path that will lead to an uninit fdt being returned...
>
> The out label reads in part:
>
> 	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
> 	return ret ? ERR_PTR(ret) : fdt;
>
> As far as I can tell, any time we get a non-zero ret, we're going to
> return an error pointer rather than the uninitialised value...
>
> (btw, it does look like we might leak fdt if we have an error after we
> successfully kmalloc it.)
>
> Am I missing something? Can you link to the report for the kernel test
> robot or from Dan? 
>
> FWIW, I think it's worth including this patch _anyway_ because initing
> local variables is good practice, but I'm just not sure on the
> justification.

Why is it good practice?

It defeats -Wuninitialized. So you're guaranteed to be returning
something initialised, but not necessarily initialised to the right
value.

In a case like this NULL seems like a safe choice, but it's still wrong.
The function is meant to return a pointer to the successfully allocated
fdt, or an ERR_PTR() value. NULL is neither of those.

I agree there are security reasons that initialising stack variables is
desirable, but I think that should be handled by the compiler, not at
the source level.

cheers
