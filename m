Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9981974552C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:59:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZxR3pyFz3dk7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:59:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZp71fjcz30PY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:52:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZp654tCz4wxw;
	Mon,  3 Jul 2023 15:52:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Anatolij Gustschin <agust@denx.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Rob Herring <robh@kernel.org>
In-Reply-To: <20230614171724.2403982-1-robh@kernel.org>
References: <20230614171724.2403982-1-robh@kernel.org>
Subject: Re: [PATCH] powerpc: 52xx: Make immr_id DT match tables static
Message-Id: <168836201904.50010.1650566287434945163.b4-ty@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Jun 2023 11:17:23 -0600, Rob Herring wrote:
> In some builds, the mpc52xx_pm_prepare()/lite5200_pm_prepare() functions
> generate stack size warnings. The addition of 'struct resource' in commit
> 2500763dd3db ("powerpc: Use of_address_to_resource()") grew the stack size
> and is blamed for the warnings. However, the real issue is there's no
> reason the 'struct of_device_id immr_ids' DT match tables need to be on
> the stack as they are constant. Declare them as static to move them off
> the stack.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: 52xx: Make immr_id DT match tables static
      https://git.kernel.org/powerpc/c/d65305bfa6f797712b928bd8f4781380726b70a0

cheers
