Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D2A86AEB6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 13:05:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l67zPqdS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlChz19Gwz3dVS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 23:05:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l67zPqdS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ba; helo=out-186.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [IPv6:2001:41d0:203:375::ba])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlChG1s30z3bX9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 23:04:29 +1100 (AEDT)
Date: Wed, 28 Feb 2024 13:04:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709121846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u00ElXyXOufHqCLdR4uMNx31NnYXH97xBaIzPn3Hn+Y=;
	b=l67zPqdSKtGoXYc+m4nQIKaTTSUf0vYLMvkl+3A0cFqzEHJseYddhhbsBPv8aD8vFPa3MK
	vmUkCF6oS0azcDZcFeUaAOGWmvDfsiyqi4gsivWoZ7Ha4cVQFiAaEi/DagWI3JyTGQDgQL
	dF6KVqm6B+ItD6g+f0TKIVJCPnfoVL8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 25/32] common/sieve: Support machines
 without MMU
Message-ID: <20240228-c35ae38d8f0f7a2132b51689@orel>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-26-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226101218.1472843-26-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 08:12:11PM +1000, Nicholas Piggin wrote:
> Not all powerpc CPUs provide MMU support. Define vm_available() that is
> true by default but archs can override it. Use this to run VM tests.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Andrew Jones <andrew.jones@linux.dev>
> Cc: kvm@vger.kernel.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  common/sieve.c      | 14 ++++++++------
>  lib/ppc64/asm/mmu.h |  1 -
>  lib/ppc64/mmu.c     |  2 +-
>  lib/vmalloc.c       |  7 +++++++
>  lib/vmalloc.h       |  2 ++
>  5 files changed, 18 insertions(+), 8 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
