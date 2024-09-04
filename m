Return-Path: <linuxppc-dev+bounces-989-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFA796BFDC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 16:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzPh74wlxz2yRM;
	Thu,  5 Sep 2024 00:17:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725459431;
	cv=none; b=LPS3G82y9W9Zl5Llz0l/GpTfxpo81QUn25+IH0cg2FEmISoVyB2uvTkLIqBx/F+8jQtclLyHi7Y2nh5K3+beh4zAnJyk8j3nDRkY6tW/cufCAnw8/N+iPXThmKo8yEwY85TZc3/iZF1T5sWuD9NKfTmECa4VlPVt2mizOuwx06V4Q8G/AXPv2R8ehIKXRUEWHVOM8EQj5I1geZ9frXomiG3Vcb9sApLc6fAtxve8W9Ly/UmX7vBTbvi9p3h3ZhUh8zLQhOeInGPZp4gRdS4PutsXsjqvvnxiPRQUef0Hb69YKIFsYoHNS8nwnFuJCnhw6PKBsGv/tvycvVufBvDygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725459431; c=relaxed/relaxed;
	bh=0gX4iKFO2d6giGBiJdj/U8E7BIuEXsYx2gfWhptxDWU=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=YumUNneomW8wwSXdFE6mg56GX3gyos2H5yhyAJmalvhpiIwIIQ0TZIjzKfUuES6knrcvd3k2drs0ubFzllBEHLw9aa+AO/eQlwz8vM7FFC/EwIxn72oLwtd5+jchdm/KM0/uDNjk2D1/gKZJzK3o95Uy3wRKg8o5L6POLOgSQ8jRnkHrkDvLt0bhIFMyCEuu/RPFxaLTykdS0AREFsQaZ9YOzpIM3cd3bBiFxC1oLqhl1lc6B2xhnOtmWdMgubGutkxVc8OuKpIzzUKhkWiyk781jruyrml35ftVtQWemzzHTpqeAUifVOWd5c7MQS4MAsnKDPj/h/fDkg77hQJTDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=ltEJ6AK0; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=zifb=qc=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=ltEJ6AK0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=zifb=qc=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzPh56KNTz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 00:17:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7FFBF5C57F0;
	Wed,  4 Sep 2024 14:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D7BC4CEC2;
	Wed,  4 Sep 2024 14:17:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ltEJ6AK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725459422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0gX4iKFO2d6giGBiJdj/U8E7BIuEXsYx2gfWhptxDWU=;
	b=ltEJ6AK0bHrwJ9RXlZ516PTeVUtSiUL7yGEtQLnYEjyD1A1U1r0m+mgYrevZkKv2SDRcnb
	YkcfwwvWKQHO67NklnaO03mC/TAAJUP+XqDWQ00JUD/4WMIVCqL7ugAMEJq23lFeUZtWsB
	GaTlLQGomeGWPBvK1KOIbdDK5n9Hp3Y=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 19554c25 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 4 Sep 2024 14:17:02 +0000 (UTC)
Date: Wed, 4 Sep 2024 16:16:54 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH v5 0/5] Wire up getrandom() vDSO implementation on powerpc
Message-ID: <Zthr1nB_RJ56YD3O@zx2c4.com>
References: <cover.1725304404.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1725304404.git.christophe.leroy@csgroup.eu>

Hi Christophe, Michael,

On Mon, Sep 02, 2024 at 09:17:17PM +0200, Christophe Leroy wrote:
> This series wires up getrandom() vDSO implementation on powerpc.
> 
> Tested on PPC32 on real hardware.
> Tested on PPC64 (both BE and LE) on QEMU:
> 
> Performance on powerpc 885:
> 	~# ./vdso_test_getrandom bench-single
> 	   vdso: 25000000 times in 62.938002291 seconds
> 	   libc: 25000000 times in 535.581916866 seconds
> 	syscall: 25000000 times in 531.525042806 seconds
> 
> Performance on powerpc 8321:
> 	~# ./vdso_test_getrandom bench-single
> 	   vdso: 25000000 times in 16.899318858 seconds
> 	   libc: 25000000 times in 131.050596522 seconds
> 	syscall: 25000000 times in 129.794790389 seconds
> 
> Performance on QEMU pseries:
> 	~ # ./vdso_test_getrandom bench-single
> 	   vdso: 25000000 times in 4.977777162 seconds
> 	   libc: 25000000 times in 75.516749981 seconds
> 	syscall: 25000000 times in 86.842242014 seconds

Looking good. I have no remaining nits on this patchset; it looks good
to me.

A review from Michael would be nice though (in addition to the necessary
"Ack" I need to commit this to my tree), because there are a lot of PPC
particulars that I don't know enough about to review properly. For
example, you use -ffixed-r30 on PPC64. I'm sure there's a good reason
for this, but I don't know enough to assess it. And cvdso_call I have no
idea what's going on. Etc.

But anyway, awesome work, and I look forward to the final stretches.

Jason

