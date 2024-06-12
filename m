Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 702FE904CC7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 09:27:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OpBrqRxC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzcYg2pqjz3dXW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 17:27:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OpBrqRxC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::af; helo=out-175.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [IPv6:2001:41d0:203:375::af])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzcXz1ylHz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 17:26:26 +1000 (AEST)
X-Envelope-To: npiggin@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1718177166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5YuQn5IrAUYtmbzCV9i0/B6NGjQuNoPZLzpKUN9oVV8=;
	b=OpBrqRxCjpyZUNsoUlgKjxwgbMlJBuNrf3NFF8PCul+SMsRawTFcZk+2I0vXG57v0zICk8
	tuy6MZMkTzEG8jLSsIe+flYk5u3XQ1keborCHXC7u1U+Gareizr2iGpagZkJR9ZnslyMBb
	w6/vNH/pGyBLSbNSRc9OKpIzRpVUb7A=
X-Envelope-To: thuth@redhat.com
X-Envelope-To: lvivier@redhat.com
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: kvm@vger.kernel.org
Date: Wed, 12 Jun 2024 09:26:04 +0200
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v10 12/15] scripts/arch-run.bash: Fix
 run_panic() success exit status
Message-ID: <20240612-eef98a649a0764215ea0d91f@orel>
References: <20240612052322.218726-1-npiggin@gmail.com>
 <20240612052322.218726-13-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612052322.218726-13-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2024 at 03:23:17PM GMT, Nicholas Piggin wrote:
> run_qemu_status() looks for "EXIT: STATUS=%d" if the harness command
> returned 1, to determine the final status of the test. In the case of
> panic tests, QEMU should terminate before successful exit status is
> known, so the run_panic() command must produce the "EXIT: STATUS" line.
> 
> With this change, running a panic test returns 0 on success (panic),
> and the run_test.sh unit test correctly displays it as PASS rather than
> FAIL.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  scripts/arch-run.bash | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 8643bab3b..9bf2f0bbd 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -378,6 +378,7 @@ run_panic ()
>  	else
>  		# some QEMU versions report multiple panic events
>  		echo "PASS: guest panicked"
> +		echo "EXIT: STATUS=1"
>  		ret=1
>  	fi
>  
> -- 
> 2.45.1
>

Do we also need an 'echo "EXIT: STATUS=3"' in the if-arm of this if-else?

Thanks,
drew
