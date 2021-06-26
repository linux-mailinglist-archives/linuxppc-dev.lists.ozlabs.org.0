Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB023B4E21
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:39:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr301bvrz3c7Y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:39:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2L3lCCz3026
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:38:50 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2K3Dtbz9sjD; Sat, 26 Jun 2021 20:38:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <49f4fb051a3e1cb69f7305d5b6768aec14727c32.1624619582.git.christophe.leroy@csgroup.eu>
References: <49f4fb051a3e1cb69f7305d5b6768aec14727c32.1624619582.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/ptrace: Move set_return_regs_changed() before
 regs_set_return_{msr/ip}
Message-Id: <162470384781.3589875.1784352665925391904.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:27 +1000
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

On Fri, 25 Jun 2021 11:13:16 +0000 (UTC), Christophe Leroy wrote:
> regs_set_return_msr() and regs_set_return_ip() have a copy
> of the code of set_return_regs_changed().
> 
> Move up set_return_regs_changed() so it can be reused by
> regs_set_return_{msr/ip}

Applied to powerpc/next.

[1/2] powerpc/ptrace: Move set_return_regs_changed() before regs_set_return_{msr/ip}
      https://git.kernel.org/powerpc/c/5f0f95f1e1b64fe55679059837dafb3439b57012
[2/2] powerpc/ptrace: Refactor regs_set_return_{msr/ip}
      https://git.kernel.org/powerpc/c/cae4644673ec5f54c77deab67a57c41395a1539f

cheers
