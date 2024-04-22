Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A88AC6BC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 10:20:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNJ8h3kwSz3vmJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 18:20:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNJ6v5G1Zz3cVq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 18:18:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNJ6v0Zlxz4x1Y;
	Mon, 22 Apr 2024 18:18:47 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Arnd Bergmann <arnd@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@ozlabs.org>, Geoff Levand <geoff@infradead.org>
In-Reply-To: <d64f06f4-81ae-4ec5-ab3b-d7f7f091e0ac@infradead.org>
References: <20240320180333.151043-1-arnd@kernel.org> <415f4af0-f44a-49fb-b1fa-76f64ed09ec6@infradead.org> <d64f06f4-81ae-4ec5-ab3b-d7f7f091e0ac@infradead.org>
Subject: Re: [PATCH v2] powerpc: Fix PS3 allmodconfig warning
Message-Id: <171377378379.1025456.13649802272990358966.b4-ty@ellerman.id.au>
Date: Mon, 22 Apr 2024 18:16:23 +1000
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
Cc: Kevin Hao <haokexin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Justin Stitt <justinstitt@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 01 Apr 2024 16:08:31 +0900, Geoff Levand wrote:
> The struct ps3_notification_device in the ps3_probe_thread routine
> is too large to be on the stack, causing a warning for an
> allmodconfig build with clang.
> 
> Change the struct ps3_notification_device from a variable on the stack
> to a dynamically allocated variable.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Fix PS3 allmodconfig warning
      https://git.kernel.org/powerpc/c/bfe51886ca544956eb4ff924d1937ac01d0ca9c8

cheers
