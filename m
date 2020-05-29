Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EFF1E74E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 06:36:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YBb42snVzDqd1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 14:36:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YBKd2zYNzDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 14:24:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 49YBKd15P6z9sT2; Fri, 29 May 2020 14:24:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49YBKc6xrTz9sTF; Fri, 29 May 2020 14:24:20 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: e2a8b49e79553bd8ec48f73cead84e6146c09408
In-Reply-To: <20200507123324.2250024-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/uaccess: Don't use "m<>" constraint
Message-Id: <49YBKc6xrTz9sTF@ozlabs.org>
Date: Fri, 29 May 2020 14:24:20 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-05-07 at 12:33:24 UTC, Michael Ellerman wrote:
> The "m<>" constraint breaks compilation with GCC 4.6.x era compilers.
> 
> The use of the constraint allows the compiler to use update-form
> instructions, however in practice current compilers never generate
> those forms for any of the current uses of __put_user_asm_goto().
> 
> We anticipate that GCC 4.6 will be declared unsupported for building
> the kernel in the not too distant future. So for now just switch to
> the "m" constraint.
> 
> Fixes: 334710b1496a ("powerpc/uaccess: Implement unsafe_put_user() using 'asm goto'")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc topic/uaccess-ppc.

https://git.kernel.org/powerpc/c/e2a8b49e79553bd8ec48f73cead84e6146c09408

cheers
