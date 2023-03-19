Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 421846C05DA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Mar 2023 23:01:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PfsK21MY8z3c6R
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 09:01:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=cFGyvjCh;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=z5JZS1uR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mailrelay1-1.pub.mailoutpod2-cph3.one.com (client-ip=2a02:2350:5:400::1; helo=mailrelay1-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=cFGyvjCh;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=z5JZS1uR;
	dkim-atps=neutral
X-Greylist: delayed 11718 seconds by postgrey-1.36 at boromir; Mon, 20 Mar 2023 09:00:48 AEDT
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PfsJ06MT7z3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 09:00:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
	 message-id:subject:cc:to:from:date:from;
	bh=55TQw3vmH2ewB+u+Nx+NoaqSvHlaHxAFdFOoflwM9FY=;
	b=cFGyvjChe1mTdtFdX6pdqz0ATMgdpW3fT1KkwUrUkpNalQQDaqFU5vN7VKBddGpYLXta2DpkFI55w
	 MogWKlXdSXzNrrC5bGiSlpq5Do4A2sQNeWaCmqIlEimeq9x1gl80wZc6zJUzkUhAOW1N6R5wz8ZVPd
	 leZt4y4mpQn+ssBwEd/MBYswMDehgShJ7ooPBMIBmdbptpzJcDOW8EWJG0l7LOHAdSdye4j/hTjl2J
	 OAiIf/mCrmSOrSub6eIq5J9qMPc36zFTeLyCvrYO7OvVztiKoy8rmG/+Gwak6H+EiJ+PByU8MKo+X5
	 +j1pgZ4jnJU00weICutVZqABC1PMCAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
	 message-id:subject:cc:to:from:date:from;
	bh=55TQw3vmH2ewB+u+Nx+NoaqSvHlaHxAFdFOoflwM9FY=;
	b=z5JZS1uRC8yuO9NKyeQdfLOOcdSuevOdrmWZPSc3Ui+aGG0zuuit9OrsPex0yW9dEql1YHNHq7Q2U
	 ZbTuEn0DQ==
X-HalOne-ID: 0b8d9806-c686-11ed-a42d-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay1 (Halon) with ESMTPSA
	id 0b8d9806-c686-11ed-a42d-11abd97b9443;
	Sun, 19 Mar 2023 18:44:15 +0000 (UTC)
Date: Sun, 19 Mar 2023 19:44:13 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 12/15] auxdisplay: ht16k33: Introduce
 backlight_get_brightness()
Message-ID: <ZBdX/YlexhyVzIRf@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-12-1bd9bafb351f@ravnborg.org>
 <CANiq72mFMJuec+r=T6xYtLpuU+a1rOrAhrHiecy_1Jpj2m4J=g@mail.gmail.com>
 <Y7qM+ZlG5gQiOW4K@ravnborg.org>
 <2857575f6ec206f79cc21d423fde7d17@protonic.nl>
 <20230319144408.03045c50@heffalump.sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230319144408.03045c50@heffalump.sk2.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Lee Jones <lee@kernel.org>, Antonino Daplas <adaplas@gmail.com>, Robin van der Gracht <robin@protonic.nl>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-omap@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Thompson <daniel.thompson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-arm-kernel@lists.infradead.org, Nicolas Ferre <nicolas.ferre@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 19, 2023 at 02:44:08PM +0100, Stephen Kitt wrote:
> Hi,
> 
> On Mon, 09 Jan 2023 11:12:02 +0100, Robin van der Gracht <robin@protonic.nl>
> wrote:
> > On 2023-01-08 10:29, Sam Ravnborg wrote:
> > > On Sat, Jan 07, 2023 at 10:02:38PM +0100, Miguel Ojeda wrote:  
> > >> On Sat, Jan 7, 2023 at 7:26 PM Sam Ravnborg via B4 Submission Endpoint
> > >> <devnull+sam.ravnborg.org@kernel.org> wrote:  
> > >> >
> > >> > Introduce backlight_get_brightness() to simplify logic
> > >> > and avoid direct access to backlight properties.  
> > >> 
> > >> Note: Stephen sent this one too a while ago (with some more details in
> > >> the commit message, which is always nice); and then he sent yesterday
> > >> v2 [1] (to mention the functional change with `BL_CORE_SUSPENDED`
> > >> [2]).  
> > > Thanks for the pointers. I will try to move forward with Stephen's
> > > patches.  
> > >> 
> > >> Anyway, if it goes via drm-misc, feel free to have my:
> > >> 
> > >>     Acked-by: Miguel Ojeda <ojeda@kernel.org>
> > >> 
> > >> Though it would be nice to have Robin test the change.  
> > > 
> > > Robin - can I get your ack to apply Stephen's original v2 patch to
> > > drm-misc?  
> > 
> > done! see: 
> > https://lore.kernel.org/lkml/0b16391f997e6ed005a326e4e48f2033@protonic.nl/
> 
> As far as I can tell, this never got applied to drm-misc, and I don’t see it
> anywhere else. I guess it slipped through the cracks ;-)

Yes, I have been busy with a lot of other stuff lately, and cannot
promise when I get back to do Linux work.
So if someone else could pick it up that would be nice.

	Sam
