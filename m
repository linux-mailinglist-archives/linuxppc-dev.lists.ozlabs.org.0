Return-Path: <linuxppc-dev+bounces-5770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F02CA24E33
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2025 14:26:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ym9Pc3fCsz2xrJ;
	Mon,  3 Feb 2025 00:26:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738502772;
	cv=none; b=T9VzqTZz3NR9+cL/E7J+PRS3h5bdQPjvuy2/MM0eirRdRTJNVr4cIIk/ebOyRWm4eyq7pcJFmIBjvc8c/A4pG0/FFIQFVxozQmcuEBejtFxMwlcT+R5k/osTZ3ghqwCy2B4z1ZmnvrcmS1gxkUcKSbtFIGGT2iCg7Nkng+WxzSwQfQdu35Gqy9SYbJSc472GMxZP/f9mmYe9+kMTJDA1gkhuVbqhuQWX9QN6d7yhAC+6fV3cna7ckBdD1ZU12xjxEO7d/wk18MBJ9E1D/klqE0i2ZXn49i/HdGl2HkLCYSeIiSBhGIa9OyBMCr308rpXxDU3e3YjX8C+eC59EkJiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738502772; c=relaxed/relaxed;
	bh=mi1XAkFXF1hJqz1PiPBnuEy+3a1mqm5DS6iO7bI70RM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l7xfvGV8upv+nxP5FokHGOZn5oAqnkUQn3VmugFF49TN3N2PuuZMUixqw3Nd+XThkWQpxEhofXs5Q1ai7uD1RobiwJUUYn422byJhbpN6PhbfG3KH2hVJ0JnyV0/Pba+b+Mhu8cqz/yWT238vDVHFrJapnNPSeY56yQsbLWdQ1Gug3XB1YjyU3fsj+cGVlndIOpLdDFUcYVK8Zqcn3QwsN7WMQGY+mtzLQIwmFKW4r6Y/GFEO7o2kD+QnCUrexkOtYTEMGwRTPCQR3AaWtdwxycozxEJ2u05Oh8n02kHWXH4JW7yKbvYAQfKC3jGgcl9Xwl8nRk8fJ/0JDkxXCOSyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Es23QAOE; dkim-atps=neutral; spf=pass (client-ip=80.241.56.151; helo=mout-p-101.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org) smtp.mailfrom=mailbox.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Es23QAOE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.151; helo=mout-p-101.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ym9PW22Pgz2xX3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2025 00:26:05 +1100 (AEDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Ym9PH4Wt4z9t9k;
	Sun,  2 Feb 2025 14:25:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1738502755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mi1XAkFXF1hJqz1PiPBnuEy+3a1mqm5DS6iO7bI70RM=;
	b=Es23QAOEM7MqzVm9d4eLlurLkM3OdM05GedLXetl2OUdnSa1lgapFFczo+bf/wIQgT7IEx
	LpYBvhGvKA3oKhOC426HjB9BoHOKMnjEC82CoNVu9W2YYhcOSRdPH0gW2sj3qRZMlgnqhF
	S00yPqODeFonejwiwwt4jh5x29xRAH8PEyN5RZnH/VKY2lZopbHn+E1W3+3wf2cCdJ5NF/
	QLL0VLhI33Kj0uK8VNuJ8S/R8w4NzmGoA8umm42sOqxKxy5+kCERG+wkjBzalJ+5Za9zQ1
	XkYcEPfAdRD52vRh9RwXJESaKoUIuVzFQFhjgwJR8SXqt3yNByWH9K8O3Aat7g==
Date: Sun, 2 Feb 2025 14:25:52 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Hari Bathini <hbathini@linux.ibm.com>, "Christopher M. Riedl"
 <cmr@bluescreens.de>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "maddy@linux.ibm.com"
 <maddy@linux.ibm.com>
Subject: Re: BUG: KASAN: vmalloc-out-of-bounds in
 copy_to_kernel_nofault+0xd8/0x1c8 (v6.13-rc6, PowerMac G4)
Message-ID: <20250202142552.33285e7e@yea>
In-Reply-To: <66f36cf5-37d5-4edb-a20b-4047dbe6a846@csgroup.eu>
References: <20250112135832.57c92322@yea>
	<af04e91f-0f44-457e-9550-d1d49789158e@linux.ibm.com>
	<20250121220027.64b79bab@yea>
	<f06de018-34ae-4662-8a35-1c55dff1024a@csgroup.eu>
	<20250122002159.43b367f0@yea>
	<ca7568ef-5032-4a80-9350-a9648b87f0b5@csgroup.eu>
	<8acd6ef8-adf0-4694-a3e5-72ec3cf09bf1@csgroup.eu>
	<20250201151435.48400261@yea>
	<1ff477a4-85f6-4330-aa0c-add315abfff9@csgroup.eu>
	<20250201165416.71e00c43@yea>
	<66f36cf5-37d5-4edb-a20b-4047dbe6a846@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: aa60b9fe1e9fcc1c344
X-MBO-RS-META: i5nxqbgwiwmxy6jbn985p6c7mdjc3dj4
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 2 Feb 2025 09:44:20 +0100
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> This time the problem is a mixture of commit 465cabc97b42 
> ("powerpc/code-patching: introduce patch_instructions()") and commit 
> c28c15b6d28a ("powerpc/code-patching: Use temporary mm for Radix MMU") 
> which is revealed by commit e4137f08816b ("mm, kasan, kmsan: instrument 
> copy_from/to_kernel_nofault")
> 
> Commit c28c15b6d28a is inspired by commit b3fd8e83ada0 
> ("x86/alternatives: Use temporary mm for text poking") but misses the 
> kasan_disable_current() / kasan_enable_current() sequence.
> 
> Was not necessary because __patch_mem() is not instrumented. But commit 
> 465cabc97b42 added use of copy_to_kernel_nofault() which is now 
> instrumented.
> 
> The problem is that commit c28c15b6d28a makes use of a special memory 
> area which is not kernel memory and it doesn't have any matching KASAN 
> shadow area. And because it is located below TASK_SIZE, in addition 
> kasan sees it as user memory.
> 
> Can you try the change below ?
> 
> diff --git a/arch/powerpc/lib/code-patching.c 
> b/arch/powerpc/lib/code-patching.c
> index 8a378fc19074..f84e0337cc02 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -493,7 +493,9 @@ static int __do_patch_instructions_mm(u32 *addr, u32 
> *code, size_t len, bool rep
> 
>   	orig_mm = start_using_temp_mm(patching_mm);
> 
> +	kasan_disable_current();
>   	err = __patch_instructions(patch_addr, code, len, repeat_instr);
> +	kasan_enable_current();
> 
>   	/* context synchronisation performed by __patch_instructions */
>   	stop_using_temp_mm(patching_mm, orig_mm);
> 

Thanks! With this patch applied the KASAN hit is gone and I got no further KASAN hits on my Talos II during boot. Applied both patches on top of v6.13.1.

Regards,
Erhard

