Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D70666B6A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 08:10:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NswgF0HKMz3fBs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 18:10:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZI1IE3Cf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=leon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZI1IE3Cf;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NswfH59HXz3c4x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 18:09:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AD9C7CE1D71;
	Thu, 12 Jan 2023 07:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107B3C433D2;
	Thu, 12 Jan 2023 07:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673507378;
	bh=Oqydj0oJ7lWgc8KOd0cdULCtOKRcsaepxFT40526GeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZI1IE3CfJnmRKlQxUvFKU4HC2yLudSu10piwKyFxLs2wpnk2yv5JAtH2ZoEsg/r5Y
	 nNdZ+MEEoVi2ivlYrIckNxC7b5QAiRZNEi+QVwdCdJAxbZpzPNwahSelwwKmhkH+8m
	 CE5IVFBk9cL5JPxxk49qdqaLpQrFj4QxiHPCORdGym/voqAYBMyIEnRor1Q7LpuFcb
	 zfrQsB+Esn8uhsuWMuAto+4Ukeu362Nug+cyGC4z06w+M94Q8Tus325z4sXeSrBlQo
	 0hb78fq7QCXRebgc81y0w3CWoCfnUB51VGYMkXPSbx9u7PWLihAvGrtiiusrQZpV6+
	 Hra6G/rhgXpWA==
Date: Thu, 12 Jan 2023 09:09:34 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Esina Ekaterina <eesina@astralinux.ru>
Subject: Re: [PATCH v4] net: wan: Add checks for NULL for utdm in
 undo_uhdlc_init and unmap_si_regs
Message-ID: <Y7+yLgGr1GO/rXun@unreal>
References: <20230111102848.44863b9c@kernel.org>
 <20230111195533.82519-1-eesina@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111195533.82519-1-eesina@astralinux.ru>
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
Cc: lvc-project@linuxtesting.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 11, 2023 at 10:55:33PM +0300, Esina Ekaterina wrote:
> If uhdlc_priv_tsa != 1 then utdm is not initialized.
> And if ret != NULL then goto undo_uhdlc_init, where
> utdm is dereferenced. Same if dev == NULL.
> 
> Found by Astra Linux on behalf of Linux Verification Center
> (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Esina Ekaterina <eesina@astralinux.ru>
>   ---
> v4: Fix style
> v3: Remove braces
> v2: Add check for NULL for unmap_si_regs
> ---
>  drivers/net/wan/fsl_ucc_hdlc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

In addition to what Jakub said, please don't send patches as reply-to.
Please sent them as new threads.

Thanks
