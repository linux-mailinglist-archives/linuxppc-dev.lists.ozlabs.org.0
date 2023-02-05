Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F035868ADB1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 01:48:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8W3C6nrlz3fC6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 11:48:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8W26636yz3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 11:47:26 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P8W264VTwz4xxJ;
	Sun,  5 Feb 2023 11:47:26 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <cover.1674617130.git.jpoimboe@kernel.org>
References: <cover.1674617130.git.jpoimboe@kernel.org>
Subject: Re: [PATCH 0/2] powerpc: Fix livepatch module re-patching issue
Message-Id: <167555801712.1621279.10804935395824436485.b4-ty@ellerman.id.au>
Date: Sun, 05 Feb 2023 11:46:57 +1100
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Song Liu <song@kernel.org>, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 24 Jan 2023 19:38:03 -0800, Josh Poimboeuf wrote:
> Fix a livepatch bug seen when reloading a patched module.
> 
> This is the powerpc counterpart to Song Liu's fix for a similar issue on
> x86:
> 
>   https://lkml.kernel.org/lkml/20230121004945.697003-2-song@kernel.org
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/module_64: Improve restore_r2() return semantics
      https://git.kernel.org/powerpc/c/bc2c6f5695ffa05c838b8b6fc5cd581a672151a1
[2/2] powerpc/module_64: Fix "expected nop" error on module re-patching
      https://git.kernel.org/powerpc/c/37251c7114e1b743b077ca74b93557c1ad92a97e

cheers
