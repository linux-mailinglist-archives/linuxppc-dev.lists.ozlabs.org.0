Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6E11957B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 14:05:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48phtP0KVbzDrBk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 00:05:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48phlr2VnkzDr6q
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 00:00:06 +1100 (AEDT)
Received: from mail-io1-f44.google.com ([209.85.166.44]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M59am-1jGi2y1pPo-0016jo for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar
 2020 13:54:52 +0100
Received: by mail-io1-f44.google.com with SMTP id d15so9690523iog.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 05:54:51 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0DOvi7UR7Hr+MmbxiwhOWDOQdT+s6HUcB+ZIhXfj0un55iEdLD
 frhRp4jSKOqPq8OrL6bYvi+H6QgGbUvnFKrsbq8=
X-Google-Smtp-Source: ADFU+vueKMRRVnX6uqbtv+2n6jxNH6u3YPxdn23XTrFSuAqIloIPBnaq1uinFAYZzt7R/58hOnRiuYU6bptE3XgXqoc=
X-Received: by 2002:ac8:d8e:: with SMTP id s14mr13725256qti.204.1585313689290; 
 Fri, 27 Mar 2020 05:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585311091.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1585311091.git.michal.simek@xilinx.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 27 Mar 2020 13:54:33 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
Message-ID: <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:aF8ggkZ95udVzStDpmmoPbVUxMTWZ3vpxA/S+DxPL/pDGnreVrv
 U5Q+rjwbf7g0t4QEgYb8ACi7USELVVLAqIYNx9QLmPVU6Zp1qTB5ym6ErTitR+kWg+g5Je2
 57II6D7ljGhpJlsTGowoHoN+SOy9Pyp3PzQ8VnSEyHQTxJydJ9PctacnZ94k02EvWsFlTeJ
 WhHHwoCpfaPkZjBah+6qw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qZF1xxC1Ppk=:U1iOsdMB7sbgUAi7CMmXds
 0FWJj6d7hVGTGPhUYTlkPgTCCBX29B6GQgGzQXnPgEZVEpjheGqTLDv2fHYU0PtLCJVhsWus3
 XrwebKQ8RItiAhZi9pxqwM882g7kh3YZ/mWMTJB4FfSSyELJKE/do2OL4OP4BZcothHMpOi6i
 aknriyASnejn+Gv6LKXfqAmBqBXanCb29TYlJBkhpeqhs4/uTI8Q0gbsA/y0YPrmaxlVLIThB
 WHdkRcpVsus/21MT45W4JLV7cuTTYU7iWT9ufEfPCRO1AmRReztoAseTQSAwkrWHzhhIGwBOU
 uKt1uPZG4tTDk+O8tXnt+0f/bcqXnUry+1gMf9RT+naOO5xzzcNkq2fBzLrE7+Isd4ldIrPpS
 iSb0GKYABhBZqxTCSRjXeWyLV6SF7yPOAxWLTyqpzmFzsLTSH2hpiAAoGD0EL8uXSlwOZP04G
 CsY4tYS9L/RhP0egfsm0l8fTUqaN5EPHx1U6T3TlRXWW9VPBuXY4Gy5WCGQQ0mHrkrkqdE2bM
 YYnPW+aDqeZvahp2TvyAxEsaayw4Nov2WjbyxGY6U9JzxM9XzJJd3pdgSYjvpV48QDZjY3XsK
 QnPjgysUYwmppTJiOH2//bE1uEYEpJ0Davq2Y0H0edwU29SJHGE/4bFgQGnsnqH86fEX4JLrh
 yKY8o2WBa0Vf3OnElFupoICVtgKIKFyT12yJ7D9mB+7WzMSnNBuhQG4NTA02depdX6jWueLN5
 VBMNUG5AhdBFjLNXMUXjydS9yRjZjxl1eMTIjLol9jYkxEAgKulrRA3ftvz3/uqG/4kKW6hKY
 J1hdUx2JWKMZI7siIU1dLfNUVnRSg7IEVdpPEx2gIIQ4nCteI4=
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Leonardo Bras <leonardo@linux.ibm.com>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 27, 2020 at 1:12 PM Michal Simek <michal.simek@xilinx.com> wrote:
>
> recently we wanted to update xilinx intc driver and we found that function
> which we wanted to remove is still wired by ancient Xilinx PowerPC
> platforms. Here is the thread about it.
> https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
>
> I have been talking about it internally and there is no interest in these
> platforms and it is also orphan for quite a long time. None is really
> running/testing these platforms regularly that's why I think it makes sense
> to remove them also with drivers which are specific to this platform.
>
> U-Boot support was removed in 2017 without anybody complain about it
> https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
>
> Based on current ppc/next.
>
> If anyone has any objection about it, please let me know.

Acked-by: Arnd Bergmann <arnd@arndb.de>

This looks reasonable to me as well, in particular as the code only
supports the two
ppc44x virtex developer boards and no commercial products.

It does raise a follow-up question about ppc40x though: is it time to
retire all of it?
The other ppc405 machines appear to have seen even fewer updates after the
OpenBlockS 600 got added in 2011, so it's possible nobody is using them any more
with modern kernels.

I see that OpenWRT removed both ppc40x and ppc44x exactly a year ago after
they had not been maintained for years.

However, 44x (in its ppc476 incarnation) is clearly still is used
through the fsp2 platform,
and can not be deprecated at least until that is known to have stopped
getting kernel
updates.

        Arnd
