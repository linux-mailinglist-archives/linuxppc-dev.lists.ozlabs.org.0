Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B81E7B5E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 00:52:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ysJS658szDqZ9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 08:52:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ysFw54dlzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 08:50:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45ysFt6DxGz9sML; Wed, 31 Jul 2019 08:50:10 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 705d0abbcc7adf04743d04ea8754acbcdf21c326
In-Reply-To: <20190729055536.25591-1-santosh@fossix.org>
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kvm: Fall through switch case explicitly
Message-Id: <45ysFt6DxGz9sML@ozlabs.org>
Date: Wed, 31 Jul 2019 08:50:10 +1000 (AEST)
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

On Mon, 2019-07-29 at 05:55:36 UTC, Santosh Sivaraj wrote:
> Implicit fallthrough warning was enabled globally which broke
> the build. Make it explicit with a `fall through` comment.
> 
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> Reviewed-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reviewed-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/705d0abbcc7adf04743d04ea8754acbcdf21c326

cheers
