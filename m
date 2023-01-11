Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 967CE6652EB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 05:45:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsFTy3nfnz3bZn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 15:45:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e3t9Y377;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e3t9Y377;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsFT31xvZz3bZn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 15:44:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E6C126195C;
	Wed, 11 Jan 2023 04:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01849C433EF;
	Wed, 11 Jan 2023 04:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673412259;
	bh=qaUYBRYmWbqBGZhHnLUAONEN9YZTBsX4mroopazyi0I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e3t9Y3779jVPIyKv3Zt8HGqA+d4tHmFvNli1yk09qr/nnWq5Ytw5FM80xBgfud9Rp
	 QGgb4gNZgz9kURKT3ytd7Dz7e6ac/4qIDs4hbuqZf5tfqeokPu1jlzaQIaZMDxGZ80
	 YtfLHfflWphpxSQxhlCn7kQs9qhWcAqegpSbY0rE0xcN1TtTkvBDzXhctnLHXaq+Hd
	 O8L5H38A0FJojuGckI7z3qCtGieFuZ2YcSNHhtfCYcDHr8pv+SID1wybkGgFC6+eqL
	 fwi4RfvUU19FiBdyU21gG9GJwyVfjkm/bK9Rc8tx2k+oJtssclgFGgq+IMSL5Ago0i
	 gQ3wrgJpwsVBg==
Date: Tue, 10 Jan 2023 20:44:18 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Esina Ekaterina <eesina@astralinux.ru>
Subject: Re: [PATCH v2] net: wan: Add checks for NULL. If uhdlc_priv_tsa !=
 1 then utdm is not initialized. And if ret != NULL then goto
 undo_uhdlc_init, where utdm is dereferenced. Same if dev == NULL.
Message-ID: <20230110204418.79f43f45@kernel.org>
In-Reply-To: <20230110114745.43894-1-eesina@astralinux.ru>
References: <20230110114745.43894-1-eesina@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 10 Jan 2023 14:47:45 +0300 Esina Ekaterina wrote:
> Subject: [PATCH v2] net: wan: Add checks for NULL. If uhdlc_priv_tsa != 1 then utdm is not initialized. And if ret != NULL then goto undo_uhdlc_init, where utdm is dereferenced. Same if dev == NULL.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Esina Ekaterina <eesina@astralinux.ru>
> 
> v2: Add check for NULL for unmap_si_regs
> ---

The format of your commit is wrong. You should make the commit message
look like this in git:

  net: wan: Add checks for NULL

  If uhdlc_priv_tsa != 1 then utdm is not initialized. 
  And if ret != NULL then goto undo_uhdlc_init, where 
  utdm is dereferenced. Same if dev == NULL.

  Found by Linux Verification Center (linuxtesting.org) with SVACE.
 
  Signed-off-by: Esina Ekaterina <eesina@astralinux.ru>
  ---
  v2: Add check for NULL for unmap_si_regs

But the first line (subject) is still not specific enough.
Refer to the bug that's being fixed, not how it's fixed.

Also no braces needed around single-line if blocks.
