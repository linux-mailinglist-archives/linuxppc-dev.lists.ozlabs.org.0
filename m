Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 830F032DA5E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 20:29:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ds1C7483Kz3d5Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 06:29:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Ds1Bp5m24z3ck3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 06:29:05 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 124JOm06007417;
 Thu, 4 Mar 2021 13:24:48 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 124JOlBd007416;
 Thu, 4 Mar 2021 13:24:47 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 4 Mar 2021 13:24:47 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v1] powerpc: Include running function as first entry in
 save_stack_trace() and friends
Message-ID: <20210304192447.GT29191@gate.crashing.org>
References: <e2e8728c4c4553bbac75a64b148e402183699c0c.1614780567.git.christophe.leroy@csgroup.eu>
 <CANpmjNOvgbUCf0QBs1J-mO0yEPuzcTMm7aS1JpPB-17_LabNHw@mail.gmail.com>
 <1802be3e-dc1a-52e0-1754-a40f0ea39658@csgroup.eu>
 <YD+o5QkCZN97mH8/@elver.google.com>
 <20210304145730.GC54534@C02TD0UTHF1T.local>
 <CANpmjNOSpFbbDaH9hNucXrpzG=HpsoQpk5w-24x8sU_G-6cz0Q@mail.gmail.com>
 <20210304165923.GA60457@C02TD0UTHF1T.local>
 <YEEYDSJeLPvqRAHZ@elver.google.com>
 <CAKwvOd=wBArMwvtDC8zV-QjQa5UuwWoxksQ8j+hUCZzbEAn+Fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=wBArMwvtDC8zV-QjQa5UuwWoxksQ8j+hUCZzbEAn+Fw@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marco Elver <elver@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Mark Brown <broonie@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-toolchains@vger.kernel.org, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 04, 2021 at 09:54:44AM -0800, Nick Desaulniers wrote:
> On Thu, Mar 4, 2021 at 9:42 AM Marco Elver <elver@google.com> wrote:
> include/linux/compiler.h:246:
> prevent_tail_call_optimization
> 
> commit a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")

That is much heavier than needed (an mb()).  You can just put an empty
inline asm after a call before a return, and that call cannot be
optimised to a sibling call: (the end of a function is an implicit
return:)

Instead of:

void g(void);
void f(int x)
	if (x)
		g();
}

Do:

void g(void);
void f(int x)
	if (x)
		g();
	asm("");
}

This costs no extra instructions, and certainly not something as heavy
as an mb()!  It works without the "if" as well, of course, but with it
it is a more interesting example of a tail call.


Segher
