Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D7647F91B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 22:54:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMZM76v4xz3c6D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 08:54:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMZLp540Wz2xCp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 08:53:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JMZLk4Skhz4xdB;
 Mon, 27 Dec 2021 08:53:50 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211221055904.555763-1-aik@ozlabs.ru>
References: <20211221055904.555763-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel 0/6] powerpc: Build with LLVM_IAS=1
Message-Id: <164055555286.3187272.4918713007568303339.b4-ty@ellerman.id.au>
Date: Mon, 27 Dec 2021 08:52:32 +1100
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Alan Modra <amodra@au1.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Dec 2021 16:58:58 +1100, Alexey Kardashevskiy wrote:
> This allows compiling the upstream Linux with the upstream llvm with one fix on top;
> https://reviews.llvm.org/D115419
> 
> This is based on sha1
> 798527287598 Michael Ellerman "Automatic merge of 'next' into merge (2021-12-14 00:12)".
> 
> Please comment. Thanks.
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc/toc: PowerPC64 future proof kernel toc, revised for lld
      https://git.kernel.org/powerpc/c/a3ad84da076009c94969fa97f604257667e2980f
[2/6] powerpc: check for support for -Wa,-m{power4,any}
      https://git.kernel.org/powerpc/c/f5140cab448e4819ca6f158cb4130352f73c92e4
[3/6] powerpc/64/asm: Inline BRANCH_TO_C000
      https://git.kernel.org/powerpc/c/fd983957971632088908c646116383402f04084b
[4/6] powerpc/64/asm: Do not reassign labels
      https://git.kernel.org/powerpc/c/d72c4a36d7ab560127885473a310ece28988b604
[5/6] powerpc/mm: Switch obsolete dssall to .long
      https://git.kernel.org/powerpc/c/d51f86cfd8e378d4907958db77da3074f6dce3ba
[6/6] powerpc/mm/book3s64/hash: Switch pre 2.06 tlbiel to .long
      https://git.kernel.org/powerpc/c/62479e6e26ef18f00e2e540c0e30156254533a43

cheers
