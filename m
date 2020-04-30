Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B140E1C08CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 23:10:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cp2S6GlvzDr74
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 07:10:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=stevens-zone.net (client-ip=217.72.192.74;
 helo=mout.kundenserver.de; envelope-from=darren@stevens-zone.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=stevens-zone.net
X-Greylist: delayed 313 seconds by postgrey-1.36 at bilbo;
 Fri, 01 May 2020 07:06:43 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cnxb6FY4zDqRM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 07:06:42 +1000 (AEST)
Received: from A1K-Ubuntu.lan ([209.93.117.199]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.179]) with ESMTPA (Nemesis) id
 1M9Frd-1jYv08364V-006Pty; Thu, 30 Apr 2020 23:01:15 +0200
From: Darren Stevens <darren@stevens-zone.net>
To: Andrew Lunn <andrew@lunn.ch>
Date: Thu, 30 Apr 2020 21:45:14 +0100 (BST)
Message-ID: <4f9f07dc2ed.5db66924@auth.smtp.1and1.co.uk>
In-Reply-To: <20200425001021.GB1095011@lunn.ch>
References: <20200424232938.1a85d353@Cyrus.lan>
 <20200425001021.GB1095011@lunn.ch>
User-Agent: YAM/2.9p1 (AmigaOS4; PPC; rv:20140418r7798)
Subject: Re: Don't initialise ports with no PHY
MIME-Version: 1.0
Content-Type: text/plain
X-Provags-ID: V03:K1:fmf8xDnUzK1WedA9cWQE5LSLSxbFn1of7nHBxBR3yRKilFW0fF5
 OJ6HQwSUJOCx6rl52kdtqC/xPXc3MQKFito5V+n9aKOJ3dQ3GKqLuVUOgYHMvNJdnGnsT7Q
 lm5/5CZwJPyBdWsByEm07DZCS54J6Bkx2j4n1pIXzRBlK3d/vrvgoc5EqE760My03JZf0ze
 mFpToSbM9vHUJ2kOUsONA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EiccgHL9b90=:TIHN+bidQJnWyH/Aeb7aZi
 a8RXh/lxOf4LHwE3qHrF0pK8M6zL5TQRWTa+wxSHF6LJqmuSdJgAqmPr1/nIhgn9w4bBl0LZq
 QlAgByDGIyGdtDFqMaRG8kWXJ+qk06kyu5aTx+5EvQaOEVb0Gs6e7FK/LMmob0YSELBa1QJeC
 h7riU87tiWSZkH8f0aiGHQj6dtep6v/MUnntx+psu1kA4T6IvdT45AWT0AR/zbSL10hdrO7wa
 hLqdw2GLgmBoyGUY4kmVo2kV3CPxGeFiozVNBRqPYO8o21CxJIA+WaTkXemexY4zc9ayuSeZA
 6VeDOLONhpse/8k82a8DsT7MCgcTAENsstgvek56spcVFoKYACL59tEbaz3eNKt0GmpH/p8Gu
 h9VV8Dy9kl567aAA7KbsyTFnuW7Z0pVOu+Qe9fojkKP8Pzip0druOXfvexbXBqb1iiLfjyDRu
 sU1BWO7D8p3mTf/PzillefDwIfSzEUQpyxCvC0ifTCIcuTRyWOOH2zOYS2Mc6eOSnXW6X/HCp
 SZq4ncOtVo2bGY+5dff848FxgiFDWEYDBTm3CM0A+YrNXezp6fahwaZUmGWM1gXtNJQtjw2jN
 yOYQ7UE0qt322tIspAKypOKqIlUmrSoz4bANDBtGLgTaF33ItVbj3gTFZ4cGk9n/Jpkc92mfv
 cOFfAtMK67pV6wuifc+n/G52tz7qfxI1F2fYE/I/H7CS+qKUOjraPxDofiS7wQtRAPbZRjo/U
 T93zqaPW7V1u1TgPlE6nfmM6k7Z36q2Y5LQuIJ7XTSx/RuxW6qHuQ9f526qlT1BCxycRF0994
 xmsZbe9ysPAcjbqNmRViHwBWn7TrbpJApzlcBbX9ndB4yhayEoZRwJZwpzQtAbaPnhTB/qO
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
Cc: oss@buserror.net, netdev@vger.kernel.org, madalin.bacur@nxp.com,
 linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Andrew

On 25/04/2020, Andrew Lunn wrote:
> On Fri, Apr 24, 2020 at 11:29:38PM +0100, Darren Stevens wrote:
>> Since cbb961ca271e ("Use random MAC address when none is given")
>> Varisys Cyrus P5020 boards have been listing 5 ethernet ports instead of
>> the 2 the board has.This is because we were preventing the adding of the
>> unused ports by not suppling them a MAC address, which this patch now
>> supplies.
>> 
>> Prevent them from appearing in the net devices list by checking for a
>> 'status="disabled"' entry during probe and skipping the port if we find
>> it. 
>
> Hi Darren
>
> I'm surprised the core is probing a device which has status disabled.
> Are you sure this is the correct explanation?

You are correct, the core is detecting status="disabled". My mistake, the Hardware vendor's supplied dts always relied on only supplying active ports with an IP address, and it didn't occur to me to test that they could be disabled.

Sorry.

Regards
Darren

