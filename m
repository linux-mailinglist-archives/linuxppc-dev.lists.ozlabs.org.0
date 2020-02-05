Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A2015399E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 21:39:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CYML0zQjzDqTl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 07:39:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CPKs19HJzDqDc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 01:37:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=fskKNcfl; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48CPKr6tCpz8swW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 01:37:36 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48CPKr6Ff3z9sSQ; Thu,  6 Feb 2020 01:37:36 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::9;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=fskKNcfl; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48CPKr0xZCz9sS9
 for <linuxppc-dev@ozlabs.org>; Thu,  6 Feb 2020 01:37:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1580913452;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=3K5CMMID3EALjv0xH2AwoQDAzF9cnjIP2QV6HxlHeTI=;
 b=fskKNcflSeCyEKytz7flwC9exCsJXcVykr4G4TUKs5ozgiNVajbTCwKzNOwLL8kT7g
 wKQNevSmI0sRkf+WtuNycosNZyrzZGWlTZeeNERidoHa/uLwEi1MocCFdvPajNnVR7Re
 4IiDdynBo0TjLjgcByB4ZtS8HE/YCoefHoPginPs0sNjQ/GjIzhO4c3nirIuF+JGC+ea
 Z1w0Wx6PezfT45r2/jJ55eI7r4mqBpvmc4aT7s+YBEHhiSkjrCheJcfwqHHFLDRplTrB
 8P2/VTfRqC+9R0I5AnjFJjxL1ecxGDemorioh644g01bEMVHYTzkK+SOtg79ItC+6D/j
 /uVg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2dxj7pixyCIG81lQblfm6W5F5TlnscZDhMmlFcU"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b004:73f8:d588:90b7:1e12:571a]
 by smtp.strato.de (RZmta 46.1.12 AUTH)
 with ESMTPSA id 40bcf3w15EaiTwK
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 5 Feb 2020 15:36:44 +0100 (CET)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-54688FF3-D1BA-44EC-AD1F-3F8C74847704
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (1.0)
Subject: Re: Latest Git kernel: avahi-daemon[2410]: ioctl(): Inappropriate
 ioctl for device
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <20200203095325.24c3ab1c@cakuba.hsd1.ca.comcast.net>
Date: Wed, 5 Feb 2020 15:36:43 +0100
Message-Id: <C11859E1-BE71-494F-81E2-9B27E27E60EE@xenosoft.de>
References: <20200203095325.24c3ab1c@cakuba.hsd1.ca.comcast.net>
To: Jakub Kicinski <kuba@kernel.org>
X-Mailer: iPhone Mail (17B111)
X-Mailman-Approved-At: Thu, 06 Feb 2020 07:37:45 +1100
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
Cc: DTML <devicetree@vger.kernel.org>, Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@ozlabs.org, "contact@a-eon.com" <contact@a-eon.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail-54688FF3-D1BA-44EC-AD1F-3F8C74847704
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Kernel 5.5 PowerPC is also affected.

=E2=80=94 Christian

Christian Zigotzky wrote:

Hi All,

The issue with the avahi-daemon still exist in the latest Git kernel. It's a=
 PowerPC issue. I compiled the latest Git kernel on a PC today and there are=
n't any issues with the avahi daemon. Another Power Mac user reported the sa=
me issue on his G5. I tested with the AmigaOne X1000 and X5000 in the last d=
ays.

I bisected today but I think the result isn't correct because it found the o=
ther problem with ordering of PCSCSI definition in esp_rev enum. I don't kno=
w how to bisect if there is another issue at the same time. Maybe "git bisec=
t skip"?

2086faae3c55a652cfbd369e18ecdb703aacc493 is the first bad commit
commit 2086faae3c55a652cfbd369e18ecdb703aacc493
Author: Kars de Jong <jongk@linux-m68k.org>
Date:   Tue Nov 19 21:20:20 2019 +0100

    scsi: esp_scsi: Correct ordering of PCSCSI definition in esp_rev enum

    The order of the definitions in the esp_rev enum is important. The value=
