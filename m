Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7D15F44F8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 16:00:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfVF4xR1z3hbq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 01:00:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1s36Dtz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:13 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1s1xTZz4xH6;
	Wed,  5 Oct 2022 00:39:13 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220920122259.363092-1-npiggin@gmail.com>
References: <20220920122259.363092-1-npiggin@gmail.com>
Subject: Re: [PATCH v4 1/2] powerpc: add ISA v3.0 / v3.1 wait opcode macro
Message-Id: <166488989627.779920.12943953506684641476.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:24:56 +1100
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

On Tue, 20 Sep 2022 22:22:58 +1000, Nicholas Piggin wrote:
> The wait instruction encoding changed between ISA v2.07 and ISA v3.0.
> In v3.1 the instruction gained a new field.
> 
> Update the PPC_WAIT macro to the current encoding. Rename the older
> incompatible one with a _v203 suffix as it was introduced in v2.03
> (the WC field was introduced in v2.07 but the kernel only uses WC=0).
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: add ISA v3.0 / v3.1 wait opcode macro
      https://git.kernel.org/powerpc/c/dabeb572adf24bbd7cb21d1cc4d118bdf2c2ab74
[2/2] powerpc/64s: Make POWER10 and later use pause_short in cpu_relax loops
      https://git.kernel.org/powerpc/c/9c7bfc2dc21e737e8e4a753630bce675e1e7c0ad

cheers
