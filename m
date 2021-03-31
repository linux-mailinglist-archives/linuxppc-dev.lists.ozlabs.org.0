Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE4334F609
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:16:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97gR6P2Mz3fnn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:16:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XY6W9fz3c7Y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:21 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XY0c3hz9sf9; Wed, 31 Mar 2021 12:10:20 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, He Ying <heying24@huawei.com>, clg@kaod.org,
 dja@axtens.net, rppt@kernel.org, mpe@ellerman.id.au,
 christophe.leroy@csgroup.eu, benh@kernel.crashing.org,
 aneesh.kumar@linux.ibm.com, paulus@samba.org, akpm@linux-foundation.org,
 ardb@kernel.org
In-Reply-To: <20210316041148.29694-1-heying24@huawei.com>
References: <20210316041148.29694-1-heying24@huawei.com>
Subject: Re: [PATCH] powerpc: arch/powerpc/kernel/setup_64.c - cleanup warnings
Message-Id: <161715298036.226945.370266141807077592.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:40 +1100
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Mar 2021 00:11:48 -0400, He Ying wrote:
> warning: symbol 'rfi_flush' was not declared.
> warning: symbol 'entry_flush' was not declared.
> warning: symbol 'uaccess_flush' was not declared.
> We found warnings above in arch/powerpc/kernel/setup_64.c by using
> sparse tool.
> 
> Define 'entry_flush' and 'uaccess_flush' as static because they are not
> referenced outside the file. Include asm/security_features.h in which
> 'rfi_flush' is declared.

Applied to powerpc/next.

[1/1] powerpc: arch/powerpc/kernel/setup_64.c - cleanup warnings
      https://git.kernel.org/powerpc/c/d2313da4ff56bd631a3afe7a17992ed5bd0e04a6

cheers
