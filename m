Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A829F19AD1E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 15:49:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48snc51ZklzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:49:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48smN52lfczDr24
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 23:53:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48smN34DHnz9sTd; Wed,  1 Apr 2020 23:53:38 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c17eb4dca5a353a9dbbb8ad6934fe57af7165e91
In-Reply-To: <20200330080400.124803-1-courbet@google.com>
To: Clement Courbet <courbet@google.com>, 
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc: Make setjmp/longjmp signature standard
Message-Id: <48smN34DHnz9sTd@ozlabs.org>
Date: Wed,  1 Apr 2020 23:53:38 +1100 (AEDT)
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, Clement Courbet <courbet@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-03-30 at 08:03:56 UTC, Clement Courbet wrote:
> Declaring setjmp()/longjmp() as taking longs makes the signature
> non-standard, and makes clang complain. In the past, this has been
> worked around by adding -ffreestanding to the compile flags.
> 
> The implementation looks like it only ever propagates the value
> (in longjmp) or sets it to 1 (in setjmp), and we only call longjmp
> with integer parameters.
> 
> This allows removing -ffreestanding from the compilation flags.
> 
> Context:
> https://lore.kernel.org/patchwork/patch/1214060
> https://lore.kernel.org/patchwork/patch/1216174
> 
> Signed-off-by: Clement Courbet <courbet@google.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Cc: stable@vger.kernel.org # v4.14+
> Fixes: c9029ef9c957 ("powerpc: Avoid clang warnings around setjmp and longjmp")

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c17eb4dca5a353a9dbbb8ad6934fe57af7165e91

cheers
