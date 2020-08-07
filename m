Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9626423F2FE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 21:14:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNZlv2W7DzDqkT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 05:14:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.220;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=E5Ge70zl; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNZjz03RKzDqkG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 05:12:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596827534;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=P7mhstXZ3r0aQzc0W25GtF8XW6jQOXfcbCvk2BpLqd4=;
 b=E5Ge70zlB5FFTcDYILAgLaR0OA9yEcnbS0mMww/ntS0omd9hHeSwIRX5RgTpn9VrL6
 N5aJrYkdO0CQejgFZaniQzFzVHz1PYmgyENL/To9giI/XcLgI+GlJSnqEIqsfkiLA3LN
 Ed/ncFctQzcxhC/RW7rKoYL4Lnv1664iZIMkOytaMT+XtbEit4W5fdz3jm7DynH6Kd2p
 qZc7nVKQ1NgfkOfJJhvEx3dvDUMFwoMqTHvYBI+rM5vNdhYhcLiCN48AdS/W+MRaE/jf
 x4zUaaMzsFMhNPPqkluWvStRlE2a/30ESFGp5ZsOJ79DsXp3ITo1tD26Ix5FzpS1a1ah
 n/Ow==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2Zx37owlXZszUtLBzgXn3WKO295t5bmobInEcRf"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b10d:ea0c:6c03:2994:72c7:709e]
 by smtp.strato.de (RZmta 46.10.5 AUTH)
 with ESMTPSA id 60686ew77JC9QLb
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 7 Aug 2020 21:12:09 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [Latest Git kernel/Linux-next kernel] Xorg doesn't start after
 the seccomp updates v5.9-rc1
Date: Fri, 7 Aug 2020 21:12:08 +0200
Message-Id: <B13B4293-8DF4-4FC7-A48F-60A5A9121B61@xenosoft.de>
References: <202008071043.2EABB8D24B@keescook>
In-Reply-To: <202008071043.2EABB8D24B@keescook>
To: Kees Cook <keescook@chromium.org>
X-Mailer: iPhone Mail (17G68)
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
Cc: mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kees,

Thanks a lot for your patch! I think your patch works because I can patch th=
e Git source code but the kernel doesn=E2=80=99t boot. In my point of view y=
our modifications aren=E2=80=99t responsible for this second issue. The kern=
el can=E2=80=99t initialize the graphics card anymore. I think the latest DR=
M updates are responsible for the second issue. Because of this second issue=
 I can=E2=80=99t test your patch.

Please test the latest Git kernel.

Thanks,
Christian

> On 7. Aug 2020, at 19:45, Kees Cook <keescook@chromium.org> wrote:
>=20
> =EF=BB=BFOn Fri, Aug 07, 2020 at 04:45:14PM +0200, Christian Zigotzky wrot=
e:
>> But Xorg works on Ubuntu 10.04.4 (PowerPC 32-bit), openSUSE Tumbleweed
>> 20190722 PPC64 and on Fedora 27 PPC64 with the latest Git kernel.
>>=20
>> I bisected today [4].
>>=20
>> Result: net/scm: Regularize compat handling of scm_detach_fds()
>> (c0029de50982c1fb215330a5f9d433cec0cfd8cc) [5] is the first bad commit.
>>=20
>> This commit has been merged with the seccomp updates v5.9-rc1 on 2020-08-=
04
>> 14:11:08 -0700 [1]. Since these updates, Xorg doesn't start anymore on so=
me
>> Linux distributions.
>=20
> Hi! Thanks for bisecting; yes, sorry for the trouble (I'm still trying
> to understand why my compat tests _passed_...). Regardless, can you try
> this patch:
>=20
> https://lore.kernel.org/lkml/20200807173609.GJ4402@mussarela/
>=20
> --=20
> Kees Cook
