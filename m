Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDCA137854
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 22:09:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vbGG5bDYzDqjh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 08:09:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vbDF5q47zDqDJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2020 08:07:57 +1100 (AEDT)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iq1VU-0004ld-Ub; Fri, 10 Jan 2020 22:07:49 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 6009B105BDB; Fri, 10 Jan 2020 22:07:48 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [RFC PATCH v2 05/10] lib: vdso: inline do_hres()
In-Reply-To: <CAK8P3a36OgFuY72b_i6+0xBNGnaxS1SsRid+HrgQHPZtUJp3LQ@mail.gmail.com>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <d0f8dfb26c025d3e3eee1b5f610161ca19b942df.1577111367.git.christophe.leroy@c-s.fr>
 <CAK8P3a36OgFuY72b_i6+0xBNGnaxS1SsRid+HrgQHPZtUJp3LQ@mail.gmail.com>
Date: Fri, 10 Jan 2020 22:07:48 +0100
Message-ID: <87o8vbrpej.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
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
Cc: the arch/x86 maintainers <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd Bergmann <arnd@arndb.de> writes:
> On Mon, Dec 23, 2019 at 3:31 PM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>>
>> do_hres() is called from several places, so GCC doesn't inline
>> it at first.
>>
>> do_hres() takes a struct __kernel_timespec * parameter for
>> passing the result. In the 32 bits case, this parameter corresponds
>> to a local var in the caller. In order to provide a pointer
>> to this structure, the caller has to put it in its stack and
>> do_hres() has to write the result in the stack. This is suboptimal,
>> especially on RISC processor like powerpc.
>>
>> By making GCC inline the function, the struct __kernel_timespec
>> remains a local var using registers, avoiding the need to write and
>> read stack.
>>
>> The improvement is significant on powerpc.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>
> Good idea, I can see how this ends up being an improvement
> for most of the callers.
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

  https://lore.kernel.org/r/20191112012724.250792-3-dima@arista.com

On the way to be applied.

Thanks,

        tglx
