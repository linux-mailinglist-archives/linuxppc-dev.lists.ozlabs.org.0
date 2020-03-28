Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CDA1966D7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 16:08:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48qMYn2zhJzDqqJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 02:08:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pAerVg/B; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48qMWs3BGzzDqRY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 02:07:00 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id g62so15964103wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 08:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mVgDlbMGn4jDqjs9njtSrU27RzsFbT7yecFsuKk/EMo=;
 b=pAerVg/BGNM5T+nr0f/WwdO9Sh/P7G2ATAgE4lNBidp3VyZgVp8LxhD/XwzK89hnOg
 usJIzU/qodT0h2/Ns64sdH7qoMADJVl1greGt5bNdBrkcwZNycbXnMB/r6C6JVPHpXYW
 iqrRSrSaKFt5OnMOScfOa1ul6/G4lV9C7GNgn7942i6w3uiUEKLh94YFaYDItSpPvIXq
 IM1KSp/5JglcqNsNCNMGy/rrO8yDQ52qTNFUDuzNTulArfyjtbDQRavO1TgYHyyFOWbe
 8OochIAY/vIUTK3+Vk47IkLWBpTG9nemLY0y5+ewYu/PRwOACY6Rnomm2wmlQvwvQA3d
 zIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mVgDlbMGn4jDqjs9njtSrU27RzsFbT7yecFsuKk/EMo=;
 b=j/BMQSw37FfOnhMfRL5GZKu8qMOluurVGju752mdk4jJ8W1cBzllsFDxXsz+oLxGnw
 1oU9ZRbNswfsxb7gMt2M5fzxfxCCkBYg6KT97/K894zqJmZUfh8dQT985gVaWf29isld
 2CTTQM8tj3kQ1FlfaiplmKpXMj+qHBuItWKEHPkzXaO2BkYhys1TqwSe0uagq1xTi/XR
 XXcT0c+Ijys3raimfKdLR4C9KBaTkzcB+nT6maBCp/f8ykNXiFGUfsW2j5Q6xDcHE/XI
 Y5qko81q0GCx9ZB/KHKCX/FA73e/XrsrpHgyWp5uaNaaP+IsdZSMWw1pgs7XtkA9XV7l
 1HBQ==
X-Gm-Message-State: ANhLgQ3R+SJyt3Ktz7KNW9Qc6+lJFMB9aiaC+bjJYVe6aJzR3ctqztFo
 CXFJ6ik+ea6ylnk+4FJglqjCf5jUh5U=
X-Google-Smtp-Source: ADFU+vteJ7u8UrlhBBVMg4JqNC0kDksrUoieeVxPUbKA/6mGuyk6Ju6nrOnD4bcgifgNuy3cdqORtg==
X-Received: by 2002:a1c:790e:: with SMTP id l14mr3968340wme.146.1585408016017; 
 Sat, 28 Mar 2020 08:06:56 -0700 (PDT)
Received: from debian64.daheim (p5B0D73FB.dip0.t-ipconnect.de. [91.13.115.251])
 by smtp.gmail.com with ESMTPSA id y11sm4695479wmi.13.2020.03.28.08.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 08:06:55 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
 by debian64.daheim with esmtp (Exim 4.93)
 (envelope-from <chunkeey@gmail.com>)
 id 1jID30-0006Y1-43; Sat, 28 Mar 2020 16:06:54 +0100
From: Christian Lamparter <chunkeey@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Enrico Weigelt <info@metux.net>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
Date: Sat, 28 Mar 2020 16:06:54 +0100
Message-ID: <2194609.nAEUQZTCmX@debian64>
In-Reply-To: <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Sasha Levin <sashal@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, ewald_comhaire@hotmail.com,
 DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(Sorry for the bounces, yes my smarthost mail setup breaks from time to time
and I had to cut the CC since it complained about the length.)

On Saturday, 28 March 2020 12:17:58 CET Christophe Leroy wrote:
>=20
> Le 27/03/2020 =E0 15:14, Andy Shevchenko a =E9crit :
>> On Fri, Mar 27, 2020 at 02:22:55PM +0100, Arnd Bergmann wrote:
>>> On Fri, Mar 27, 2020 at 2:15 PM Andy Shevchenko
>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>> On Fri, Mar 27, 2020 at 03:10:26PM +0200, Andy Shevchenko wrote:
>>>>> On Fri, Mar 27, 2020 at 01:54:33PM +0100, Arnd Bergmann wrote:
>>>>>> On Fri, Mar 27, 2020 at 1:12 PM Michal Simek=20
>>>>>> <michal.simek@xilinx.com> wrote:
>>>>>> It does raise a follow-up question about ppc40x though: is it time to
>>>>>> retire all of it?
>>>>>
>>>>> Who knows?
>>>>>
>>>>> I have in possession nice WD My Book Live, based on this=20
>>>>> architecture, and I won't it gone from modern kernel support.
>>>>> OTOH I understand that amount of real users not too big.
Hm, can't add much to Xilinx ppc405/440 removal patch debate.=20

But as for the APM82181 with it's PPC464:

The last time I checked was with 5.6-rc4, it worked fine on the APM82181
(a MyBook Live) device. I've made a "build your own powerpc debian sid"
image thing that takes the latest kernel git and up-to-date packages
from debian ports (they still make powerpc packages!):=20
<https://github.com/chunkeey/mbl-debian> .

Though, this is small potatoes. There exists a much more popular project
by Ewald Comhaire (CCed): <https://github.com/ewaldc/My-Book-Live>
that serves the largest userbase:
<https://community.wd.com/c/wd-legacy-products>

I guess we should think about upstreaming the MyBook Live DTS. Problem here
is that we deviated a bit from the canyonlands.dts/bluestone.dts structure
by having a skeleton apm82181.dtsi with most of the SoC defintition and a
wd-mybooklive.dts for the device.

<https://github.com/chunkeey/mbl-debian/blob/master/dts/apm82181.dtsi>=20
<https://github.com/chunkeey/mbl-debian/blob/master/dts/wd-mybooklive.dts>

Cheers,
Christian



