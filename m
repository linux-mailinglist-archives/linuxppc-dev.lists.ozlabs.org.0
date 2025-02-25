Return-Path: <linuxppc-dev+bounces-6464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC54A440FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 14:38:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2JZk2fF5z30Qk;
	Wed, 26 Feb 2025 00:38:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ac"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740490686;
	cv=none; b=LZlIGP4NNuxc+cXXk+9iA7QqGQQl6yh4JCLURo2ZzowIdzX4OzhqkdOKTH58hMqMFIe7FEt9dBRSGMY4Q/NKDDolmNp6nq2tdnou2C+NXnvbGogJnZSVbfzDduARk2aIa75Xlwrh21bIdQ4JLhtuDKPXQXlOpwdjobN98mndFU08AHn1KpaAcW10a0qwh+gOfg+JgtEnddzW1iVZF/F1ACORDVZgNGXy5Ryo20deOQf79RIGPHkoR3bD7j8bx5s2jlvbdf23zKhLqtzg2O34G7OXjAxq18Vv0eaY87af8TqPxhTGKIR3uanMlnLtMc6idsq2m3lwUy9GJYT7XSlSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740490686; c=relaxed/relaxed;
	bh=+ixqOC12lcUbO8F8o140WgK+Y55hHmyICfLfrpYnuPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnBrxlME6EXmDFlVEKfH2SJyt1/bAg2AzDIbZJ7h17BC4bML3MmmQIXqrNOfKEiG/+Wv/yFLmKWsSuUf5FkMKnBTKkmDWGxOu748kB0Ke45uqAAzowl7EigHrABHZ2yuX0tdItRdhF/BbLgMC5PaQV0qeO5hCph23KRL6x/+lkuEoCm6mVo493Q6N12SIA2jna6iwKFmUdLc5XuWTIyvfI6/TR9KEqtldBNfwneSOU4eQrs1sIFYk+I9HeD3vP+dNUJ3wRIu98KvtUul4d5iIRhfNqXYRV8xaqVZSekD5d8uY6lAYaLj6zIV+pouvbaq3CzG09MEzTblxscdjTLn9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wH+xhjsR; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::ac; helo=out-172.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wH+xhjsR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ac; helo=out-172.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [IPv6:2001:41d0:203:375::ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2JZg1q7Wz2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 00:38:01 +1100 (AEDT)
Date: Tue, 25 Feb 2025 14:37:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740490661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ixqOC12lcUbO8F8o140WgK+Y55hHmyICfLfrpYnuPM=;
	b=wH+xhjsRmvhrhpxvrfoccwgz9vk4ycI7xJw3NIyc5a0Cnhjg34RUCnfdqBfFCOGenODEy4
	mNmIL02lvg+cKWngs6CywduekBe+7s9leXhvNgdLmd/IyG5MmwUslcfu2ORydBCklhQp32
	SvBxreXHRruBA0wHnBtaIVkApGPpBH8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [RFC kvm-unit-tests PATCH] lib: Use __ASSEMBLER__ instead of
 __ASSEMBLY__
Message-ID: <20250225-f474d056a12e6b23cc05f9e7@orel>
References: <20250222014526.2302653-1-seanjc@google.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222014526.2302653-1-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 21, 2025 at 05:45:26PM -0800, Sean Christopherson wrote:
> Convert all non-x86 #ifdefs from __ASSEMBLY__ to __ASSEMBLER__, and remove
> all manual __ASSEMBLY__ #defines.  __ASSEMBLY_ was inherited blindly from
> the Linux kernel, and must be manually defined, e.g. through build rules
> or with the aforementioned explicit #defines in assembly code.
> 
> __ASSEMBLER__ on the other hand is automatically defined by the compiler
> when preprocessing assembly, i.e. doesn't require manually #defines for
> the code to function correctly.
> 
> Ignore x86, as x86 doesn't actually rely on __ASSEMBLY__ at the moment,
> and is undergoing a parallel cleanup.

With ignoring x86, I see just one other instance of ASSEMBLY, which is in
a comment and is mispelled to only have the leading underscores

lib/libfdt/fdt.h:48:#endif /* !__ASSEMBLY */

With that replaced, for riscv and arm

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Thanks,
drew

