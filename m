Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 019DD34F5FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:14:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97dG0NhMz3cVN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:14:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XT2zf5z3bc7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:17 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XS5lrTz9shn; Wed, 31 Mar 2021 12:10:16 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, "Christopher M. Riedl" <cmr@codefail.de>
In-Reply-To: <20210227011259.11992-1-cmr@codefail.de>
References: <20210227011259.11992-1-cmr@codefail.de>
Subject: Re: [PATCH v7 00/10] Improve signal performance on PPC64 with KUAP
Message-Id: <161715296986.226945.2679761173827862086.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:29 +1100
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

On Fri, 26 Feb 2021 19:12:49 -0600, Christopher M. Riedl wrote:
> As reported by Anton, there is a large penalty to signal handling
> performance on radix systems using KUAP. The signal handling code
> performs many user access operations, each of which needs to switch the
> KUAP permissions bit to open and then close user access. This involves a
> costly 'mtspr' operation [0].
> 
> There is existing work done on x86 and by Christophe Leroy for PPC32 to
> instead open up user access in "blocks" using user_*_access_{begin,end}.
> We can do the same in PPC64 to bring performance back up on KUAP-enabled
> radix and now also hash MMU systems [1].
> 
> [...]

Applied to powerpc/next.

[01/10] powerpc/uaccess: Add unsafe_copy_from_user()
        https://git.kernel.org/powerpc/c/9466c1799fa2acb68e505a264dcdf53779101ac6
[02/10] powerpc/signal: Add unsafe_copy_{vsx, fpr}_from_user()
        https://git.kernel.org/powerpc/c/609355dfc88e2921bfcbd879300d482a9a33378e
[03/10] powerpc/signal64: Remove non-inline calls from setup_sigcontext()
        https://git.kernel.org/powerpc/c/c6c9645e37483444ec5182373455b2f22e4b1535
[04/10] powerpc: Reference parameter in MSR_TM_ACTIVE() macro
        https://git.kernel.org/powerpc/c/1a130b67c682be9842f188f593c2080786de4204
[05/10] powerpc/signal64: Remove TM ifdefery in middle of if/else block
        https://git.kernel.org/powerpc/c/2d19630e20fe5fbd5813f73fd5b1c81ddec61369
[06/10] powerpc/signal64: Replace setup_sigcontext() w/ unsafe_setup_sigcontext()
        https://git.kernel.org/powerpc/c/7bb081c8f043ab166f8c6f26fca744821217dad7
[07/10] powerpc/signal64: Replace restore_sigcontext() w/ unsafe_restore_sigcontext()
        https://git.kernel.org/powerpc/c/193323e1009437c0885240e75ca71f7963e4a006
[08/10] powerpc/signal64: Rewrite handle_rt_signal64() to minimise uaccess switches
        https://git.kernel.org/powerpc/c/96d7a4e06fab9fbc4f67c563af65b073902f3e61
[09/10] powerpc/signal64: Rewrite rt_sigreturn() to minimise uaccess switches
        https://git.kernel.org/powerpc/c/0f92433b8f9f76608528101e7a81cd3bfd00e236
[10/10] powerpc/signal: Use __get_user() to copy sigset_t
        https://git.kernel.org/powerpc/c/d3ccc9781560af051554017c702631560bdc0811

cheers
