Return-Path: <linuxppc-dev+bounces-2823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6849BB026
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 10:47:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhmpC68Z1z2xk1;
	Mon,  4 Nov 2024 20:46:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730713619;
	cv=none; b=AgY4gLSjMHJDeK04X/AlwF3RAn5LsOwxeAv4QIYYB3C8V5PtbLRno0UDRdx55jw/d8QC7Svgk7UpYigB6jhHcXufFsco8oMghVrvEGdvgu9Pa8pm+xIE3VrnXh6A3yDn91QBYSGsE75Ef/RWU+Z43ahxmnFAhc7MIoebvs2S+/qcavR9jt7YDx1xKRJnP3o8RMH4CwVM0sreS3OgS0DXr9oIbES8EvLyCZUSFxwCq1NvMsRMIEc9A4efgKY+kjujHQGv/37ux7R3kC+HY9ChBXE8d2wdoemn9+e/j764dcJwvxNRIk3zQxz0w2o34ZluCw5R7NwTpljYVjYRWSloSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730713619; c=relaxed/relaxed;
	bh=WOeVZUpHYvw/tY8Qp1zQWc2nyD6/7gZcqh+fs+oBPRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asWqxZll5mJMePNQGB6qErylXgP5Xxu0cJHu7YgSujJTe4Aa0ZdKj7IwdwXS/2xlWG5GM7ybEjHFqhqwQKBVNuPrkf217RDMCIZVsnfCkIZvRY/jCydGsnRQwYKV7xq8xqZyf4/jHPABFekvxrq/dipD05TEsYS1JWI4B/7/54LtWzygUYUZDBoCAHZI6QXXkdgkvC7P5aZJm5Q+py4LeQePiO3EJpVv8+z6Atu3eJEESXxmkg5+hS2aMoxeXfYZv5qYCJBbIiB7LpNYWeHH4zlVKv7/0xKWXUFb7lbE/rUg2k/Hsd7MIDvTbr6vgHn567mDBAcUBJQpEVntEia+iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xhmp96KT2z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 20:46:57 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4A49iXoP008951;
	Mon, 4 Nov 2024 03:44:33 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4A49iWW9008947;
	Mon, 4 Nov 2024 03:44:32 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 4 Nov 2024 03:44:31 -0600
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
Message-ID: <20241104094431.GY29862@gate.crashing.org>
References: <20241101191925.1550493-1-hbathini@linux.ibm.com> <20241101205948.GW29862@gate.crashing.org> <1916cb5c-cb3d-427c-bcf0-2c1b905fd6d1@linux.ibm.com>
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
In-Reply-To: <1916cb5c-cb3d-427c-bcf0-2c1b905fd6d1@linux.ibm.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi!

On Mon, Nov 04, 2024 at 02:51:57PM +0530, Hari Bathini wrote:
> On 02/11/24 2:29 am, Segher Boessenkool wrote:
> >On Sat, Nov 02, 2024 at 12:49:25AM +0530, Hari Bathini wrote:
> >>For ppc64le, depending on the kernel configuration used, offset 16
> >>from function start address can also be considered function entry.
> >>Update the test case to accommodate such configurations.
> >
> >(This is true for all ELfv2, not just LE.  For the kernel that is about
> >the same).
> >
> >The LEP and GEP can differ by zero, one, two, four, eight, or sixteen
> >insns (where an insn is four bytes).  Four insns is common, yes, but
> >maybe you can support all?  See the function symbol's st_other field
> >to see what the offset is:
> >0, 1: zero insns, zero bytes
> >N = 2..6: 1 << (N-2) insns, i.e. 1<<N bytes
> >7: reserved
> >
> >(This is the top 3 bits of st_other, the other bits have other meanings).
> >
> >Four insns is common, yes, but by no means the only possibility.
> 
> Hi Segher,
> 
> Querying for function arguments is supported on kprobes only at function
> entry. This is a negative test case where the offset is intentionally
> set beyond function entry while querying for function arguments.
> I guess, simply setting the offset to 20 (vfs_read is anyway
> going to be beyond 5 instructions) instead of 8 for powerpc would
> make all platforms and ABI variants happy?

I have no idea.  What is this "offset" anyway?

This is just the ELFv2 ABI.  No platform can make up its own thing at
all (well, none decided to be gratuitously incompatible, so far).  And
there are no "ABI variants"!

You're just making assumptions here that are based on nothing else but
observations of what is done most of the time.  That might work for a
while -- maybe a long while even! -- but it can easily break down.


Segher

