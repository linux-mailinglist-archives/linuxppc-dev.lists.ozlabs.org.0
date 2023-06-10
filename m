Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF4A72AF62
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 00:08:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdsY51dL7z3f1J
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 08:08:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=b25T5Qe4;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=F0OuUI0f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=b25T5Qe4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=F0OuUI0f;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdsXF3hKYz3c4B
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jun 2023 08:08:13 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686434889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jVZzPX6ySJgTLx7rG1PlEmES+KNjRD+EkEdNbnlOS88=;
	b=b25T5Qe4kt5MEyfeX2GABqTnk9yjLItyquzWcx2uF0ipsqgMJo+Jd06bI9wtxSVxGwD/fg
	nz+i3ogEhNW+eOrE/+j7gQxfpsNLaPE4I9xtkoLRJjP1wegoLl4ky+Ib5h0qVFn3Ktwb71
	mcFIsaywBASu+DAaFu7RCo3rCLXQEaKGMXPEhuFLXkh6xtZXFhgu6gwACW9KC0awg7WVtW
	eNJ4emR5imFeA2He/z1nGztGSklYh3+dKykgJh/tmNsdAvW+EIDUBRGKFBpogE0EUkeT9F
	yKNajzrDDN7B3NN9z9N3qg6MEwP2ppmAgPDyQ17i45iAAjb3JHBsmFJ3XIxaSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686434889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jVZzPX6ySJgTLx7rG1PlEmES+KNjRD+EkEdNbnlOS88=;
	b=F0OuUI0fMxtyjvJSBkwniYXqfNSWA+CQmKGCPAp9LUuUIenY+Pb43ltP79gk0gHv6mQJtn
	Miqvo/wls8h5U9Bg==
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] cpu/SMT: Store the current/max number of threads
In-Reply-To: <87fs6z80w5.ffs@tglx>
References: <20230524155630.794584-1-mpe@ellerman.id.au>
 <20230524155630.794584-3-mpe@ellerman.id.au> <87fs6z80w5.ffs@tglx>
Date: Sun, 11 Jun 2023 00:08:09 +0200
Message-ID: <87a5x77yye.ffs@tglx>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com, bp@alien8.de, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 10 2023 at 23:26, Thomas Gleixner wrote:
> On Thu, May 25 2023 at 01:56, Michael Ellerman wrote:
>  /*
>   * The decision whether SMT is supported can only be done after the full
>   * CPU identification. Called from architecture code.
>   */
> -void __init cpu_smt_check_topology(void)
> +void __init cpu_smt_set_num_threads(unsigned int max_threads, unsigned int num_threads)
>  {
> -	if (!topology_smt_supported())
> +	if (max_threads == 1)

Which makes topology_smt_supported() redundant, i.e. it can be removed.

Thanks,

        tglx
