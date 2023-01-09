Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CCF662F54
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 19:38:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrN4B1Tvlz3cKB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 05:38:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=xr+iUWmf;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=nxcQ2DNw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mailrelay4-1.pub.mailoutpod2-cph3.one.com (client-ip=46.30.211.179; helo=mailrelay4-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=xr+iUWmf;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=nxcQ2DNw;
	dkim-atps=neutral
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrN380KYMz3c3N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 05:37:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
	 message-id:subject:cc:to:from:date:from;
	bh=wZxH/nDf40/5XX4K0N7bveQXBer/ZTbSo4stXhMD1MQ=;
	b=xr+iUWmfOB1CLBr6Qsy2YZMDRotm12WBZ/zh+3qIGnqD+WW38gq16Rl6LS9taWAIgXP2llv2ueyF0
	 fA3iIIxYnmuPGkwiK+SGk3l7yHRvIxggcTtT7x2q0+wwF6fVIQkEzPtcW04Q4A6X4SKS9m56vo7D0o
	 hLzfG7GraTS31Ch8FAtoGue7T76SmYvTnNeZNZkj0/5oK6YNNivj7Wo0ExtjbmvCmHRBteAPdkj/Eg
	 NkDkGI6lGIPAVh39LbMkR8Ej5M2GsnANIVRaeRashpzz54gdLod6v1ri7V6JrPjvdhVHIVaCwftjs+
	 2rttIhFTMoveJDSDeM23dX3GpjUJUVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
	 message-id:subject:cc:to:from:date:from;
	bh=wZxH/nDf40/5XX4K0N7bveQXBer/ZTbSo4stXhMD1MQ=;
	b=nxcQ2DNweooGl9o3PknXxmGKMXudrM7A8yocezPtlLEgBpQEu7WtSwjxUTWj2HhN7+D5H3vtKKz4P
	 oB6b4GmAA==
X-HalOne-ID: 5e23647e-904a-11ed-85ce-87783a957ad9
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay4 (Halon) with ESMTPSA
	id 5e23647e-904a-11ed-85ce-87783a957ad9;
	Mon, 09 Jan 2023 18:21:02 +0000 (UTC)
Date: Mon, 9 Jan 2023 19:21:00 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 02/15] video: fbdev: atyfb: Introduce
 backlight_get_brightness()
Message-ID: <Y7xbDAwLEeCJ4L54@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-2-1bd9bafb351f@ravnborg.org>
 <04f0f8c7-43cd-f774-c952-eb1cf3494bd8@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04f0f8c7-43cd-f774-c952-eb1cf3494bd8@csgroup.eu>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Lee Jones <lee@kernel.org>, Stephen Kitt <steve@sk2.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Daniel Thompson <daniel.thompson@linaro.org>, Antonino Daplas <adaplas@gmail.com>, Helge Deller <deller@gmx.de>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, Daniel Vetter <daniel.vetter@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jani Nikula <jani.nikula@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jason Yan <yanaijie@huawei.com>, Robin van
  der Gracht <robin@protonic.nl>, Nicolas Ferre <nicolas.ferre@microchip.com>, Souptick Joarder <jrdr.linux@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,
On Mon, Jan 09, 2023 at 05:44:46PM +0000, Christophe Leroy wrote:
> 
> 
> Le 07/01/2023 à 19:26, Sam Ravnborg via B4 Submission Endpoint a écrit :
> > From: Sam Ravnborg <sam@ravnborg.org>
> > 
> > Introduce backlight_get_brightness() to simplify logic
> > and avoid direct access to backlight properties.
> 
> When I read 'introduce' I understand that you are adding a new function.
> 
> In fact backlight_get_brightness() already exists, so maybe replace 
> 'introduce' by 'use'

Thanks for your feedback. A similar patch is already applied to the
fbdev tree, so this patch can be ignored.

	Sam