s
    are used in comparisons for chip features.

    Add a comment to the enum explaining this.

    Also, the actual values for the enum fields are irrelevant, so remove th=
e
    explicit values (suggested by Geert Uytterhoeven). This makes adding a n=
ew
    field in the middle of the enum easier.

    Finally, move the PCSCSI definition to the right place in the enum. In i=
ts
    previous location, at the end of the enum, the wrong values are written t=
o
    the CONFIG3 register when used with FAST-SCSI targets.

    Link: https://lore.kernel.org/r/20191119202021.28720-2-jongk@linux-m68k.=
org
    Signed-off-by: Kars de Jong <jongk@linux-m68k.org>
    Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>

:040000 040000 cdc128596e33fb60406b5de9b17b79623c187c1a 48ceab06439f95285e8b=
30181e75f9a68c25fcb5 M    drivers=

--Apple-Mail-54688FF3-D1BA-44EC-AD1F-3F8C74847704
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><p style=3D"margin: 0px; font-stretch: norm=
al; font-size: 12px; line-height: normal; font-family: Helvetica;">Kernel 5.=
5 PowerPC is also affected.</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">=E2=80=94 Christian</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">Christian Zigotzky wrote:</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">Hi All,</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">The issue with the avahi-daemon still exis=
t in the latest Git kernel. It's a PowerPC issue. I compiled the latest Git k=
ernel on a PC today and there aren't any issues with the avahi daemon. Anoth=
er Power Mac user reported the same issue on his G5. I tested with the Amiga=
One X1000 and X5000 in the last days.</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">I bisected today but I think the result is=
n't correct because it found the other problem with ordering of PCSCSI defin=
ition in esp_rev enum. I don't know how to bisect if there is another issue a=
t the same time. Maybe "git bisect skip"?</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">2086faae3c55a652cfbd369e18ecdb703aacc493 i=
s the first bad commit</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">commit 2086faae3c55a652cfbd369e18ecdb703aa=
cc493</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">Author: Kars de Jong &lt;jongk@linux-m68k.=
org&gt;</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">Date: &nbsp; Tue Nov 19 21:20:20 2019 +010=
0</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">&nbsp; &nbsp; scsi: esp_scsi: Correct orde=
ring of PCSCSI definition in esp_rev enum</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">&nbsp; &nbsp; The order of the definitions=
 in the esp_rev enum is important. The values</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">&nbsp; &nbsp; are used in comparisons for c=
hip features.</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">&nbsp; &nbsp; Add a comment to the enum ex=
plaining this.</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">&nbsp; &nbsp; Also, the actual values for t=
he enum fields are irrelevant, so remove the</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">&nbsp; &nbsp; explicit values (suggested b=
y Geert Uytterhoeven). This makes adding a new</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">&nbsp; &nbsp; field in the middle of the e=
num easier.</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">&nbsp; &nbsp; Finally, move the PCSCSI def=
inition to the right place in the enum. In its</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">&nbsp; &nbsp; previous location, at the en=
d of the enum, the wrong values are written to</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">&nbsp; &nbsp; the CONFIG3 register when us=
ed with FAST-SCSI targets.</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">&nbsp; &nbsp; Link: https://lore.kernel.or=
g/r/20191119202021.28720-2-jongk@linux-m68k.org</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">&nbsp; &nbsp; Signed-off-by: Kars de Jong &=
lt;jongk@linux-m68k.org&gt;</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">&nbsp; &nbsp; Signed-off-by: Martin K. Pet=
ersen &lt;martin.petersen@oracle.com&gt;</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;">:040000 040000 cdc128596e33fb60406b5de9b17=
b79623c187c1a 48ceab06439f95285e8b30181e75f9a68c25fcb5 M&nbsp; &nbsp; driver=
s</p></body></html>=

--Apple-Mail-54688FF3-D1BA-44EC-AD1F-3F8C74847704--

