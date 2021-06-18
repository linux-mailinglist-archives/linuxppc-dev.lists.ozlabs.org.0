Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3483AC1F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:23:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5m4Q1HbNz3c6F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:23:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m445z5lz2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:22:44 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m432RXBz9sT6; Fri, 18 Jun 2021 14:22:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20210510144925.58195-1-andriy.shevchenko@linux.intel.com>
References: <20210510144925.58195-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] powerpc/prom_init: Move custom isspace() to its
 own namespace
Message-Id: <162398828919.1363949.14771833320193532617.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:29 +1000
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
Cc: Paul Mackerras <paulus@samba.org>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 10 May 2021 17:49:25 +0300, Andy Shevchenko wrote:
> If by some reason any of the headers will include ctype.h
> we will have a name collision. Avoid this by moving isspace()
> to the dedicate namespace.
> 
> First appearance of the code is in the commit cf68787b68a2
> ("powerpc/prom_init: Evaluate mem kernel parameter for early allocation").

Applied to powerpc/next.

[1/1] powerpc/prom_init: Move custom isspace() to its own namespace
      https://git.kernel.org/powerpc/c/4cfdd9201cfb85538975f5c8fb83941c3d463ed2

cheers
