Return-Path: <linuxppc-dev+bounces-6974-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 970B2A5F708
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 14:56:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD8DH2DgTz3c7d;
	Fri, 14 Mar 2025 00:56:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1098:5b::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741874175;
	cv=none; b=YVNj2++ut6+wsHmnI5ACiLsDPIru9f/PgnecehiMHhQV4I5PId+StwM+emhUbfYRWcV4EQXBkyM9ta8BEtdnHXb/hbpK25Fpq6FYyjcTXIQFfdnudQOPHFFGyz/YzQQ5YGNDGFViKKySddmGjxk9ZpkjSs9EM2xAIPi0j/ikmcBIlFuZLpZst10pZDSKRK22Unj2ds+vTAgOINK35DzKelq1BXurQ7SH15UeqouOmmgpLqjEg3OswFIjO4AfjZ814G2jVFSeGUHs+M4HZPFnzU7GHJGISz44vRroVJaQXxJ/VzUZXwTZE3+CnvNvenNCopn58qd7ublrgqDdYwFDBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741874175; c=relaxed/relaxed;
	bh=lM0g+et7+koHvwD3M6Xbjrzfe2Oj1PGsMfiK3GoCkb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LI2UMVoIB5AyokOT32xsrFbGUCs372+kX3d+RttvNxHVEaFL1dyyFv1QFGOht5LCfLDLPDrcobX7N35MT5xnvd747Um3vLI/iA2IH+cz1BcMkzEIRAL2Czwn9k1Kv8gKyANXJUAf+8cs0JStiEDOyuO+bl1Vnn9KuXUUZivPWpEgizZVEgCkSbeHesPVaqE1nEPQSUL19DSnHBpy402z10lcHwVEbU+cEk9H6snLQcL4L/S3omwxs8blgUmSD6967S71Wy+Libm1eCQLWuqV0sToFTHT+Qsye/2HxJZ+8xVsQ0TjZO9pIKGT/JDhl6xWEd7EKdeNsCW65msSVKZawQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org; dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=fShdanW6; dkim-atps=neutral; spf=pass (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org) smtp.mailfrom=treblig.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=fShdanW6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 2098 seconds by postgrey-1.37 at boromir; Fri, 14 Mar 2025 00:56:12 AEDT
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD8DF00C3z3c78
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 00:56:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=lM0g+et7+koHvwD3M6Xbjrzfe2Oj1PGsMfiK3GoCkb0=; b=fShdanW6PbvuMFwP
	d1KJgdHaBd9oqatJIw5wA440G9mE87T9T7pcZPbqnEr/U25jvEF/fb9jkBiIllm6yjUBaGXMMQJgQ
	3riEx4T9FqTUlLmZiGaj/BphArEk5qjlRF7Rd32O8Nk5ugQp+6Rs6nNZ3MgczTvCMMeJf/PhJqqk1
	M1DTti6LAUeCZ3X732q2w44mc4TrghGxiJFwWclX5/WpD3EcVD9ZBRndSnT32MSTRfq9BaZ/R0ZiT
	LPvwKn/OT/+x1DBiy/Bku+Tk0CNowUwiHyCcmqWlK7X42Gp5xocQUlZ9yqWJJfN55QiR9kbcqmAIZ
	R8pIkXl1jwJioPNI7g==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tsj2d-004e9J-1n;
	Thu, 13 Mar 2025 13:56:07 +0000
Date: Thu, 13 Mar 2025 13:56:07 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: gregkh@linuxfoundation.org, Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, stuyoder@gmail.com,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: Remove deadcode
Message-ID: <Z9Lj9_yM1EK5pKee@gallifrey>
References: <20241115152055.279732-1-linux@treblig.org>
 <3f9dbb7b-6527-48e1-9028-b46e5a0c58ce@csgroup.eu>
 <Z9LbwRUsHwFLpBZA@gallifrey>
 <362f9392-f891-4a15-9ffd-5f5a6cac41b8@csgroup.eu>
 <oz65tdekf2ywyzadbntuxntwxulcdzyo33se54qqdsddkogquh@bqnmsmqijfvb>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <oz65tdekf2ywyzadbntuxntwxulcdzyo33se54qqdsddkogquh@bqnmsmqijfvb>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 13:54:58 up 309 days,  1:09,  1 user,  load average: 0.13, 0.07,
 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Greg,

* Ioana Ciornei (ioana.ciornei@nxp.com) wrote:
> On Thu, Mar 13, 2025 at 02:37:56PM +0100, Christophe Leroy wrote:
> > 
> > 
> > Le 13/03/2025 à 14:21, Dr. David Alan Gilbert a écrit :
> > > [Vous ne recevez pas souvent de courriers de linux@treblig.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > > 
> > > * Christophe Leroy (christophe.leroy@csgroup.eu) wrote:
> > > > 
> > > > 
> > > > Le 15/11/2024 à 16:20, linux@treblig.org a écrit :
> > > > > [Vous ne recevez pas souvent de courriers de linux@treblig.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > > > > 
> > > > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > > > 
> > > > > fsl_mc_allocator_driver_exit() was added explicitly by
> > > > > commit 1e8ac83b6caf ("bus: fsl-mc: add fsl_mc_allocator cleanup function")
> > > > > but was never used.
> > > > > 
> > > > > Remove it.
> > > > > 
> > > > > fsl_mc_portal_reset() was added in 2015 by
> > > > > commit 197f4d6a4a00 ("staging: fsl-mc: fsl-mc object allocator driver")
> > > > > but was never used.
> > > > > 
> > > > > Remove it.
> > > > > 
> > > > > fsl_mc_portal_reset() was the only caller of dpmcp_reset().
> > > > > 
> > > > > Remove it.
> > > > > 
> > > > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > > 
> > > > Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > 
> > > Hi,
> > >    Can someone pick this old change up please?  I see the PPC patchwork says
> > >    'handled elsewhere' but doesn't say where.
> > 
> > MAINTAINERS file says where:
> > 
> > QORIQ DPAA2 FSL-MC BUS DRIVER
> > M:	Stuart Yoder <stuyoder@gmail.com>
> > M:	Laurentiu Tudor <laurentiu.tudor@nxp.com>
> > L:	linux-kernel@vger.kernel.org
> > S:	Maintained
> > F:	Documentation/ABI/stable/sysfs-bus-fsl-mc
> > F:	Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> > F:
> > Documentation/networking/device_drivers/ethernet/freescale/dpaa2/overview.rst
> > F:	drivers/bus/fsl-mc/
> > F:	include/uapi/linux/fsl_mc.h
> > 
> > FREESCALE SOC DRIVERS
> > M:	Christophe Leroy <christophe.leroy@csgroup.eu>
> > L:	linuxppc-dev@lists.ozlabs.org
> > L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > S:	Maintained
> > F:	Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
> > F:	Documentation/devicetree/bindings/soc/fsl/
> > F:	drivers/soc/fsl/
> > F:	include/linux/fsl/
> > F:	include/soc/fsl/
> > 
> > I acked the 2 line changes in include/linux/fsl/mc.h, the main changes being
> > in the C files which are not under my scope.
> > 
> > Stuart, Laurentiu, can you pick up the patch ?
> 
> Stuart and Laurentiu are no longer at NXP. Even when they handled the
> fsl-mc bus driver, they didn't have a tree themselves to pick patches up
> but rather, historically, patches on the fsl-mc bus were picked by Greg
> KH.

OK, copied Greg in.

Dave

> Ioana
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

