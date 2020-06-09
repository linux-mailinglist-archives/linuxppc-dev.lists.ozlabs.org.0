Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3431F339E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 07:52:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gzlf0TvbzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 15:51:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzDt0gt0zDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:28:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzDs2zx8z9sTH; Tue,  9 Jun 2020 15:28:44 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <7195fcde7314ccbf7a081b356084a69d421b10d4.1590660977.git.christophe.leroy@csgroup.eu>
References: <7195fcde7314ccbf7a081b356084a69d421b10d4.1590660977.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32: disable KASAN with pages bigger than 16k
Message-Id: <159168035113.1381411.9694012621969820760.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:44 +1000 (AEST)
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

On Thu, 28 May 2020 10:17:04 +0000 (UTC), Christophe Leroy wrote:
> Mapping of early shadow area is implemented by using a single static
> page table having all entries pointing to the same early shadow page.
> The shadow area must therefore occupy full PGD entries.
> 
> The shadow area has a size of 128Mbytes starting at 0xf8000000.
> With 4k pages, a PGD entry is 4Mbytes
> With 16k pages, a PGD entry is 64Mbytes
> With 64k pages, a PGD entry is 256Mbytes which is too big.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32: Disable KASAN with pages bigger than 16k
      https://git.kernel.org/powerpc/c/888468ce725a4cd56d72dc7e5096078f7a9251a0

cheers
