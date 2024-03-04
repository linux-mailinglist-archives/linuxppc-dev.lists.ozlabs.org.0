Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 605DB8701C0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 13:45:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Dqyp5NRA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpJLl17qYz3cgk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 23:45:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Dqyp5NRA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpJKx6xsyz30YR
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 23:44:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 628A360F35;
	Mon,  4 Mar 2024 12:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD03BC433C7;
	Mon,  4 Mar 2024 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709556256;
	bh=ibr0m6bwybrat6p5oKhqSPl9lIKu4xO6Eqo3Au5t4N0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dqyp5NRA/ASPQgQoh8YmxL2xQ00ZlwdxOuHf0qBz1794AGQKGEbzyygfuZJQYaIsC
	 Qkg1BfzqVoYTszvukj68S9J9rOWQQvQnJzz1Kgb9DS7dJI8ju9PEiUyUNyhLDiCBVI
	 LsitKlvmRJreBxCBbAUUyHSSO5zQjttXJQ8v6t34=
Date: Mon, 4 Mar 2024 13:44:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] usb: gadget: fsl-udc: Replace custom log wrappers by
 pr_{err,warn,debug}
Message-ID: <2024030429-oppressed-crispness-ac9d@gregkh>
References: <20240304121153.750165-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240304121153.750165-2-u.kleine-koenig@pengutronix.de>
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
Cc: linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 04, 2024 at 01:11:53PM +0100, Uwe Kleine-König wrote:
> The custom log wrappers ERR, WARNING and DBG don't add anything useful
> that cannot easily be done with pr_err() and friends. Replace the custom
> stuff by the well known functions from printk.h.

These really should be dev_*() as there is a device structure buried
down in there somewhere :)

thanks,

greg k-h
