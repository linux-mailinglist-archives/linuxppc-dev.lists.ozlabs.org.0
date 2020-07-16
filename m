Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFB42225B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:34:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6xZs5gjCzDr7Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:33:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vQK6h7BzDqlZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vQB68Q7z9sVQ; Thu, 16 Jul 2020 22:56:18 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Hulk Robot <hulkci@huawei.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200714142424.66648-1-weiyongjun1@huawei.com>
References: <20200714142424.66648-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] cpuidle/pseries: Make symbol 'pseries_idle_driver'
 static
Message-Id: <159490401706.3805857.7133480973769495238.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:56:18 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Jul 2020 22:24:24 +0800, Wei Yongjun wrote:
> The sparse tool complains as follows:
> 
> drivers/cpuidle/cpuidle-pseries.c:25:23: warning:
>  symbol 'pseries_idle_driver' was not declared. Should it be static?
> 
> 'pseries_idle_driver' is not used outside of this file, so marks
> it static.

Applied to powerpc/next.

[1/1] cpuidle/pseries: Make symbol 'pseries_idle_driver' static
      https://git.kernel.org/powerpc/c/92fe8483b1660feaa602d8be6ca7efe95ae4789b

cheers
