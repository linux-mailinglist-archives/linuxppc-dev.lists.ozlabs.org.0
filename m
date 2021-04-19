Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D63363A2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:15:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtkv6DgBz3ddj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:15:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtWD3XBgz3cPd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:56 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtW36lkFz9vGg; Mon, 19 Apr 2021 14:04:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Yu Kuai <yukuai3@huawei.com>, benh@kernel.crashing.org
In-Reply-To: <20210407125738.4138480-1-yukuai3@huawei.com>
References: <20210407125738.4138480-1-yukuai3@huawei.com>
Subject: Re: [PATCH] windfarm: make symbol 'wf_thread' static
Message-Id: <161880479082.1398509.3847359134460061965.b4-ty@ellerman.id.au>
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

On Wed, 7 Apr 2021 20:57:38 +0800, Yu Kuai wrote:
> The sparse tool complains as follows:
> 
> drivers/macintosh/windfarm_core.c:59:20: warning:
>  symbol 'wf_thread' was not declared. Should it be static?
> 
> This symbol is not used outside of windfarm_core.c, so this
> commit marks it static.

Applied to powerpc/next.

[1/1] windfarm: make symbol 'wf_thread' static
      https://git.kernel.org/powerpc/c/4204ecd598cb0a044e6fcfd48e569080955347f4

cheers
