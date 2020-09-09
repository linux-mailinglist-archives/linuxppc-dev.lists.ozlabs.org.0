Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B94262F68
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 15:57:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmk9N5817zDqFK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 23:57:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjW15hVLzDqTs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjVy5cDVz9sVb; Wed,  9 Sep 2020 23:27:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: hch@infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <245cabd8f291facac8c8c5fd370e361a69e02860.1597384145.git.christophe.leroy@csgroup.eu>
References: <245cabd8f291facac8c8c5fd370e361a69e02860.1597384145.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc: Remove flush_instruction_cache() on 8xx
Message-Id: <159965717033.808686.4691063730479167234.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:37 +1000 (AEST)
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

On Fri, 14 Aug 2020 05:49:29 +0000 (UTC), Christophe Leroy wrote:
> flush_instruction_cache() is never used on 8xx, remove it.

Applied to powerpc/next.

[1/1] powerpc: Remove flush_instruction_cache() on 8xx
      https://git.kernel.org/powerpc/c/76d46a1e2fe2c35f24c07b7cc8a41afbf98b349e

cheers
