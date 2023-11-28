Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EDC7FC985
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 23:31:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RgF0zQOP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfxyF09w3z3cfy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 09:31:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RgF0zQOP;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfxxP3RcSz3cYV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 09:30:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701210649;
	bh=hfMTgs27UIvcO0GZVIso0Hw/ToGRlXsC/exVsmtbRM0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RgF0zQOPvtoh2t03OFoQmeC4/i9r3uMbuUuMbFxlTo7ayyD/+lQ5/vV6pZGsiAXLr
	 pZqCmGXocf8pNcgRtydLHt/Koehbfa8PGJfnozkQJvk6hUjrUrz4P9ST9NPNBGgEBN
	 EFHA4CMpgAw/0hnu7CZ1BFGeVWRjm2UZG9l6UMjbVaffq4T/KPiHyaaQIvGFT1UOoC
	 kH8PhJCzVuN8ws2LHOmem5daUgeXxhA0yNlGIu24770/2huyxl3poejiNIIontoqXt
	 cpURjpgc+Bmr5Q+Os+IRIw+mBQBzNGbcxjaN9brWWSdHLxzPZGSg+xyFIEt0rdxbVF
	 ZnpiSrfj3ohIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SfxxN5BDLz4wx5;
	Wed, 29 Nov 2023 09:30:48 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/13] powerpc/rtas: Facilitate high-level call
 sequences
In-Reply-To: <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
Date: Wed, 29 Nov 2023 09:30:43 +1100
Message-ID: <87sf4p33zg.fsf@mail.lhotse>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> On RTAS platforms there is a general restriction that the OS must not
> enter RTAS on more than one CPU at a time. This low-level
> serialization requirement is satisfied by holding a spin
> lock (rtas_lock) across most RTAS function invocations.
...
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 1fc0b3fffdd1..52f2242d0c28 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -581,6 +652,28 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
>  	return NULL;
>  }
>  
> +static void __rtas_function_lock(struct rtas_function *func)
> +{
> +	if (func && func->lock)
> +		mutex_lock(func->lock);
> +}

This is obviously going to defeat most static analysis tools. I assume
lockdep is OK with it though?

cheers
