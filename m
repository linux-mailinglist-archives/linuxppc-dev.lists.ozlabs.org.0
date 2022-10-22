Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6BA608F56
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 21:46:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvsKf5PzLz3drj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Oct 2022 06:46:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QH1i6VZD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sj@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QH1i6VZD;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mvqy80kWJz303N
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Oct 2022 05:44:47 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EF5F5B80171;
	Sat, 22 Oct 2022 18:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F6AC433D7;
	Sat, 22 Oct 2022 18:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666464281;
	bh=rOUU30Ns40RaPB0p9BJDk4013bR8TLp0a0aP/lu3CGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QH1i6VZDzmLtoKIfZRdZlY5d0nnl5DOOq4/LqxYE5FlmXq1e/ayVWYrKNPQTQfyTm
	 lDWgFVezS94kXpPQqLVZatcxNDhidctINkWrhuWdQswTmu6mz+CfseCYZ+3W8aNf/D
	 BNkZScXW3d2V3kASY+/66HDGLtFJ5ipyIa5e8xIAsg2O2gipHt0u3nXAKd6fgttKgZ
	 NC4qpNwwmaHrG3GXHMyiFE9RiFlknggaV/ZCAfsoGqw84Y8dfHy2yZiRWd2Z5DPiV2
	 OT+zRHLzLLt4Xmw92V6rNOqAbn6uKoF3nU46vq2IUtHpqclZiRhC/zWn5A1+rqtQtz
	 yzpn0LslOhDww==
From: SeongJae Park <sj@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v1 1/5] treewide: use get_random_u32_below() instead of deprecated function
Date: Sat, 22 Oct 2022 18:44:36 +0000
Message-Id: <20221022184436.33750-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221022014403.3881893-2-Jason@zx2c4.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 23 Oct 2022 06:46:01 +1100
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
Cc: damon@lists.linux.dev, "Darrick J . Wong" <djwong@kernel.org>, linux-mips@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-m
 mc@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jason,

Cc-ing damon@lists.linux.dev and linux-mm@kvack.org.

On Fri, 21 Oct 2022 21:43:59 -0400 "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> This is a simple mechanical transformation done by:
> 
> @@
> expression E;
> @@
> - prandom_u32_max(E)
> + get_random_u32_below(E)
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
[...]
>  include/linux/damon.h                         |  2 +-

For the damon.h part,

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ
