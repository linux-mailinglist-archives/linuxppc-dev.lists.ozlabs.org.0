Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C149966E3E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 17:43:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxF875CSxz3fCg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 03:43:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=<UNKNOWN>)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxF7X4mYSz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 03:43:02 +1100 (AEDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pHp2k-001f9B-4y; Tue, 17 Jan 2023 17:42:38 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pHp2j-002q0C-UX; Tue, 17 Jan 2023 17:42:38 +0100
Message-ID: <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
Date: Tue, 17 Jan 2023 17:42:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Calculating array sizes in C - was: Re: Build
 regressions/improvements in v6.2-rc1
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
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
Cc: linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org, linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Geert!

On 1/6/23 16:17, Geert Uytterhoeven wrote:
>> I'm not seeing this one, but I am getting this one instead:
>>
>> In file included from ./arch/sh/include/asm/hw_irq.h:6,
>>                    from ./include/linux/irq.h:596,
>>                    from ./include/asm-generic/hardirq.h:17,
>>                    from ./arch/sh/include/asm/hardirq.h:9,
>>                    from ./include/linux/hardirq.h:11,
>>                    from ./include/linux/interrupt.h:11,
>>                    from ./include/linux/serial_core.h:13,
>>                    from ./include/linux/serial_sci.h:6,
>>                    from arch/sh/kernel/cpu/sh2/setup-sh7619.c:11:
>> ./include/linux/sh_intc.h:100:63: error: division 'sizeof (void *) / sizeof (void)' does not compute the number of array elements [-Werror=sizeof-pointer-div]
>>     100 | #define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 : sizeof(a)/sizeof(*a)
>>         |                                                               ^
>> ./include/linux/sh_intc.h:105:31: note: in expansion of macro '_INTC_ARRAY'
>>     105 |         _INTC_ARRAY(vectors), _INTC_ARRAY(groups),      \
>>         |                               ^~~~~~~~~~~
> 
> The easiest fix for the latter is to disable CONFIG_WERROR.
> Unfortunately I don't know a simple solution to get rid of the warning.

I did some research and it seems that what the macro _INT_ARRAY() does with "sizeof(a)/sizeof(*a)"
is a commonly used way to calculate array sizes and the kernel has even its own macro for that
called ARRAY_SIZE() which Linus asks people to use here [1].

So, I replaced _INTC_ARRAY() with ARRAY_SIZE() (see below), however the kernel's own ARRAY_SIZE()
macro triggers the same compiler warning. I'm CC'ing Michael Karcher who has more knowledge on
writing proper C code than me and maybe an idea how to fix this warning.

Thanks,
Adrian

> [1] https://lkml.org/lkml/2015/9/3/428

diff --git a/include/linux/sh_intc.h b/include/linux/sh_intc.h
index c255273b0281..07a187686a84 100644
--- a/include/linux/sh_intc.h
+++ b/include/linux/sh_intc.h
@@ -97,14 +97,12 @@ struct intc_hw_desc {
         unsigned int nr_subgroups;
  };
  
-#define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 : sizeof(a)/sizeof(*a)
-
  #define INTC_HW_DESC(vectors, groups, mask_regs,       \
                      prio_regs, sense_regs, ack_regs)   \
  {                                                      \
-       _INTC_ARRAY(vectors), _INTC_ARRAY(groups),      \
-       _INTC_ARRAY(mask_regs), _INTC_ARRAY(prio_regs), \
-       _INTC_ARRAY(sense_regs), _INTC_ARRAY(ack_regs), \
+       ARRAY_SIZE(vectors), ARRAY_SIZE(groups),        \
+       ARRAY_SIZE(mask_regs), ARRAY_SIZE(prio_regs),   \
+       ARRAY_SIZE(sense_regs), ARRAY_SIZE(ack_regs),   \
  }
  
  struct intc_desc {

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

