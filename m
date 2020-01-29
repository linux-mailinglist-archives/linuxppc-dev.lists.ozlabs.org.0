Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABCC14C66E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 07:20:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486td93s26zDqX3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 17:20:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sF31nTszDqNV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sF15MZrz9sRs; Wed, 29 Jan 2020 16:17:41 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 1e3531982ee70adf1880715a968d9c3365f321ed
In-Reply-To: <20200121013153.9937-1-chenzhou10@huawei.com>
To: Chen Zhou <chenzhou10@huawei.com>, <benh@kernel.crashing.org>,
 <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH -next] powerpc/maple: fix comparing pointer to 0
Message-Id: <486sF15MZrz9sRs@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:41 +1100 (AEDT)
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
Cc: chenzhou10@huawei.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, nivedita@alum.mit.edu, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org, allison@lohutok.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-01-21 at 01:31:53 UTC, Chen Zhou wrote:
> Fixes coccicheck warning:
> ./arch/powerpc/platforms/maple/setup.c:232:15-16:
> 	WARNING comparing pointer to 0
> 
> Compare pointer-typed values to NULL rather than 0.
> 
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/1e3531982ee70adf1880715a968d9c3365f321ed

cheers
