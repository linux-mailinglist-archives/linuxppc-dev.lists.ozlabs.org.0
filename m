Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBE73AC19C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 05:51:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5lNP1nPfz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 13:51:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lMF1VsHz3bsr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 13:50:49 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5lMC59x7z9sWl; Fri, 18 Jun 2021 13:50:47 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210608134605.2783677-1-mpe@ellerman.id.au>
References: <20210608134605.2783677-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/signal64: Copy siginfo before changing regs->nip
Message-Id: <162398820940.1362017.18411954522726911271.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:50:09 +1000
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
Cc: dja@axtens.net, cmr@codefail.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 8 Jun 2021 23:46:05 +1000, Michael Ellerman wrote:
> In commit 96d7a4e06fab ("powerpc/signal64: Rewrite handle_rt_signal64()
> to minimise uaccess switches") the 64-bit signal code was rearranged to
> use user_write_access_begin/end().
> 
> As part of that change the call to copy_siginfo_to_user() was moved
> later in the function, so that it could be done after the
> user_write_access_end().
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/signal64: Copy siginfo before changing regs->nip
      https://git.kernel.org/powerpc/c/e41d6c3f4f9b4804e53ca87aba8ee11ada606c77

cheers
