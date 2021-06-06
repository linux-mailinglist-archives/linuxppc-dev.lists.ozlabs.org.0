Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9C639CEDF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:18:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FybB62Gg7z3fSn
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:18:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb3R1XGhz3bns
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:19 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb3P2YbVz9t0p; Sun,  6 Jun 2021 22:12:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nick Desaulniers <ndesaulniers@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210518204044.2390064-1-ndesaulniers@google.com>
References: <87cztok1r5.fsf@mpe.ellerman.id.au>
 <20210518204044.2390064-1-ndesaulniers@google.com>
Subject: Re: [PATCH v2] powerpc/powernv/pci: fix header guard
Message-Id: <162298132083.2353459.1100923917875069463.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:40 +1000
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
 Joe Perches <joe@perches.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 18 May 2021 13:40:41 -0700, Nick Desaulniers wrote:
> While looking at -Wundef warnings, the #if CONFIG_EEH stood out as a
> possible candidate to convert to #ifdef CONFIG_EEH.
> 
> It seems that based on Kconfig dependencies it's not possible to build
> this file without CONFIG_EEH enabled, but based on upstream discussion,
> it's not clear yet that CONFIG_EEH should be enabled by default.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powernv/pci: fix header guard
      https://git.kernel.org/powerpc/c/73e6e4e01134c9ee97433ad1f470c71b0748b08f

cheers
