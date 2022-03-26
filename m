Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2AF4E84FC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 04:05:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQzgl60rsz3c1L
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 13:05:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQrCQ12BRz2ynp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 07:29:04 +1100 (AEDT)
Received: from mail-lf1-f41.google.com ([209.85.167.41]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MsI4Q-1oMKZd2SpG-00tjJx for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Mar
 2022 21:28:59 +0100
Received: by mail-lf1-f41.google.com with SMTP id d5so18688950lfj.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Mar 2022 13:28:59 -0700 (PDT)
X-Gm-Message-State: AOAM530Jgelks5j6QckBuDJsgKhzO0eMeSd9sPDfgjP/9CqX4kdFLthp
 shoHfqkHqaxQ+X+KqAu00MnwLXum3HiJBpBmvRg=
X-Google-Smtp-Source: ABdhPJxx8NCR/u6qmXzG17FP9feBwegQPJsf9Aqi/l68ye4U4vfPlOZSED7ECKkFvKmT885cCFviGMxdRBsqoooKkLU=
X-Received: by 2002:a5d:6505:0:b0:205:9a98:e184 with SMTP id
 x5-20020a5d6505000000b002059a98e184mr11258676wru.317.1648322627645; Sat, 26
 Mar 2022 12:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220326165909.506926-1-benni@stuerz.xyz>
In-Reply-To: <20220326165909.506926-1-benni@stuerz.xyz>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 26 Mar 2022 20:23:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1e57mNUQgronhwrsXsuQW9sZYxCktKij7NwsieBWiGmw@mail.gmail.com>
Message-ID: <CAK8P3a1e57mNUQgronhwrsXsuQW9sZYxCktKij7NwsieBWiGmw@mail.gmail.com>
Subject: Re: [PATCH 01/22] orion5x: Replace comments with C99 initializers
To: =?UTF-8?Q?Benjamin_St=C3=BCrz?= <benni@stuerz.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F/Y26y5bAOzl7lj3bK5ZasFfkkjrxZ6e9+mJkGKfDKUMRBQ8dFY
 aFYxGQB3UMDpcKw836YpSCZWoKvnaYPCLOvpiZpELoxR/7z8uJGv+HRHVtojMsaRBUzCWV5
 +q3/MzrPJ4Shr2DezKiZWeIipfFYVbcTH58QbDzOKZhd92FmcSEtzIJZ+/dqXB8cq0Pjvxu
 Hvc1AVyIPFh7iH94DflLA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1sUMZCjJb8g=:xXHru0d1zDjgUmh3SpT6Nu
 lxdFGiEQv5nVDb4H532Q/Agx1u0sR0FItnOebfsNiCHx3w7mxhjw/LScjMPcZJO3vs4GLWIym
 CGMgDDI00IQO8xI/+nP5cq8ykdZoe8NUO/gHmfKSSvMMTfTskluJb1S/LrFT5ut/qD0i97GEY
 aWOr/bfdi8rfb9HUder2YNVCjCrD747LoLLdp5RY4SJNRcpdsga44fjEnfXKpX79kzBlJQ0nL
 Pk330izvjHs5CdTJUKbjsy/XTOECX5anF8Qk0Du6feJqifKYXDA0f9NdTA//vY70GRzdYltzW
 LdsCqPpIpA+07RGoJhhv3+DKLo9nlHXiAftPxCvtrpYlDi8iG0c1odcEKfDPBMcT6DHFzRBrV
 RjzaEk0+YMtCcU3WoMAUooSiHG+iNqudCbDDVOAm93+hOONNb5sJ26r/bw9WYGZp2cXymVhdy
 P+JLgJ2nnqbnD9NTHC0iy/Q/SxRjX62W2XeIYmSbQ1/91ADl+htlq/SoBF98VTm27GRxBHLoj
 0X3BJDiloClfcbSHJYmeKFe0YjY1Qq1bYpqvQSneF0MsdDd8d9as/oOmsVBtL1rZQjVaoZkmc
 L+TZkwzoTLknaDFLTHJgsoUgDn+pb7VLUmqzRITuRDD6h91oHQPD3SxAqTXlYrjTwA7VJpCm7
 lk/lmWTfKDSzCltNckwWfQqVYsmpfp/kOR4Ll0fA74QMATqxTHLRYoDWGpaeiabHiD2PvrsAi
 YFUMRLf9qQvTeCaT+TWrRuV2SWBz66RaQjFX5OSgoA07EIJlUpACgSl6e3NbedzCq4iIV0ImT
 S+w7Nkdt7LAnV4VS/JelDhRkNsv+gSE+N+RLPzdpH2GEWmtN4beoH5d+5Ax1xX7MmKOOQ42Gx
 HbnKusHwm78ejF9DTPCw==
X-Mailman-Approved-At: Sun, 27 Mar 2022 13:03:21 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-atm-general@lists.sourceforge.net,
 linux-ia64@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 linux-pci <linux-pci@vger.kernel.org>, Robert Moore <robert.moore@intel.com>,
 Harald Welte <laforge@gnumonks.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 "H. Peter Anvin" <hpa@zytor.com>, wcn36xx@lists.infradead.org,
 Pkshih <pkshih@realtek.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, Chas Williams <3chas3@gmail.com>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 Len Brown <lenb@kernel.org>, mike.marciniszyn@cornelisnetworks.com,
 Robert Richter <rric@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, kvalo@kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 loic.poulain@linaro.org, Borislav Petkov <bp@alien8.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 Karsten Keil <isdn@linux-pingi.de>, Tony Luck <tony.luck@intel.com>,
 Nicolas Pitre <nico@fluxnic.net>, gregkh <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Miller <davem@davemloft.net>, James Morse <james.morse@arm.com>,
 Networking <netdev@vger.kernel.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 26, 2022 at 5:58 PM Benjamin St=C3=BCrz <benni@stuerz.xyz> wrot=
e:
>
> This replaces comments with C99's designated
> initializers because the kernel supports them now.

The change looks fine, but the comment looks misplaced, as enum initializer=
s
are not c99 feature. Also, the named array and struct intializers have been
supported by gnu89 for a long time and widely used in the kernel, so it's
not a recent change even for the others.

Also,

      Arnd
