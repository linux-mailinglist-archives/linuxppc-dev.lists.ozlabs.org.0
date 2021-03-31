Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 469EF34F5E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:11:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97Z423jjz3dCP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:11:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XK3d8Xz3bsB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:09 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XK1yZ5z9sWk; Wed, 31 Mar 2021 12:10:09 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 rashmicy@gmail.com, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <9881c68fbca004f9ea18fc9473f630e11ccd6417.1615806071.git.christophe.leroy@csgroup.eu>
References: <9881c68fbca004f9ea18fc9473f630e11ccd6417.1615806071.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/asm-offsets: GPR14 is not needed either
Message-Id: <161715297765.226945.4352182922403291412.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:37 +1100
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

On Mon, 15 Mar 2021 11:01:26 +0000 (UTC), Christophe Leroy wrote:
> Commit aac6a91fea93 ("powerpc/asm: Remove unused symbols in
> asm-offsets.c") removed GPR15 to GPR31 but kept GPR14,
> probably because it pops up in a couple of comments when doing
> a grep.
> 
> However, it was never used either, so remove it as well.

Applied to powerpc/next.

[1/1] powerpc/asm-offsets: GPR14 is not needed either
      https://git.kernel.org/powerpc/c/6eeca7a11379e9dd05493bbdba57515b36a2e3cf

cheers
