Return-Path: <linuxppc-dev+bounces-10734-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D69B1D9B6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 16:11:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byTcX0VxNz3cRJ;
	Fri,  8 Aug 2025 00:11:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.165 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754575916;
	cv=pass; b=KQpPf10T40u1VfZLh0rYTLVFPLtKmI+dPZpk729caEubUQQJcdiZzB5Yj7qxJuQobH78Ol+Nk3EH46nxrXHDCzljO7RfD+4ZhJp7sk2mh42JO4Dbf/wBHFKUp8vfqNkOuXY5lGsv8iZGNk5oPlMF090yoaWQe2cstQHcT2H9Gpi3CGVSBz9gm3RdTp71xW65XtDCKOMtPNU3v3BUpRbIoOQVqzqulBtsosImdJVRGrFJbfBoZxfvps/NXI16t7t89Q41EOvbvkalYb9kpep6PiG8YGxdEQLGzqEH1X6qMRVoyRXkb6OxE2MBkpoqbCzQGtigG9QblsJxcxSlmmglTw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754575916; c=relaxed/relaxed;
	bh=Fi7s1UkIuqw0mEFnNe9HGhSrdVwj64AYbKwdHjWG7vc=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=ETXXuESP5Rj9YYlmN6Jh83jKVQpA9rvwUGZnX6nbVWn9YIQIOXd50PMOXqn9v0fAzW8eW83vMS1MLwl6LjcyaeqFmKXvpTR3uGzSx+gzXQmFA5Oe8ZrArZaP4DwkNorpE+xdimJtE8wpVdbs/K09iNZfurmdw82xijUdJtTSeDi6aj4CCp0CiikIHzTn6BHLdx6ZIp95X79+OAvwG1MS5Fl9/pEqUrs6Ykn6+7LQ4TCfBztl7EJTy6iYF4M+V/ZnJVYGU04utt9FIOWXOkoc8t/YjTntUTXjdAVxnFclItNApZQAooWRIGtaoHsLSXD+L7LRnR4mlXmXGFxLimwPDA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=UulJonZ9; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=65Jy9w0g; dkim-atps=neutral; spf=pass (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=UulJonZ9;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=65Jy9w0g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byTcS2pZ5z3cRH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 00:11:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1754575863; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GTCLAUlx1j4sBDnHpJvrTICj2PTgKxHOjoaajiTXmLvjhuds+R8gJXCKNYqQiHN0Vy
    beKK9gS/xenWogwmK+/hzmRRjyCZGFjP7mDnN91buCiLzafQeAyEUeqAQwIoJpZNEZXp
    cXDB6EOpR6ty6vXp1nPJkft+9jIpt+3xLAUQtAPVx0XaVWi8oGTHuPFEBU18IWwdxReR
    y495tDexQKj6+gP1N6OjDvOXNkGMt90okplWfFQDxpCKlCerWupmcvasW00p8dy/dduV
    E9t8l8mO8cQ0NIvgdDxlog1AtCgZp7X2iZmBIo3WEZZlyEFJU3rhAO03S7T+UAaOiK/k
    FMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754575863;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=Fi7s1UkIuqw0mEFnNe9HGhSrdVwj64AYbKwdHjWG7vc=;
    b=cR+kvaL/7IOKB0cVpcBkDPK7J7nFcEiQKjdbHNkWejL+LFmp3Q9ccLBZStDtMAnqQ1
    Ol4vYPSh8TdEatPkfaYSzzs+xDvRpNfpzn4iY5hI2TgFH5vve1al3sjCpZqUVrbZgHNa
    ZTgUH/9dO9xXjHKfEloykPfbrdHxfghKwZvRI1oitdPM3T0L/j9rfU5kBBanudRpGI3N
    +mtBgqTGuMXFEn8weUXz9EQ4Edd6+MxR+akVevf2ExF1ophmqfoflC9AKx2khA74sSht
    OkB0ePWpGTrU5U2gU5p7CdBRjU3SgE5JqtGIqBbHv1rJFUhJ+4UBHyyAB3NbykRFxkp3
    SFaA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754575863;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=Fi7s1UkIuqw0mEFnNe9HGhSrdVwj64AYbKwdHjWG7vc=;
    b=UulJonZ9uLMI0KbTW7Z/so0pOQkVcT7+lq7kOLPxv5OeEg8ctnXTiIMTQqXgHsfWiT
    SANLS+DXhUgltTssh/GPAtdqcPZa1gjfTfw+bJn5a3kLhXITVH/SmOHra0gyGJjtc+sB
    rg4/vWk393q1J6XkRWa9ABhhu4vXbYte1B4Psd6sOGXpLD/0wmy6r3/lXhCms52HYvXp
    o4As5ThMZQzSQSoXezL+xINm0no8FuLFDHFkacBpDz2kUawnRoPOhLs1tJee509uoSY7
    rP3mfrI76kftccAiZj9a87PP/pKQUvrdpKl4TH5XFLzdHsVVh6j6ThmL3l6xW/2iM2im
    wryA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754575863;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=Fi7s1UkIuqw0mEFnNe9HGhSrdVwj64AYbKwdHjWG7vc=;
    b=65Jy9w0gDriyzZ63kan5GMCxTcAcE3TftfWC+mymZMUey79YbuTAspvWg2pZPPX21/
    q+CAhhT2uiO15uE8OABw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5m2s3jFWinvWQAExapN1WKXrI0REZC0pX5emA=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c177EB34EZ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 7 Aug 2025 16:11:03 +0200 (CEST)
Content-Type: multipart/alternative; boundary=Apple-Mail-12B86B8C-A310-4918-BF15-0E45D471C480
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: radeon_fbdev_river_fbdev: failed to initialize framebuffer and setup emulation
Date: Thu, 7 Aug 2025 16:10:52 +0200
Message-Id: <DA680712-472D-46BE-A2DF-9E923A4E6EE1@xenosoft.de>
References: <CAHkrCmHKSR+3gCjs7E=Qnini_CCEa+wjx9gWNPMjSWWFOScQtw@mail.gmail.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, ville.syrjala@linux.intel.com,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mario.limonciello@amd.com,
 bhelgaas@google.com, benato.denis96@gmail.com, Yijun_Shen@Dell.com,
 david.perry@amd.com, rafael@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <CAHkrCmHKSR+3gCjs7E=Qnini_CCEa+wjx9gWNPMjSWWFOScQtw@mail.gmail.com>
To: mad skateman <madskateman@gmail.com>
X-Mailer: iPhone Mail (22G86)
X-Spam-Status: No, score=-0.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	MIME_HTML_ONLY,MIME_HTML_ONLY_MULTI,MIME_QP_LONG_LINE,MPART_ALT_DIFF,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--Apple-Mail-12B86B8C-A310-4918-BF15-0E45D471C480
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><div dir=3D"ltr">I bisecte=
d today.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">git clone https://=
gitlab.freedesktop.org/drm/kernel a</div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr">git bisect start</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">g=
it bisect good 2f29b5c231011b94007d2c8a6d793992f2275db1</div><div dir=3D"ltr=
">(Good: video: screen_info: Relocate framebuffers behind PCI bridges)</div>=
<div dir=3D"ltr"><br></div><div dir=3D"ltr">git bisect bad f62408efc8669b825=
41295a4611494c8c8c52684</div><div dir=3D"ltr">(Bad: drm/xe/vf: Disable CSC s=
upport on VF)</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">4d4c10f763d78=
08fbade28d83d237411603bca05 is the first bad commit</div><div dir=3D"ltr">co=
mmit 4d4c10f763d7808fbade28d83d237411603bca05</div><div dir=3D"ltr">Author: M=
ario Limonciello &lt;mario.limonciello@amd.com&gt;</div><div dir=3D"ltr">Dat=
e: &nbsp; Wed Apr 23 23:31:32 2025 -0500</div><div dir=3D"ltr"><br></div><di=
v dir=3D"ltr">&nbsp; &nbsp; PCI: Explicitly put devices into D0 when initial=
izing</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">&nbsp; &nbsp; AMD BIO=
S team has root caused an issue that NVMe storage failed to come</div><div d=
ir=3D"ltr">&nbsp; &nbsp; back from suspend to a lack of a call to _REG when N=
VMe device was probed.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">&nbs=
p; &nbsp; 112a7f9c8edbf ("PCI/ACPI: Call _REG when transitioning D-states") a=
dded</div><div dir=3D"ltr">&nbsp; &nbsp; support for calling _REG when trans=
itioning D-states, but this only works</div><div dir=3D"ltr">&nbsp; &nbsp; i=
f the device actually "transitions" D-states.</div><div dir=3D"ltr"><br></di=
v><div dir=3D"ltr">&nbsp; &nbsp; 967577b062417 ("PCI/PM: Keep runtime PM ena=
bled for unbound PCI devices")</div><div dir=3D"ltr">&nbsp; &nbsp; added sup=
port for runtime PM on PCI devices, but never actually</div><div dir=3D"ltr"=
>&nbsp; &nbsp; 'explicitly' sets the device to D0.</div><div dir=3D"ltr"><br=
></div><div dir=3D"ltr">&nbsp; &nbsp; To make sure that devices are in D0 an=
d that platform methods such as</div><div dir=3D"ltr">&nbsp; &nbsp; _REG are=
 called, explicitly set all devices into D0 during initialization.</div><div=
 dir=3D"ltr"><br></div><div dir=3D"ltr">&nbsp; &nbsp; Fixes: 967577b062417 (=
"PCI/PM: Keep runtime PM enabled for unbound PCI devices")</div><div dir=3D"=
ltr">&nbsp; &nbsp; Signed-off-by: Mario Limonciello &lt;mario.limonciello@am=
d.com&gt;</div><div dir=3D"ltr">&nbsp; &nbsp; Signed-off-by: Bjorn Helgaas &=
lt;bhelgaas@google.com&gt;</div><div dir=3D"ltr">&nbsp; &nbsp; Tested-by: De=
nis Benato &lt;benato.denis96@gmail.com&gt;</div><div dir=3D"ltr">&nbsp; &nb=
sp; Tested-By: Yijun Shen &lt;Yijun_Shen@Dell.com&gt;</div><div dir=3D"ltr">=
&nbsp; &nbsp; Tested-By: David Perry &lt;david.perry@amd.com&gt;</div><div d=
ir=3D"ltr">&nbsp; &nbsp; Reviewed-by: Rafael J. Wysocki &lt;rafael@kernel.or=
g&gt;</div><div dir=3D"ltr">&nbsp; &nbsp; Link: https://patch.msgid.link/202=
50424043232.1848107-1-superm1@kernel.org</div><div dir=3D"ltr"><br></div><di=
v dir=3D"ltr">&nbsp;drivers/pci/pci-driver.c | &nbsp;6 ------</div><div dir=3D=
"ltr">&nbsp;drivers/pci/pci.c &nbsp; &nbsp; &nbsp; &nbsp;| 13 ++++++++++---<=
/div><div dir=3D"ltr">&nbsp;drivers/pci/pci.h &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp;1 +</div><div dir=3D"ltr">&nbsp;3 files changed, 11 insertions(+), 9 de=
letions(-)</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">I bisected with a=
 ATi Radeon 7000 / VE (-device ati-vga,model=3Drv100) :-)</div></div><div di=
r=3D"ltr"><br><blockquote type=3D"cite">On 04 August 2025 at 06:26 pm, mad s=
kateman &lt;madskateman@gmail.com&gt; wrote:<br><br></blockquote></div><bloc=
kquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"auto">I am using t=
he R580 chip which is the Radeon X1950 XT.<div dir=3D"auto"><br></div><div d=
ir=3D"auto">The board i am using is a T1042 PowerPC based one with e5500 cor=
e.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I also lost the abilit=
y to start Xorg and therefore just a blank screen.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Dave</div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Op ma 4 aug 2025, 18:04 schreef Christian Zigotzky &lt;<a h=
ref=3D"mailto:chzigotzky@xenosoft.de">chzigotzky@xenosoft.de</a>&gt;:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br>
On 04 August 2025 at 04:42 pm, Alex Deucher wrote:<br>
&gt; On Sun, Aug 3, 2025 at 11:28=E2=80=AFAM Christian Zigotzky<br>
&gt; &lt;<a href=3D"mailto:chzigotzky@xenosoft.de" target=3D"_blank" rel=3D"=
noreferrer">chzigotzky@xenosoft.de</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; I have the same issue on another machine either. Blank screen durin=
g the<br>
&gt;&gt; boot. The Radeon graphics framebuffer device doesn't work anymore.<=
br>
&gt;&gt;<br>
&gt;&gt; Here is the modifed code from the DRM updates (drm-next-2025-07-30)=
:<br>
&gt;&gt;<br>
&gt;&gt; -<br>
&gt;&gt; <a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/torv=
alds/linux.git/diff/drivers/gpu/drm/radeon/radeon_fbdev.c?id=3D260f6f4fda93c=
8485c8037865c941b42b9cba5d2" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff=
/drivers/gpu/drm/radeon/radeon_fbdev.c?id=3D260f6f4fda93c8485c8037865c941b42=
b9cba5d2</a><br>
&gt;&gt; -<br>
&gt;&gt; <a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/torv=
alds/linux.git/diff/drivers/gpu/drm/radeon/radeon_drv.c?id=3D260f6f4fda93c84=
85c8037865c941b42b9cba5d2" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/d=
rivers/gpu/drm/radeon/radeon_drv.c?id=3D260f6f4fda93c8485c8037865c941b42b9cb=
a5d2</a><br>
&gt; <br>
&gt; This change just bumps the driver version it shouldn't affect the fbdev=
.<br>
&gt; <br>
&gt;&gt; -<br>
&gt;&gt; <a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/torv=
alds/linux.git/diff/drivers/gpu/drm/radeon/radeon_display.c?id=3D260f6f4fda9=
3c8485c8037865c941b42b9cba5d2" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/di=
ff/drivers/gpu/drm/radeon/radeon_display.c?id=3D260f6f4fda93c8485c8037865c94=
1b42b9cba5d2</a><br>
&gt;&gt; -<br>
&gt;&gt; <a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/torv=
alds/linux.git/diff/drivers/gpu/drm/radeon/evergreen_cs.c?id=3D260f6f4fda93c=
8485c8037865c941b42b9cba5d2" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff=
/drivers/gpu/drm/radeon/evergreen_cs.c?id=3D260f6f4fda93c8485c8037865c941b42=
b9cba5d2</a><br>
&gt; <br>
&gt; This only affects acceleration, it should not affect fbdev.<br>
&gt; <br>
&gt; What chip are you using?&nbsp; Can you attach your full dmesg output?&n=
bsp; Can<br>
&gt; you bisect?&nbsp; This cultrit could be a core drm change.<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Do you have a patch for reverting these modifications? I would like=
 to<br>
&gt;&gt; revert these modifications for testing.<br>
&gt;&gt;<br>
&gt;&gt; Thanks in advance,<br>
&gt;&gt; Christian<br>
&gt;&gt;<br>
&gt;&gt; On 03 August 2025 at 1:35 pm, Christian Zigotzky wrote:<br>
&gt;&gt;&gt; Hello,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Xorg doesn't work after the DRM updates drm-next-2025-07-30.<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Error messages:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [dr:.radeon_fbdev_river_fbdev_proe] *ERROR* failed to initializ=
e<br>
&gt;&gt;&gt; framebuffer -22<br>
&gt;&gt;&gt; radeon 0000:01:0.0: [drm] *ERRO* fbdev: Failedto setup emulaton=
 (ret=3D-22)<br>
&gt;&gt;&gt; brd module loadedm<br>
&gt;&gt;&gt; lop: module loadd<br>
&gt;&gt;&gt; mpt3ss version 52.10.00.00 loaded<br>
&gt;&gt;&gt; nve nvme0: pci fuction 0002:04:0.0<br>
&gt;&gt;&gt; fsl-sata ffe20000.sata: SataFSL Platform/CS Driver init<br>
&gt;&gt;&gt; scs host0: sata_fs<br>
&gt;&gt;&gt; ta1: SATA max DMA/133 irq 68 pm-pol 0<br>
&gt;&gt;&gt; ;21;39mfsl-sat ffe221000.sata Sata FSL Platfrm/CSB Driver iit<b=
r>
&gt;&gt;&gt; ata1: Signatue Update detectd @ 0 msecs<br>
&gt;&gt;&gt; scsihost1: sata_fsl[0m<br>
&gt;&gt;&gt; ta2: SATA max UMA/133 irq 69 lm-pol 0<br>
&gt;&gt;&gt; nvme nvm0: 4/0/0 defaul/read/poll queus<br>
&gt;&gt;&gt; nvme0n1: p1 p p3 p4 p5 p6 p7[0m<br>
&gt;&gt;&gt; drm:.radeon_fbdv_driver_fbdev_robe] *ERROR* filed to initialze<=
br>
&gt;&gt;&gt; framebuffer 22<br>
&gt;&gt;&gt; fsl_dpaa_mac fe4e6000.ethernt: of_get_mac_adress(/soc@ffe00000/=
<br>
&gt;&gt;&gt; fman@40000/ethernet@e6000 failed<br>
&gt;&gt;&gt; radeon 000:01:00.0: [dr] *ERROR* fbdev Failed to setu emulation=
 (ret-22)<br>
&gt;&gt;&gt; fsl_dpaa_ma ffe4e6000.ethenet: FMan MEMAC[0m<br>
&gt;&gt;&gt; sl_dpaa_mac ffee6000.ethernet:Using random MA address: 0e<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Could you please check the latest DRM updates?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt; Christian<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
<br>
Hello Alex,<br>
<br>
Thanks for your answer.<br>
<br>
I use a BARTS chip (Radeon HD6870). I would like to bisect but I don't <br>
have time for it currently. Sorry<br>
<br>
There are some other user reports:<br>
<br>
- <a href=3D"https://forum.hyperion-entertainment.com/viewtopic.php?p=3D6060=
6#p60606" rel=3D"noreferrer noreferrer" target=3D"_blank">https://forum.hype=
rion-entertainment.com/viewtopic.php?p=3D60606#p60606</a><br>
- <a href=3D"https://forum.hyperion-entertainment.com/viewtopic.php?p=3D6059=
5#p60595" rel=3D"noreferrer noreferrer" target=3D"_blank">https://forum.hype=
rion-entertainment.com/viewtopic.php?p=3D60595#p60595</a><br>
<br>
They use other Radeon graphics chips.<br>
<br>
Bug report: <a href=3D"https://github.com/chzigotzky/kernels/issues/15" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://github.com/chzigotzky/kern=
els/issues/15</a><br>
<br>
What do you think about the following commit?<br>
<br>
Link: <br>
<a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/?id=3D0e7d5874fb6b80c44be3cfbcf1cf356e81d91232" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://web.git.kernel.org/pub/scm/linux/ke=
rnel/git/torvalds/linux.git/commit/?id=3D0e7d5874fb6b80c44be3cfbcf1cf356e81d=
91232</a><br>
<br>
@Hypex<br>
Could you please attach your full dmesg output?<br>
<br>
Thanks,<br>
Christian<br>
</blockquote></div>
</div></blockquote></body></html>=

--Apple-Mail-12B86B8C-A310-4918-BF15-0E45D471C480--

