Return-Path: <linuxppc-dev+bounces-2764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAA99B99C9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2024 22:02:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XgCwk5yn2z2xHw;
	Sat,  2 Nov 2024 08:02:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730494934;
	cv=none; b=ovDgyFww2zmNyReTyrsVPF2kEbZDElPHCz224dofVjYyBFRGlW2rvYbKqanvZEWgxSD4NWdEX9FLuEcKfumWKa9tHx4AMPycLy8UdGrZIY4ominLR+c0B4B2E1NI360queVFZ1bw9EAhipVZxRjTk4aqokR/5X23sU49RXOfZwoyEboL9CeBS7JndXRkiryM3u5WU6kIeiqqST8XUgGsOx6xrvPvluniQFIl37FxlX5yxdIIXaI1PuWosRvd69/voybZ7e4ClTbLKY3+J0U0xQmv9KWDqdhXN7NfPMYExEn2QYPhKmxO1KLcGcNLuLVO3XCX6FLN9aUL2mdMZQ5nGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730494934; c=relaxed/relaxed;
	bh=wo98OmrPZSpO4hXg1rl35Q+dqDwXXgz1Q3dvnhMmxBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b128oP15AowcOuDxlunpwsrYi7jgJ3l1KdGQhoKqmQ8UqJdpFDE2pmFX1VNJ6mfp2r4KRBtTq4xR4vZco/mrkFSLPnXp9ChN5Q1ofI1hA5scbVeJj6IH5LipWAkaNAwuGVHv5WVrLWSdqVBSEhNQzb9a10p80xShkzhj1qKMMQkZJbZsCfKRRW4brWQJ0k/9+ADNVMCYk+BNsUslBpD2432Lvm0KxR/579Df6jgN5IgPP1fcXyS4caGGks4R1mBBTPW2HsnsJb4Exmn6q3ZgoZOvfOwbF4mWRyYB6/4WuBtnbi0fG8AZJaVRxU7NjYbsVdaHlhpffb5TDvO8NaPTAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XgCwh2VDSz2xGj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 08:02:10 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4A1KxpG2021265;
	Fri, 1 Nov 2024 15:59:51 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4A1Kxnst021262;
	Fri, 1 Nov 2024 15:59:49 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 1 Nov 2024 15:59:48 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Naveen N. Rao" <naveen@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-trace-kernel@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] selftests/ftrace: update kprobe syntax error test for ppc64le
Message-ID: <20241101205948.GW29862@gate.crashing.org>
References: <20241101191925.1550493-1-hbathini@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101191925.1550493-1-hbathini@linux.ibm.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi!

On Sat, Nov 02, 2024 at 12:49:25AM +0530, Hari Bathini wrote:
> For ppc64le, depending on the kernel configuration used, offset 16
> from function start address can also be considered function entry.
> Update the test case to accommodate such configurations.

(This is true for all ELfv2, not just LE.  For the kernel that is about
the same).

The LEP and GEP can differ by zero, one, two, four, eight, or sixteen
insns (where an insn is four bytes).  Four insns is common, yes, but
maybe you can support all?  See the function symbol's st_other field
to see what the offset is:
0, 1: zero insns, zero bytes
N = 2..6: 1 << (N-2) insns, i.e. 1<<N bytes
7: reserved

(This is the top 3 bits of st_other, the other bits have other meanings).

Four insns is common, yes, but by no means the only possibility.


Segher

