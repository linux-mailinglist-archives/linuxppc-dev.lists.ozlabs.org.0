Return-Path: <linuxppc-dev+bounces-14437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EBBC7F02B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 06:59:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFFWn4MYxz2yvv;
	Mon, 24 Nov 2025 16:59:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763963957;
	cv=none; b=mV5A7g0IgsJZh4nT4vCIT5+IQz6oXAUntIuRj7HahFPn2WhM097hDU4GhYzIOsYWe5TyLz3TyNsg/+a3tIxj1Z0VoArH6JE9n1l8K/iCJLurXpH/e0yXScwHTATeCB9gpMdtWL0/zi803uwEfEfbAZwIe8OvybYLYg1SzIXo/ewe1qDs0f1cxrxmYszBk3y5SgScd+/zxDt/CCmfNfZohXo9ba+0KgpfLocO9H66c7FhDUIeS3VODe6vY8n3yj9ZY9WYwqEn3x+YVe7min8IONlQGfk8kRIQECVlCCU5KNbh9M9+4b5//EL/HzfA4jEndmLAJxljiTsf0rCtv/GRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763963957; c=relaxed/relaxed;
	bh=koYW/k5S58eb9JtvdE1EAkSs/8nQfcCUzn4BI/KUX70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5rDB7T38D21h1w+2g5vad6LMCTpNhZ6NlTZx3Y445WpBXNYv/QflCRvhsIC/9SslGYHPOQrqOFuoygC8Bv7P2XdUJnSgN+ZmTwtkZ85CRmB34qEZjItjIZd3CXCYGBpEp2t5eyB8KGgyD9CDG6k0AQhEq/uXwGZNVDts190I9w+uLh0uCtGMojr9bsHzHGYEWI6SJ2g4EPEbvAZGK5whNbP15BcIlL5m/e2oet1/LCNFgP9tZICrAkMXKSgOPM9W3zuK2HRJ2xzoIbQ/dDK8rXA4pp7dX3pjiPu7wNUun/fX+fjW8Fw9jXtdDdt3KcPpk/fa3DlEDag4lNzq/PJCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S3CKN0uz; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S3CKN0uz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFFWn00q5z2yvN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 16:59:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A89060161;
	Mon, 24 Nov 2025 05:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E03C4CEF1;
	Mon, 24 Nov 2025 05:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763963954;
	bh=9Kp2XSAO7hnwd2eaJfptvyOOHPe26HdjZ6qO1Ax435Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3CKN0uzZV6J6u0UpKVPBeM3gWS6VhVTR+wqE86peb2K2KDfkWCh3eVLDj1HT9cFW
	 V3rVAEL+ADV/SE8/f0p/TP9t1E4fI9fHRIHmKj0OrPqrctO7Lyyvud8n17Q6rOh6o5
	 yKZxTlxPAVMp5PIESXwekNuZYNIY7R5KHbSIIj18Xy05syoa8QThvgMhcKs0765XPL
	 3MSBGGMTzIlZYixBASmWU+vXr8stLuouAXY2l/aTQucFCu9NS++cTZjsgbBj36e4P7
	 EsJx2UJuWl81Efu+PJ5tU9b6selvp2NRvBpQPyD2bn46LsyANb3ekTqsIknnPzDHTP
	 918sxkORS9FXg==
Date: Mon, 24 Nov 2025 11:25:32 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-trace-kernel@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, llvm@lists.linux.dev, Maryam Moghadas <maryammo@ca.ibm.com>
Subject: Re: [PATCH 3/3] powerpc64/ftrace: workaround clang recording GEP in
 __patchable_function_entries
Message-ID: <sjheprnafkraauotmi2fwjz6l6fha5te7jdp74t4zfh3jvs2if@vjpey276fsti>
References: <20251108210405.2375472-1-hbathini@linux.ibm.com>
 <20251108210405.2375472-4-hbathini@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251108210405.2375472-4-hbathini@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Nov 09, 2025 at 02:34:05AM +0530, Hari Bathini wrote:
> Support for -fpatchable-function-entry on ppc64le was added in Clang
> with [1]. However, when no prefix NOPs are specified - as is the case
> with CONFIG_PPC_FTRACE_OUT_OF_LINE - the first NOP is emitted at LEP,
> but Clang records the Global Entry Point (GEP) unlike GCC which does
> record the Local Entry Point (LEP). Issue [2] has been raised to align
> Clang's behavior with GCC. As a temporary workaround to ensure ftrace

Any reason to put in a "temporary" workaround rather than waiting for 
this to be fixed?

- Naveen


