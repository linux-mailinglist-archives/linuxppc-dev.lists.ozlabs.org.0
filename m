Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E61030DA3B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:53:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW1nz1CPQzDwyZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 23:53:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW09m3M5ZzDwsr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:44 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DW09l0Hwmz9vG7; Wed,  3 Feb 2021 22:40:43 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09j6yJqz9vG6; Wed,  3 Feb 2021 22:40:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20201217005306.895685-1-mpe@ellerman.id.au>
References: <20201217005306.895685-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s/kuap: Use mmu_has_feature()
Message-Id: <161235200005.1516112.5569812810079543982.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:40 +1100 (AEDT)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Dec 2020 11:53:06 +1100, Michael Ellerman wrote:
> In commit 8150a153c013 ("powerpc/64s: Use early_mmu_has_feature() in
> set_kuap()") we switched the KUAP code to use early_mmu_has_feature(),
> to avoid a bug where we called set_kuap() before feature patching had
> been done, leading to recursion and crashes.
> 
> That path, which called probe_kernel_read() from printk(), has since
> been removed, see commit 2ac5a3bf7042 ("vsprintf: Do not break early
> boot with probing addresses").
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s/kuap: Use mmu_has_feature()
      https://git.kernel.org/powerpc/c/7613f5a66becfd0e43a0f34de8518695888f5458

cheers
