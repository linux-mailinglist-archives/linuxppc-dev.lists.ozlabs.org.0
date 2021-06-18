Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F983AC247
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:26:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5m8J2NY3z3f0l
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:26:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4D33jRz3c22
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:22:49 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m460fdXz9sf8; Fri, 18 Jun 2021 14:22:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <98394503e92d6fd6d8f657e0b263b32f21cf2790.1623438478.git.christophe.leroy@csgroup.eu>
References: <98394503e92d6fd6d8f657e0b263b32f21cf2790.1623438478.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32: Display modules range in virtual memory layout
Message-Id: <162398829836.1363949.3616148004557919453.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:38 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 11 Jun 2021 19:08:54 +0000 (UTC), Christophe Leroy wrote:
> book3s/32 and 8xx don't use vmalloc for modules.
> 
> Print the modules area at startup as part of the virtual memory layout:
> 
> [    0.000000] Kernel virtual memory layout:
> [    0.000000]   * 0xffafc000..0xffffc000  : fixmap
> [    0.000000]   * 0xc9000000..0xffafc000  : vmalloc & ioremap
> [    0.000000]   * 0xb0000000..0xc0000000  : modules
> [    0.000000] Memory: 118480K/131072K available (7152K kernel code, 2320K rwdata, 1328K rodata, 368K init, 854K bss, 12592K reserved, 0K cma-reserved)

Applied to powerpc/next.

[1/1] powerpc/32: Display modules range in virtual memory layout
      https://git.kernel.org/powerpc/c/baf24d23be7d2357a2aa9c5ffb6a2d680ac2a68c

cheers
