Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AE5366C0A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:10:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQLWf1vqnz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:10:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQLVG49gtz304c
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:09:10 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQLVC5vg7z9vDw; Wed, 21 Apr 2021 23:09:06 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <69f9968f4b592fefda55227f0f7430ea612cc950.1611299687.git.christophe.leroy@csgroup.eu>
References: <69f9968f4b592fefda55227f0f7430ea612cc950.1611299687.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32: Use r2 in wrtspr() instead of r0
Message-Id: <161901050347.1961279.12121626398624044029.b4-ty@ellerman.id.au>
Date: Wed, 21 Apr 2021 23:08:23 +1000
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

On Fri, 22 Jan 2021 07:15:03 +0000 (UTC), Christophe Leroy wrote:
> wrtspr() is a function to write an arbitrary value in a special
> register. It is used on 8xx to write to SPRN_NRI, SPRN_EID and
> SPRN_EIE. Writing any value to one of those will play with MSR EE
> and MSR RI regardless of that value.
> 
> r0 is used many places in the generated code and using r0 for
> that creates an unnecessary dependency of this instruction with
> preceding ones using r0 in a few places in vmlinux.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32: Use r2 in wrtspr() instead of r0
      https://git.kernel.org/powerpc/c/867e762480f4ad4106b16299a373fa23eccf5b4b

cheers
