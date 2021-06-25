Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC463B3CB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 08:28:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB6WR29FGz3c96
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 16:28:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB6Rb3cBFz3btF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 16:24:43 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GB6RY5KBQz9sxS; Fri, 25 Jun 2021 16:24:41 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210617155116.2167984-1-npiggin@gmail.com>
References: <20210617155116.2167984-1-npiggin@gmail.com>
Subject: Re: [PATCH v4 00/17] powerpc/64: fast interrupt exits
Message-Id: <162460208696.3247425.13006654599795164065.b4-ty@ellerman.id.au>
Date: Fri, 25 Jun 2021 16:21:26 +1000
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 18 Jun 2021 01:50:59 +1000, Nicholas Piggin wrote:
> This series attempts to improve the speed of interrupts and system calls
> in three major ways.
> 
> Firstly, the SRR/HSRR registers do not need to be reloaded if they were
> clobbered for the duration of the interrupt and the return NIP and MSR
> did not changed. 64e does not implement this part, but it could quite
> easily.
> 
> [...]

Patches 1-4, and 6-17 applied to powerpc/next.

[01/17] powerpc/interrupt: Fix CONFIG ifdef typo
        https://git.kernel.org/powerpc/c/9a3ed7adcabce24a85fbe05f54e762b18756ec22
[02/17] powerpc: remove interrupt exit helpers unused argument
        https://git.kernel.org/powerpc/c/bf9155f1970c4dbf9ec6b87d3688433bd494a4e1
[03/17] powerpc/64s: introduce different functions to return from SRR vs HSRR interrupts
        https://git.kernel.org/powerpc/c/1df7d5e4baeac74d14c1bee18b2dff9302b3efbc
[04/17] powerpc/64s: avoid reloading (H)SRR registers if they are still valid
        https://git.kernel.org/powerpc/c/59dc5bfca0cb6a29db1a50847684eb5c19f8f400
[06/17] powerpc/64: move interrupt return asm to interrupt_64.S
        https://git.kernel.org/powerpc/c/e754f4d13e3919aafa485657599907aa63b9a40c
[07/17] powerpc/64s: system call avoid setting MSR[RI] until we set MSR[EE]
        https://git.kernel.org/powerpc/c/dd152f70bdc1b91445b10c65ac874b90c93fb3b5
[08/17] powerpc/64s: save one more register in the masked interrupt handler
        https://git.kernel.org/powerpc/c/63e40806eea984f770c992120bbfd71b589ea580
[09/17] powerpc/64: allow alternate return locations for soft-masked interrupts
        https://git.kernel.org/powerpc/c/f23699c93becd746295aaa506537882a46a62219
[10/17] powerpc/64: interrupt soft-enable race fix
        https://git.kernel.org/powerpc/c/862fa563524b9f92d7e89fe332732bd3421772db
[11/17] powerpc/64: treat low kernel text as irqs soft-masked
        https://git.kernel.org/powerpc/c/9d1988ca87dd90ecf80a0601c7fd13071fbb1a83
[12/17] powerpc/64: use interrupt restart table to speed up return from interrupt
        https://git.kernel.org/powerpc/c/13799748b957bc5659f97c036224b0f4b42172e2
[13/17] powerpc/interrupt: Rename and lightly change syscall_exit_prepare_main()
        https://git.kernel.org/powerpc/c/f84aa284947f325c5697d35b92abd2047224f24b
[14/17] powerpc/interrupt: Refactor interrupt_exit_user_prepare()
        https://git.kernel.org/powerpc/c/a214ee8802adb864d175ea6ca4176223bcc11d2b
[15/17] powerpc/interrupt: Interchange prep_irq_for_{kernel_enabled/user}_exit()
        https://git.kernel.org/powerpc/c/99f98f849cf13e5fac532979ccdb77dff07665db
[16/17] powerpc/interrupt: Refactor prep_irq_for_{user/kernel_enabled}_exit()
        https://git.kernel.org/powerpc/c/61eece2d1707796fd45225ea3d20e9289251311c
[17/17] powerpc/interrupt: Remove prep_irq_for_user_exit()
        https://git.kernel.org/powerpc/c/ae58b1c645895c28ca155843db6788d57ea99e11

cheers
