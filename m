Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F54D91047E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 14:49:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4gKp6pkRz3cZ5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 22:49:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4gK871kPz3cSS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 22:48:44 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W4gJy4TM4z4wcg;
	Thu, 20 Jun 2024 22:48:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Danny Tsen <dtsen@linux.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20240603-powerpc-crypto-ignore-p8-asm-v1-1-05843fec2bb7@linux.ibm.com>
References: <20240603-powerpc-crypto-ignore-p8-asm-v1-1-05843fec2bb7@linux.ibm.com>
Subject: Re: [PATCH] powerpc/crypto: Add generated P8 asm to .gitignore
Message-Id: <171888750936.804969.14409568109203763184.b4-ty@ellerman.id.au>
Date: Thu, 20 Jun 2024 22:45:09 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 03 Jun 2024 08:01:03 -0500, Nathan Lynch wrote:
> Looks like drivers/crypto/vmx/.gitignore should have been merged into
> arch/powerpc/crypto/.gitignore as part of commit
> 109303336a0c ("crypto: vmx - Move to arch/powerpc/crypto") so that all
> generated asm files are ignored.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/crypto: Add generated P8 asm to .gitignore
      https://git.kernel.org/powerpc/c/2b85b7fb1376481f7d4c2cf92e5da942f06b2547

cheers
