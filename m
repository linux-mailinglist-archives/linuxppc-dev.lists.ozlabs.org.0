Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C33133AC25F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:32:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mHK3bPCz3cBj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:32:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4V1k9lz3c7V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:23:06 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4T20v6z9t14; Fri, 18 Jun 2021 14:23:05 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, trix@redhat.com, mpe@ellerman.id.au,
 benh@kernel.crashing.org, agust@denx.de
In-Reply-To: <20210601190200.2637776-1-trix@redhat.com>
References: <20210601190200.2637776-1-trix@redhat.com>
Subject: Re: [PATCH] powerpc: 52xx: add fallthrough in mpc52xx_wdt_ioctl()
Message-Id: <162398828853.1363949.2617045934377270438.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:28 +1000
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

On Tue, 1 Jun 2021 12:02:00 -0700, trix@redhat.com wrote:
> With gcc 10.3, there is this compiler error
> compiler.h:56:26: error: this statement may
>   fall through [-Werror=implicit-fallthrough=]
> 
> mpc52xx_gpt.c:586:2: note: here
>   586 |  case WDIOC_GETTIMEOUT:
>       |  ^~~~
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: 52xx: add fallthrough in mpc52xx_wdt_ioctl()
      https://git.kernel.org/powerpc/c/b629f6c0ab8668a186fda2627296d0cbcc45a368

cheers
