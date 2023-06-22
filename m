Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB99739C5A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 11:13:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zAdjYj0u;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ihmbkNRt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmvmV1xLhz306B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 19:13:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zAdjYj0u;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ihmbkNRt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qmvlc6c9yz2yxt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 19:12:28 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1687425145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8wyD3yiae4RqAqg4/PcAoMB/t3rxUu0dXpqSaXrgfqA=;
	b=zAdjYj0urbgxQ+q85LblYhZqhR0wZe8A1YtfMgZIllOWR6PU9Yr7GMT5nH7nzb9NSBpzJR
	LERkTBLa2iz4rjaE8yjKRi68VR/FPSWyYREiOt+h/KUZFxG85sv+Ax1oxxuCfPJWkjI8u6
	UllBmquVsyyi/ww0+qFI9iOWHGEkUdxtR2KTBdaBZW39X7MKIFkS/mblJ6Vz35Y/fDT4DC
	5hKp4q3nJjyzfiDlnhyYz/pavfCdrME/BjdmSgC4rT0NG0kolJpfQUWl+KhQA2gDsji4bJ
	AdrDtGj/1uaUIF6EPTajairYGTmSXBnSs+QFeZH5BaJ7Eh8VU0IIDA6MrNNSpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1687425145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8wyD3yiae4RqAqg4/PcAoMB/t3rxUu0dXpqSaXrgfqA=;
	b=ihmbkNRtGNL2/681+Calept6cNhMoNdxJ0agon4MLtpuxishE9sFXkKNB3hqUIiaR73bm3
	NtrBF6+nK5mNCSBA==
To: Laurent Dufour <ldufour@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] cpu/SMT: Allow enabling partial SMT states via sysfs
In-Reply-To: <20230615154635.13660-8-ldufour@linux.ibm.com>
References: <20230615154635.13660-1-ldufour@linux.ibm.com>
 <20230615154635.13660-8-ldufour@linux.ibm.com>
Date: Thu, 22 Jun 2023 11:12:24 +0200
Message-ID: <87legb7tdz.ffs@tglx>
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com, bp@alien8.de, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 15 2023 at 17:46, Laurent Dufour wrote:
>  
> -	if (ctrlval != cpu_smt_control) {
> +	orig_threads = cpu_smt_num_threads;
> +	cpu_smt_num_threads = num_threads;
> +
> +	if (num_threads > orig_threads) {
> +		ret = cpuhp_smt_enable();
> +	} else if (num_threads < orig_threads) {
> +		ret = cpuhp_smt_disable(ctrlval);
> +	} else if (ctrlval != cpu_smt_control) {
>  		switch (ctrlval) {
>  		case CPU_SMT_ENABLED:
>  			ret = cpuhp_smt_enable();

This switch() is still as pointless as in the previous version.

OFF -> ON, ON -> OFF, ON -> FORCE_OFF are covered by the num_threads
comparisons.

So the only case where (ctrlval != cpu_smt_control) is relevant is the
OFF -> FORCE_OFF transition because in that case the number of threads
is not changing.

          force_off = ctrlval != cpu_smt_control && ctrval == CPU_SMT_FORCE_DISABLED;

	  if (num_threads > orig_threads)
		  ret = cpuhp_smt_enable();
	  else if (num_threads < orig_threads || force_off)
		  ret = cpuhp_smt_disable(ctrlval);

Should just work, no?

Thanks,

        tglx


