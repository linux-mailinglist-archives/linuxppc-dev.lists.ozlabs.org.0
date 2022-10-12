Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6175FC138
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 09:24:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnPKh5lMqz3c6N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 18:24:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tyPYFLr2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/zwlqSJk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tyPYFLr2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/zwlqSJk;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnPJc2RkTz3cCx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 18:23:28 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id C45101F8B4;
	Wed, 12 Oct 2022 07:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1665559403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=djcwSN4dkWIz5Sy4j03l1ZsVJt74zX0r7xHpF62rRLw=;
	b=tyPYFLr29QirZ2tlQWMq0kO+H0JFk9YU6aTsmy6+OmcKxGXZo3hYZWOoK+Hq5UjU7qR4nx
	IEF6Qjuq9QDYsS18qVE0aGYXpcvfrlkmsPL1tWoiSogpykHNxXTzIs6RNUc5XVtCViV0be
	LgDtsfjtFTTdKD7uVEQ0QfAhCC+RbWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1665559403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=djcwSN4dkWIz5Sy4j03l1ZsVJt74zX0r7xHpF62rRLw=;
	b=/zwlqSJkxjPROQdXgETbJhWAElIVpqUJIH1IIifJczs0WhPwV2PzQLgdFS8CnvHHjkzNUg
	h92uKCF6uDgB0mBw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 7052A2C141;
	Wed, 12 Oct 2022 07:23:23 +0000 (UTC)
Date: Wed, 12 Oct 2022 09:23:22 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Message-ID: <20221012072322.GB28810@kitsune.suse.cz>
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <20221011213841.GA28810@kitsune.suse.cz>
 <87fbe7bd-1160-420e-984b-5afccd5d523c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fbe7bd-1160-420e-984b-5afccd5d523c@app.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022 at 08:29:39AM +0200, Arnd Bergmann wrote:
> On Tue, Oct 11, 2022, at 11:38 PM, Michal Suchánek wrote:
> > On Tue, Oct 11, 2022 at 10:06:59PM +0200, Arnd Bergmann wrote:
> >> On Tue, Oct 11, 2022, at 1:30 PM, Thomas Zimmermann wrote:
> >> > Am 11.10.22 um 09:46 schrieb Javier Martinez Canillas:
> >> >>> +static bool display_get_big_endian_of(struct drm_device *dev, struct device_node *of_node)
> >> >>> +{
> >> >>> +	bool big_endian;
> >> >>> +
> >> >>> +#ifdef __BIG_ENDIAN
> >> >>> +	big_endian = true;
> >> >>> +	if (of_get_property(of_node, "little-endian", NULL))
> >> >>> +		big_endian = false;
> >> >>> +#else
> >> >>> +	big_endian = false;
> >> >>> +	if (of_get_property(of_node, "big-endian", NULL))
> >> >>> +		big_endian = true;
> >> >>> +#endif
> >> >>> +
> >> >>> +	return big_endian;
> >> >>> +}
> >> >>> +
> >> >> 
> >> >> Ah, I see. The heuristic then is whether the build is BE or LE or if the Device
> >> >> Tree has an explicit node defining the endianess. The patch looks good to me:
> >> >
> >> > Yes. I took this test from offb.
> >> 
> >> Has the driver been tested with little-endian kernels though? While
> >> ppc32 kernels are always BE, you can build kernels as either big-endian
> >> or little-endian for most (modern) powerpc64 and arm/arm64 hardware,
> >> and I don't see why that should change the defaults of the driver
> >> when describing the same framebuffer hardware.
> >
> > The original code was added with
> > commit 7f29b87a7779 ("powerpc: offb: add support for foreign endianness")
> >
> > The hardware is either big-endian or runtime-switchable-endian.
> 
> Are you referring to CPU hardware or framebuffer hardware here?
CPU hardware
> 
> > It makes
> > sense to assume big-endian when runnig big-endian and the DT does not
> > specify endian which is likely on a historical system.
> 
> Agreed, assuming big-endian here clearly makes sense.
> 
> > It also makes sense to assume that on system with
> > runtime-switchable-endian the DT specifies the framebuffer endian.
> >
> > If systems that only do little-endian exist or emerge later then it also
> > makes sense to assume that the framebuffer matches the host if not
> > specified.
> >
> > I don't really see a problem here.
> >
> > BTW is this used on arm and on what platform?
> 
> I'm not aware of any users on Arm, most likely they all use
> simplefb/simpledrm or a gpu specific binding. There might be
> users on sparc, but they would obviously be big-endian
> as well.
> 
> > I do not see any bindings in dts.
> 
> Right, that is the real problem I see as well. I found the original
> CHRP binding document at
> https://www.devicetree.org/open-firmware/bindings/devices/html/lfb-1_0d.html
> 
> Unfortunately, this only specifies an 8-bit-per-pixel mode, and the
> multi-byte pixel support that was added in linux-2.1.125 was
> probably powermac specific without a public specification.
> 
> I think ideally we should add a binding document that describes what
> the driver actually expects, but in this case I would just drop the
> #ifdef check and always assume the framebuffer is big-endian unless
> the "little-endian" property is set, in order to have a sensible
> definition that does not depend on what OS (i.e. Linux
> CONFIG_CPU_BIG_ENDIAN) you are running.
> 
>        Arnd
