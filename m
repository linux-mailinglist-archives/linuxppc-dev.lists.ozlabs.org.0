Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C80E822259F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:31:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6xXC5V9HzDqc6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:31:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vQL0vDMzDqly
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vQF6sjHz9sVl; Thu, 16 Jul 2020 22:56:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, mpe@ellerman.id.au, groug@kaod.org,
 benh@kernel.crashing.org, YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20200715025040.33952-1-yuehaibing@huawei.com>
References: <20200715025040.33952-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] powerpc/xive: Remove unused inline function
 xive_kexec_teardown_cpu()
Message-Id: <159490401670.3805857.414808886972366764.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:56:19 +1000 (AEST)
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

On Wed, 15 Jul 2020 10:50:40 +0800, YueHaibing wrote:
> commit e27e0a94651e ("powerpc/xive: Remove xive_kexec_teardown_cpu()")
> left behind this, remove it.

Applied to powerpc/next.

[1/1] powerpc/xive: Remove unused inline function xive_kexec_teardown_cpu()
      https://git.kernel.org/powerpc/c/29d9407e1037868b59d12948d42ad3ef58fc3a5a

cheers
