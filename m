Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364CD7E99E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 11:12:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STQGN3y3sz3cX3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 21:12:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=195.130.137.80; helo=riemann.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 579 seconds by postgrey-1.37 at boromir; Mon, 13 Nov 2023 21:12:03 AEDT
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STQFv4mHHz2xTR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 21:12:02 +1100 (AEDT)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4STQ2V2ycgz4wykQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 11:02:10 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:e81:b3d6:4f11:ac28])
	by albert.telenet-ops.be with bizsmtp
	id 9m292B0030WpEYl06m29vw; Mon, 13 Nov 2023 11:02:09 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r2Tlh-009BsO-30;
	Mon, 13 Nov 2023 11:02:09 +0100
Date: Mon, 13 Nov 2023 11:02:09 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.7-rc1
In-Reply-To: <20231113093630.4164101-1-geert@linux-m68k.org>
Message-ID: <60ca157e-6eff-d12c-9dc0-8aeab125edda@linux-m68k.org>
References: <CAHk-=whuO0zmuxp_yorYFWdcrALpqjRPhWkmEy+7wcCnnDcPNA@mail.gmail.com> <20231113093630.4164101-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: linux-sh@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linuxppc-dev@lists.ozlabs.org, linux-edac@vger.kernel.org, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Nov 2023, Geert Uytterhoeven wrote:
> Below is the list of build error/warning regressions/improvements in
> v6.7-rc1[1] compared to v6.6[2].
>
> Summarized:
>  - build errors: +20/-7
>  - build warnings: +24/-8
>
> Note that there may be false regressions, as some logs are incomplete.
> Still, they're build errors/warnings.
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/b85ea95d086471afb4ad062012a4d73cd328fa86/ (238 out of 239 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/ffc253263a1375a65fa6c9f62a893e9767fbebfa/ (all 239 configs)
>
>
> *** ERRORS ***
>
> 20 error regressions:
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_654' declared with attribute error: FIELD_PREP: value too large for the field:  => 435:38

powerpc-gcc5/powerpc-allyesconfig
drivers/edac/versal_edac.c: In function 'mc_probe':
num_chans = FIELD_PREP(XDDR_REG_CONFIG0_NUM_CHANS_MASK, regval);

>  + {standard input}: Error: displacement to undefined symbol .L100 overflows 8-bit field :  => 588
>  + {standard input}: Error: displacement to undefined symbol .L104 overflows 8-bit field :  => 588
>  + {standard input}: Error: displacement to undefined symbol .L105 overflows 8-bit field :  => 593
>  + {standard input}: Error: displacement to undefined symbol .L134 overflows 8-bit field :  => 598
>  + {standard input}: Error: displacement to undefined symbol .L72 overflows 12-bit field:  => 589
>  + {standard input}: Error: displacement to undefined symbol .L73 overflows 8-bit field :  => 580
>  + {standard input}: Error: displacement to undefined symbol .L75 overflows 12-bit field:  => 586, 589, 606
>  + {standard input}: Error: displacement to undefined symbol .L76 overflows 8-bit field :  => 577, 580
>  + {standard input}: Error: displacement to undefined symbol .L77 overflows 8-bit field : 582 => 607, 585
>  + {standard input}: Error: displacement to undefined symbol .L78 overflows 8-bit field :  => 610
>  + {standard input}: Error: displacement to undefined symbol .L80 overflows 8-bit field :  => 607, 601
>  + {standard input}: Error: displacement to undefined symbol .L81 overflows 8-bit field : 606 => 604, 610
>  + {standard input}: Error: displacement to undefined symbol .L96 overflows 12-bit field:  => 602
>  + {standard input}: Error: displacement to undefined symbol .L97 overflows 12-bit field:  => 607
>  + {standard input}: Error: displacement to undefined symbol .L98 overflows 12-bit field:  => 602
>  + {standard input}: Error: invalid operands for opcode:  => 612
>  + {standard input}: Error: missing operand:  => 612
>  + {standard input}: Error: pcrel too far: 601, 598, 604, 577, 595, 574 => 590, 598, 599, 577, 596, 569, 604, 610, 572, 593
>  + {standard input}: Error: unknown pseudo-op: `.l':  => 609

sh4-gcc1[123]/sh-all{mod,yes}config ICE

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
