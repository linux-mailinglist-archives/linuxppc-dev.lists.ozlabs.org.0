Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA307661413
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 08:58:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqTvw4bHgz3cDk
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 18:58:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sk2.org (client-ip=46.105.56.113; helo=14.mo582.mail-out.ovh.net; envelope-from=steve@sk2.org; receiver=<UNKNOWN>)
X-Greylist: delayed 39891 seconds by postgrey-1.36 at boromir; Sun, 08 Jan 2023 18:57:33 AEDT
Received: from 14.mo582.mail-out.ovh.net (14.mo582.mail-out.ovh.net [46.105.56.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqTvK29Xxz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 18:57:31 +1100 (AEDT)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.143.145])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 006CD20752
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 07:47:29 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-p7xcs (unknown [10.110.208.152])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 23C671FEA6;
	Sun,  8 Jan 2023 07:47:24 +0000 (UTC)
Received: from sk2.org ([37.59.142.102])
	by ghost-submission-6684bf9d7b-p7xcs with ESMTPSA
	id GxvpAgx1umMSjQcAO+84Ug
	(envelope-from <steve@sk2.org>); Sun, 08 Jan 2023 07:47:24 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R004f3b2dc6e-40e0-46d7-b496-fab2440419aa,
                    5128B599F7D401446F64D4771BE19AB2B9CD7A8B) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 37.167.47.239
Date: Sun, 08 Jan 2023 08:47:21 +0100
From: Stephen Kitt <steve@sk2.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_01/15=5D_video=3A_fbdev=3A_atm?= =?US-ASCII?Q?el=5Flcdfb=3A_Rework_backlight_handling?=
User-Agent: K-9 Mail for Android
In-Reply-To: <366FC0B8-21E2-4642-A5A5-CF4B6AB046B0@sk2.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org> <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org> <553AE999-CAF1-4E59-9F3F-68591ED192DE@sk2.org> <Y7nb2q6SDota/rTU@ravnborg.org> <366FC0B8-21E2-4642-A5A5-CF4B6AB046B0@sk2.org>
Message-ID: <0342789A-88E6-4A3C-84DF-0F1FEB21F25C@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 8435523578534069894
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeefgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevufgfjghfkfggtgfgsehtqhhmtddtreejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeevieelieekfeelhfduffdvgfduvdegkeeljeejhfdtkeeujeeileekgeeugefhhfenucffohhmrghinheplhhkmhhlrdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsthgvvhgvsehskhdvrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-staging@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Miguel Ojeda <ojeda@kernel.org>, Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>, Antonino Daplas <adaplas@gmail.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Robin van der Gracht <robin@protonic.nl>, Nicolas Ferre <nicolas.ferre@microchip.com>, Jingoo Han <jingoohan1@gmail.com>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8 January 2023 08:45:46 CET, Stephen Kitt <steve@sk2=2Eorg> wrote:
>On 7 January 2023 21:53:46 CET, Sam Ravnborg <sam@ravnborg=2Eorg> wrote:
>>Hi Stephen=2E
>>
>>On Sat, Jan 07, 2023 at 09:36:47PM +0100, Stephen Kitt wrote:
>>> On 7 January 2023 19:26:15 CET, Sam Ravnborg via B4 Submission Endpoin=
t <devnull+sam=2Eravnborg=2Eorg@kernel=2Eorg> wrote:
>>> >From: Sam Ravnborg <sam@ravnborg=2Eorg>
>>> >
>>> >The atmel_lcdfb had code to save/restore power state=2E
>>> >This is not needed so drop it=2E
>>> >
>>> >Introduce backlight_is_brightness() to make logic simpler=2E
>>> >
>>> >Signed-off-by: Sam Ravnborg <sam@ravnborg=2Eorg>
>>> >Cc: Nicolas Ferre <nicolas=2Eferre@microchip=2Ecom>
>>> >Cc: Alexandre Belloni <alexandre=2Ebelloni@bootlin=2Ecom>
>>> >Cc: Ludovic Desroches <ludovic=2Edesroches@microchip=2Ecom>
>>> >Cc: linux-fbdev@vger=2Ekernel=2Eorg
>>> >Cc: linux-arm-kernel@lists=2Einfradead=2Eorg
>>> >---
>>> > drivers/video/fbdev/atmel_lcdfb=2Ec | 24 +++---------------------
>>> > 1 file changed, 3 insertions(+), 21 deletions(-)
>>=2E=2E=2E
>>>=20
>>> Hi Sam,
>>>=20
>>> I=E2=80=99d submitted quite a few more of these previously (and you=E2=
=80=99d reviewed them), see e=2Eg=2E the thread starting at https://lkml=2E=
org/lkml/2022/6/7/4365, and yesterday, https://lkml=2Eorg/lkml/2023/1/6/520=
, https://lkml=2Eorg/lkml/2023/1/6/656, https://lkml=2Eorg/lkml/2023/1/6/97=
0, https://lkml=2Eorg/lkml/2023/1/6/643, and https://lkml=2Eorg/lkml/2023/1=
/6/680=2E There are a few more, I can find them if it=E2=80=99s any use=2E
>>
>>The patches from yesterday was what triggered me to resurrect an old
>>branch of mine where I had done something similar=2E I had lost all
>>memory of reviewing similar patches from you=2E
>>
>>
>>Helge - could you pick the reviewed patches from:
>>https://lore=2Ekernel=2Eorg/all/20220607192335=2E1137249-1-steve@sk2=2Eo=
rg/
>>[This is the same mail as Stephen refer to above - looked up via lore]=
=2E
>>
>>Stephen - I expect Daniel/Lee to take care of the patches from yesterday=
=2E
>>If you can look up other pending patches from you please do so, so we
>>can have them applied=2E
>>Preferably with links to lore - as this makes it easier to apply them=2E
>>
>>Review of what is unique in this set would be appreciated=2E
>>
>>	Sam
>
>Hi Sam,
>
>Here are my pending patches from last June on lore:
>
>* https://lore=2Ekernel=2Eorg/lkml/20220607190925=2E1134737-1-steve@sk2=
=2Eorg/
>* https://lore=2Ekernel=2Eorg/lkml/20220608205623=2E2106113-1-steve@sk2=
=2Eorg/
>* https://lore=2Ekernel=2Eorg/lkml/20220607192335=2E1137249-1-steve@sk2=
=2Eorg/
>* https://lore=2Ekernel=2Eorg/lkml/20220616170425=2E1346081-1-steve@sk2=
=2Eorg/
>
>I=E2=80=99ll send reviews of your other patches later today or tomorrow=
=2E
>
>Regards,
>
>Stephen

And the auxdisplay patch, v1:

https://lore=2Ekernel=2Eorg/lkml/20220607180406=2E1116277-1-steve@sk2=2Eor=
g/

and v2:

https://lore=2Ekernel=2Eorg/lkml/20230106143002=2E1434266-1-steve@sk2=2Eor=
g/

Regards,

Stephen
