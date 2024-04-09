Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF9D89E515
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 23:42:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j8oIrGlv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDfZf3Q3bz3vX3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 07:42:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j8oIrGlv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDfYt0FZYz3d2W
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 07:42:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 96160CE23BE;
	Tue,  9 Apr 2024 21:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDA6C433F1;
	Tue,  9 Apr 2024 21:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712698925;
	bh=5I1KP0MI3m2b78fWq623tWUuBU2WB1RVyh5tQpUvABU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j8oIrGlvoDxbi3j/516Cm5YFo5s1GnfkJb2iZ5gV5X0luxOT0mDFAkkJ6A6SGne37
	 VRsGjGqN2tLqC/uOIioWPZ1od9drdbGbuxES53flCNRPlL4+3RIEvcF3v8OcL5dZa+
	 7DKfuXDL/CBiQ3C6aqOTbzLRtmeIGVjzmJYd4Qqk0611B9yw8PFWuBjblVahoQzpqa
	 uIiqA10UlwOQVhQF7QV+6GKHxfKgWyGhKI3YvpeQL0GjJ9EgKFD+1xgUyxnnynfGjR
	 W35hiPfk8M/x5RCdtlGiZbEi/38cdXV6uVmAlDYQvd7SLba4U+ikLKFPQ1wmu5OsVU
	 23MrTtMBmhFxw==
Date: Tue, 9 Apr 2024 14:42:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] MAINTAINERS: Drop Li Yang as their email address
 stopped working
Message-ID: <20240409144204.00cc76ce@kernel.org>
In-Reply-To: <20240405072042.697182-2-u.kleine-koenig@pengutronix.de>
References: <20240405072042.697182-2-u.kleine-koenig@pengutronix.de>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>, kernel@pengutronix.de, netdev@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri,  5 Apr 2024 09:20:41 +0200 Uwe Kleine-K=C3=B6nig wrote:
> When sending a patch to (among others) Li Yang the nxp MTA replied that
> the address doesn't exist and so the mail couldn't be delivered. The
> error code was 550, so at least technically that's not a temporal issue.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

FWIW it's eaac25d026a1 in net, thanks!
