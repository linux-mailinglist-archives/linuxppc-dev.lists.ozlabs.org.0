Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E14FDDAA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 13:37:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd3cg3dgBz3bbV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 21:37:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N3/DiKCN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e;
 helo=mail-ej1-x62e.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=N3/DiKCN; dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd3c21nVRz2x9W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 21:37:21 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id bg10so36756670ejb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 04:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Ireb+u2fz+HNDp7W/0u9tq1dE6EEB8pXAEENxA5hKe0=;
 b=N3/DiKCNwWEXj6baA/2A7S/u+N9x0cmIYnpFq5u882hKTkppGapWKjCAzu6HvUzdTb
 sYHXpr6qZJwnrsqJWLdgMv0sg/7fxY1FO0iUCbgAS/aWCtA+qdSsgSjdtQ3Vl3kikFaH
 Ity+WWj1mcX+25gbyeHsj2h2Yom8e5qNmDrIgfpEJ0jbVf13S1FtMLyYY+CamfhXm4Hh
 kByIIuYOH90KylSxKVeYQ7BkbiYp8IvlnQyKLDAbYLYocFfUF8J226MVMo374edYU8Wi
 iUcGMPq5CQsOFI0pyC/0IOSBJpjRAvS2afx8ubJTpSig8FABBB3LfG2S4Ep5WP5xXqft
 F3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Ireb+u2fz+HNDp7W/0u9tq1dE6EEB8pXAEENxA5hKe0=;
 b=2G2gw0410I23uuLoS7CNuHsDD/yzLnY+XIZmiLYDfJ78MSjWQbGeOpgqc4fmKjtFYC
 jE9oTx3Zfitc0dU0HRRXTak8dYBG6AfAnm+CuQgtd6LblWXmLUCD/Sre0fChLkt4jzry
 XLFpbOM4LtjvfHKr62YFkbBHjuYibbYdcMCbD+BP57QNem04kRMwXAzN0f4g5oORNvpD
 0I9ogt6XJS5pJi/qj82XEavLrDzzqKdSdpEbVwy+eQ7okhze/0DPUIxNZR6byRxbRTNU
 yAzUlCiZgQxag4ad5HYwh0PnbugwmPDu9cgYffov1FSpWvZjHo8wvq1lv1k/4taaSjdw
 XHcw==
X-Gm-Message-State: AOAM530mfA6yVF3V9Vu/rskUTXtb6oxBNL9omA2eLSJb4yjAY7gt/L0a
 SB6YUgJfKcbVPq09DgMsX/A=
X-Google-Smtp-Source: ABdhPJyVdngo1HvueM2ZUMpF2ABzA9tTU6Hq/Z1IehvEZwx5+grwH5M0xobTdptT/tEuHm5m8cBuXw==
X-Received: by 2002:a17:907:160b:b0:6e8:58c1:8850 with SMTP id
 hb11-20020a170907160b00b006e858c18850mr14414194ejc.284.1649763438997; 
 Tue, 12 Apr 2022 04:37:18 -0700 (PDT)
Received: from smtpclient.apple (i130160.upc-i.chello.nl. [62.195.130.160])
 by smtp.gmail.com with ESMTPSA id
 fu13-20020a170907b00d00b006e8ae97f91asm947697ejc.64.2022.04.12.04.37.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Apr 2022 04:37:18 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH net-next v2 05/18] net: dsa: mv88e6xxx: remove redundant
 check in mv88e6xxx_port_vlan()
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <YlViPWWKhvoV2DLN@shell.armlinux.org.uk>
Date: Tue, 12 Apr 2022 13:37:17 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <8BAFAAD1-D9AB-4339-BE81-18BE564F78F6@gmail.com>
References: <20220412105830.3495846-1-jakobkoschel@gmail.com>
 <20220412105830.3495846-6-jakobkoschel@gmail.com>
 <YlViPWWKhvoV2DLN@shell.armlinux.org.uk>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Ariel Elior <aelior@marvell.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "Bos, H.J." <h.j.bos@vu.nl>, linux-arm-kernel@lists.infradead.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakub Kicinski <kuba@kernel.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Yonghong Song <yhs@fb.com>,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 12. Apr 2022, at 13:27, Russell King (Oracle) =
<linux@armlinux.org.uk> wrote:
>=20
> On Tue, Apr 12, 2022 at 12:58:17PM +0200, Jakob Koschel wrote:
>> We know that "dev > dst->last_switch" in the "else" block.
>> In other words, that "dev - dst->last_switch" is > 0.
>>=20
>> dsa_port_bridge_num_get(dp) can be 0, but the check
>> "if (bridge_num + dst->last_switch !=3D dev) continue", rewritten as
>> "if (bridge_num !=3D dev - dst->last_switch) continue", aka
>> "if (bridge_num !=3D something which cannot be 0) continue",
>> makes it redundant to have the extra "if (!bridge_num) continue" =
logic,
>> since a bridge_num of zero would have been skipped anyway.
>>=20
>> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
>> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
>=20
> Isn't this Vladimir's patch?
>=20
> If so, it should be commited as Vladimir as the author, and Vladimir's
> sign-off should appear before yours. When sending out such patches,
> there should be a From: line for Vladimir as the first line in the =
body
> of the patch email.

yes, you are right. I wasn't sure on how to send those commits, but
I guess if I just set the commit author correctly it should be fine.

regarding the order: I thought I did it correctly doing bottom up but
I confused the order, wasn't on purpose. Sorry about that.

I'll resend after verifying all the authors and sign-offs are correct.

>=20
> The same goes for the next mv88e6xxx patch in this series - I think
> both of these are the patches Vladimir sent in his email:
>=20
> https://lore.kernel.org/r/20220408123101.p33jpynhqo67hebe@skbuf
>=20
> Thanks.
>=20
> --=20
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

Thanks for pointing it out!
Jakob

