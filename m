Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8D7530870
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 06:30:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L64C50wBqz3by8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 14:30:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MOxF9o3M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L64BR281kz3bc8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 14:30:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MOxF9o3M; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L64BJ3Qknz4xD8;
 Mon, 23 May 2022 14:30:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1653280216;
 bh=TOwfscKYdwdC2haCLPjRwmo2HHPTOP6220mJAoVyel4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=MOxF9o3MlQhPhKv68mEIveQsJ6XjKWqV4zneDowZK0AzaiI42uknDJFmnfHihfcy5
 70nqhuj9/sAyMsDDmwUatHz1OIcrikGZxUTi0AjrRkxWOvb83fMaZIntdoFvOcfofw
 IzDTjBQxqRQL0r9ZTijPFNntSyV31dbbi/epqYT0GoXem3A+E7Qnn13J2xZ0U34pN5
 wL7Ak4zY0OUkVDEF87DjV4Rmg9MEHSxxz+Jhp+zy2C4fO3E/xxWdOr2g28mGw2DWvW
 RywZxIxvVqwnI+LAofgXKQW8qsiU0sbPaQYddEec07u8kDJzbp/QaLPVBCcmwXifZW
 CTc5gwWYcXaBA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] powerpc: check previous kernel's ima-kexec-buffer
 against memory bounds
In-Reply-To: <87wnedfaey.fsf@vajain21.in.ibm.com>
References: <20220518200547.655788-1-vaibhav@linux.ibm.com>
 <20220520223025.GA359803-robh@kernel.org>
 <87wnedfaey.fsf@vajain21.in.ibm.com>
Date: Mon, 23 May 2022 14:30:13 +1000
Message-ID: <87fsl0na5m.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 linux-kernel@vger.kernel.org, Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linuxppc-dev@lists.ozlabs.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:
> Rob Herring <robh@kernel.org> writes:
>> On Thu, May 19, 2022 at 01:35:47AM +0530, Vaibhav Jain wrote:
>>> Presently ima_get_kexec_buffer() doesn't check if the previous kernel's
>>> ima-kexec-buffer lies outside the addressable memory range. This can result
>>> in a kernel panic if the new kernel is booted with 'mem=X' arg and the
>>> ima-kexec-buffer was allocated beyond that range by the previous kernel.
>>> The panic is usually of the form below:
>>> 
>>> $ sudo kexec --initrd initrd vmlinux --append='mem=16G'
>>> 
>>> <snip>
>>>  BUG: Unable to handle kernel data access on read at 0xc000c01fff7f0000
>>>  Faulting instruction address: 0xc000000000837974
>>>  Oops: Kernel access of bad area, sig: 11 [#1]
>>> <snip>
>>>  NIP [c000000000837974] ima_restore_measurement_list+0x94/0x6c0
>>>  LR [c00000000083b55c] ima_load_kexec_buffer+0xac/0x160
>>>  Call Trace:
>>>  [c00000000371fa80] [c00000000083b55c] ima_load_kexec_buffer+0xac/0x160
>>>  [c00000000371fb00] [c0000000020512c4] ima_init+0x80/0x108
>>>  [c00000000371fb70] [c0000000020514dc] init_ima+0x4c/0x120
>>>  [c00000000371fbf0] [c000000000012240] do_one_initcall+0x60/0x2c0
>>>  [c00000000371fcc0] [c000000002004ad0] kernel_init_freeable+0x344/0x3ec
>>>  [c00000000371fda0] [c0000000000128a4] kernel_init+0x34/0x1b0
>>>  [c00000000371fe10] [c00000000000ce64] ret_from_kernel_thread+0x5c/0x64
>>>  Instruction dump:
>>>  f92100b8 f92100c0 90e10090 910100a0 4182050c 282a0017 3bc00000 40810330
>>>  7c0802a6 fb610198 7c9b2378 f80101d0 <a1240000> 2c090001 40820614 e9240010
>>>  ---[ end trace 0000000000000000 ]---
>>> 
>>> Fix this issue by checking returned address/size of previous kernel's
>>> ima-kexec-buffer against memblock's memory bounds.
>>> 
>>> Fixes: fee3ff99bc67("powerpc: Move arch independent ima kexec functions to
>>> drivers/of/kexec.c")
...
>>
>> But more importantly, how did this commit introduce the problem? It just 
>> moved the code and didn't have any such check.

> Yes, the code didnt have the necessary check to see if the address for
> previous kernel IMA buffer is beyond the currently addressable memory. I
> have described the problem in patch description.

Rob's point is that commit fee3ff99bc67 only moved existing code, the
bug already existed.

The function was introduced in:

  467d27824920 ("powerpc: ima: get the kexec buffer passed by the previous kernel")

So that's where the Fixes tag should point.

cheers
