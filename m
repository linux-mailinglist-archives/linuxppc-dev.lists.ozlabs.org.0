Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B153B4E24
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:39:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr3f30dTz3cQY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:39:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2N1x3Tz3bw1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:38:52 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2M1QRgz9ssD; Sat, 26 Jun 2021 20:38:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 npiggin@gmail.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <52531029563c1fc823b790058e799d0ca71b028c.1624631463.git.christophe.leroy@csgroup.eu>
References: <52531029563c1fc823b790058e799d0ca71b028c.1624631463.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/interrupt: Also use exit_must_hard_disable() on
 PPC32
Message-Id: <162470384844.3589875.8852110377002600805.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:28 +1000
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

On Fri, 25 Jun 2021 14:31:46 +0000 (UTC), Christophe Leroy wrote:
> Reduce #ifdefs a bit by making exit_must_hard_disable() return
> true on PPC32.

Applied to powerpc/next.

[1/1] powerpc/interrupt: Also use exit_must_hard_disable() on PPC32
      https://git.kernel.org/powerpc/c/767e6e7130b288d856e4f2be365554dc6147a80a

cheers
