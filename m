Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9787197718
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 10:54:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rR916NfFzDqkK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 19:54:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rR6r4bmPzDqVx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 19:52:35 +1100 (AEDT)
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mc02T-1in5dZ1B9z-00dXU0 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar
 2020 10:52:30 +0200
Received: by mail-qk1-f174.google.com with SMTP id c145so18058392qke.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 01:52:29 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3tusIBHpFpHlbvsxDTO5vF7kTIus7+CQ7TAmzOTm/zkvii1b9m
 4b2phR+amjGo152AblTFKJ8lvc5HO5KCFWmx95I=
X-Google-Smtp-Source: ADFU+vspLuSrK8vR03RwDBO/StenmRiwdE7jGV6xhNQgPE6lP5dk6ojwytg8GYIfZCdnyNJJEiEKM8ekH1yyAFQe8+w=
X-Received: by 2002:a37:8707:: with SMTP id j7mr10668481qkd.394.1585558348217; 
 Mon, 30 Mar 2020 01:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr> <2194609.nAEUQZTCmX@debian64>
In-Reply-To: <2194609.nAEUQZTCmX@debian64>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 Mar 2020 10:52:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0i7virtvTJHb2Ssx5zmJ4joKPEjK6timAXGK7BdymzKw@mail.gmail.com>
Message-ID: <CAK8P3a0i7virtvTJHb2Ssx5zmJ4joKPEjK6timAXGK7BdymzKw@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Christian Lamparter <chunkeey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:9CW1shJ8yWNm1W8OhpGq2A74iUWZ5lAbGUSupP8pwRgQbsindg7
 gRhTfkj8YZs/3Bo4kUCYsHvvp4CWf5vW8/0/pkRpZhN8f30nQGbYc+RAToHd7Kb1uyIrfjO
 b5eKghYe/DuZTnIy/EyWdTp3XNVb4rlVd8k0Q15g0NRuOkBn873QRXSeGDoNEZfa1IEfXBq
 yxfrdItaZA4uR0THbfg8g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BVJqj9U/r8I=:SYbsfStNgqQFCyxsf1Hplp
 aUUz8cPQ7uVdYzJHk1UOKUmjY8uAPzuOo9gRd4LFLCpIsMWrROEPBYCMjGkGc0LgkBUAG3Ij0
 YuBsYGNVHthrXA+qyMlb5DO6mbT3r0jLHi0aiDA4zUk4QWWAu1Lgd0aAEaAwNrV6OqXW9ufkS
 kcY285NzLT02UgQN4KZGe4dDXId5waqjbO69AMhmXxnUGRrgR3PeZv0qr+YijLtfwO6ml3z4w
 3ksROHyA5ftEXZf9Ab58EP3VCEENdiRHdyj1XxZ1Wyf8yEucN+Xy7YZHYKAZPj+VaHXWIgN5h
 /yCWhpejl+sYLI7YbJ+PxnmXU/3koNRZ6a6d9ClRxrAr3gmNIgPEZtu5H40OarNHDCuzUQclX
 XZaovL/MuRQ7FdnR6p1N74lIkJBeDtVxkO15k8BcwMoENEkTrWs/NPsr6NY5C1fyBId0ssLxo
 DseIOPCB+IVt5MjWJUJ9hH6PT2OpJsHB+ntx1OyeVBHLnFkyJvAGLZVwXqzanGyvTDaPy/K7D
 wYKVEcdbXRV8/TX86dx5U0C0TzK0p3DC57pZ/iX2jNpLfgADcFr49R3MF24NMTvACVpj31NYG
 NAYKhMzEqVSIOK1+JbxiqHo06G15qmw5I7UD14IPdpgnRqALTJH0kGrDdspuB6d+boGsSMTW0
 w8aNtz8n7ru8aKHtq6FGBE947XBG6W0eNjxyb4zwlltF2jPioyDyzOUFI9ooAG7eGVhC40kK0
 yD3e1z+ra3kCPMhwIcm60KZTbtXrxYLALyZ1Qr9JkB1U62JGZvVL8pImgrXNA9mAu2BRwP32X
 3rPqghlXlBJpPK4cEgJ93Ozn0ghcSXNILebwQQ2dKqPX/o25P0=
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, ewald_comhaire@hotmail.com,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Enrico Weigelt <info@metux.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 28, 2020 at 4:07 PM Christian Lamparter <chunkeey@gmail.com> wrote:
>
> (Sorry for the bounces, yes my smarthost mail setup breaks from time to time
> and I had to cut the CC since it complained about the length.)
>
> I guess we should think about upstreaming the MyBook Live DTS. Problem here
> is that we deviated a bit from the canyonlands.dts/bluestone.dts structure
> by having a skeleton apm82181.dtsi with most of the SoC defintition and a
> wd-mybooklive.dts for the device.

I don't see much of a problem with that. If the chips are quite
different, then this
would be the right way to do it, and it matches how most dts files are
structured
on arm and others as well.

It would be nice to move over the the bluestone .dts to the apm82181.dtsi file
when that gets added, if only to ensure they use the same description for each
node, but that shouldn't stop the addition of the new file if that is needed for
distros to make use of a popular device.
I see a couple of additional files in openwrt [1],

[obviously, I'm not actually the one in charge here, the decision is with the
 powerpc maintainers].

        Arnd

[1] https://git.openwrt.org/?p=openwrt/openwrt.git;a=tree;f=target/linux/apm821xx/dts;h=d359ba4ed83547438581dd40105e5100d8240beb;hb=HEAD
