Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 226DC3AC256
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:29:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mDK5Pnxz3g7M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:29:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4Q0Tw5z3c6C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:23:02 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4N62hdz9sWk; Fri, 18 Jun 2021 14:23:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Finn Thain <fthain@linux-m68k.org>, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <a1456e8bbd33ef702e3ff6f14b1bf3919241c62b.1623398307.git.fthain@linux-m68k.org>
References: <a1456e8bbd33ef702e3ff6f14b1bf3919241c62b.1623398307.git.fthain@linux-m68k.org>
Subject: Re: [PATCH v2] powerpc/tau: Remove superfluous parameter in
 alloc_workqueue() call
Message-Id: <162398829913.1363949.18107899985945378048.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:39 +1000
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

On Fri, 11 Jun 2021 17:58:27 +1000, Finn Thain wrote:
> This avoids an (optional) compiler warning:
> 
> arch/powerpc/kernel/tau_6xx.c: In function 'TAU_init':
> arch/powerpc/kernel/tau_6xx.c:204:30: error: too many arguments for format [-Werror=format-extra-args]
>   tau_workq = alloc_workqueue("tau", WQ_UNBOUND, 1, 0);

Applied to powerpc/next.

[1/1] powerpc/tau: Remove superfluous parameter in alloc_workqueue() call
      https://git.kernel.org/powerpc/c/ddf4a7bcd09439e82c4d6f959f4ff6c53f07466f

cheers
