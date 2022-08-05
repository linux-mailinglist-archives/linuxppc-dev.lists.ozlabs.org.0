Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C3258A433
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 02:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzRTZ6TN4z3c8q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 10:35:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzRT91997z304J
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 10:35:24 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2750T200009896;
	Thu, 4 Aug 2022 19:29:02 -0500
Message-ID: <e92ea74fefd5110d2c1dbcea454d5ec8d2cadcf8.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas
 <javierm@redhat.com>, airlied@linux.ie,
        daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
        msuchanek@suse.de, mpe@ellerman.id.au, paulus@samba.org,
        geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
Date: Fri, 05 Aug 2022 10:29:01 +1000
In-Reply-To: <05511c35-da46-aefd-3e03-364b7311284c@suse.de>
References: <20220720142732.32041-1-tzimmermann@suse.de>
	 <20220720142732.32041-11-tzimmermann@suse.de>
	 <abe3fa95-942b-6d2f-7167-83d0cea59444@redhat.com>
	 <05511c35-da46-aefd-3e03-364b7311284c@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-07-27 at 10:41 +0200, Thomas Zimmermann wrote:
> 
> > > +static void __iomem *ofdrm_mach64_cmap_ioremap(struct ofdrm_device *odev,
> > > +					       struct device_node *of_node,
> > > +					       u64 fb_base)
> > > +{
> > > +	struct drm_device *dev = &odev->dev;
> > > +	u64 address;
> > > +	void __iomem *cmap_base;
> > > +
> > > +	address = fb_base & 0xff000000ul;
> > > +	address += 0x7ff000;
> > > +
> > 
> > It would be good to know where these addresses are coming from. Maybe some
> > constant macros or a comment ? Same for the other places where addresses
> > and offsets are used.
> 
> I have no idea where these values come from. I took them from offb. And 
> I suspect that some of these CMAP helpers could be further merged if 
> only it was clear where the numbers come from.  But as i don't have the 
> equipment for testing, I took most of this literally as-is from offb.

Ancient black magic :-) Old ATI mach64 chips had the registers sitting
at the end of the framebuffer. You can find an equivalent in
drivers/video/aty/atyfb_base.c:atyfb_setup_generic():

	raddr = addr + 0x7ff000UL;

Cheers,
Ben.

