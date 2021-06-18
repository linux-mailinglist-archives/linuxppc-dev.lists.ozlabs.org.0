Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A53323AC24A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:27:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5m8z2PpVz3c3T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:26:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4F0yqwz3c2Y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:22:53 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4D0scNz9sjD; Fri, 18 Jun 2021 14:22:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, trix@redhat.com,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <bf1e074f6fb213a1c4cc4964370bdce4b648d647.1622706812.git.christophe.leroy@csgroup.eu>
References: <bf1e074f6fb213a1c4cc4964370bdce4b648d647.1622706812.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Remove CONFIG_PPC_MMU_NOHASH_32
Message-Id: <162398828829.1363949.4502364876568416205.b4-ty@ellerman.id.au>
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

On Thu, 3 Jun 2021 07:53:49 +0000 (UTC), Christophe Leroy wrote:
> Since commit Fixes: 555904d07eef ("powerpc/8xx: MM_SLICE is not needed anymore"),
> CONFIG_PPC_MMU_NOHASH_32 has not been used.
> 
> Remove it.

Applied to powerpc/next.

[1/1] powerpc: Remove CONFIG_PPC_MMU_NOHASH_32
      https://git.kernel.org/powerpc/c/c0ca0fe08c9213a5187e4513b5506667f249030f

cheers
