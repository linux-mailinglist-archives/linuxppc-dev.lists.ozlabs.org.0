Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D18503B9F69
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 13:00:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGXDQ62Q2z3bTh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 21:00:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGXCt1h0jz2yN3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jul 2021 20:59:53 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GGXCq46CSz9shx; Fri,  2 Jul 2021 20:59:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210701125026.292224-1-mpe@ellerman.id.au>
References: <20210701125026.292224-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Only build restart_table.c for 64s
Message-Id: <162522358081.303689.1915142573283705407.b4-ty@ellerman.id.au>
Date: Fri, 02 Jul 2021 20:59:40 +1000
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 1 Jul 2021 22:50:26 +1000, Michael Ellerman wrote:
> Commit 9b69d48c7516 ("powerpc/64e: remove implicit soft-masking and
> interrupt exit restart logic") limited the implicit soft masking and
> restart logic to 64-bit Book3S only. However we are still building
> restart_table.c for all 64-bit, ie. Book3E also.
> 
> There's no need to build it for 64e, and it also causes missing
> prototype warnings for 64e builds, because the prototype is already
> behind an #ifdef PPC_BOOK3S_64.

Applied to powerpc/next.

[1/1] powerpc: Only build restart_table.c for 64s
      https://git.kernel.org/powerpc/c/4ebbbaa4ce8524b853dd6febf0176a6efa3482d7

cheers
