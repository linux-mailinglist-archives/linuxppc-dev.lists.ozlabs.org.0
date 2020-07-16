Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 338EB222442
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 15:49:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6wbP2vKHzDqMB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:49:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vPs1dP4zDqly
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPq12B4z9sVB; Thu, 16 Jul 2020 22:55:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Abhishek Goel <huntbag@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200706053258.121475-1-huntbag@linux.vnet.ibm.com>
References: <20200706053258.121475-1-huntbag@linux.vnet.ibm.com>
Subject: Re: [PATCH] cpuidle/powernv : Remove dead code block
Message-Id: <159490400609.3805857.11882065929256574276.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:55:58 +1000 (AEST)
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
Cc: daniel.lezcano@linaro.org, rjw@rjwysocki.net, ego@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Jul 2020 00:32:58 -0500, Abhishek Goel wrote:
> Commit 1961acad2f88559c2cdd2ef67c58c3627f1f6e54 removes usage of
> function "validate_dt_prop_sizes". This patch removes this unused
> function.

Applied to powerpc/next.

[1/1] cpuidle/powernv : Remove dead code block
      https://git.kernel.org/powerpc/c/c339f9be304c21da1c42899a824f84a2cc9ced30

cheers
