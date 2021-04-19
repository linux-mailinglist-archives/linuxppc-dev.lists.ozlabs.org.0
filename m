Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A86D363A2C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:14:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtk33jZrz3grk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:14:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtW75zrrz3bTs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:51 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVx3x8mz9vHj; Mon, 19 Apr 2021 14:04:41 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Yu Kuai <yukuai3@huawei.com>, benh@kernel.crashing.org
In-Reply-To: <20210407125712.4138033-1-yukuai3@huawei.com>
References: <20210407125712.4138033-1-yukuai3@huawei.com>
Subject: Re: [PATCH] macintosh/windfarm: Make symbol 'pm121_sys_state' static
Message-Id: <161880479055.1398509.2440866944867826442.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 13:59:50 +1000
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

On Wed, 7 Apr 2021 20:57:12 +0800, Yu Kuai wrote:
> The sparse tool complains as follows:
> 
> drivers/macintosh/windfarm_pm121.c:436:24: warning:
>  symbol 'pm121_sys_state' was not declared. Should it be static?
> 
> This symbol is not used outside of windfarm_pm121.c, so this
> commit marks it static.

Applied to powerpc/next.

[1/1] macintosh/windfarm: Make symbol 'pm121_sys_state' static
      https://git.kernel.org/powerpc/c/13ddd0e3acf988a98b46800178ae691640b0cd00

cheers
