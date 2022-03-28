Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 062464EA15D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 22:20:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KS3wz63BPz3c31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 07:20:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nccR77Dm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nccR77Dm; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KS3wP1pRzz3c00
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 07:20:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D57EFB81205;
 Mon, 28 Mar 2022 20:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF991C340F0;
 Mon, 28 Mar 2022 20:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648498816;
 bh=DYKSgCLyLSG5eVAyXEXBJzv5wUb4KbwLHueX4TuM2es=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nccR77DmMt5fnc/o6gzPVyT3/n47SLxU5yK+UpwKdHx+DMcaLuX/6OketRHPbmZK4
 q8cXPhOeS5U/lTt4ZBRJMWdOApW5jbpoUqhxVh/BedGBZMTMV5wkH3BtP7s6iGDW7Q
 y0QdQapyEyF3Bt/RYtFN3DcVWfO6ymXfIwUMVbM0YopTHxL2aIt7JhbD6dj4ejWOxW
 pc+m/7ZMIf0Ie62Bdb6sgKnlk4iE+Z9kmM5yyWzogfPqXEglCECce8tPm4qxiKW+nA
 n66IatdJU8T97URqDPNt56LnxyLR99fOCTtEa0OoWadqYlrX2oFEX/OYDMGmH5+pqh
 E51HpRAN1M85Q==
Date: Mon, 28 Mar 2022 13:20:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Benjamin =?UTF-8?B?U3TDvHJ6?= <benni@stuerz.xyz>
Subject: Re: [PATCH 00/22] Replace comments with C99 initializers
Message-ID: <20220328132014.6b8c0a21@kernel.org>
In-Reply-To: <cc104272-d79a-41e1-f4de-cb78fb073991@stuerz.xyz>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <8f9271b6-0381-70a9-f0c2-595b2235866a@stuerz.xyz>
 <87fsn2zaix.fsf@kernel.org>
 <cc104272-d79a-41e1-f4de-cb78fb073991@stuerz.xyz>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, linux-atm-general@lists.sourceforge.net,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-input@vger.kernel.org, wcn36xx@lists.infradead.org,
 linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Mar 2022 13:51:42 +0200 Benjamin St=C3=BCrz wrote:
> > Just a small tip: If you are new, start with something small and learn
> > from that. Don't do a controversial big patchset spanning multiple
> > subsystems, that's the hard way to learn things. First submit one patch
> > at a time to one subsystem and gain understanding of the process that
> > way.
>=20
> I actually thought this would be such simple thing. Do you know of any
> good thing where to start? I already looked into drivers/staging/*/TODO
> and didn't found something for me personally.

FWIW on the netdev side there's work coming to convert a set of features
from unsigned long to a BITMAP which will require converting a lot of
drivers to an explicit helpers from direct access.

https://lore.kernel.org/all/20220324154932.17557-14-shenjian15@huawei.com/

If it seems interesting enough you can try reaching out to Jian Shen.
