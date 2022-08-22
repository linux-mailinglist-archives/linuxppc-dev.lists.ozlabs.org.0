Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E41D59C2BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 17:29:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBGW21L2jz3cFp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 01:29:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T50xCBWW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T50xCBWW;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBGVM75mGz3byv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 01:28:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A3CF6112F;
	Mon, 22 Aug 2022 15:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B499C43470;
	Mon, 22 Aug 2022 15:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661182135;
	bh=SIasQlAEFjGCSRt/CEHtDDFWf9zOQKXzw2OystW7yS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T50xCBWWaV5QoBpJDmOOFH7Mff5Ib3Sev/Y9BLrJWykYJ87jo/wnqMfaMqHLHxCzO
	 ebFN6eCI8NbUWyBIA8kbmOD5Etwx4FgXmHg8xoY51bRmNI6YJl7odKqs8ZbVhIHzCU
	 WFKpgEVoWcaNEhC3qnnUy3FKM1/qtvzKqWbNMjVcVjH8ixbZo+fzhKUqkMN6vQh8g9
	 PjfbcQgo0bV1FCdyvjRNZgkaSWCHOqDBcPBYxkDcfF8Glg17GRmEV9KyotXfRm5SwQ
	 jUE1Jl6aZtBvQt7jikq9qpJ7Ee0pyKUSfviMm/G5P9sO/CaJBB5Bk9CmqfIpdhWG/Y
	 VuMBeSExtUq8w==
Received: by pali.im (Postfix)
	id 63EDD97B; Mon, 22 Aug 2022 17:28:52 +0200 (CEST)
Date: Mon, 22 Aug 2022 17:28:52 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Add support for early debugging via Serial
 16550 console
Message-ID: <20220822152852.y5fjpmjjasbu2wab@pali>
References: <20220819211254.22192-1-pali@kernel.org>
 <35c0ff6a-387d-3c01-66b3-f659cfe67c2a@infradead.org>
 <20220819223848.lvxakjjzfdjvyqgu@pali>
 <d12435b4-0caa-ba06-f0a5-8c9268bb8dfd@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d12435b4-0caa-ba06-f0a5-8c9268bb8dfd@csgroup.eu>
User-Agent: NeoMutt/20180716
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
Cc: Nick Child <nick.child@ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Mackerras <paulus@samba.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 22 August 2022 14:13:30 Christophe Leroy wrote:
> >> CONFIG_PPC_EARLY_DEBUG_16550=y
> >> # CONFIG_PPC_EARLY_DEBUG_MEMCONS is not set
> >> CONFIG_PPC_EARLY_DEBUG_16550_PHYSADDR=
> >> CONFIG_PPC_EARLY_DEBUG_16550_STRIDE=1
> >>
> >> which then causes a kconfig prompt when starting
> >> the build...
> > 
> > Cannot we set somehow that PPC_EARLY_DEBUG_16550 would be disabled by
> > default when upgrading defconfig?
> 
> The only solution I see is to put it at the end of the list, so that the 
> previous default value which is PPC_EARLY_DEBUG_MEMCONS gets selected.

Does it work for all cases? If yes, then it looks like an elegant solution.
