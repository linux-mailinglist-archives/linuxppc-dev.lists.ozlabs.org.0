Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0621C0998
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 23:44:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cpn24TYQzDrDp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 07:44:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=stevens-zone.net (client-ip=217.72.192.73;
 helo=mout.kundenserver.de; envelope-from=darren@stevens-zone.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=stevens-zone.net
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cpl15V9PzDrCF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 07:42:37 +1000 (AEST)
Received: from A1K-Ubuntu.lan ([209.93.117.199]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.179]) with ESMTPA (Nemesis) id
 1MGhds-1jPNIg0q5i-00Druq; Thu, 30 Apr 2020 23:36:56 +0200
From: Darren Stevens <darren@stevens-zone.net>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Date: Thu, 30 Apr 2020 22:32:14 +0100 (BST)
Message-ID: <4f9f12e02c7.744a6d93@auth.smtp.1and1.co.uk>
In-Reply-To: <68BEA58A-DF1D-44B8-91DD-B90BAAB738BE@xenosoft.de>
References: <20200429152224.GA66424@lunn.ch>
 <68BEA58A-DF1D-44B8-91DD-B90BAAB738BE@xenosoft.de>
User-Agent: YAM/2.9p1 (AmigaOS4; PPC; rv:20140418r7798)
Subject: Re: Don't initialise ports with no PHY
MIME-Version: 1.0
Content-type: multipart/mixed; boundary="--=_BOUNDARY.6be26a90625442d4.e1"
X-Provags-ID: V03:K1:F/6F678m71Jdl3s1yEHlllWRlA8edSbpKEweBe4FLqBQOv/wdi3
 RACK8kJ8i+EtfAXcrOdelrl9OuXqtU3+m9FPZ6KtFmQp4kNxxrMyXJDHWG/3AD1hOvNYYUI
 aYx5uKC1d6kFDeA1/02SaWMeLmt28mm+KwfYbsf243wHIONVpAE6Mn79F6JSCw+AS8mibxS
 d7YZaT85LrO9vi3glRNfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1DqbT3d+HMQ=:fWSpj6si4iCEjr5u5h/L0Y
 wEbPyBGqrsOglZIyu+j0qMdxJZ1buQDZ8PxZrWAu3wKKZc20EoF7ar0FruLH8h/XpO8aOnJMD
 0MfYjUAzEcWA9LGy/FBGbVfgy+w+Eou8j+0/stEvqkVXxQR8SDHwV2viHiAwXRB5HSANFuNiB
 AMGBxhotPnatkk5OImzwFkW6B4OhZy3s5wfE384FiThd2kZ4l78qZbQIqocnkiEa/9JWDjRd2
 LbH2kqF0jzqGdsE+0qjlofcW6VoxKN390mtg8UijYiTu5sLBSfH3NdHyhtaiqcHXWlfAGxijY
 dvwvEr1/Px54lb4GXcnm1cVaYiwVPGUTMhuPiF1dSEzPO8g5EC4rqh8x9zyaHZOJd+EXb1lAt
 9tumT8yKFByMz1GnEbS3ndC1G0chlcu/DKVZ+FKZSp0SqXRSQfQDhl79AVAWrWFKvx1Q2QLNM
 luDnIbR7VAa1vEyxrRy5BraD2m0tbeo1a+54bqpaApIAjke+rF3ujkiCeNX0rQ0M7oGhiXH7w
 +/19Ta6nvA+Xc3QoH38AAni6h+XqnSLOE9hhFp89p25YiUOvanUNJshTiskIDUTSFlAabQLVF
 XvpqcCnK5NYKt8XgXtQzUolhDyPR9J7QEZCTDC5Y5mOdQ/Ul/bTSYODOKtVLYLnFkqR6VuEaF
 MrTRAKqSaxNUPtAFsJtIkoydFUycOHQdNtwn96tniGoNmEhjJRgv104YxfbyB0IrkSNHwO6Um
 tqgLQCAPyQhYBUR/M0e2oPokEehfjLd3nsW+m0wJFYji6QfmZagB4WpizBPjFYC2J+uXapTxn
 1WywKZiejavqHTdoMtefh0wJCJFreMlF6+ABvg3roInnj/KlJg3HewnNvcRofvXArMJQ1Dr
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
Cc: Andrew Lunn <andrew@lunn.ch>, linuxppc-dev@lists.ozlabs.org,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Warning: This is a message in MIME format. Your mail reader does
not support MIME. Some parts of this message will be readable as
plain text. To see the rest, you will need to upgrade your mail
reader. Following are some URLs where you can find MIME-capable
mail programs for common platforms:

  AmigaOS...........: http://yam.ch/
  Unix/MacOS/Windows: http://www.mozilla.com/thunderbird/

General information about MIME can be found at:
http://en.wikipedia.org/wiki/MIME

----=_BOUNDARY.6be26a90625442d4.e1
Content-Type: text/plain

Hello Christian

On 29/04/2020, Christian Zigotzky wrote:
>
>
>> On 29. Apr 2020, at 17:22, Andrew Lunn <andrew@lunn.ch> wrote:
>> 
>> ?On Wed, Apr 29, 2020 at 03:55:28PM +0200, Christian Zigotzky wrote:
>>> Hi Andrew,
>>> 
>>> You can find some dtb and source files in our kernel package.
>>> 
>>> Download: http://www.xenosoft.de/linux-image-5.7-rc3-X1000_X5000.tar.gz
>> 
>> I have the tarball. Are we talking about
>>
>>
linux-image-5.7-rc3-X1000_X5000/X5000_and_QEMU_e5500/dtbs/X5000_20/cyrus.eth.dtb
>
>> I don't see any status = "disabled"; in the blob. So i would expect
>> the driver to probe.

No, the vendor never added that to them.

> Yes, that's correct but maybe Darren uses another dtb file.
>
> @Darren
> Which dtb file do you use?

My current one attached, including updated cyrus_p5020.dts & p5020si-pre.dtsi
which I'm preparing patches for.

Christian, build an unmodified kernel, select board level reset or power off,
then both the GPIO drivers.
Then under LED Support: GPIO connected LED's and triggers -> disk activity

I think you still have a 5020 don't you? I'll look at 5040 later (I'll need
someone to test)

Regards
Darren

----=_BOUNDARY.6be26a90625442d4.e1
Content-Type: application/zip;
	name="cyrus-dts.zip"
Content-Disposition: attachment;
	filename="cyrus-dts.zip";
	size=8289
Content-Transfer-Encoding: base64

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
BOgDAABQSwUGAAAAAAMAAwAAAQAASx8AAAAA
----=_BOUNDARY.6be26a90625442d4.e1--


