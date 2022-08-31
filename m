Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 278025A7480
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 05:35:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHVDp0GTlz3c7y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 13:35:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=NQBMw4uC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHVDF0vFYz2xbK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 13:34:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=NQBMw4uC;
	dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4MHVDF0DYLz4xGC; Wed, 31 Aug 2022 13:34:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1661916893;
	bh=HCg6+BvaYmSmlRjB/itmRf5kMZ9vl1V8waSjYVg7RZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQBMw4uCQpWTwSQQEZ7Iqitx69FGv8Tv1E6TRiyXhKHc0+STFMwyqrYsZR7iYbDyO
	 z5R3ptFKmQpbwoWjqmeUg1Qo6Pk8xegVomYW5WLq3phLNuQyfXzZooC7GrM0H7dZ3v
	 jtqcyuvEwq8jRRP7k7N9htFZXioN3Pj5eDc7ppxs4dpVcSo6XDZD5qtbkeH5aHCS8E
	 iCKbilz1JqXPaTUVcWAdTI/awb4FdKPEPQy67qp+C1IJcvVzpyP37ntYr0crzBDhFN
	 DQDQxZuJIArJhir+2XTsizWlKJ3vv6DdGXuYMmPJiiGEYqCiTYvbzEtLT75RY0+CWp
	 5tiPDTb6qZmnA==
Date: Wed, 31 Aug 2022 13:34:48 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: Re: [PATCH] KVM: fix repeated words in comments
Message-ID: <Yw7W2DfOvqqm7IvM@cleo>
References: <20220831004454.33921-1-yuanjilin@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831004454.33921-1-yuanjilin@cdjrlc.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 31, 2022 at 08:44:54AM +0800, Jilin Yuan wrote:
> Delete the redundant word 'that'.

Nack, having two "that"s in a row is intentional.  It's "make sure
that" (i.e. bring about the situation described in what follows)
"that many HPTEs" (i.e. the number of HPTEs referenced previously)
"are invalid".

> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>  arch/powerpc/kvm/book3s_64_mmu_hv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index e9744b41a226..8e4b42b5f37f 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -1601,7 +1601,7 @@ long kvm_vm_ioctl_resize_hpt_commit(struct kvm *kvm,
>   * is valid, it is written to the HPT as if an H_ENTER with the
>   * exact flag set was done.  When the invalid count is non-zero
>   * in the header written to the stream, the kernel will make
> - * sure that that many HPTEs are invalid, and invalidate them
> + * sure that many HPTEs are invalid, and invalidate them
>   * if not.
>   */

Paul.
