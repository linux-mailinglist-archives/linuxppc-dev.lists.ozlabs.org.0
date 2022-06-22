Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3405545A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 13:13:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSgk00w0xz3bqY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 21:13:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=l5mm9mk8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=l5mm9mk8;
	dkim-atps=neutral
X-Greylist: delayed 565 seconds by postgrey-1.36 at boromir; Wed, 22 Jun 2022 21:13:12 AEST
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSgjN64kkz2yw3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 21:13:12 +1000 (AEST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 7271A22238;
	Wed, 22 Jun 2022 13:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1655895815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aBtd961AtvmJMz12rN1xdgEhy6lx5FNcxorgMS7aEYk=;
	b=l5mm9mk8jW1WKydNdLijg4SMlz53lnrVVQOXqiE5Ql70KDKnf+W2Paawv4CAzycYsJTYjh
	VNT74Hw8oTPepOgBqb05gvIkWxz4aXuwaJy0oJAPnbUeWaDgGpChvwv/nkZ8AqN54LJH8i
	lf6sleRhgncqfm7/P84gbI9jRneWltI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 22 Jun 2022 13:03:33 +0200
From: Michael Walle <michael@walle.cc>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 0/7] soc: fsl: guts: cleanups and serial_number
 support
In-Reply-To: <20220404095609.3932782-1-michael@walle.cc>
References: <20220404095609.3932782-1-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0bde7550b0bbd1b0a478139d296f92a2@walle.cc>
X-Sender: michael@walle.cc
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Li Yang <leoyang.li@nxp.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 2022-04-04 11:56, schrieb Michael Walle:
> [Resend because of new development cycle. Shawn, can this series get
> through your tree? Sorry you weren't on CC on the former submissions.]
> 
> This series converts the guts driver from a platform driver to just an
> core_initcall. The driver itself cannot (or rather should never) be
> unloaded because others depends on detecting the current SoC revision
> to apply chip errata. Other SoC drivers do it the same way. Overall I
> got rid of all the global static variables.
> 
> The last patch finally adds unique id support to the guts driver. DT
> binding can be found at:
>   Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml
> 
> changes since v1:
>  - call kfree() in error case, thanks Dan
>  - add missing of_node_put(np), thanks Dan
> 
> Michael Walle (7):
>   soc: fsl: guts: machine variable might be unset
>   soc: fsl: guts: remove module_exit() and fsl_guts_remove()
>   soc: fsl: guts: embed fsl_guts_get_svr() in probe()
>   soc: fsl: guts: allocate soc_dev_attr on the heap
>   soc: fsl: guts: use of_root instead of own reference
>   soc: fsl: guts: drop platform driver
>   soc: fsl: guts: add serial_number support
> 
>  drivers/soc/fsl/guts.c | 219 ++++++++++++++++++++++-------------------
>  1 file changed, 118 insertions(+), 101 deletions(-)

There goes another kernel release without any comments on this
series :(

Shawn, can you pick this up and give it some time in linux-next?

-michael
