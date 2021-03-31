Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2D034F61F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:19:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97kW4cxNz3dZ8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:18:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97Xk6G5Lz3c78
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:30 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97Xk3mhWz9srX; Wed, 31 Mar 2021 12:10:29 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210314093333.132657-1-mpe@ellerman.id.au>
References: <20210314093333.132657-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Fix section mismatch warning in smp_setup_pacas()
Message-Id: <161715297845.226945.15209464603661875737.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:38 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 14 Mar 2021 20:33:33 +1100, Michael Ellerman wrote:
> Section mismatch in reference from the function .smp_setup_pacas() to
> the function .init.text:.allocate_paca()
> 
> The only caller of smp_setup_pacas() is setup_arch() which is __init,
> so mark smp_setup_pacas() __init.

Applied to powerpc/next.

[1/1] powerpc: Fix section mismatch warning in smp_setup_pacas()
      https://git.kernel.org/powerpc/c/55c2f5574a013d2dbf1012a2ad93cb8d947279a7

cheers
