Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB4126DAE0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 13:57:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsb750rqQzDqKj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 21:57:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSY4LQjzDqX7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSY1vLWz9sVV; Thu, 17 Sep 2020 21:27:25 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <3612a8f8aaca16de3fc414a7e66293319d6e213c.1597643147.git.christophe.leroy@csgroup.eu>
References: <3612a8f8aaca16de3fc414a7e66293319d6e213c.1597643147.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1] powerpc/process: Tag an #endif to help locate the
 matching #ifdef.
Message-Id: <160034201546.3339803.1252084823343319379.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:25 +1000 (AEST)
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

On Mon, 17 Aug 2020 05:46:45 +0000 (UTC), Christophe Leroy wrote:
> That #endif is more than 100 lines after the matching #ifdef,
> and there are several #ifdef/#else/#endif inbetween.
> 
> Tag it as /* CONFIG_PPC_BOOK3S_64 */ to help locate the
> matching #ifdef.

Applied to powerpc/next.

[1/1] powerpc/process: Tag an #endif to help locate the matching #ifdef.
      https://git.kernel.org/powerpc/c/60d62bfd24efce1a595d259100b8a4e7a489e834

cheers
