Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2166435AE65
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 16:33:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHctg09RNz3drn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 00:33:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHcp94Hhyz3bxN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:29:37 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FHcp90Sx1z9sj1; Sun, 11 Apr 2021 00:29:36 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210315034159.315675-1-mpe@ellerman.id.au>
References: <20210315034159.315675-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kexec: Don't use .machine ppc64 in trampoline_64.S
Message-Id: <161806493667.1467223.8535178468858438234.b4-ty@ellerman.id.au>
Date: Sun, 11 Apr 2021 00:28:56 +1000
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
Cc: dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 Mar 2021 14:41:59 +1100, Michael Ellerman wrote:
> The ".machine" directive allows changing the machine for which code is
> being generated. It's equivalent to passing an -mcpu option on the
> command line.
> 
> Although it can be useful, it's generally a bad idea because it adds
> another way to influence code generation separate from the flags
> passed via the build system. ie. if we need to build different pieces
> of code with different flags we should do that via our Makefiles, not
> using ".machine".
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/kexec: Don't use .machine ppc64 in trampoline_64.S
      https://git.kernel.org/powerpc/c/acd4dfeb49c8ec1071b1e67683c5779e97fdc5b9

cheers
