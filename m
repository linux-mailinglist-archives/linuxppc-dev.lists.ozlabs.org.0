Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998231681F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 14:37:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbLQk1rLDzDsVH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 00:37:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKY54Hy4zDrBq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 23:57:29 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKY44w7Yz9sVw; Wed, 10 Feb 2021 23:57:27 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, cmr@codefail.de,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <c72f014730823b413528e90ab6c4d3bcb79f8497.1612692067.git.christophe.leroy@csgroup.eu>
References: <c72f014730823b413528e90ab6c4d3bcb79f8497.1612692067.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/uaccess: Perform barrier_nospec() in KUAP
 allowance helpers
Message-Id: <161296172412.3178259.4318567757525360600.b4-ty@ellerman.id.au>
Date: Wed, 10 Feb 2021 23:57:27 +1100 (AEDT)
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

On Sun, 7 Feb 2021 10:08:11 +0000 (UTC), Christophe Leroy wrote:
> barrier_nospec() in uaccess helpers is there to protect against
> speculative accesses around access_ok().
> 
> When using user_access_begin() sequences together with
> unsafe_get_user() like macros, barrier_nospec() is called for
> every single read although we know the access_ok() is done
> onece.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/uaccess: Perform barrier_nospec() in KUAP allowance helpers
      https://git.kernel.org/powerpc/c/8524e2e76441fc615a3b5c1415823e051cc79eae

cheers
