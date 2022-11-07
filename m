Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3294861FA26
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 17:42:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5cT60JWYz3f3x
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 03:42:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5cSY62Xmz3000
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 03:41:32 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2A7GdOSP011643;
	Mon, 7 Nov 2022 10:39:24 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 2A7GdNKo011642;
	Mon, 7 Nov 2022 10:39:23 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 7 Nov 2022 10:39:23 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Rohan McLure <rmclure@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] powerpc/64: Add INTERRUPT_SANITIZE_REGISTERS Kconfig
Message-ID: <20221107163923.GO25951@gate.crashing.org>
References: <20221107033202.1375238-1-rmclure@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107033202.1375238-1-rmclure@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Mon, Nov 07, 2022 at 02:31:59PM +1100, Rohan McLure wrote:
> Add Kconfig option for enabling clearing of registers on arrival in an
> interrupt handler. This reduces the speculation influence of registers
> on kernel internals.

Assuming you are talking about existing PowerPC CPUs from the last 30
years:

There is no data speculation.  At all.  Ever.

There is branch prediction, but that is not influenced by register
contents, either (for any current CPUs at least).  (Except when you get
a flush because of a mispredict, but if this zeroing changes anything,
we will have used wild (but user controlled) values in the old
non-zeroing situation, and that is a much bigger problem itself already,
also for security!  This can be an unlikely kernel bug, or a very
unlikely compiler bug.)

All GPRs are renamed, always.  If you zero all GPRs on interrupt entry
(which is context synchronising, importantly), this will guarantee there
can be no timing influence from the GPRs, because all of the physical
registers depend on nothing that happened before.  So that is good, at
least it can give some peace of mind.  Except that this makes 30 new
registers in just a few cycles, which *itself* can cause stalls, if the
renaming things are still busy.  Context synchronising does not
necessarily help there, the renaming machinery can do stuff *after* an
insn completes.

I don't see how this helps anything.  If it does, "reduces speculation
influence" is not a good description of what it does, afaics?


Segher
