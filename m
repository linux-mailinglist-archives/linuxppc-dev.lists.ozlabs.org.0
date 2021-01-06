Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB512EB770
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 02:06:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9WR15yjGzDqdt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 12:06:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9WNg6G79zDqZ9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jan 2021 12:04:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4D9WNg4jNMz9sVk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jan 2021 12:04:35 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4D9WNg43rzz9sVs; Wed,  6 Jan 2021 12:04:35 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=23.128.96.9; helo=mail.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
X-Greylist: delayed 417 seconds by postgrey-1.36 at bilbo;
 Wed, 06 Jan 2021 12:04:35 AEDT
Received: from mail.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4D9WNg0L4hz9sVk
 for <linuxppc-dev@ozlabs.org>; Wed,  6 Jan 2021 12:04:34 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id D5A794CBCE1FD;
 Tue,  5 Jan 2021 16:57:32 -0800 (PST)
Date: Tue, 05 Jan 2021 16:57:32 -0800 (PST)
Message-Id: <20210105.165732.1163341792000656368.davem@davemloft.net>
To: mpe@ellerman.id.au
Subject: Re: [PATCH v2] net: ethernet: fs_enet: Add missing MODULE_LICENSE
From: David Miller <davem@davemloft.net>
In-Reply-To: <20210105091515.87509-1-mpe@ellerman.id.au>
References: <20210105091515.87509-1-mpe@ellerman.id.au>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Tue, 05 Jan 2021 16:57:33 -0800 (PST)
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
Cc: andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, kuba@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>
Date: Tue,  5 Jan 2021 20:15:15 +1100

> Since commit 1d6cd3929360 ("modpost: turn missing MODULE_LICENSE()
> into error") the ppc32_allmodconfig build fails with:
> 
>   ERROR: modpost: missing MODULE_LICENSE() in drivers/net/ethernet/freescale/fs_enet/mii-fec.o
>   ERROR: modpost: missing MODULE_LICENSE() in drivers/net/ethernet/freescale/fs_enet/mii-bitbang.o
> 
> Add the missing MODULE_LICENSEs to fix the build. Both files include a
> copyright header indicating they are GPL v2.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied.
