Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 761273AC24D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:27:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mB01cRhz3fQK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:27:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4H2xpqz2ysw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:22:55 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4G37Fnz9sXb; Fri, 18 Jun 2021 14:22:54 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <a069a348ee3c2fe3123a5a93695c2b35dc42cb40.1623340691.git.christophe.leroy@csgroup.eu>
References: <a069a348ee3c2fe3123a5a93695c2b35dc42cb40.1623340691.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/signal32: Remove impossible #ifdef combinations
Message-Id: <162398829818.1363949.2552824132149811468.b4-ty@ellerman.id.au>
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

On Thu, 10 Jun 2021 15:58:34 +0000 (UTC), Christophe Leroy wrote:
> PPC_TRANSACTIONAL_MEM is only on book3s/64
> SPE is only on booke
> 
> PPC_TRANSACTIONAL_MEM selects ALTIVEC and VSX
> 
> Therefore, within PPC_TRANSACTIONAL_MEM sections,
> ALTIVEC and VSX are always defined while SPE never is.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/signal32: Remove impossible #ifdef combinations
      https://git.kernel.org/powerpc/c/ac3d085368b3abf19b24d8505b897454c7372855

cheers
