Return-Path: <linuxppc-dev+bounces-4622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F051BA00660
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 10:01:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPcxz4q5tz30Sw;
	Fri,  3 Jan 2025 20:01:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.166.175
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735894887;
	cv=none; b=dLEe82bGhFcs9iEAya4zXngyXIdfx2F9ZzbC0YLBMtsPTi82qMiITahDsYkGc3Sd92UqhNS+yJ9wwfJYfGirfQ57AdWusuLvsULLPZS0127/LD74RLwMleNgpuZyx878WdJwPbsAy0GONWu6wyeUJCkRXYZWni7Vx37SzqVFYSLRmxm1vxtuUWkdXYdjAWYrR3LjKuo5azyqOso4inHx9waUDlVYqDP2BmsO0CDU9VwTVKGztuEY5T1QMG7wm58aGJNQzN9bjOKuf8b5iU6D/KG16spdY10cFtmFUZpdfLc6syRSY8VclPwXASNJ71BCxXygL8tXv89RvLLAHa6Zbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735894887; c=relaxed/relaxed;
	bh=j30abThuUeHkj5Ij3LGKLh6rqpnb67GZgQG4O9gJV1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7KY8BtGroXh/GXzhZlYfjOILILjEvy1Aozr23Awzuo0XPZHsB22k2a+0iM68/SPLFenmFLM7uSyJxfRCavQWJScIjdiFAGIRHFRLzqlO7NU8skYd9Kb/oWcTS1Mw5KGWeRvPFBTw7dBif1DV1LXdqiBkxSzrBmXTnxFfghEpDP4j90drlJWkn7VVmAqrnI4LxCYVfCN9uzNGso0K7tnuGQb2ajM9bRJ5Hi6suywZ6NoCWlR+Hn4azBii87MMXh2wOHTPjvIbRNiec1xBQ/RBlVdlLwAKMZJvXd6vYD+aOtpyC6E/eFLW9O7Ytx2L89GQXZUzPyD9PUiqeCFAzCl+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.166.175; helo=mail-il1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.175; helo=mail-il1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPcxx5tcFz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 20:01:25 +1100 (AEDT)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a7e108b491so107998075ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 01:01:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735894882; x=1736499682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j30abThuUeHkj5Ij3LGKLh6rqpnb67GZgQG4O9gJV1M=;
        b=Hq4ka0oZ+oCXPl5I6cWIsuzDZuE9aS17en9b/CGL6OmRtBUJCZXWcNchW1HWtdVeY2
         PgggrI1bGizE4pIGrtMDXYqRhRoMJ5RbAcmFdLdNXzVDNnUi0hdeLDDbaxPNHzHKWTRU
         t2tL4rl+3FVBYn8tN6g83NWg4JxtnnFkvPlZf5leytJ5DX/npG1XiQ+pGiWWAknGQWDE
         8d2oedHyUBfwukS619OexniHL09OUnnXcHoRlrA+3fPdoBXirj+yjqEAPvEQ/vwpkTFF
         TKafYwj6yfwm9g6rduHpE9RiMyYyBHVzCFJABS2pZOVH59E+uR0covZo55FiJpE5I0+0
         j7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgrAoMp6kbpxLjQhHkkfpGBxtjCshdhIcjXvXLp34ArxDFB61G1VoAIZLEXEX3ZOXSGVFqCnfuba0fOR4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyncO70DMwxDxwZhz/dO07ovx4TKCvqvRCkgtSHYjCfKLmHcK+U
	izYmST+Yqb30c6UDOWP2ZLRcoWMslepzUSTVqHv0K2181G/6dA7cjXMKT3ke
X-Gm-Gg: ASbGncv8pffEwb2+RcU4RdDXWFdYOLcZABgjK+//da6iAddxe+Nyys7ITGfq08rS+Dm
	z/lKNqlAL1iMQ1mxKgR4+841T1lJm7VDTIdsrodYvr++krS5Iv7nqQVRkpBc0BldReDQHuEbG+I
	8qiOfz45V+PowYXvb7H/9074J+HX+woJLPxzxdMP7te4JF+6m5l6pXBzKeLu1Uk61HJ8fwJuS6+
	/BiHRSoBoFaZaKpaUyJragy0/eCoHnmwpV6DQ9ZYIYyJOSmykcyphNeCL4zIojstaHxS04lSOs6
	rSEFceamW4Ku0GL+SC8=
X-Google-Smtp-Source: AGHT+IHmdqgg3nnXTdife7sWHBj5nuogs0pOan7MUNKi589FWJNuF+f8hBLHhc2lbWyRrk6rQpMeaw==
X-Received: by 2002:a05:6e02:2185:b0:3a7:c072:c69a with SMTP id e9e14a558f8ab-3c2d1c919b7mr424465205ab.3.1735894881646;
        Fri, 03 Jan 2025 01:01:21 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf64f1esm7256755173.37.2025.01.03.01.01.20
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:01:21 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-844e61f3902so1029904939f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 01:01:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrfatQZWmYC/k3JiVOmNt/O1INSNlXnZW/sdnhwImFby54r7Q526hc37m7GfTprDict+rNXDp2SiBLFYE=@lists.ozlabs.org
X-Received: by 2002:a05:6102:160e:b0:4b2:bdf1:c1ba with SMTP id
 ada2fe7eead31-4b2cc380883mr40018988137.13.1735894419660; Fri, 03 Jan 2025
 00:53:39 -0800 (PST)
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
MIME-Version: 1.0
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net> <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
In-Reply-To: <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 09:53:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGdpVqkdvoFxu84YgBh_0fsAKeBhWFEg+nDyGLwbruig@mail.gmail.com>
Message-ID: <CAMuHMdVGdpVqkdvoFxu84YgBh_0fsAKeBhWFEg+nDyGLwbruig@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove driver
 using deprecated API wext
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Geoff Levand <geoff@infradead.org>, 
	Simon Horman <horms@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Larry Finger <Larry.Finger@lwfinger.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Pavel Machek <pavel@ucw.cz>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	Gregory Greenman <gregory.greenman@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Stefan Lippers-Hollmann <s.l-h@gmx.de>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Philipp,

CC hch

On Fri, Jan 3, 2025 at 7:44=E2=80=AFAM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
> T2 is working but to make this happen the T2 Author has an own repo for
> patches to apply. In the following video he publishes his view on how
> well the ps3disk is maintained and tested by the linux kernel community.
> My impression of this is that ps3disk is not tested on hardware at all.
> You can find this in a youtube video: =E2=80=9CI can't believe VIP Linux =
kernel
> developer BROKE PS3 support=E2=80=9D but watch out that you are in a good=
 mood
> otherwise it is pulling you down like me...
>
> The commit that is breaking the function is:
> commit a7f18b74dbe171625afc2751942a92f71a4dd4ba

Thanks, I see no evidence of this ever being reported upstream, which
makes it rather difficult to be aware of the issue...

> This fixes are not in Mainline up to today. So who beside T2 Linux is
> using this? You can find more of those breaking patches... and videos...

Care to tell us where the fix is?

/me looks at the bad commit...

Oh, dev->bounce_size is used before set. Patch sent.
https://lore.kernel.org/06988f959ea6885b8bd7fb3b9059dd54bc6bbad7.1735894216=
.git.geert+renesas@glider.be

> The following points are also in the list of reasons:
> - This driver has a maximum 54MBit/s as it supports only 802.11 b/g.
> - Using this hardware is security wise not state of the art as WPA3 is
>    not supported.

If you only do VPN over such an insecure link, I guess it's still safe?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

