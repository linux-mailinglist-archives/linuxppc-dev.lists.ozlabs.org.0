Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A94B7838
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 13:08:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YvGt3cd5zDrWV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 21:08:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YtKl5pNrzF4Xs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 20:26:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46YtKk2RyPz9sPf; Thu, 19 Sep 2019 20:26:02 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 1fdfa4c6af0cc1854b017f308af6bece94568bb6
In-Reply-To: <20190912074037.13813-1-yamada.masahiro@socionext.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc: improve prom_init_check rule
Message-Id: <46YtKk2RyPz9sPf@ozlabs.org>
Date: Thu, 19 Sep 2019 20:26:02 +1000 (AEST)
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Firoz Khan <firoz.khan@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-09-12 at 07:40:37 UTC, Masahiro Yamada wrote:
> This slightly improves the prom_init_check rule.
> 
> [1] Avoid needless check
> 
> Currently, prom_init_check.sh is invoked every time you run 'make'
> even if you have changed nothing in prom_init.c. With this commit,
> the script is re-run only when prom_init.o is recompiled.
> 
> [2] Beautify the build log
> 
> Currently, the O= build shows the absolute path to the script:
> 
>   CALL    /abs/path/to/source/of/linux/arch/powerpc/kernel/prom_init_check.sh
> 
> With this commit, it is always a relative path to the timestamp file:
> 
>   PROMCHK arch/powerpc/kernel/prom_init_check
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/1fdfa4c6af0cc1854b017f308af6bece94568bb6

cheers
