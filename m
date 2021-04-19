Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B80F363A18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:08:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtbc14hfz3fPd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:08:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVZ2L5Fz3cLh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:22 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVY4vwpz9vGp; Mon, 19 Apr 2021 14:04:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, benh@kernel.crashing.org, alistair@popple.id.au,
 mpe@ellerman.id.au, paulus@samba.org, Li Huafei <lihuafei1@huawei.com>,
 jniethe5@gmail.com
In-Reply-To: <20210408033951.28369-1-lihuafei1@huawei.com>
References: <20210408033951.28369-1-lihuafei1@huawei.com>
Subject: Re: [PATCH -next] powerpc/security: Make symbol 'stf_barrier' static
Message-Id: <161880479001.1398509.6935026820404555887.b4-ty@ellerman.id.au>
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

On Thu, 8 Apr 2021 11:39:51 +0800, Li Huafei wrote:
> The sparse tool complains as follows:
> 
> arch/powerpc/kernel/security.c:253:6: warning:
>  symbol 'stf_barrier' was not declared. Should it be static?
> 
> This symbol is not used outside of security.c, so this commit marks it
> static.

Applied to powerpc/next.

[1/1] powerpc/security: Make symbol 'stf_barrier' static
      https://git.kernel.org/powerpc/c/7f262b4dcf7edf75097c3946e676d6c6d77fc599

cheers
