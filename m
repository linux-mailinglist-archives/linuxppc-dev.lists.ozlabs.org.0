Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C91405C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 10:01:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zZmw0lPczDql9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 20:01:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zZkn1m9XzDqZR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 19:59:44 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00H8ws29002697;
 Fri, 17 Jan 2020 02:58:54 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 00H8wpV1002692;
 Fri, 17 Jan 2020 02:58:51 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 17 Jan 2020 02:58:51 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [RFC PATCH v4 00/11] powerpc: switch VDSO to C implementation.
Message-ID: <20200117085851.GS3191@gate.crashing.org>
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579196675.git.christophe.leroy@c-s.fr>
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
Cc: nathanl@linux.ibm.com, arnd@arndb.de, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, luto@kernel.org, tglx@linutronix.de,
 vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Jan 16, 2020 at 05:58:24PM +0000, Christophe Leroy wrote:
> On a powerpc8xx, with current powerpc/32 ASM VDSO:
> 
> gettimeofday:    vdso: 907 nsec/call
> clock-getres-realtime:    vdso: 484 nsec/call
> clock-gettime-realtime:    vdso: 899 nsec/call
> 
> The first patch adds VDSO generic C support without any changes to common code.
> Performance is as follows:
> 
> gettimeofday:    vdso: 1211 nsec/call
> clock-getres-realtime:    vdso: 722 nsec/call
> clock-gettime-realtime:    vdso: 1216 nsec/call
> 
> Then a few changes in the common code have allowed performance improvement. At
> the end of the series we have:
> 
> gettimeofday:    vdso: 974 nsec/call
> clock-getres-realtime:    vdso: 545 nsec/call
> clock-gettime-realtime:    vdso: 941 nsec/call
> 
> The final result is rather close to pure ASM VDSO:
> * 7% more on gettimeofday (9 cycles)
> * 5% more on clock-gettime-realtime (6 cycles)
> * 12% more on clock-getres-realtime (8 cycles)

Nice!  Much better.

It should be tested on more representative hardware, too, but this looks
promising alright :-)


Segher
