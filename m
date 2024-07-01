Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C93A91EB98
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 01:53:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hQa1zMbO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCjYR1Ngxz30TZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 09:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hQa1zMbO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCjXj4RSNz30TZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 09:53:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1BD460AFD;
	Mon,  1 Jul 2024 23:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BFCC116B1;
	Mon,  1 Jul 2024 23:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719877986;
	bh=H/mu3aKcgoW+nHI2DDrCcOD0hRmnkFHjlkxrzAmB17M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hQa1zMbOZ6SsGDTS/IzIPd6//5ydalSbzNTPEbwhu3L6o59xojZYdgmiivf2TH2mB
	 vZYk+jPvOisOoD6dblNW4mPSZXLG8JXUDzdang/FgBRsnioyTjWb+Mbf46oz/44aln
	 7QebWk3d4NZ8lYkHhAXhqbEh92iA6iG+ogjNMSm7K7YSNa49hEqFAu8QsX4QowIRCR
	 o8dZ9u8nNFOsu4/zfCJf1ae5AmuBr/jwCm4KxmAxoyNZstI6Sm4WAaEDBtwFM19y6g
	 eLajQwvE23W9Q2sIuSpACbF5YaMVzi84bYFBIPX9ruuGJQ2lncvZlFpxIENCs5wwlz
	 spBRuYf49TXBA==
Date: Tue, 2 Jul 2024 08:53:02 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Abhishek Dubey <adubey@linux.ibm.com>
Subject: Re: [PATCH v3] PowerPC: Replace kretprobe with rethook
Message-Id: <20240702085302.90ab3214b8b6e39614bb8d11@kernel.org>
In-Reply-To: <20240627132101.405665-1-adubey@linux.ibm.com>
References: <20240627132101.405665-1-adubey@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, mhiramat@kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 27 Jun 2024 09:21:01 -0400
Abhishek Dubey <adubey@linux.ibm.com> wrote:

> +/* rethook initializer */
> +int __init arch_init_kprobes(void)
> +{
> +	return register_kprobe(&trampoline_p);
> +}

No, please don't use arch_init_kprobes() for initializing rethook, since
rethook is used from fprobe too (at this moment).

If you want to make it relays on kprobes, you have to make a dependency
in powerpc's kconfig, e.g.

select HAVE_RETHOOK if KPROBES

But I don't recommend it.

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
