Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4A581CA10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 13:35:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=X3gr0tiT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxRbp6MSdz3cY5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 23:35:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=X3gr0tiT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxRZy1XNwz3c2F
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 23:35:02 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC452240003;
	Fri, 22 Dec 2023 12:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703248490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bq0Cc7KHVfln4arFsKeGt5O9gb4Np/925X2DinLuzzI=;
	b=X3gr0tiTDPm0nix/vXT1GCh6Ot7hAp7YQ2RZjpA2QK+NhhgJcTJ6YoXMIThcEFm6dtx5pD
	FrEPEmTpeB/xztiJTDtdrc5nQr4jBcm06tyA/SdL9QJJXeCMQBLTGJCM4X2Yd8MdVOVyvM
	dLVMDonEoTvo1TddsOaCC8XQ2mNThiKUgrnoUunvn8tYQYoShtPbiGs7nRfq/w4gCl7y5Z
	6cTPk7SZhyFQZsJ+iDYaICyLMeGX/KuCihyuLxP5qrt/3g36Rz+7Iks/t++A5z4m6YPDTv
	OPsucwuj53L7ZkClevva2b7gtATtb4AgbsmB8U5YEObm7FmEl44LoLQ3bn0AQA==
Date: Fri, 22 Dec 2023 13:34:48 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [GIT PULL] PowerQUICC QMC and TSA drivers updates for v6.8
Message-ID: <20231222133448.1413d78d@bootlin.com>
In-Reply-To: <a274ba17-6ab7-4169-a10c-22fcc9e74248@app.fastmail.com>
References: <20231212105514.273e8ab0@bootlin.com>
	<a274ba17-6ab7-4169-a10c-22fcc9e74248@app.fastmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: linux-kernel@vger.kernel.org, Leo Li <leoyang.li@nxp.com>, soc <soc@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Fri, 22 Dec 2023 10:55:00 +0000
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Dec 12, 2023, at 09:55, Herve Codina wrote:
> > The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:
> >
> >   Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:hcodina/linux.git tags/fsl_qmc_tsa_v6.8
> >
> > for you to fetch changes up to 7a2ee1576dcc6bbe017a8283fba237b05b13fd15:
> >  
> 
> This is not a valid git URL I can pull from. I have instead pulled from
> 
>   https://github.com/hcodina/linux.git tags/fsl_qmc_tsa_v6.8
> 
> which is what I think you meant. 

Yes, exactly.
Thanks a lot for having pulled the https url.

> 
> You should probably edit your .gitconfig file to add a section
> like (not sure about the exact syntax, you'll figure it out).
> 
> [url "https://github.com"]
>     insteadOf = git@github.com
> 
> 
> >  drivers/soc/fsl/qe/qmc.c      | 658 
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------  
> 
> This is an overly long line that you probably copied from a large
> terminal window. Just for readability, I recommend redirecting the
> 'git request-pull' output, e.g. into 'xclip' or 'cat', which will
> give it the appropriate line length for emails.
> 

Thanks you these feedback and tips.
I will be more careful in the future.

Hervé
