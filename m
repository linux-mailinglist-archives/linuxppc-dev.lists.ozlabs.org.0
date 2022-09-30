Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C165F0BD7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 14:41:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf8wz3Fvpz3cdW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 22:41:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T6RakQqx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=kabel@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T6RakQqx;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf8wL71FPz2xyB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 22:40:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B3156B828D7;
	Fri, 30 Sep 2022 12:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F90C433D6;
	Fri, 30 Sep 2022 12:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664541645;
	bh=JaemdEB8Tz0oLNGh2q7yrWCufRhyktkyw9BpZMOIDuw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T6RakQqxYSkyYzDNBanm9oPDbcZY3fBjEHy8fajXEA62mTfBju9w9zaxdOL6sksjs
	 rYKUkvaLtEJrED0EPGa85/BUjrL54obsJmBsv9oMYR8mebIDKB1n9PAthuYcLInkta
	 u6GaXPIfoQ+pM/0c1pwdPXcWmrKBDmR4uHUOb4DEPfAvU/5e8N7IKXg4lXhrMpQ73U
	 4FdxHrtv6hy4GorQ48xOMwmS7X8cjaPIiK/w71fukYFGgH5mhTWEryg5GZRP7ez+uH
	 z2PzJYnaansTQTTXEUYs1WZjoodq4imyvVQR3SHM/ZPYIEOLSaKnXrXM2qHgu6L3o0
	 aHVgoA+3LS9PQ==
Date: Fri, 30 Sep 2022 14:40:40 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH] powerpc: dts: turris1x.dts: Add channel labels for
 temperature sensor
Message-ID: <20220930144040.666a6090@dellmb>
In-Reply-To: <20220930123901.10251-1-pali@kernel.org>
References: <20220930123901.10251-1-pali@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Josef Schlehofer <josef.schlehofer@nic.cz>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 30 Sep 2022 14:39:01 +0200
Pali Roh=C3=A1r <pali@kernel.org> wrote:

> Channel 0 of SA56004ED chip refers to internal SA56004ED chip sensor (chip
> itself is located on the board) and channel 1 of SA56004ED chip refers to
> external sensor which is connected to temperature diode of the P2020 CPU.
>=20
> Fixes: 54c15ec3b738 ("powerpc: dts: Add DTS file for CZ.NIC Turris 1.x ro=
uters")
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
