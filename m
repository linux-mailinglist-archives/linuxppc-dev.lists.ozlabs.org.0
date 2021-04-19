Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D53EA363A1F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:10:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtdc673rz3fp7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:10:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVq1xvlz3cVw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:35 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVl0sGnz9vH5; Mon, 19 Apr 2021 14:04:30 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: benh@kernel.crashing.org, mpe@ellerman.id.au, christophe.leroy@c-s.fr,
 joel@jms.id.au, paulus@samba.org, Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20210408062012.85973-1-pulehui@huawei.com>
References: <20210408062012.85973-1-pulehui@huawei.com>
Subject: Re: [PATCH -next] powerpc/fadump: make symbol
 'rtas_fadump_set_regval' static
Message-Id: <161880480163.1398509.9529896301333711688.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 14:00:01 +1000
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
Cc: zhangjinhao2@huawei.com, yangjihong1@huawei.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 8 Apr 2021 14:20:12 +0800, Pu Lehui wrote:
> Fix sparse warnings:
> 
> arch/powerpc/platforms/pseries/rtas-fadump.c:250:6: warning:
>  symbol 'rtas_fadump_set_regval' was not declared. Should it be static?

Applied to powerpc/next.

[1/1] powerpc/fadump: make symbol 'rtas_fadump_set_regval' static
      https://git.kernel.org/powerpc/c/59fd366b9bef2d048af763e27cd1622ee5a1dfd4

cheers
