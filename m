Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 822E1536D00
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 14:54:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9M823Lpmz3cCm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 22:54:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9M6s5P9Nz302S
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 22:53:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4L9M6s4b3Bz4xZ7;
	Sat, 28 May 2022 22:53:41 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220527112035.2842155-1-mpe@ellerman.id.au>
References: <20220527112035.2842155-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Include cache.h directly in paca.h
Message-Id: <165374238796.3058522.3083080302932503845.b4-ty@ellerman.id.au>
Date: Sat, 28 May 2022 22:53:07 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 27 May 2022 21:20:35 +1000, Michael Ellerman wrote:
> paca.h uses ____cacheline_aligned without directly including cache.h,
> where it's defined.
> 
> For Book3S builds that's OK because paca.h includes lppaca.h, and it
> does include cache.h.
> 
> But Book3E builds have been getting cache.h indirectly via printk.h,
> which is dicey, and in fact that include was recently removed, leading
> to build errors such as:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64: Include cache.h directly in paca.h
      https://git.kernel.org/powerpc/c/dcf280e6f80be280ca7dd1b058f038654e4a18dd

cheers
