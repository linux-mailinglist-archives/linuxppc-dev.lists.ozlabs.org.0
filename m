Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC8436419F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:24:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP5bc1TP1z30Fc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 22:24:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=N3IAifGb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=N3IAifGb; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP5bC6ShTz2xYl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 22:24:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FP5b973w3z9vDc;
 Mon, 19 Apr 2021 22:24:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618835046;
 bh=zZp3+Qorw8JfU+RWCL9IvATK734P2yLMhkBuOspAZko=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=N3IAifGbYvjmxWVnc+5jTzFCtLjePsZZsa2jU/3dphqyToVZZHRVt/9cb85BA0tyv
 vCTMMiCZ+yM3sIJeh8zTfQ+xoxngupIRQGbMkWrqHSCVxD4lj1XfSddVpM9OV3FmDZ
 BFnN6tS/34V+ZJ8uYgWEUnJSk1vNtxgRceEnFhGrPFOf6Mphu5w5hT7NK/MJVAzy0T
 XvZL2M2eehoxjGyWcN6t0QshjxY8QluZlQF7Zf9AuRLUrfDDTYCH4DYW0QH5LRvF4g
 noTOhcg4SsKYZrJWB3nRmWe0zwLVXjfClTMm1x5EuHgf4iogJumNZqBNpSocWCu8r1
 +81UwWbXXj1Tw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Xiongwei Song <sxwjean@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the powerpc tree
In-Reply-To: <CAEVVKH905HJoJ_WVVZadXiy3LG5y+XDpMBVVtUNOwF2MtYTv8Q@mail.gmail.com>
References: <20210419191425.281dc58a@canb.auug.org.au>
 <CAEVVKH905HJoJ_WVVZadXiy3LG5y+XDpMBVVtUNOwF2MtYTv8Q@mail.gmail.com>
Date: Mon, 19 Apr 2021 22:24:05 +1000
Message-ID: <874kg2ea3e.fsf@mpe.ellerman.id.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Xiongwei Song <sxwjean@gmail.com> writes:
> Thank you so much Stephen. Sorry for my negligence.

My fault. I forgot to run allyesconfig.

> Should I fix this myself on powerpc tree?

I'll fix it up.

cheers
