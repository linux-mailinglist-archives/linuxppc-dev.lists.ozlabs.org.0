Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF3A744D13
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jul 2023 11:50:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WhwptTr6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qv46m0XzJz3bws
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jul 2023 19:50:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WhwptTr6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qv45r0Sjyz30f7
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jul 2023 19:49:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1E7C46009F;
	Sun,  2 Jul 2023 09:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D59C433C8;
	Sun,  2 Jul 2023 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688291371;
	bh=EYppSHIVPNoV1/xChigYeVDIfmyw66skaZz4fN3/5sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WhwptTr6RbnJonQdHxrIyrX7qtv4sIV7DW0hsZkh8yPrey6WiaTv44T1D3sCNFiRP
	 Di1xbB9NtyNRYEVK3fV3hjwN/J8odS4Jq99jaRLo6RPMZFY8iWMpR/Fa3v/DbeXDfa
	 C0i7dXo61t8SCe/my3JJXq5XUOZgevccQ2iuECHTfpn5aN/WIeUkXMWKHzJ5/VL62D
	 tx8OCXyIxfapG+fUlmW5lEggoHUqrYSKh7C5EvCleSPcAJjpejpq/yE7fH4hsklGJi
	 t7w3Ml1cNX+4LItqD/Fd8AmwnSqDU1Ad1m+LED7AaAbjnUeiSnplLYG4zt1WGGzLI4
	 ANfLslHH6nGwQ==
Received: by pali.im (Postfix)
	id 1C5E2891; Sun,  2 Jul 2023 11:49:28 +0200 (CEST)
Date: Sun, 2 Jul 2023 11:49:28 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: dts: turris1x.dts: Fix PCIe MEM size for pci2
 node
Message-ID: <20230702094928.hhuksy6aed5naz74@pali>
References: <20230505172818.18416-1-pali@kernel.org>
 <20230610073521.prpxivjcwtcfwl3u@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230610073521.prpxivjcwtcfwl3u@pali>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Saturday 10 June 2023 09:35:21 Pali Rohár wrote:
> On Friday 05 May 2023 19:28:18 Pali Rohár wrote:
> > Freescale PCIe controllers on their PCIe Root Ports do not have any
> > mappable PCI BAR allocate from PCIe MEM.
> > 
> > Information about 1MB window on BAR0 of PCIe Root Port was misleading
> > because Freescale PCIe controllers have at BAR0 position different register
> > PEXCSRBAR, and kernel correctly skipts BAR0 for these Freescale PCIe Root
> > Ports.
> > 
> > So update comment about P2020 PCIe Root Port and decrease PCIe MEM size
> > required for PCIe controller (pci2 node) on which is on-board xHCI
> > controller.
> > 
> > lspci confirms that on P2020 PCIe Root Port is no PCI BAR and /proc/iomem
> > sees that only c0000000-c000ffff and c0010000-c0011fff ranges are used.
> > 
> > Fixes: 54c15ec3b738 ("powerpc: dts: Add DTS file for CZ.NIC Turris 1.x routers")
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> >  arch/powerpc/boot/dts/turris1x.dts | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
> > index 6612160c19d5..dff1ea074d9d 100644
> > --- a/arch/powerpc/boot/dts/turris1x.dts
> > +++ b/arch/powerpc/boot/dts/turris1x.dts
> > @@ -476,12 +476,12 @@
> >  		 * channel 1 (but only USB 2.0 subset) to USB 2.0 pins on mPCIe
> >  		 * slot 1 (CN5), channels 2 and 3 to connector P600.
> >  		 *
> > -		 * P2020 PCIe Root Port uses 1MB of PCIe MEM and xHCI controller
> > +		 * P2020 PCIe Root Port does not use PCIe MEM and xHCI controller
> >  		 * uses 64kB + 8kB of PCIe MEM. No PCIe IO is used or required.
> > -		 * So allocate 2MB of PCIe MEM for this PCIe bus.
> > +		 * So allocate 128kB of PCIe MEM for this PCIe bus.
> >  		 */
> >  		reg = <0 0xffe08000 0 0x1000>;
> > -		ranges = <0x02000000 0x0 0xc0000000 0 0xc0000000 0x0 0x00200000>, /* MEM */
> > +		ranges = <0x02000000 0x0 0xc0000000 0 0xc0000000 0x0 0x00020000>, /* MEM */
> >  			 <0x01000000 0x0 0x00000000 0 0xffc20000 0x0 0x00010000>; /* IO */
> >  
> >  		pcie@0 {
> > -- 
> > 2.20.1
> > 
> 
> PING?

PING?
