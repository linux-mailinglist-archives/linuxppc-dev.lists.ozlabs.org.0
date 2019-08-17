Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 236639122B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 20:12:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 469pFT5VNdzDrbj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Aug 2019 04:12:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="kJuCaxcV"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 469pCg1QTpzDrQ3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Aug 2019 04:11:10 +1000 (AEST)
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AE2D206DF;
 Sat, 17 Aug 2019 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566065468;
 bh=wc7eTRLiEcYYmYpaLb6Z5l3HQX0RaJTCiwllmXpt9TM=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=kJuCaxcVOP8W8PaXCBwEE/ArPPwNejN89wqwvyXqwdQ+VTnV4XrxmY7XaR26RLDZw
 uXh+D3dgiGHqIydQdRXruEWMFaMODwWfKstWC0zIM6MWZgIZBbVonoXAqs4kO0UB7I
 izHY3JJNh1BbE/IAFwxJorILeuwoKwySR8fku/J0=
Date: Sat, 17 Aug 2019 18:11:07 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
To: erhard_f@mailbox.org, Chris Mason <clm@fb.com>,
Subject: Re: [PATCH] btrfs: fix allocation of bitmap pages.
In-Reply-To: <20190817074439.84C6C1056A3@localhost.localdomain>
References: <20190817074439.84C6C1056A3@localhost.localdomain>
Message-Id: <20190817181108.0AE2D206DF@mail.kernel.org>
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
Cc: , linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: 69d2480456d1 btrfs: use copy_page for copying pages instead of memcpy.

The bot has tested the following trees: v5.2.9, v4.19.67.

v5.2.9: Build OK!
v4.19.67: Failed to apply! Possible dependencies:
    f8b00e0f06e5 ("btrfs: remove unneeded NULL checks before kfree")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

--
Thanks,
Sasha
