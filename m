Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF617CF010
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 08:27:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nOG+A8w8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9yRy0fmzz3ckN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 17:27:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nOG+A8w8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9yQz05FFz2yVZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 17:26:15 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ECC220007;
	Thu, 19 Oct 2023 06:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697696763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNNRaG2dqKNviipuJLjD/k7aYF+k9GHOUwNhRm6P7tc=;
	b=nOG+A8w8Ex2Py8fK1x1jePPuCwk8ZCKopqO8U4eGAQ1krekFAbawqQt8P22mqV/985zz03
	mRwy4Wd9kMxT2hkfpaj5XeSMqOixZEyrLK+kF9Di8r6EVzRg00O1I1T6mRSH6ve0PYGNtH
	rZjsAyHlVyYCP0jyPXEEsMvn1V3KFZa2p9qyVMueNHCoQ0AKiCHMe3NylwEWM18sm0lqwx
	AuwaQg1gLgFH0KM1kyrqGNrhtmH1V08P7gYAlgc6CHSR//1NhwcQs8zsGkT5Dw17HQtElD
	PYCYlRe5Q2l2dcln2xal8V5TbEXH3SPFLTizGEJv8rTkZQ9WOhU7hMqwiVoSAA==
Date: Thu, 19 Oct 2023 08:25:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yi Yang <yiyang13@huawei.com>
Subject: Re: [PATCH v2] mtd: powernv_flash: check return value of
 devm_kasprintf()
Message-ID: <20231019082556.5053b900@xps-13>
In-Reply-To: <20231019013050.316022-1-yiyang13@huawei.com>
References: <20231019013050.316022-1-yiyang13@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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
Cc: robh@kernel.org, vigneshr@ti.com, richard@nod.at, tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org, npiggin@gmail.com, u.kleine-koenig@pengutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yi,

yiyang13@huawei.com wrote on Thu, 19 Oct 2023 01:30:50 +0000:

> devm_kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful by
> checking the pointer validity.
>=20
> Fixes: acfe63ec1c59 ("mtd: Convert to using %pOFn instead of device_node.=
name")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>

Please re-read my previous answer and address all comments.

Thanks,
Miqu=C3=A8l
