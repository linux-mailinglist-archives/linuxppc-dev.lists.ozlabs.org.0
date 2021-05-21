Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A438C6BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 14:45:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmmY81F6Fz3c3S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 22:45:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmmXQ1Blqz305p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 22:44:53 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FmmXJ47Bdz9sW1; Fri, 21 May 2021 22:44:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210520032919.358935-1-aik@ozlabs.ru>
References: <20210520032919.358935-1-aik@ozlabs.ru>
Subject: Re: [RFC PATCH kernel] powerpc: Fix early setup to make early_ioremap
 work
Message-Id: <162160105301.3327984.16129135929516996275.b4-ty@ellerman.id.au>
Date: Fri, 21 May 2021 22:44:13 +1000
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

On Thu, 20 May 2021 13:29:19 +1000, Alexey Kardashevskiy wrote:
> The immediate problem is that after
> 0bd3f9e953bd ("powerpc/legacy_serial: Use early_ioremap()")
> the kernel silently reboots. The reason is that early_ioremap() returns
> broken addresses as it uses slot_virt[] array which initialized with
> offsets from FIXADDR_TOP == IOREMAP_END+FIXADDR_SIZE ==
> KERN_IO_END- FIXADDR_SIZ + FIXADDR_SIZE == __kernel_io_end which is 0
> when early_ioremap_setup() is called. __kernel_io_end is initialized
> little bit later in early_init_mmu().
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Fix early setup to make early_ioremap work
      https://git.kernel.org/powerpc/c/e2f5efd0f0e229bd110eab513e7c0331d61a4649

cheers
