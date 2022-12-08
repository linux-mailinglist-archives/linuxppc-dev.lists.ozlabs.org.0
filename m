Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9989564704A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:59:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZ4L41h2z3gCv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:59:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYs331n8z3cNh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYs31xnfz4xvh;
	Thu,  8 Dec 2022 23:49:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221127124942.1665522-1-npiggin@gmail.com>
References: <20221127124942.1665522-1-npiggin@gmail.com>
Subject: Re: [PATCH 00/17] powerpc: Remove STACK_FRAME_OVERHEAD
Message-Id: <167050320012.1457988.4811996947997987468.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:40:00 +1100
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

On Sun, 27 Nov 2022 22:49:25 +1000, Nicholas Piggin wrote:
> Since RFC:
> - Fix a compile bug.
> - Fix BookE KVM properly. Hopefully -- I don't have a BookE
>   KVM environment to test. Can QEMU do it? Is it still tested?
> - Drop the last two patches that changed the stack layout, they
>   can be done later.
> - Drop the load/store-multiple change to 32-bit.
> 
> [...]

Applied to powerpc/next.

[01/17] KVM: PPC: Book3E: Fix CONFIG_TRACE_IRQFLAGS support
        https://git.kernel.org/powerpc/c/6c645b01e536757a9e1a9f72c13767f9b3f8559f
[02/17] powerpc/64: Remove asm interrupt tracing call helpers
        https://git.kernel.org/powerpc/c/d6aee468e4ecbfec46a3eafae4d31d6efc0d4da4
[03/17] powerpc/perf: callchain validate kernel stack pointer bounds
        https://git.kernel.org/powerpc/c/32c5209214bd8d4f8c4e9d9b630ef4c671f58e79
[04/17] powerpc: Rearrange copy_thread child stack creation
        https://git.kernel.org/powerpc/c/bc0677363d0ffaec0c56685291e97b080116976c
[05/17] powerpc/pseries: hvcall stack frame overhead
        https://git.kernel.org/powerpc/c/baa49d81a94bb4170e7f2f4d97016772117d0f60
[06/17] powerpc: simplify ppc_save_regs
        https://git.kernel.org/powerpc/c/37195b820d32c23bdefce3f460ed7de48a57e5e4
[07/17] powerpc: add definition for pt_regs offset within an interrupt frame
        https://git.kernel.org/powerpc/c/c03be0a3f3cc656eab5c427b78959b8f1b169a11
[08/17] powerpc: add a definition for the marker offset within the interrupt frame
        https://git.kernel.org/powerpc/c/d2e8ff9f1492f44c5a6d93f759eea27574d753de
[09/17] powerpc: Rename STACK_FRAME_MARKER and derive it from frame offset
        https://git.kernel.org/powerpc/c/e856e336924b0ecd0b7058e65e6b3e7266ee0b95
[10/17] powerpc: add a define for the user interrupt frame size
        https://git.kernel.org/powerpc/c/1223e5a20f7fb3c31c91a328d1a04ed26d5e889b
[11/17] powerpc: add a define for the switch frame size and regs offset
        https://git.kernel.org/powerpc/c/6f291a03819e4051ebc870471d26915ef2e6ba31
[12/17] powerpc: copy_thread fill in interrupt frame marker and back chain
        https://git.kernel.org/powerpc/c/6895dfc0474170c492191c126fcfc420f7771a09
[13/17] powerpc: copy_thread add a back chain to the switch stack frame
        https://git.kernel.org/powerpc/c/edbd0387f3249cc7e102f86d4852a9a9f3bb1305
[14/17] powerpc: split validate_sp into two functions
        https://git.kernel.org/powerpc/c/4cefb0f6c555971b3e6544a9b15470f9d1f12089
[15/17] powerpc: allow minimum sized kernel stack frames
        https://git.kernel.org/powerpc/c/90f1b43196c5e79f6c986a359011a19857984c27
[16/17] powerpc/64: ELFv2 use minimal stack frames in int and switch frame sizes
        https://git.kernel.org/powerpc/c/cd52414d5a6ccea6ce956ef05161fe824522a107
[17/17] powerpc: remove STACK_FRAME_OVERHEAD
        https://git.kernel.org/powerpc/c/dfecd06bc5524517ed7737c30eaaf747338b280a

cheers
