Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB26F4D6E24
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 11:31:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFzbw52bRz3bfX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 21:31:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFzbb2SVCz2yhC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 21:30:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KFzbT4jY9z4xLX;
 Sat, 12 Mar 2022 21:30:45 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220309061822.168173-1-aik@ozlabs.ru>
References: <20220309061822.168173-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel v4] powerpc/64: Add UADDR64 relocation support
Message-Id: <164708099074.827774.7477119612590053363.b4-ty@ellerman.id.au>
Date: Sat, 12 Mar 2022 21:29:50 +1100
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

On Wed, 9 Mar 2022 17:18:22 +1100, Alexey Kardashevskiy wrote:
> When ld detects unaligned relocations, it emits R_PPC64_UADDR64
> relocations instead of R_PPC64_RELATIVE. Currently R_PPC64_UADDR64 are
> detected by arch/powerpc/tools/relocs_check.sh and expected not to work.
> Below is a simple chunk to trigger this behaviour (this disables
> optimization for the demonstration purposes only, this also happens with
> -O1/-O2 when CONFIG_PRINTK_INDEX=y, for example):
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64: Add UADDR64 relocation support
      https://git.kernel.org/powerpc/c/d799769188529abc6cbf035a10087a51f7832b6b

cheers
