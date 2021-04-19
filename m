Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE43363A2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:14:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtjj0Dcdz3gl6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtW75ppWz3clf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:51 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVw6Rd3z9vHR; Mon, 19 Apr 2021 14:04:40 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Yu Kuai <yukuai3@huawei.com>, benh@kernel.crashing.org
In-Reply-To: <20210407125803.4138837-1-yukuai3@huawei.com>
References: <20210407125803.4138837-1-yukuai3@huawei.com>
Subject: Re: [PATCH] macintosh/via-pmu: Make some symbols static
Message-Id: <161880479109.1398509.777689260617554743.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 13:59:51 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, zhangxiaoxu5@huawei.com,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Apr 2021 20:58:03 +0800, Yu Kuai wrote:
> The sparse tool complains as follows:
> 
> drivers/macintosh/via-pmu.c:183:5: warning:
>  symbol 'pmu_cur_battery' was not declared. Should it be static?
> drivers/macintosh/via-pmu.c:190:5: warning:
>  symbol '__fake_sleep' was not declared. Should it be static?
> 
> [...]

Applied to powerpc/next.

[1/1] macintosh/via-pmu: Make some symbols static
      https://git.kernel.org/powerpc/c/95d143923379ffb0e706b064305681d44c05ec4b

cheers
