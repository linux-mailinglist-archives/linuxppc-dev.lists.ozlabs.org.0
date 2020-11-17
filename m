Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 010E42B7208
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 00:17:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbMKF4SJdzDqbp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 10:17:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbMHP4phGzDqXg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 10:15:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4CbMHP3Jwcz9sRR; Wed, 18 Nov 2020 10:15:29 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CbMHP2tSgz9sSn; Wed, 18 Nov 2020 10:15:29 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20201116120913.165317-1-mpe@ellerman.id.au>
References: <20201116120913.165317-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Drop -me200 addition to build flags
Message-Id: <160565490600.491761.10215082379059532791.b4-ty@ellerman.id.au>
Date: Wed, 18 Nov 2020 10:15:29 +1100 (AEDT)
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
Cc: oss@buserror.net, natechancellor@gmail.com, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 16 Nov 2020 23:09:13 +1100, Michael Ellerman wrote:
> Currently a build with CONFIG_E200=y will fail with:
> 
>   Error: invalid switch -me200
>   Error: unrecognized option -me200
> 
> Upstream binutils has never supported an -me200 option. Presumably it
> was supported at some point by either a fork or Freescale internal
> binutils.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Drop -me200 addition to build flags
      https://git.kernel.org/powerpc/c/e02152ba2810f7c88cb54e71cda096268dfa9241

cheers
