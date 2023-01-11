Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A806E66649E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 21:11:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nsf383XL5z3chK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 07:11:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a7V/64ys;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a7V/64ys;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nsf294d3mz3bNr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 07:10:57 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D1B261D9E;
	Wed, 11 Jan 2023 20:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F925C433D2;
	Wed, 11 Jan 2023 20:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673467853;
	bh=lbWbDcWNv/5XwINtvzpcEaKEhpxedFtZSa176XyNSec=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a7V/64ys7rleGBVzl7y60dq39WgoyIUoHXkq3nasxaJEPu0s65AJ7gWKTtfs2Vezi
	 S/GvhMkFtdOkZ/oJfrZpr+gLOF0tELnQ6b8kRYLrDrdsE36nbvfmqD0m1v05K3maxM
	 s3flhFjBd04ZKIoB2DlFXmKufh4PkR9UnZFk9AuTy3t1fVd2LbAwcvdKZPeGcNhC0W
	 RL2j5vJLs5POVlCq3oW5pDRdcpqd1ydEyHSFPB9tcpgCdiRIcuB+qrOYsRZwqJhHFX
	 OWGs2xu6eZ8fKfBW+wYoNhvGUFcKk4F6YOjMgDsweQjg1AJ0/f2Tqc6D2/0l44nkZh
	 IZsM36Hs6AHKQ==
Date: Wed, 11 Jan 2023 12:10:52 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Esina Ekaterina <eesina@astralinux.ru>
Subject: Re: [PATCH v4] net: wan: Add checks for NULL for utdm in 
 undo_uhdlc_init and unmap_si_regs
Message-ID: <20230111121052.54fa65e6@kernel.org>
In-Reply-To: <20230111195533.82519-1-eesina@astralinux.ru>
References: <20230111102848.44863b9c@kernel.org>
	<20230111195533.82519-1-eesina@astralinux.ru>
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
Cc: lvc-project@linuxtesting.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 Jan 2023 22:55:33 +0300 Esina Ekaterina wrote:
> Signed-off-by: Esina Ekaterina <eesina@astralinux.ru>
>   ---

This --- is still indented.

On top of that please tag the patch for the tree to which networking
maintainers apply fixes (by specifying [PATCH net v5] instead just
[PATCH v5] in the subject).

And add a Fixes tag. If the bug dates all the way back to the start of
the git era add:

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

otherwise use the commit which added the buggy code.
