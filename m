Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A944363A17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:08:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtbG15Zmz3fJL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:08:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVY6nP5z3cKn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:21 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVW5p1zz9vDw; Mon, 19 Apr 2021 14:04:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, mahesh@linux.ibm.com, benh@kernel.crashing.org,
 mpe@ellerman.id.au, santosh@fossix.org, christophe.leroy@csgroup.eu,
 paulus@samba.org, Li Huafei <lihuafei1@huawei.com>, ganeshgr@linux.ibm.com,
 clg@kaod.org
In-Reply-To: <20210408035802.31853-1-lihuafei1@huawei.com>
References: <20210408035802.31853-1-lihuafei1@huawei.com>
Subject: Re: [PATCH -next] powerpc/mce: Make symbol 'mce_ue_event_work' static
Message-Id: <161880479027.1398509.16254201379710862051.b4-ty@ellerman.id.au>
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
Cc: zhangjinhao2@huawei.com, yangjihong1@huawei.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 8 Apr 2021 11:58:02 +0800, Li Huafei wrote:
> The sparse tool complains as follows:
> 
> arch/powerpc/kernel/mce.c:43:1: warning:
>  symbol 'mce_ue_event_work' was not declared. Should it be static?
> 
> This symbol is not used outside of mce.c, so this commit marks it
> static.

Applied to powerpc/next.

[1/1] powerpc/mce: Make symbol 'mce_ue_event_work' static
      https://git.kernel.org/powerpc/c/f6f1f48e8b3b242dfa684d6e1b930d239d87533a

cheers
