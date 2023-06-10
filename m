Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 149DE72AF8A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 00:36:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qdt8T60yCz3dxT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 08:36:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FG1PzBBK;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eDVMV+Md;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FG1PzBBK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eDVMV+Md;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qdt7d64cQz3dsS
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jun 2023 08:35:25 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686436521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3YWu4vesiEmq8yQ43fCf61y6Kfro74ZpUbzYp6i9ipo=;
	b=FG1PzBBK93G9spaxq/ccgsCLD4R5x/g779/6y9E3roFPMbw+fgpuMWKzZ7sISsZwaAURHV
	gKdpv2uCcoqB07nc9c96ow2+PdVR0x6Qw6lp4ywBOIG6LozTFMwhUXBOq3w3r+tv2Rn+k3
	MJDUhACfnsW3dDOAriCvZHTHPy11MCBsp6zAY0gPqDVIfOQKK4g93FNFiDvgNvCkDwXCfL
	jeYII0srdU+Dsr+pU52pNI5eIsu14LTC9O7P49YCItA/qaTuNHKWRSM+9iJzIQR+m2DMcx
	yE7ud0wAx1oClYeynOcmlpTgbCblTjG9L/HaTVi3DXMF/TkcLjo10fU2O14ZRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686436521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3YWu4vesiEmq8yQ43fCf61y6Kfro74ZpUbzYp6i9ipo=;
	b=eDVMV+MdQjITqh2OpuwXpUo+ERakvDZ7eYn2M8lJ2Ee2m+hcfVspkNhfGclzOp769rKocS
	1Uh8PxvQgPukzJBQ==
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] cpu/SMT: Create topology_smt_thread_allowed()
In-Reply-To: <20230524155630.794584-5-mpe@ellerman.id.au>
References: <20230524155630.794584-1-mpe@ellerman.id.au>
 <20230524155630.794584-5-mpe@ellerman.id.au>
Date: Sun, 11 Jun 2023 00:35:21 +0200
Message-ID: <875y7v7xp2.ffs@tglx>
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

On Thu, May 25 2023 at 01:56, Michael Ellerman wrote:
> A subsequent patch will enable partial SMT states, ie. when not all SMT
> threads are brought online.

Nitpick. I stumbled over this 'subsequent patch' theme a couple of times
now because it's very similar to the 'This patch does' phrase.

Just explain what you want to achieve at the end.

>  #else
>  #define topology_max_packages()			(1)
>  static inline int
> @@ -159,6 +160,7 @@ static inline int topology_max_smt_threads(void) { return 1; }
>  static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
>  static inline bool topology_smt_supported(void) { return false; }
>  static inline bool topology_smt_threads_supported(unsigned int threads) { return false; }
> +static inline bool topology_smt_thread_allowed(unsigned int cpu) { return false; }

Not all these functions need a !SMP stub. Think about the context in
which they are called. There is probably precedence for pointless ones,
but that does not make an argument to add more.

> +/**
> + * topology_smt_thread_allowed - When enabling SMT check whether this particular
> + *				 CPU thread is allowed to be brought online.
> + * @cpu:	CPU to check
> + */
> +bool topology_smt_thread_allowed(unsigned int cpu)
> +{
> +	/*
> +	 * No extra logic s required here to support different thread values
> +	 * because threads will always == 1 or smp_num_siblings because of
> +	 * topology_smt_threads_supported().
> +	 */
> +	return true;
> +}
> +

As x86 only supoorts the on/off model there is no need for this function
if you pick up the CONFIG_SMT_NUM_THREADS_DYNAMIC idea.

You still need something like that for your PPC use case, but that
reduces the overall impact, right?

Thanks,

        tglx
