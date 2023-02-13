Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1512F694271
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 11:12:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFgBV0L5fz3cGT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 21:12:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=2a02:1800:110:4::f00:10; helo=riemann.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [IPv6:2a02:1800:110:4::f00:10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFg9s6HTxz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 21:11:59 +1100 (AEDT)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4PFg9h0kWlz4x3xn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 11:11:52 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:5d34:d0af:a884:130e])
	by laurent.telenet-ops.be with bizsmtp
	id LaBq2900Q3vMoCy01aBqf9; Mon, 13 Feb 2023 11:11:51 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pRVoM-008u3i-AL;
	Mon, 13 Feb 2023 11:11:50 +0100
Date: Mon, 13 Feb 2023 11:11:50 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.2-rc8
In-Reply-To: <20230213100542.328169-1-geert@linux-m68k.org>
Message-ID: <7154f87-ca35-4d13-7a7c-1e29105d3b8c@linux-m68k.org>
References: <CAHk-=wj1=T1KzpPWbhqfFWOEp5Wf_kj3JjTHSHmEngf0-Vv7aA@mail.gmail.com> <20230213100542.328169-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Feb 2023, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.2-rc8[1] to v6.2-rc7[3], the summaries are:
>  - build errors: +11/-1

   + {standard input}: Error: unrecognized opcode: `dcbfl':  => 5736, 4743, 4327, 4476, 4447, 5067, 4602, 5212, 5224, 4298, 5594, 4315, 5050, 5195, 4464, 5079
   + {standard input}: Error: unrecognized opcode: `dlmzb.':  => 2848, 18800, 2842, 2383, 106, 2377, 3327, 112
   + {standard input}: Error: unrecognized opcode: `iccci':  => 204, 163, 510
   + {standard input}: Error: unrecognized opcode: `lbarx':  => 570, 196
   + {standard input}: Error: unrecognized opcode: `mbar':  => 887, 558, 1172, 539, 516, 837, 1457, 1125, 815, 7523, 1100, 1385, 368, 703, 662, 468, 441, 1410
   + {standard input}: Error: unrecognized opcode: `mfdcr':  => 3589, 4358, 3565, 3493, 3614, 128, 3445, 276, 3518, 3541, 3469, 4413
   + {standard input}: Error: unrecognized opcode: `mtdcr':  => 265, 4402, 4430, 4375, 4388, 4347, 117, 4443
   + {standard input}: Error: unrecognized opcode: `stbcx.':  => 196, 570
   + {standard input}: Error: unrecognized opcode: `tlbwe':  => 475, 476, 477

powerpc-gcc11/ppc64_book3e_allmodconfig
powerpc-gcc11/powerpc-allmodconfig
powerpc-gcc11/corenet64_smp_defconfig
powerpc-gcc11/powerpc-allyesconfig
powerpc-gcc11/44x/fsp2_defconfig

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/ceaa837f96adb69c0df0397937cd74991d5d821a/ (all 152 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/4ec5183ec48656cec489c49f989c508b68b518e3/ (all 152 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
