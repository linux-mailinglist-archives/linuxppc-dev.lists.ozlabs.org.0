Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9353316841
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 14:47:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbLfx2WJMzDrfF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 00:47:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKY95VTwzDrgn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 23:57:33 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKY825rlz9sVt; Wed, 10 Feb 2021 23:57:32 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Chengyang Fan <cy.fan@huawei.com>, mpe@ellerman.id.au
In-Reply-To: <20210125095338.1719405-1-cy.fan@huawei.com>
References: <20210125095338.1719405-1-cy.fan@huawei.com>
Subject: Re: [PATCH] powerpc: remove unneeded semicolons
Message-Id: <161296171966.3178259.9297308863330851895.b4-ty@ellerman.id.au>
Date: Wed, 10 Feb 2021 23:57:32 +1100 (AEDT)
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
Cc: joe@perches.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 25 Jan 2021 17:53:38 +0800, Chengyang Fan wrote:
> Remove superfluous semicolons after function definitions.

Applied to powerpc/next.

[1/1] powerpc: remove unneeded semicolons
      https://git.kernel.org/powerpc/c/6c6fdbb2b7002aa04e418b5d2b26df1c5ba5ab80

cheers
