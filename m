Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C2A7D94D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:10:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ReDZGBiq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGz222dTSz3dB5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:10:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ReDZGBiq;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzN0PVXz3c13
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401295;
	bh=KDsvzW99/6MUtGF6A21Q7TspVKEYplpYhiBKkLhuJJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ReDZGBiqj633/pzOOlM4lkGwCG9ptpwWu94S2VSgVoSY2hyRmmNkg7rORzvefRW7p
	 lpr3nZeOEXP9QcUPhYqHPxCpwI6ArMXdGMjXEL9zzxZdiHs8Xi5lL2ZoRaVo6VRq4j
	 SjrYJNh/S81DbsZVPUNpGlv0p5fGWp0rszRJMz/7erRmi4qWGsuYI1FLuFl5xyE6vX
	 e+3FITbfdPMnD57hakXPvDDoliTygMJkcO/chbkxzFN3u6K8iRzkjPkP6BLyWvNKiZ
	 lzVXmztc9FyORTqhzGQjHfy8nUHVcTQHMDF44rYvhZqlsqJn0QFY3tqI//1+fGDP+V
	 hBhK33dpxUr0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzM6KZyz4xWS;
	Fri, 27 Oct 2023 21:08:15 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20230309134831.Nz12nqsU@linutronix.de>
References: <20230309134831.Nz12nqsU@linutronix.de>
Subject: Re: [PATCH] powerpc/imc-pmu: Use the correct spinlock initializer.
Message-Id: <169840079680.2701453.3088502811732499350.b4-ty@ellerman.id.au>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Kajol Jain <kjain@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 09 Mar 2023 14:48:31 +0100, Sebastian Andrzej Siewior wrote:
> The macro __SPIN_LOCK_INITIALIZER() is implementation specific. Users
> that desire to initialize a spinlock in a struct must use
> __SPIN_LOCK_UNLOCKED().
> 
> Use __SPIN_LOCK_UNLOCKED() for the spinlock_t in imc_global_refc.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/imc-pmu: Use the correct spinlock initializer.
      https://git.kernel.org/powerpc/c/007240d59c11f87ac4f6cfc6a1d116630b6b634c

cheers
