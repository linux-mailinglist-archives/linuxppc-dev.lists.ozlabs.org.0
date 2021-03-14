Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE1A33A40E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 11:05:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DywCy6F4qz3dRy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 21:05:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DywBd0ZFxz3f75
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 21:04:25 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DywBc6FNGz9sW5; Sun, 14 Mar 2021 21:04:24 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210309071544.515303-1-mpe@ellerman.id.au>
References: <20210309071544.515303-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Use symbolic macros for function entry
 encoding
Message-Id: <161571622094.141776.12700373219914523666.b4-ty@ellerman.id.au>
Date: Sun, 14 Mar 2021 21:04:24 +1100 (AEDT)
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
Cc: naveen.n.rao@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 9 Mar 2021 18:15:44 +1100, Michael Ellerman wrote:
> In ppc_function_entry() we look for a specific set of instructions by
> masking the instructions and comparing with a known value. Currently
> those known values are just literal hex values, and we recently
> discovered one of them was wrong.
> 
> Instead construct the values using the existing constants we have for
> defining various fields of instructions.

Applied to powerpc/fixes.

[1/1] powerpc/64s: Use symbolic macros for function entry encoding
      https://git.kernel.org/powerpc/c/7aed41cff35a9aaf3431b8c0c23daa7d8bb77cd3

cheers
