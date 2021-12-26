Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE3847F926
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 22:56:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMZQ73vpwz3dsp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 08:56:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMZLw6LZxz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 08:54:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JMZLw5P6Qz4xn1;
 Mon, 27 Dec 2021 08:54:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211209115944.4062384-1-mpe@ellerman.id.au>
References: <20211209115944.4062384-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Add a test of sigreturning to the
 kernel
Message-Id: <164055553269.3187272.9055381081762369428.b4-ty@ellerman.id.au>
Date: Mon, 27 Dec 2021 08:52:12 +1100
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 9 Dec 2021 22:59:44 +1100, Michael Ellerman wrote:
> We have a general signal fuzzer, sigfuz, which can modify the MSR & NIP
> before sigreturn. But the chance of it hitting a kernel address and also
> clearing MSR_PR is fairly slim.
> 
> So add a specific test of sigreturn to a kernel address, both with and
> without attempting to clear MSR_PR (which the kernel must block).
> 
> [...]

Applied to powerpc/next.

[1/1] selftests/powerpc: Add a test of sigreturning to the kernel
      https://git.kernel.org/powerpc/c/a8968521cfdc3e339fe69473d6632e0aa8d7202a

cheers
