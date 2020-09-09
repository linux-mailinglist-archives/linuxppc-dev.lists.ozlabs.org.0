Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69984262F62
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 15:55:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmk6W1HJ1zDqD9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 23:54:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjW205bCzDqJK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjW14T0yz9sVm; Wed,  9 Sep 2020 23:27:41 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Wolfram Sang <wsa@kernel.org>,
 Colin King <colin.king@canonical.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <20200806102901.44988-1-colin.king@canonical.com>
References: <20200806102901.44988-1-colin.king@canonical.com>
Subject: Re: [PATCH][V2] macintosh: windfarm: remove detatch debug containing
 spelling mistakes
Message-Id: <159965716592.808686.16632951735856644964.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:41 +1000 (AEST)
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 6 Aug 2020 11:29:01 +0100, Colin King wrote:
> There are spelling mistakes in two debug messages. As recommended
> by Wolfram Sang, these can be removed as there is plenty of debug
> in the driver core.

Applied to powerpc/next.

[1/1] macintosh: windfarm: remove detatch debug containing spelling mistakes
      https://git.kernel.org/powerpc/c/7db0a07273e8f581d0b3e8a102d3d9dd99f43528

cheers
