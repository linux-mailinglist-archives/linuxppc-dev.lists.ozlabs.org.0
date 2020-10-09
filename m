Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 605182881FD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 08:12:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6yRT6VwCzDqdD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 17:12:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6yFF2mtLzDqWY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 17:04:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C6yFD4wxNz9sTK; Fri,  9 Oct 2020 17:04:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <3c9a6eb0fc040868ac59be66f338d08fd017668d.1601549945.git.christophe.leroy@csgroup.eu>
References: <3c9a6eb0fc040868ac59be66f338d08fd017668d.1601549945.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/time: Remove ifdef in get_dec() and set_dec()
Message-Id: <160222339270.867048.7781470173395952813.b4-ty@ellerman.id.au>
Date: Fri,  9 Oct 2020 17:04:00 +1100 (AEDT)
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

On Thu, 1 Oct 2020 10:59:19 +0000 (UTC), Christophe Leroy wrote:
> Move SPRN_PIT definition in reg.h.
> 
> This allows to remove ifdef in get_dec() and set_dec() and
> makes them more readable.

Applied to powerpc/next.

[1/1] powerpc/time: Remove ifdef in get_dec() and set_dec()
      https://git.kernel.org/powerpc/c/63f9d9df5ed0d4f3a2c0cd08730e1cae1edd11bf

cheers
