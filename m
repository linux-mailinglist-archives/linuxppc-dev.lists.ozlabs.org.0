Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E90B036EBE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:04:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHKv6XT3z3cXr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:04:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHJ01yZVz300x
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:02:24 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FWHHz5CVmz9t1C; Fri, 30 Apr 2021 00:02:23 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <c68163065163f303f5af1e4bbdd9f1ce69f0543e.1619260465.git.christophe.leroy@csgroup.eu>
References: <c68163065163f303f5af1e4bbdd9f1ce69f0543e.1619260465.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/kasan: Fix shadow start address with modules
Message-Id: <161970488639.4033873.400053528462440778.b4-ty@ellerman.id.au>
Date: Fri, 30 Apr 2021 00:01:26 +1000
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

On Sat, 24 Apr 2021 10:34:43 +0000 (UTC), Christophe Leroy wrote:
> Modules are now located before kernel, KASAN area has to
> be extended accordingly.

Applied to powerpc/next.

[1/1] powerpc/kasan: Fix shadow start address with modules
      https://git.kernel.org/powerpc/c/30c400886bad4ac1801516683b71d7714bc2b1b1

cheers
