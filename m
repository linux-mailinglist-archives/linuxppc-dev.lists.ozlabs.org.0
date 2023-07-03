Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA20745528
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:57:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZvF3kZ8z3dJk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:57:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZp35btXz3bYt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:52:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZp315s2z4wb5;
	Mon,  3 Jul 2023 15:52:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Paul Gortmaker <paul.gortmaker@windriver.com>
In-Reply-To: <20230620043300.197546-1-paul.gortmaker@windriver.com>
References: <20230620043300.197546-1-paul.gortmaker@windriver.com>
Subject: Re: [PATCH v2 0/2] Remove some e500/MPC85xx evaluation platforms
Message-Id: <168836201901.50010.13037565611998441767.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:59 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Pali Rohár <pali@kernel.org>, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 20 Jun 2023 00:32:58 -0400, Paul Gortmaker wrote:
> v1: https://lore.kernel.org/all/20230221194637.28436-1-paul.gortmaker@windriver.com/
> 
> v1 --> v2:
>    -don't remove MPC8568MDS or P1021 or P1012 platforms as per discussion
>    -drop commit #4 that removed kernel fragments still in use elsewhere.
>    -trivial refresh for the updated baseline of linux-next
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: drop MPC8540_ADS and MPC8560_ADS platform support
      https://git.kernel.org/powerpc/c/384e338a9187e479349c97c9cfb36f6060708db8
[2/2] powerpc: drop MPC85xx_CDS platform support
      https://git.kernel.org/powerpc/c/b751ed04bc5e1b76f2885b846ea8289792a37166

cheers
