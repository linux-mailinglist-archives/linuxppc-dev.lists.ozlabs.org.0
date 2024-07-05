Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B60292892B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 15:01:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iLVuOg7I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFtvN0QvMz3fKQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 23:01:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iLVuOg7I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFttg2Dslz3bhc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2024 23:01:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD3D262BE2;
	Fri,  5 Jul 2024 13:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81799C116B1;
	Fri,  5 Jul 2024 13:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720184471;
	bh=wFLfSOenR7Pj3La1IrKKOJzJRYxUmpXInQGcTcg3mhI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iLVuOg7IwK1qRdMOX8r6PS1ljKUMSs3jcgOHvAATvhN6+m4Fp//ukq23sZYqi5/qQ
	 hK1Q4kuGuVIWDsoKdIZzt4G5+Mgjf1xewR8D/3M/Uh12mwAvfScEmDzccVfYLyjR23
	 Kv4WGfiqdf+yV5QWBo0KP8jny9ZVntXHNbyD/5SSLv9/VVW4RL5Aqkyu7gCwKxFSno
	 wpx/L0wU56Eseo6AJzkhItK5PBNkbKivgSVxc4No7qQAPpaD40al0i9pz+GreFfIPl
	 O3hZ1i2oYPViRWJ7KmSQVyPtzNskIA7GEeHworNWXUU9nbDKo6JAttL0NVkgaDCFT3
	 vM1ok4JgSOblg==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sPiYn-00A3gM-2Y;
	Fri, 05 Jul 2024 14:01:09 +0100
MIME-Version: 1.0
Date: Fri, 05 Jul 2024 14:01:08 +0100
From: Marc Zyngier <maz@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
In-Reply-To: <C7B869E5-95D9-426E-A2CB-8336CC9EF432@xenosoft.de>
References: <C2FBFAD0-DEEE-4906-80B1-5FA745CD9726@xenosoft.de>
 <C7B869E5-95D9-426E-A2CB-8336CC9EF432@xenosoft.de>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <12665d67dcf74cd9a2cd8388d8106f8d@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: chzigotzky@xenosoft.de, robh@kernel.org, apatel@ventanamicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, madskateman@gmail.com, rtd2@xtra.co.nz, matthew@a-eon.biz, darren@stevens-zone.net, info@xenosoft.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-07-05 09:05, Christian Zigotzky wrote:
> How about the other patch[1], which would be far preferable?
> 
>    M.
> 
> [1] https://lore.kernel.org/all/86ed8ba2sp.wl-maz@kernel.org
> 
> - - - -
> 
> Marc,
> 
> We will test the patch as soon as possible.
> 
> Christian
> 
> - - - -
> 
> Our tester has reported, that it doesn’t boot.

Does it mean you are not testing this yourself???

> 
> Link: 
> https://forum.hyperion-entertainment.com/viewtopic.php?p=58627#p58627

How does it fail? I've repeatedly asked for dmesg outputs
for working and non-working configurations.

         M.
-- 
Jazz is not dead. It just smells funny...
