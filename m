Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C2533A407
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 11:03:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dyw9w06nvz3dwT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 21:03:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dyw7B0m0gz3cSP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 21:01:26 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Dyw792nfGz9sWj; Sun, 14 Mar 2021 21:01:25 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210218123058.748882-1-mpe@ellerman.id.au>
References: <20210218123058.748882-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/4xx: Fix build errors from mfdcr()
Message-Id: <161571586978.138988.9208711581610669921.b4-ty@ellerman.id.au>
Date: Sun, 14 Mar 2021 21:01:25 +1100 (AEDT)
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
Cc: feng.tang@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 18 Feb 2021 23:30:58 +1100, Michael Ellerman wrote:
> lkp reported a build error in fsp2.o:
> 
>   CC      arch/powerpc/platforms/44x/fsp2.o
>   {standard input}:577: Error: unsupported relocation against base
> 
> Which comes from:
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/4xx: Fix build errors from mfdcr()
      https://git.kernel.org/powerpc/c/eead089311f4d935ab5d1d8fbb0c42ad44699ada

cheers
