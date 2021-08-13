Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F17A3EB4F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 14:00:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmMZ11RbCz3cTM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 22:00:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmMXl01t1z3bWT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 21:59:02 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GmMXd0tWSz9sWq; Fri, 13 Aug 2021 21:58:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, radu.rendec@gmail.com,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <028d5483b4851b01ea4334d0751e7f260419092b.1625637264.git.christophe.leroy@csgroup.eu>
References: <028d5483b4851b01ea4334d0751e7f260419092b.1625637264.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32: Fix critical and debug interrupts on BOOKE
Message-Id: <162885586697.2317031.18158265809824368370.b4-ty@ellerman.id.au>
Date: Fri, 13 Aug 2021 21:57:46 +1000
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

On Wed, 7 Jul 2021 05:55:07 +0000 (UTC), Christophe Leroy wrote:
> 32 bits BOOKE have special interrupts for debug and other
> critical events.
> 
> When handling those interrupts, dedicated registers are saved
> in the stack frame in addition to the standard registers, leading
> to a shift of the pt_regs struct.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/32: Fix critical and debug interrupts on BOOKE
      https://git.kernel.org/powerpc/c/b5cfc9cd7b0426e94ffd9e9ed79d1b00ace7780a

cheers
