Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF85808852
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:49:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDcN5H66z3wMS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:49:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDVr70F1z3dJ0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:44:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVr5nhbz4xQS;
	Thu,  7 Dec 2023 23:44:36 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20231025012452.1985680-1-mpe@ellerman.id.au>
References: <20231025012452.1985680-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Make cpu_spec __ro_after_init
Message-Id: <170195271159.2310221.14820812805712713324.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:38:31 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Oct 2023 12:24:52 +1100, Michael Ellerman wrote:
> The cpu_spec is a struct holding various information about the CPU the
> kernel is executing on. It's populated early in boot and must not change
> after that.
> 
> In particular the cpu_features and mmu_features hold the set of
> discovered CPU/MMU features and are used to set static keys for each
> feature, and do binary patching of assembly. So any change to the
> cpu_features/mmu_features later in boot will not be reflected in
> the state of the static keys or patched code.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Make cpu_spec __ro_after_init
      https://git.kernel.org/powerpc/c/98eb30fe4c69a9b602f29e406317c49b5580352a

cheers
