Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E45C1233333
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:38:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHWhg1kYZzDqJ3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 23:38:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHVfg5bs3zDqxQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:51:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BHVfg212Kz9sSt; Thu, 30 Jul 2020 22:51:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BHVff52Mbz9sSy; Thu, 30 Jul 2020 22:51:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200727070341.595634-1-mpe@ellerman.id.au>
References: <20200727070341.595634-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/fadump: Fix build error with
 CONFIG_PRESERVE_FA_DUMP=y
Message-Id: <159611349908.1605534.13544680784147570902.b4-ty@ellerman.id.au>
Date: Thu, 30 Jul 2020 22:51:50 +1000 (AEST)
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

On Mon, 27 Jul 2020 17:03:41 +1000, Michael Ellerman wrote:
> skiroot_defconfig fails:
> 
> arch/powerpc/kernel/fadump.c:48:17: error: ‘cpus_in_fadump’ defined but not used
>    48 | static atomic_t cpus_in_fadump;
> 
> Fix it by moving the definition into the #ifdef where it's used.

Applied to powerpc/next.

[1/1] powerpc/fadump: Fix build error with CONFIG_PRESERVE_FA_DUMP=y
      https://git.kernel.org/powerpc/c/5f987caec521cbb00d4ba2dc641ac8074626b762

cheers
