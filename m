Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC543AC213
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:24:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5m6F0TlVz3dGy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:24:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4C1fLMz3c1W
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:22:51 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4925tZz9sCD; Fri, 18 Jun 2021 14:22:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <8479a862e165a57a855292d47e24c259a578f5a0.1622711627.git.christophe.leroy@csgroup.eu>
References: <8479a862e165a57a855292d47e24c259a578f5a0.1622711627.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/kuap: Force inlining of all first level KUAP
 helpers.
Message-Id: <162398829627.1363949.10534995724959196164.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:36 +1000
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

On Thu, 3 Jun 2021 09:13:54 +0000 (UTC), Christophe Leroy wrote:
> All KUAP helpers defined in asm/kup.h are single line functions
> that should be inlined. But on book3s/32 build, we get many
> instances of <prevent_write_to_user.constprop.0>.
> 
> Force inlining of those helpers.

Applied to powerpc/next.

[1/1] powerpc/kuap: Force inlining of all first level KUAP helpers.
      https://git.kernel.org/powerpc/c/240efd717c415e69511780044f44416bdf161523

cheers
