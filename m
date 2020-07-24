Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DB822C95F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:39:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCtfh25XNzF0c5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 01:39:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqh44Wr2zDrdN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:25:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqh066PPz9sSt; Fri, 24 Jul 2020 23:25:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, haren@linux.ibm.com, paulus@samba.org,
 dave.hansen@linux.intel.com, benh@kernel.crashing.org,
 YueHaibing <yuehaibing@huawei.com>, mpe@ellerman.id.au
In-Reply-To: <20200717112714.19304-1-yuehaibing@huawei.com>
References: <20200715031939.31968-1-yuehaibing@huawei.com>
 <20200717112714.19304-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] powerpc: Remove unneeded inline functions
Message-Id: <159559696842.1657499.8881605373645357480.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:25:20 +1000 (AEST)
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

On Fri, 17 Jul 2020 19:27:14 +0800, YueHaibing wrote:
> Both of those functions are only called from 64-bit only code, so the
> stubs should not be needed at all.

Applied to powerpc/next.

[1/1] powerpc: Remove unneeded inline functions
      https://git.kernel.org/powerpc/c/a3f3f8aa1f72dafe1450ccf8cbdfb1d12d42853a

cheers
