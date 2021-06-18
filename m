Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B873AC249
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:26:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5m8d2nKGz3f5G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:26:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4D3Vdzz3c03
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:22:49 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m480SDCz9shn; Fri, 18 Jun 2021 14:22:47 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <8ab21fd93d6e0047aa71e6509e5e312f14b2991b.1620998075.git.christophe.leroy@csgroup.eu>
References: <8ab21fd93d6e0047aa71e6509e5e312f14b2991b.1620998075.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Don't handle ALTIVEC/SPE in ASM in _switch(). Do
 it in C.
Message-Id: <162398828971.1363949.11216180122568844562.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:29 +1000
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

On Fri, 14 May 2021 13:14:53 +0000 (UTC), Christophe Leroy wrote:
> _switch() saves and restores ALTIVEC and SPE status.
> For altivec this is redundant with what __switch_to() does with
> save_sprs() and restore_sprs() and giveup_all() before
> calling _switch().
> 
> Add support for SPI in save_sprs() and restore_sprs() and
> remove things from _switch().

Applied to powerpc/next.

[1/1] powerpc: Don't handle ALTIVEC/SPE in ASM in _switch(). Do it in C.
      https://git.kernel.org/powerpc/c/359c2ca74d2fede5c571fbf3f5ee16ba1ad98259

cheers
