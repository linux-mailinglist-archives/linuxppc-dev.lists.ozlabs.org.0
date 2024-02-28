Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F39F86AE2C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 12:52:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F/H2xG2n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlCQl568Jz3dfM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 22:52:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F/H2xG2n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b4; helo=out-180.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 230 seconds by postgrey-1.37 at boromir; Wed, 28 Feb 2024 22:52:09 AEDT
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [IPv6:2001:41d0:203:375::b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlCQ16wDSz30hG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 22:52:09 +1100 (AEDT)
Date: Wed, 28 Feb 2024 12:51:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709121105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jZX06/t/vObxlUd3rjMifnJudTyaWwmVSmqsij++4PU=;
	b=F/H2xG2n0r3jJlW3sDq2LpzjP4WdPViUuTXqSdCcbnx+WBhS5OA0kRreYiOyJd0iiooxDf
	NPKmuHxZ/+twtmxBkxnl9oXxVU5jHMMgjf6vB+vWAlIOcHCPteHoIFkEDWPozBz3ZqFIbe
	ynwSv4Vs2JNRatJJhPalYj+vFYLuxB0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 17/32] arch-run: Fix handling multiple
 exit status messages
Message-ID: <20240228-046d6f84483d096b669d1203@orel>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-18-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226101218.1472843-18-npiggin@gmail.com>
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

On Mon, Feb 26, 2024 at 08:12:03PM +1000, Nicholas Piggin wrote:
> In SMP tests, it's possible for multiple CPUs to print an exit
> message if they abort concurrently, confusing the harness:
> 
>   EXIT: STATUS=127
> 
>   EXIT: STATUS=127
>   scripts/arch-run.bash: line 85: [: too many arguments
>   scripts/arch-run.bash: line 93: return: too many arguments
> 
> lib/arch code should probably serialise this to prevent it, but
> at the moment not all do. So make the parser handle this by
> just looking at the first EXIT.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Andrew Jones <andrew.jones@linux.dev>
> Cc: kvm@vger.kernel.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  scripts/arch-run.bash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 5c7e72036..4af670f1c 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -79,7 +79,7 @@ run_qemu_status ()
>  	exec {stdout}>&-
>  
>  	if [ $ret -eq 1 ]; then
> -		testret=$(grep '^EXIT: ' <<<"$lines" | sed 's/.*STATUS=\([0-9][0-9]*\).*/\1/')
> +		testret=$(grep '^EXIT: ' <<<"$lines" | head -n1 | sed 's/.*STATUS=\([0-9][0-9]*\).*/\1/')
>  		if [ "$testret" ]; then
>  			if [ $testret -eq 1 ]; then
>  				ret=0
> -- 
> 2.42.0
>

Acked-by: Andrew Jones <andrew.jones@linux.dev>
