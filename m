Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06788591D02
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 00:39:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M4wT46ZSRz3cjY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 08:39:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M4wSJ1VmPz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Aug 2022 08:38:40 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M4wSH470Tz4xG2;
	Sun, 14 Aug 2022 08:38:39 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <20220809095907.418764-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20220809095907.418764-1-naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc64/ftrace: Fix ftrace for clang builds
Message-Id: <166043029181.1050412.4657635247684421735.b4-ty@ellerman.id.au>
Date: Sun, 14 Aug 2022 08:38:11 +1000
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, Ondrej Mosnacek <omosnacek@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 9 Aug 2022 15:29:07 +0530, Naveen N. Rao wrote:
> Clang doesn't support -mprofile-kernel ABI, so guard the checks against
> CONFIG_DYNAMIC_FTRACE_WITH_REGS, rather than the elf ABI version.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc64/ftrace: Fix ftrace for clang builds
      https://git.kernel.org/powerpc/c/cb928ac192128c842f4c1cfc8b6780b95719d65f

cheers
