Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A4130D26
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 06:27:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rkY80VGRzDqCD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 16:27:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rkSD218zzDq9G
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 16:23:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47rkSD0mxYz9sR4; Mon,  6 Jan 2020 16:23:23 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 6da3eced8c5f3b03340b0c395bacd552c4d52411
In-Reply-To: <20191223133147.129983-1-Jason@zx2c4.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, pauld@redhat.com,
 longman@redhat.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/shared: include correct header for static key
Message-Id: <47rkSD0mxYz9sR4@ozlabs.org>
Date: Mon,  6 Jan 2020 16:23:23 +1100 (AEDT)
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-12-23 at 13:31:47 UTC, "Jason A. Donenfeld" wrote:
> Recently, the spinlock implementation grew a static key optimization,
> but the jump_label.h header include was left out, leading to build
> errors:
> 
> linux/arch/powerpc/include/asm/spinlock.h:44:7: error: implicit declaration of function ‘static_branch_unlikely’ [-Werror=implicit-function-declaration]
>    44 |  if (!static_branch_unlikely(&shared_processor))
> 
> This commit adds the missing header.
> 
> Fixes: 656c21d6af5d ("powerpc/shared: Use static key to detect shared processor")
> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/6da3eced8c5f3b03340b0c395bacd552c4d52411

cheers
