Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E32155CAC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 18:15:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Dhkc16RyzDqjk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 04:15:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Dhhw5rnLzDqf6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2020 04:13:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48Dhhw2hcWz8shd
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2020 04:13:36 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48Dhhw2KNVz9sRl; Sat,  8 Feb 2020 04:13:36 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 308 seconds by postgrey-1.36 at bilbo;
 Sat, 08 Feb 2020 04:13:34 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48Dhht5Y8Gz9sRX
 for <linuxppc-dev@ozlabs.org>; Sat,  8 Feb 2020 04:13:34 +1100 (AEDT)
Received: from mail-lj1-f172.google.com ([209.85.208.172]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MSI6i-1j6oAt2xdQ-00SdUl for <linuxppc-dev@ozlabs.org>; Fri, 07 Feb 2020
 18:08:19 +0100
Received: by mail-lj1-f172.google.com with SMTP id v17so72486ljg.4
 for <linuxppc-dev@ozlabs.org>; Fri, 07 Feb 2020 09:08:18 -0800 (PST)
X-Gm-Message-State: APjAAAVArC7TgcWNQzcud0h0/S0OvwJHUUfb9v8dz0p5hQQIZamhMT6/
 mlJTishihraaVGEgGsrez++hNNW3gaS2f16Tuok=
X-Google-Smtp-Source: APXvYqw9u3WcxbpVw6rO3j9Ozu9XMB+H2m1FoTnlA7ltWTv2RF4oTSzNzORrzx5UZNelPR7iZjN33BiBam2VYEndX7Q=
X-Received: by 2002:a2e:5056:: with SMTP id v22mr142178ljd.164.1581095297786; 
 Fri, 07 Feb 2020 09:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20200203095325.24c3ab1c@cakuba.hsd1.ca.comcast.net>
 <C11859E1-BE71-494F-81E2-9B27E27E60EE@xenosoft.de>
 <87tv441gg1.fsf@mpe.ellerman.id.au>
 <42888ad2-71e0-6d03-ddff-3de6f0ee5d43@xenosoft.de>
In-Reply-To: <42888ad2-71e0-6d03-ddff-3de6f0ee5d43@xenosoft.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 7 Feb 2020 17:08:06 +0000
X-Gmail-Original-Message-ID: <CAK8P3a39L5i4aEbKe9CiW6unbioL=T8GqXC007mXxUu+_j84FA@mail.gmail.com>
Message-ID: <CAK8P3a39L5i4aEbKe9CiW6unbioL=T8GqXC007mXxUu+_j84FA@mail.gmail.com>
Subject: Re: Latest Git kernel: avahi-daemon[2410]: ioctl(): Inappropriate
 ioctl for device
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fdtBRiF7UB4mERUOcTVlOg7mSp4wF9WF7ALnFzXbfkPV1T6jeUR
 1uQaQ+94jix1VZJcqlKP31Y9hAcTIYRLFvaTD78pEca1ZnQL5WyipDnA1pcFcPdIYjgRzRe
 xcUJsUxo5JnJnPX21mc9A0gPYkVlbX5eHZ6va/cGYkV2iauEsYWgzcyMPv0i4ZxCDWQzGXS
 LxIJs/jdHRr1+wA+NrXeQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:U5UzjEcUpo4=:dXUeruSHBIWWFuiIORVZKH
 gBvE4xEbbSJp9hCXsFegEYGunQwQMAOn+MVkHP0YVye/8eYJ+WpgYXOpg9SdanJR8DVlc5sJm
 2yztCszcSXVuJ1sAImt3XDCkZlaq12ddhXCwu/R285oQwR90w9FDeSYhL1FAuEWQn1jqSjrPt
 UadaVxUj5Dk6/922dPm9vf/WlNdch4htCpkjilKQI+CivGS9EbgaqcLmXdPB44NZSCzIvWlTk
 8+8Ngm+Z2DcW8toWUn4WVIsqzCYm8nIuR+lpBr9RGrrdbfA8KjLma1mWo+W6a7XbATaZACCC1
 d3dK6/MKzKEWrnoGBw4dPI75XETCkWChAklGEbvW0UNRkNEFoo+bji+B9n8500w13uJ1P+tNr
 ymL6rOc/4VT1ldz2YoU+HwEEt4vF4N+EbkY5Jpcc1lf5fTmjKd5Mz3aN4V3XDOxU/XXPn/jc0
 ginBYBDWflnNGXpo6p1U9b8B69nSXvk1wDCFSsiaYKa5I2SEKkm7qUp2blLYIh+BbOWKYIYsO
 Zb/kew0Azp4UnfOSmQgI4WXppSYRAdOR1Jydse4EZjy2zTZkbuPFrE2ekU3KfcuLYItcPiqmn
 J36xFaogQvnQNQoCgz9JOoZohsCirbeX1KbDoDhl99P3wZipAePSBlXADIwB1AN03kBX0KgWp
 FslCB3nFDZZ1EMtXMt756jYAgZEdYK3mvZ7ODfRYsyyZwaLjQX+RVk7L9k78mwgRWBjk8DR6q
 eQaaWGX9WhZjMeqwQAkQRIPST6anX8U0Cbn2+QDNMR9l1YKJ5ig7AD5QqWqQDRGMXTnhDd5LJ
 EWYTaDfQg6qC5XgE/14jBBUlEXovKWaHCTI7Xpe905xhw/09uk=
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
 Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 7, 2020 at 3:34 PM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> Hello Arnd,
>
> We regularly compile and test Linux kernels every day during the merge
> window. Since Thursday last week we have very high CPU usage because of
> the avahi daemon on our desktop Linux systems (Ubuntu, Debian etc). The
> avahi daemon produces a lot of the following log message. This generates
> high CPU usage.
>
> Error message: avahi-daemon[2410]: ioctl(): Inappropriate ioctl for device
>
> strace /usr/sbin/avahi-daemon:
>

Thanks a lot for the detailed analysis, with this I immediately saw
what went wrong in my
original commit and I sent you a fix. Please test to ensure that this
correctly addresses
the problem.

        Arnd
