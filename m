Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 149F734F5E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:12:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97bQ6WKQz3dpT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:12:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XN3TGsz3byk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:12 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XN0ST7z9sXb; Wed, 31 Mar 2021 12:10:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <8038392f38d81f2ad169347efac29146f553b238.1615819955.git.christophe.leroy@csgroup.eu>
References: <8038392f38d81f2ad169347efac29146f553b238.1615819955.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/mm: Remove unneeded #ifdef CONFIG_PPC_MEM_KEYS
Message-Id: <161715297876.226945.6700622335291233560.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:38 +1100
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

On Mon, 15 Mar 2021 14:52:51 +0000 (UTC), Christophe Leroy wrote:
> In fault.c, #ifdef CONFIG_PPC_MEM_KEYS is not needed because all
> functions are always defined, and arch_vma_access_permitted()
> always returns true when CONFIG_PPC_MEM_KEYS is not defined so
> access_pkey_error() will return false so bad_access_pkey()
> will never be called.
> 
> Include linux/pkeys.h to get a definition of vma_pkeys() for
> bad_access_pkey().

Applied to powerpc/next.

[1/1] powerpc/mm: Remove unneeded #ifdef CONFIG_PPC_MEM_KEYS
      https://git.kernel.org/powerpc/c/98c26a72751ecb2ed247cdfd6cb2385f37195707

cheers
