Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D3E6C0372
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Mar 2023 18:23:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pfl8J0cjdz3cgT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 04:23:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sk2.org (client-ip=188.165.48.29; helo=11.mo550.mail-out.ovh.net; envelope-from=steve@sk2.org; receiver=<UNKNOWN>)
X-Greylist: delayed 12005 seconds by postgrey-1.36 at boromir; Mon, 20 Mar 2023 04:23:12 AEDT
Received: from 11.mo550.mail-out.ovh.net (11.mo550.mail-out.ovh.net [188.165.48.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pfl7h4JpLz308w
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 04:23:09 +1100 (AEDT)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.16.60])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id A287023689
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Mar 2023 13:44:13 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-vk2nn (unknown [10.110.103.232])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A395D1FE33;
	Sun, 19 Mar 2023 13:44:09 +0000 (UTC)
Received: from sk2.org ([37.59.142.105])
	by ghost-submission-6684bf9d7b-vk2nn with ESMTPSA
	id IxRwI6kRF2SLKQEA5A//1w
	(envelope-from <steve@sk2.org>); Sun, 19 Mar 2023 13:44:09 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-105G006adb33e03-d5be-4371-a698-f6a54d8109e0,
                    9CCC51F2D7DAB1FB7350B438D1071C8867680B66) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Sun, 19 Mar 2023 14:44:08 +0100
From: Stephen Kitt <steve@sk2.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 12/15] auxdisplay: ht16k33: Introduce
 backlight_get_brightness()
Message-ID: <20230319144408.03045c50@heffalump.sk2.org>
In-Reply-To: <2857575f6ec206f79cc21d423fde7d17@protonic.nl>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
	<20230107-sam-video-backlight-drop-fb_blank-v1-12-1bd9bafb351f@ravnborg.org>
	<CANiq72mFMJuec+r=T6xYtLpuU+a1rOrAhrHiecy_1Jpj2m4J=g@mail.gmail.com>
	<Y7qM+ZlG5gQiOW4K@ravnborg.org>
	<2857575f6ec206f79cc21d423fde7d17@protonic.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 1273674272938165894
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefiedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeludetkeehffejieetveeltddttdeftedtvdegkeffueefvefgieetvddtieehfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshhtvghvvgesshhkvddrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Miguel Ojeda <ojeda@kernel.org>, Antonino Daplas <adaplas@gmail.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jingoo Han <jingoohan1@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Robin van der Gracht <robin@protonic.nl>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Mon, 09 Jan 2023 11:12:02 +0100, Robin van der Gracht <robin@protonic.nl>
wrote:
> On 2023-01-08 10:29, Sam Ravnborg wrote:
> > On Sat, Jan 07, 2023 at 10:02:38PM +0100, Miguel Ojeda wrote: =20
> >> On Sat, Jan 7, 2023 at 7:26 PM Sam Ravnborg via B4 Submission Endpoint
> >> <devnull+sam.ravnborg.org@kernel.org> wrote: =20
> >> >
> >> > Introduce backlight_get_brightness() to simplify logic
> >> > and avoid direct access to backlight properties. =20
> >>=20
> >> Note: Stephen sent this one too a while ago (with some more details in
> >> the commit message, which is always nice); and then he sent yesterday
> >> v2 [1] (to mention the functional change with `BL_CORE_SUSPENDED`
> >> [2]). =20
> > Thanks for the pointers. I will try to move forward with Stephen's
> > patches. =20
> >>=20
> >> Anyway, if it goes via drm-misc, feel free to have my:
> >>=20
> >>     Acked-by: Miguel Ojeda <ojeda@kernel.org>
> >>=20
> >> Though it would be nice to have Robin test the change. =20
> >=20
> > Robin - can I get your ack to apply Stephen's original v2 patch to
> > drm-misc? =20
>=20
> done! see:=20
> https://lore.kernel.org/lkml/0b16391f997e6ed005a326e4e48f2033@protonic.nl/

As far as I can tell, this never got applied to drm-misc, and I don=E2=80=
=99t see it
anywhere else. I guess it slipped through the cracks ;-)

Regards,

Stephen
