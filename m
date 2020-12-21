Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A742DFB80
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 12:29:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czy0r6Z7XzDq8t
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 22:29:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzxR80K1kzDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 22:03:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4CzxR7653Yz9sVm; Mon, 21 Dec 2020 22:03:31 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CzxR73tKLz9sWD; Mon, 21 Dec 2020 22:03:31 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20201023040002.3313371-1-mpe@ellerman.id.au>
References: <20201023040002.3313371-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Add config fragment for disabling -Werror
Message-Id: <160854857958.1696279.5155996292611631065.b4-ty@ellerman.id.au>
Date: Mon, 21 Dec 2020 22:03:31 +1100 (AEDT)
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

On Fri, 23 Oct 2020 15:00:02 +1100, Michael Ellerman wrote:
> This makes it easy to disable building with -Werror:
> 
>   $ make defconfig
>   $ grep WERROR .config
>   # CONFIG_PPC_DISABLE_WERROR is not set
>   CONFIG_PPC_WERROR=y
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Add config fragment for disabling -Werror
      https://git.kernel.org/powerpc/c/c15d1f9d03a0f4f68bf52dffdd541c8054e6de35

cheers
