Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EB89F970
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 06:32:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JCWz47YszDr1K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 14:32:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JCM40PzlzDqsr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 14:24:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46JCM36VN6z9sN1; Wed, 28 Aug 2019 14:24:47 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46JCM36C7Dz9sNf; Wed, 28 Aug 2019 14:24:47 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d57b78353a99f5d813248954dd7d0527a01751ac
In-Reply-To: <20190813031314.1828-2-cmr@informatik.wtf>
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4 1/3] powerpc/spinlocks: Refactor SHARED_PROCESSOR
Message-Id: <46JCM36C7Dz9sNf@ozlabs.org>
Date: Wed, 28 Aug 2019 14:24:47 +1000 (AEST)
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-08-13 at 03:13:12 UTC, "Christopher M. Riedl" wrote:
> Determining if a processor is in shared processor mode is not a constant
> so don't hide it behind a #define.
> 
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d57b78353a99f5d813248954dd7d0527a01751ac

cheers
