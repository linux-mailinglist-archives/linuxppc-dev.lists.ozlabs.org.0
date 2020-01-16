Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E76EF13FB24
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 22:12:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zH354W6KzDr1c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 08:12:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zFN11fpSzDqdP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 06:57:20 +1100 (AEDT)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1isBGJ-0000KB-UP; Thu, 16 Jan 2020 20:57:04 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 6000B101226; Thu, 16 Jan 2020 20:57:03 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [RFC PATCH v4 10/11] lib: vdso: Allow arches to override the ns
 shift operation
In-Reply-To: <CALCETrWJcB9=MuSw5yx6arcb_np=E=awTyLRSi=r8BJySf_aXw@mail.gmail.com>
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
 <c8ce9baaef0dc7273e4bcc31f353b17b655113d1.1579196675.git.christophe.leroy@c-s.fr>
 <CALCETrWJcB9=MuSw5yx6arcb_np=E=awTyLRSi=r8BJySf_aXw@mail.gmail.com>
Date: Thu, 16 Jan 2020 20:57:03 +0100
Message-ID: <877e1rfa40.fsf@nanos.tec.linutronix.de>
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
Cc: nathanl@linux.ibm.com, Arnd Bergmann <arnd@arndb.de>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andrew Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andy Lutomirski <luto@kernel.org> writes:
> On Thu, Jan 16, 2020 at 9:58 AM Christophe Leroy
>
> Would mul_u64_u64_shr() be a good alternative?  Could we adjust it to
> assume the shift is less than 32?  That function exists to benefit
> 32-bit arches.

We'd want mul_u64_u32_shr() for this. The rules for mult and shift are:

     1 <= mult <= U32_MAX

     1 <= shift <= 32

If we want to enforce a shift < 32 we need to limit that conditionally
in the calculation/registration function.

Thanks,

        tglx

