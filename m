Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCDF81B420
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 11:45:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwnBr66Drz3w4R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 21:45:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swn5c6xBFz3cWq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 21:40:52 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Swn5b6ThGz4xNH;
	Thu, 21 Dec 2023 21:40:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20231128132748.1990179-1-mpe@ellerman.id.au>
References: <20231128132748.1990179-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/5] selftests/powerpc: Fix error handling in FPU/VMX preemption tests
Message-Id: <170315510011.2192823.8044597579068621950.b4-ty@ellerman.id.au>
Date: Thu, 21 Dec 2023 21:38:20 +1100
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
Cc: tpearson@raptorengineering.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 Nov 2023 00:27:44 +1100, Michael Ellerman wrote:
> The FPU & VMX preemption tests do not check for errors returned by the
> low-level asm routines, preempt_fpu() / preempt_vsx() respectively.
> That means any register corruption detected by the asm routines does not
> result in a test failure.
> 
> Fix it by returning the return value of the asm routines from the
> pthread child routines.
> 
> [...]

Applied to powerpc/next.

[1/5] selftests/powerpc: Fix error handling in FPU/VMX preemption tests
      https://git.kernel.org/powerpc/c/9dbd5927408c4a0707de73ae9dd9306b184e8fee
[2/5] selftests/powerpc: Check all FPRs in fpu_preempt
      https://git.kernel.org/powerpc/c/e5d00aaac651a69b8016d355123438387bfd37be
[3/5] selftests/powerpc: Generate better bit patterns for FPU tests
      https://git.kernel.org/powerpc/c/2ba107f6795d780bb54b85040a9b2c6a60fccb15
[4/5] selftests/powerpc: Run fpu_preempt test for 60 seconds
      https://git.kernel.org/powerpc/c/60d2c3af9a0c04dc2d34a62e9f5e7033b40dfed8
[5/5] selftests/powerpc: Check all FPRs in fpu_syscall test
      https://git.kernel.org/powerpc/c/1bdf22580b794a498b17617bcd7ae417d6b78444

cheers
