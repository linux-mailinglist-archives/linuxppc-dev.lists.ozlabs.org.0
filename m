Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 021E255B807
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 08:54:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWdk56ZCTz3cfy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:54:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K1Ambt0w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K1Ambt0w;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWdjV51Qzz3bsl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 16:53:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3D1CFB80ED6;
	Mon, 27 Jun 2022 06:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D95C341C8;
	Mon, 27 Jun 2022 06:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656312807;
	bh=YMnpQ22y+MGXt/JGuvFPSGFaB2wfRaxnM06BIxHzmEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1Ambt0wQ2JMXXFBCJ0nadm5S4JHO8OJMYGoFHoA7yNXk17o5LtVaW+lL8eQla4ki
	 qNkVznnc1vvBpnQ8ZMblOjOSjokBIYlf3BX0gooAPxi8yzrzcYIVJWHJHK7U+Mno38
	 5GWTiPAXmMCfJM6/c9HSjesq5AynhHkSso8RxosNrUJgA0k57injl69edb2AAuvv5+
	 qnEc4GmLDzovq62U+aiPOrruv9tH3z6fGl+OxieVqhmxkuu28Bq5VfzugnjNht8/Yw
	 f179pcdCCejndqKPePCdciL2cTMvErAwZ8D3pon8gjIm0QBsNMhTT3Bf1lDbqwIdoy
	 AGjQLTmwjCwFw==
Date: Mon, 27 Jun 2022 14:53:21 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH RESEND v2 0/7] soc: fsl: guts: cleanups and serial_number
 support
Message-ID: <20220627065321.GA819983@dragon>
References: <20220404095609.3932782-1-michael@walle.cc>
 <0bde7550b0bbd1b0a478139d296f92a2@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bde7550b0bbd1b0a478139d296f92a2@walle.cc>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Dan Carpenter <dan.carpenter@oracle.com>, Sudeep Holla <Sudeep.Holla@arm.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 22, 2022 at 01:03:33PM +0200, Michael Walle wrote:
> Am 2022-04-04 11:56, schrieb Michael Walle:
> > [Resend because of new development cycle. Shawn, can this series get
> > through your tree? Sorry you weren't on CC on the former submissions.]
> > 
> > This series converts the guts driver from a platform driver to just an
> > core_initcall. The driver itself cannot (or rather should never) be
> > unloaded because others depends on detecting the current SoC revision
> > to apply chip errata. Other SoC drivers do it the same way. Overall I
> > got rid of all the global static variables.
> > 
> > The last patch finally adds unique id support to the guts driver. DT
> > binding can be found at:
> >   Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml
> > 
> > changes since v1:
> >  - call kfree() in error case, thanks Dan
> >  - add missing of_node_put(np), thanks Dan
> > 
> > Michael Walle (7):
> >   soc: fsl: guts: machine variable might be unset
> >   soc: fsl: guts: remove module_exit() and fsl_guts_remove()
> >   soc: fsl: guts: embed fsl_guts_get_svr() in probe()
> >   soc: fsl: guts: allocate soc_dev_attr on the heap
> >   soc: fsl: guts: use of_root instead of own reference
> >   soc: fsl: guts: drop platform driver
> >   soc: fsl: guts: add serial_number support
> > 
> >  drivers/soc/fsl/guts.c | 219 ++++++++++++++++++++++-------------------
> >  1 file changed, 118 insertions(+), 101 deletions(-)
> 
> There goes another kernel release without any comments on this
> series :(
> 
> Shawn, can you pick this up and give it some time in linux-next?

Okay, I just picked the series up to IMX tree.

Leo, let me know if you want to drop it from IMX tree.

Shawn
