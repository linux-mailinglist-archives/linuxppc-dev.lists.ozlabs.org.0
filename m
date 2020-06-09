Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B081F338E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 07:42:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gzXC6sm8zDqVp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 15:42:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzDh1LJ7zDqRs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:28:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzDg6Xgpz9sT5; Tue,  9 Jun 2020 15:28:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, benh@kernel.crashing.org,
 Chen Zhou <chenzhou10@huawei.com>, paulus@samba.org
In-Reply-To: <20200509020838.121660-1-chenzhou10@huawei.com>
References: <20200509020838.121660-1-chenzhou10@huawei.com>
Subject: Re: [PATCH -next] powerpc/powernv: add NULL check after kzalloc
Message-Id: <159168031252.1381411.17963161685967073553.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:35 +1000 (AEST)
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

On Sat, 9 May 2020 10:08:38 +0800, Chen Zhou wrote:
> Fixes coccicheck warning:
> 
> ./arch/powerpc/platforms/powernv/opal.c:813:1-5:
> 	alloc with no test, possible model on line 814
> 
> Add NULL check after kzalloc.

Applied to powerpc/next.

[1/1] powerpc/powernv: add NULL check after kzalloc
      https://git.kernel.org/powerpc/c/ceffa63acce7165c442395b7d64a11ab8b5c5dca

cheers
