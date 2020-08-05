Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EDC23D352
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 22:58:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMP956lrgzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 06:58:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4BMP743r5NzDqKg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 06:56:32 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 075KtxCR012156;
 Wed, 5 Aug 2020 15:55:59 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 075KtuFg012155;
 Wed, 5 Aug 2020 15:55:56 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 5 Aug 2020 15:55:56 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v10 2/5] powerpc/vdso: Prepare for switching VDSO to
 generic C implementation.
Message-ID: <20200805205556.GR6753@gate.crashing.org>
References: <cover.1596611196.git.christophe.leroy@csgroup.eu>
 <348528c33cd4007f3fee7fe643ef160843d09a6c.1596611196.git.christophe.leroy@csgroup.eu>
 <20200805140307.GO6753@gate.crashing.org>
 <7d409421-6396-8eba-8250-b6c9ff8232d9@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d409421-6396-8eba-8250-b6c9ff8232d9@csgroup.eu>
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
Cc: nathanl@linux.ibm.com, linux-arch@vger.kernel.org,
 vincenzo.frascino@arm.com, arnd@arndb.de, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, luto@kernel.org, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, Aug 05, 2020 at 06:51:44PM +0200, Christophe Leroy wrote:
> Le 05/08/2020 à 16:03, Segher Boessenkool a écrit :
> >On Wed, Aug 05, 2020 at 07:09:23AM +0000, Christophe Leroy wrote:
> >>+/*
> >>+ * The macros sets two stack frames, one for the caller and one for the 
> >>callee
> >>+ * because there are no requirement for the caller to set a stack frame 
> >>when
> >>+ * calling VDSO so it may have omitted to set one, especially on PPC64
> >>+ */
> >
> >If the caller follows the ABI, there always is a stack frame.  So what
> >is going on?
> 
> Looks like it is not the case. See discussion at 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/2a67c333893454868bbfda773ba4b01c20272a5d.1588079622.git.christophe.leroy@c-s.fr/
> 
> Seems like GCC uses the redzone and doesn't set a stack frame. I guess 
> it doesn't know that the inline assembly contains a function call so it 
> doesn't set the frame.

Yes, that is the problem.  See
https://gcc.gnu.org/onlinedocs/gcc-10.2.0/gcc/Extended-Asm.html#AssemblerTemplate
where this is (briefly) discussed:
  "Accessing data from C programs without using input/output operands
  (such as by using global symbols directly from the assembler
  template) may not work as expected. Similarly, calling functions
  directly from an assembler template requires a detailed understanding
  of the target assembler and ABI."

I don't know of a good way to tell GCC some function needs a frame (that
is, one that doesn't result in extra code other than to set up the
frame).  I'll think about it.


Segher
