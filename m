Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 178CF3639F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:07:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtYs0fKbz3dwW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:07:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVT0FKbz3cGB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:17 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVR5nzHz9tl3; Mon, 19 Apr 2021 14:04:15 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Bixuan Cui <cuibixuan@huawei.com>,
 Liu Shixin <liushixin2@huawei.com>
In-Reply-To: <20210409090109.59347-1-cuibixuan@huawei.com>
References: <20210409090109.59347-1-cuibixuan@huawei.com>
Subject: Re: [PATCH -next] powerpc/pseries: Make symbol
 '__pcpu_scope_hcall_stats' static
Message-Id: <161880479761.1398509.15398715314309643145.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 13:59:57 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 9 Apr 2021 17:01:09 +0800, Bixuan Cui wrote:
> The sparse tool complains as follows:
> 
> arch/powerpc/platforms/pseries/hvCall_inst.c:29:1: warning:
>  symbol '__pcpu_scope_hcall_stats' was not declared. Should it be static?
> 
> This symbol is not used outside of hvCall_inst.c, so this
> commit marks it static.

Applied to powerpc/next.

[1/1] powerpc/pseries: Make symbol '__pcpu_scope_hcall_stats' static
      https://git.kernel.org/powerpc/c/193e4cd8ed9dd01092d01df7706a6b344c946af4

cheers
