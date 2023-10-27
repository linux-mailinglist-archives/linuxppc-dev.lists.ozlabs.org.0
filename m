Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B23F7D950A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:18:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AsGi1Ekn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGzCX5rz0z3w5W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:18:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AsGi1Ekn;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzV0pDzz3cQg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401302;
	bh=YCnHLjZS5iqqL1xwbw3wcU/USe/DpI7JqW6ENB606lw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AsGi1EknhHfUohD7asqMWGTBjq2CEzgBEL9mwyhxg9MSkCl9ceYy26YIJjvN7er0r
	 BQ78glD/e+jlnmvnXaoq/2sRyjHuzGdzvCh5aqDOM+PoMoa4R+XnRhgm34yykjliiQ
	 Gfh+So5UIfBgmZqHR5NriVk50qcrsNR77uySIice7GNqML1NaZ4/s7K8XS/AGavA98
	 CnV6bGDCZbuhG8DraP/RoQ/37Nhk4BEenAf/mPcobu5jrBUYkWjonWfs5Clr6W8+0X
	 4m9Ihl6cZu6XWoVR9RdxF1wLF+Yf1kyScQ6CgGkv4yITNPdgRpKmQyvJdkYqbWQuOa
	 a4cQ31j4Rrldg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzT6WZ5z4xWr;
	Fri, 27 Oct 2023 21:08:21 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230824064210.907266-1-mpe@ellerman.id.au>
References: <20230824064210.907266-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Hide empty pt_regs at base of the stack
Message-Id: <169840079675.2701453.445573032040396883.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: joel@jms.id.au, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Aug 2023 16:42:10 +1000, Michael Ellerman wrote:
> A thread started via eg. user_mode_thread() runs in the kernel to begin
> with and then may later return to userspace. While it's running in the
> kernel it has a pt_regs at the base of its kernel stack, but that
> pt_regs is all zeroes.
> 
> If the thread oopses in that state, it leads to an ugly stack trace with
> a big block of zero GPRs, as reported by Joel:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Hide empty pt_regs at base of the stack
      https://git.kernel.org/powerpc/c/d45c4b48dafb5820e5cc267ff9a6d7784d13a43c

cheers
