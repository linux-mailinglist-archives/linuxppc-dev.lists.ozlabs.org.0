Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBA36EF407
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 14:10:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5yNx2NXxz3ffg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 22:10:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5yMP38Hrz3cK6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 22:08:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q5yMM22wyz4xMs;
	Wed, 26 Apr 2023 22:08:47 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230406144535.3786008-1-mpe@ellerman.id.au>
References: <20230406144535.3786008-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/4] powerpc/64: Mark prep_irq_for_idle() __cpuidle
Message-Id: <168251050530.3973805.3959525808657719536.b4-ty@ellerman.id.au>
Date: Wed, 26 Apr 2023 22:01:45 +1000
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 07 Apr 2023 00:45:32 +1000, Michael Ellerman wrote:
> Code in the idle path is not allowed to be instrumented because RCU is
> disabled, see commit 0e985e9d2286 ("cpuidle: Add comments about
> noinstr/__cpuidle usage").
> 
> Mark prep_irq_for_idle() __cpuidle, which is equivalent to noinstr, to
> enforce that.
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/64: Mark prep_irq_for_idle() __cpuidle
      https://git.kernel.org/powerpc/c/7640854d966449e5befeff02c45c799cfc3d4fcf
[2/4] powerpc/64: Don't call trace_hardirqs_on() in prep_irq_for_idle()
      https://git.kernel.org/powerpc/c/6fee130204650515af80c2786176da0fe7e94482
[3/4] cpuidle: pseries: Mark ->enter() functions as __cpuidle
      https://git.kernel.org/powerpc/c/88990745c934b14359e526033c5bc1daaf15267c
[4/4] powerpc/pseries: Always inline functions called from cpuidle
      https://git.kernel.org/powerpc/c/18b5e7170a33a985dc842ab24a690fa6ff0f50e4

cheers
