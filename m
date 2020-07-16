Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FF222240F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 15:38:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6wM40qbYzDqMX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:38:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vPr3jzZzDqhb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPh0ndYz9sV1; Thu, 16 Jul 2020 22:55:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <810bd8840ef990a200f58c9dea9abe767ca02a3a.1594146723.git.christophe.leroy@csgroup.eu>
References: <810bd8840ef990a200f58c9dea9abe767ca02a3a.1594146723.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/signal64: Don't opencode page prefaulting
Message-Id: <159490400694.3805857.15212813327289950599.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:55:52 +1000 (AEST)
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

On Tue, 7 Jul 2020 18:32:25 +0000 (UTC), Christophe Leroy wrote:
> Instead of doing a __get_user() from the first and last location
> into a tmp var which won't be used, use fault_in_pages_readable()

Applied to powerpc/next.

[1/1] powerpc/signal64: Don't opencode page prefaulting
      https://git.kernel.org/powerpc/c/96032f983ca32ad1d43c73da922dbc7022754c3c

cheers
