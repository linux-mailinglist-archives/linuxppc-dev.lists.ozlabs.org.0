Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D4678E551
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 06:09:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbnjr5JRtz3fCq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 14:09:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbncM2R1bz2xpw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 14:04:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbncL6vW7z4x3H;
	Thu, 31 Aug 2023 14:04:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nick Desaulniers <ndesaulniers@google.com>
In-Reply-To: <20230828-ppc_rerevert-v2-1-46b71a3656c6@google.com>
References: <20230828-ppc_rerevert-v2-1-46b71a3656c6@google.com>
Subject: Re: [PATCH v2] reapply: powerpc/xmon: Relax frame size for clang
Message-Id: <169345455034.11824.13251320830249144277.b4-ty@ellerman.id.au>
Date: Thu, 31 Aug 2023 14:02:30 +1000
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
Cc: kernel test robot <lkp@intel.com>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Aug 2023 13:39:06 -0700, Nick Desaulniers wrote:
> This is a manual revert of commit
> 7f3c5d099b6f8452dc4dcfe4179ea48e6a13d0eb, but using
> ccflags-$(CONFIG_CC_IS_CLANG) which is shorter.
> 
> Turns out that this is reproducible still under specific compiler
> versions (mea culpa: I did not test every supported version of clang),
> and even a few randconfigs bots found.
> 
> [...]

Applied to powerpc/next.

[1/1] reapply: powerpc/xmon: Relax frame size for clang
      https://git.kernel.org/powerpc/c/90bae4d99beb1f31d8bde7c438a36e8875ae6090

cheers
