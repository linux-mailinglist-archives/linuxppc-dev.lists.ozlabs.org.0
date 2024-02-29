Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1661986C8A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 12:55:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UKQXxJUY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlqQw4nDmz3vd0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 22:55:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UKQXxJUY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.188; helo=out-188.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlqQC507vz3bWy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 22:54:27 +1100 (AEDT)
Date: Thu, 29 Feb 2024 12:54:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709207648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SRQFyPvY8FzfiTI6Lrcxrny9e2wWpcl8DCC9vctNmI8=;
	b=UKQXxJUYc46ZLK+ZyhJkOcUg7zV8d2domzB+H8mVZ5fSkRQ9UVh4pEC03ilpi6Xb7MFKCt
	TXem02Z9MWLkn7NyZKKbQKS5wTnaEdARZYCQQcFrDHMafZcQJ8iC3/XWQINP8o8AiqMfy6
	CmLGcFI9P8Bw9WDCPlaaL6IcbpCzg/w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 04/13] treewide: lib/stack: Make
 base_address arch specific
Message-ID: <20240229-edee610a9d15912f1f349ea0@orel>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
 <20240228150416.248948-19-andrew.jones@linux.dev>
 <CZH98WKJY6NT.5D53XGR31X22@wheely>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CZH98WKJY6NT.5D53XGR31X22@wheely>
X-Migadu-Flow: FLOW_OUT
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
Cc: lvivier@redhat.com, linux-s390@vger.kernel.org, thuth@redhat.com, nrb@linux.ibm.com, frankja@linux.ibm.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, imbrenda@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 01:49:58PM +1000, Nicholas Piggin wrote:
> On Thu Feb 29, 2024 at 1:04 AM AEST, Andrew Jones wrote:
> > Calculating the offset of an address is image specific, which is
> > architecture specific. Until now, all architectures and architecture
> > configurations which select CONFIG_RELOC were able to subtract
> > _etext, but the EFI configuration of riscv cannot (it must subtract
> > ImageBase). Make this function architecture specific, since the
> > architecture's image layout already is.
> 
> arch_base_address()?

Yeah, I should have added that prefix.

> 
> How about a default implementation unlesss HAVE_ARCH_BASE_ADDRESS?

We have a default implementation for !CONFIG_RELOC, but if an arch
selects RELOC it must have an implementation of base_address(), so
I wouldn't introduce a HAVE_ARCH_BASE_ADDRESS type of config since
it would just always be selected when RELOC is selected. It occurred
to me after posting that I probably should have just made the current
base_address() implementation weak and then only introduced the new
riscv one. I'll do that for v2.

Thanks,
drew
