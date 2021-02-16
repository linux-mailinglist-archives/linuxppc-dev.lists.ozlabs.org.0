Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B920131CF8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 18:50:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dg7md5rrrz3bPC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 04:50:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
X-Greylist: delayed 626 seconds by postgrey-1.36 at boromir;
 Wed, 17 Feb 2021 04:50:24 AEDT
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dg7mJ0qxLz30KJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 04:50:21 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dg7X256vfzB09ZP;
 Tue, 16 Feb 2021 18:39:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id obuZMT7z7GUL; Tue, 16 Feb 2021 18:39:46 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dg7X24HVlzB09ZM;
 Tue, 16 Feb 2021 18:39:46 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 769CB1EC; Tue, 16 Feb 2021 18:42:47 +0100 (CET)
Received: from 37-171-22-224.coucou-networks.fr
 (37-171-22-224.coucou-networks.fr [37.171.22.224]) by messagerie.c-s.fr
 (Horde Framework) with HTTP; Tue, 16 Feb 2021 18:42:47 +0100
Date: Tue, 16 Feb 2021 18:42:47 +0100
Message-ID: <20210216184247.Horde.If3nEUb5zLh4eU_4qXZCAw1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
Subject: Re: [PATCH 1/4] add generic builtin command line
References: <20190319232448.45964-2-danielwa@cisco.com>
 <20190320155319.2cd3c0f73ef3cdefb65d5d1e@linux-foundation.org>
 <20190320232328.3bijcxek2yg43a25@zorba>
 <20190320201433.6c5c4782f4432d280c0e8361@linux-foundation.org>
 <20190321151308.yt6uc3mxgppm5zko@zorba>
 <20190321151519.1f4479d92228c8a8738e02cf@linux-foundation.org>
 <1613417521.3853.5.camel@chimera>
In-Reply-To: <1613417521.3853.5.camel@chimera>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, xe-linux-external@cisco.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Maksym Kokhan <maksym.kokhan@globallogic.com>,
 Daniel Walker <dwalker@fifo99.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Daniel Walker <danielwa@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us> a =C3=A9crit=C2=
=A0:

> On Thu, 2019-03-21 at 15:15 -0700, Andrew Morton wrote:
>> On Thu, 21 Mar 2019 08:13:08 -0700 Daniel Walker <danielwa@cisco.com> wr=
ote:
>> > On Wed, Mar 20, 2019 at 08:14:33PM -0700, Andrew Morton wrote:
>> > > The patches (or some version of them) are already in linux-next,
>> > > which messes me up.  I'll disable them for now.
>> >
>> > Those are from my tree, but I remove them when you picked up the=20=20
>>=20series. The
>> > next linux-next should not have them.
>>
>> Yup, thanks, all looks good now.
>
> This patchset is currently neither in mainline nor in -next. May I ask
> what happened to it? Thanks.

As far as I remember, there has been a lot of discussion around this series=
.

As of today, it doesn't apply cleanly anymore and would require rebasing.

I'd suggest also to find the good arguments to convince us that this=20=20
series=20has a real added value, not just "cisco use it in its kernels=20=
=20
so=20it is good".

I proposed an alternative at=20=20
https://patchwork.ozlabs.org/project/linuxppc-dev/cover/cover.1554195798.gi=
t.christophe.leroy@c-s.fr/=20but never got any feedback so I gave=20=20
up.

If=20you submit a new series, don't forget to copy ppclinux-dev and=20=20
linux-arch=20lists.

Christophe


