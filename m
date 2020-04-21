Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E001B2AB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 17:11:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4966V83rynzDqx5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 01:11:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49656m5yWRzDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 00:09:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49656h5krGz9sT6; Wed, 22 Apr 2020 00:09:46 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d53979b589609d87036d8daf9500f7eccb0c6317
In-Reply-To: <20200420205538.25181-2-rzinsly@linux.ibm.com>
To: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, dja@axtens.net
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH V4 1/5] selftests/powerpc: Add header files for GZIP
 engine test
Message-Id: <49656h5krGz9sT6@ozlabs.org>
Date: Wed, 22 Apr 2020 00:09:46 +1000 (AEST)
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
Cc: haren@linux.ibm.com, abali@us.ibm.com, herbert@gondor.apana.org.au,
 rzinsly@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-04-20 at 20:55:34 UTC, Raphael Moreira Zinsly wrote:
> Add files to access the powerpc NX-GZIP engine in user space.
> 
> Signed-off-by: Bulent Abali <abali@us.ibm.com>
> Signed-off-by: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d53979b589609d87036d8daf9500f7eccb0c6317

cheers
