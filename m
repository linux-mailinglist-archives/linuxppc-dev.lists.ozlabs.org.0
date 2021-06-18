Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0393AC243
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:25:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5m7H14nMz3dlJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:25:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4D2rNnz3bxV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:22:52 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4C2XgRz9srX; Fri, 18 Jun 2021 14:22:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <d37f61afca55b5b33787b643890e061ae1c18f5f.1620396045.git.christophe.leroy@csgroup.eu>
References: <d37f61afca55b5b33787b643890e061ae1c18f5f.1620396045.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/perf: Simplify Makefile
Message-Id: <162398828936.1363949.1084024487791778042.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:29 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 7 May 2021 14:01:09 +0000 (UTC), Christophe Leroy wrote:
> arch/powerpc/Kbuild decend into arch/powerpc/perf/ only when
> CONFIG_PERF_EVENTS is selected, so there is not need to take
> CONFIG_PERF_EVENTS into account in arch/powerpc/perf/Makefile.

Applied to powerpc/next.

[1/1] powerpc/perf: Simplify Makefile
      https://git.kernel.org/powerpc/c/87f19ea10100892637d4eee9069fad4ed61cb6a5

cheers
