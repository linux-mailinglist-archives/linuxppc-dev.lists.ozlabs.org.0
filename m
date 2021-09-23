Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 462D641608B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 16:06:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFcR11gRYz3c72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 00:06:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t/uIo3wG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t/uIo3wG; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFcPZ16SPz3056
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 00:05:21 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7CB466109E
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 14:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632405919;
 bh=5NwvhYfCfVveTM+bR8CHRSwTTloyx5fmw4NtMJPkKLU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=t/uIo3wG44D1LiaCs/trjIc1Q3L/03jsOucfvkUFDKiC5nrgo7s1iraHStMjGPCyq
 PbCV4ii1QwftskIXXWVsC4JrdxCk6VE6Bwro4nMmvSYIHoTlN6LXlT3xmInr+omjYd
 0cYYuY5Pwn9f9rgjrtTuRZbKVrUnonmgD2FyOG+nKWPKi0jor40rDyIO4Iz6/4BAY7
 L27CXLqe78Orh0kho8z+S31TFGcN297RtKSJhgtiCdi7sRzjbJeQO+PjsUpPgpsQ2v
 idJtxe/bggPbH6BDa9pl0zohhfb6FfDCtHeXdB/tZVjEFg1cUiAmXvxVCQSoyb7lix
 kO9PCi0wijAmw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 741B760FC4; Thu, 23 Sep 2021 14:05:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
Date: Thu, 23 Sep 2021 14:05:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpe@ellerman.id.au
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213837-206035-XLvJw4U18N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213837-206035@https.bugzilla.kernel.org/>
References: <bug-213837-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D213837

--- Comment #8 from mpe@ellerman.id.au ---
bugzilla-daemon@bugzilla.kernel.org writes:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D213837
>
> --- Comment #7 from Erhard F. (erhard_f@mailbox.org) ---
> Created attachment 298919
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D298919&action=3Dedit
> dmesg (5.15-rc2 + patch, PowerMac G5 11,2)
>
> (In reply to mpe from comment #6)
>> Can you try this patch, it might help us work out what is corrupting the
>> stack.
> With your patch applied to recent v5.15-rc2 the output looks like this:
>
> [...]
> stack corrupted? stack end =3D 0xc000000029fdc000
> stack: c000000029fdbc00: 5a5a5a5a 5a5a5a5a cccccccc cccccccc=20
> ZZZZZZZZ........
...

> Can't make much sense out of it but hopefully you can. ;)

Thanks. Obvious isn't it? ;)

  stack corrupted? stack end =3D 0xc000000029fdc000
  stack: c000000029fdbc00: 5a5a5a5a 5a5a5a5a cccccccc cccccccc=20
ZZZZZZZZ........
  stack: c000000029fdbc10: 00000ddc 7c000010 cccccccc cccccccc=20
....|...........
  stack: c000000029fdbc20: 29fc4e41 673d4bb3 5a5a5a5a 5a5a5a5a=20
).NAg=3DK.ZZZZZZZZ
  stack: c000000029fdbc30: cccccccc cccccccc 00000ddc 8e000010=20
................
  stack: c000000029fdbc40: cccccccc cccccccc 41fc4e41 673d41a3=20
........A.NAg=3DA.
  stack: c000000029fdbc50: 5a5a5a5a 5a5a5a5a cccccccc cccccccc=20
ZZZZZZZZ........
  stack: c000000029fdbc60: 00000ddc 8e00000c cccccccc cccccccc=20
................
  stack: c000000029fdbc70: 79fc4e41 673d4dab 5a5a5a5a 5a5a5a5a=20
y.NAg=3DM.ZZZZZZZZ
  stack: c000000029fdbc80: cccccccc cccccccc 00000ddc 90000008=20
................
  stack: c000000029fdbc90: cccccccc cccccccc 91fc4e41 673d4573=20
..........NAg=3DEs
  stack: c000000029fdbca0: 5a5a5a5a 5a5a5a5a cccccccc cccccccc=20
ZZZZZZZZ........
  stack: c000000029fdbcb0: 00000dd7 ac000016 cccccccc cccccccc=20
................
  stack: c000000029fdbcc0: c9fc4e41 673d4203 5a5a5a5a 5a5a5a5a=20
..NAg=3DB.ZZZZZZZZ
  stack: c000000029fdbcd0: cccccccc cccccccc 00000ddc 6c000004=20
............l...
  stack: c000000029fdbce0: cccccccc cccccccc e1fc4e41 673d474b=20
..........NAg=3DGK
  stack: c000000029fdbcf0: 5a5a5a5a 5a5a5a5a cccccccc cccccccc=20
ZZZZZZZZ........
  stack: c000000029fdbd00: 00000ddc 88000000 cccccccc cccccccc=20
................
  stack: c000000029fdbd10: 19fd4e41 673d4143 5a5a5a5a 5a5a5a5a=20
..NAg=3DACZZZZZZZZ
  stack: c000000029fdbd20: cccccccc cccccccc 00000ddb 6c00000e=20
............l...
  stack: c000000029fdbd30: cccccccc cccccccc 31fd4e41 673d4f43=20
........1.NAg=3DOC
  stack: c000000029fdbd40: 5a5a5a5a 5a5a5a5a cccccccc cccccccc=20
ZZZZZZZZ........
  stack: c000000029fdbd50: 00000ddc 8e000008 cccccccc cccccccc=20
................
  stack: c000000029fdbd60: 69fd4e41 673d407b 5a5a5a5a 5a5a5a5a=20
i.NAg=3D@{ZZZZZZZZ
  stack: c000000029fdbd70: cccccccc cccccccc 00000ddc 92000008=20
................
  stack: c000000029fdbd80: cccccccc cccccccc 81fd4e41 673d4633=20
..........NAg=3DF3
  stack: c000000029fdbd90: 5a5a5a5a 5a5a5a5a cccccccc cccccccc=20
ZZZZZZZZ........
  stack: c000000029fdbda0: 00000ddb 42000018 cccccccc cccccccc=20
....B...........
  stack: c000000029fdbdb0: b9fd4e41 673d42fb 5a5a5a5a 5a5a5a5a=20
..NAg=3DB.ZZZZZZZZ
  stack: c000000029fdbdc0: cccccccc cccccccc 00000ddc 7e000018=20
............~...
  stack: c000000029fdbdd0: cccccccc cccccccc d1fd4e41 673d4a1b=20
..........NAg=3DJ.
  stack: c000000029fdbde0: 5a5a5a5a 5a5a5a5a cccccccc cccccccc=20
ZZZZZZZZ........
  stack: c000000029fdbdf0: 00000ddc 8e000004 cccccccc cccccccc=20
................
  stack: c000000029fdbe00: 09fe4e41 673d4ee3 5a5a5a5a 5a5a5a5a=20
..NAg=3DN.ZZZZZZZZ
  stack: c000000029fdbe10: cccccccc cccccccc 00000dd9 7200001c=20
............r...
  stack: c000000029fdbe20: cccccccc cccccccc 21fe4e41 673d4fa3=20
........!.NAg=3DO.

That's slab data.

It's not clear what the actual data is, but because you booted with
slub_debug=3DFZP we can see the red zones and poison.

The cccccccc is SLUB_RED_ACTIVE, and 5a5a5a5a is POISON_INUSE (see poison.h)


  stack: c000000029fdbe30: c0000000 29fdbeb0 cccccccc cccccccc=20
....)...........

But then here we have an obvious pointer (big endian FTW).

And it points nearby, just slightly higher in memory, so that looks
suspiciously like a stack back chain pointer. There's more similar
values if you look further.

But we shouldn't be seeing the stack yet, it's meant to start (end) at
c000000029fdc000 ...

  stack: c000000029fdbe40: 00000ddc 94000000 cccccccc cccccccc=20
................
  stack: c000000029fdbe50: 59fe4e41 673d4933 5a5a5a5a 5a5a5a5a=20
Y.NAg=3DI3ZZZZZZZZ
  stack: c000000029fdbe60: cccccccc cccccccc 00000dd9 60000024=20
............`..$
  stack: c000000029fdbe70: cccccccc cccccccc 71fe4e41 673d416b=20
........q.NAg=3DAk
  stack: c000000029fdbe80: 5a5a5a5a 5a5a5a5a cccccccc cccccccc=20
ZZZZZZZZ........
  stack: c000000029fdbe90: 00000ddc 6000000c cccccccc cccccccc=20
....`...........
  stack: c000000029fdbea0: c0000000 29fdbf20 00000000 00000002  ....)..
........
  stack: c000000029fdbeb0: c0000000 29fdbf30 00000ddc 7e00001c ....)..0....=
~...
    <---
  stack: c000000029fdbec0: c0000000 29fdbf40 c1fe4e41 673d4723=20
....)..@..NAg=3DG#
  stack: c000000029fdbed0: 5a5a5a5a 5a5a5a5a cccccccc cccccccc=20
ZZZZZZZZ........
  stack: c000000029fdbee0: c0000000 29fdbf60 cccccccc cccccccc=20
....)..`........
  stack: c000000029fdbef0: c0000000 29fdbf70 5a5a5a5a 5a5a5a5a=20
....)..pZZZZZZZZ
  stack: c000000029fdbf00: cccccccc cccccccc 00000ddc 60000010=20
............`...
  stack: c000000029fdbf10: c0000000 29fdbf90 00000000 00000002=20
....)...........
  stack: c000000029fdbf20: c0000000 29fdbf01 001d3029 96167689=20
....).....0)..v.
  stack: c000000029fdbf30: c0000000 29fdbfc0 c0000004 7f6f1800 ....).......=
.o..
    <---
  stack: c000000029fdbf40: c0000000 29fdbfc0 5a5a5a5a 5a5a5a5a=20
....)...ZZZZZZZZ
  stack: c000000029fdbf50: c0000000 000ea33c 00000000 00000000=20
.......<........
  stack: c000000029fdbf60: c0000000 29fdbfe0 c0000000 05cdb700=20
....)...........
  stack: c000000029fdbf70: c0000000 29fdbff0 cccccccc cccccccc=20
....)...........
  stack: c000000029fdbf80: c0000000 000ea33c 00000000 00328780=20
.......<.....2..
  stack: c000000029fdbf90: c0000000 29fdc010 001d3029 96167689=20
....).....0)..v.
  stack: c000000029fdbfa0: c0000000 29fdc020 00000000 000008e4  ....)..
........
  stack: c000000029fdbfb0: 00000000 00000201 001d3029 96167689=20
..........0)..v.
  stack: c000000029fdbfc0: c0000000 29fdc040 cccccccc cccccccc ....)..@....=
....
    <---
  stack: c000000029fdbfd0: c0000000 000c2344 001d3029 96167689=20
......#D..0)..v.
  stack: c000000029fdbfe0: c0000000 29fdc001 001d3029 96167689=20
....).....0)..v.
  stack: c000000029fdbff0: c0000000 29fdc080 00000088 554c539a=20
....).......ULS.

... which is here:

  stack: c000000029fdc000: c0000000 000c1d9c 001d3029 96167689=20
..........0)..v.
  stack: c000000029fdc010: c0000000 29fdc0d0 c0000004 7f6f1700=20
....)........o..
  stack: c000000029fdc020: c0000000 29fdc0a0 c0000000 05cdb580=20
....)...........
  stack: c000000029fdc030: c0000000 29fdc0b0 c0000004 7f6f1700=20
....)........o..
  stack: c000000029fdc040: c0000000 29fdc0c0 00000000 00000001=20
....)...........


So it looks like you have actually overran your stack, rather than
something else clobbering your stack.

Can you attach your System.map for that exact kernel? We might be able
to work out what functions we were in when we overran.

You could also try changing CONFIG_THREAD_SHIFT to 15, that might keep
the system running a bit longer and give us some other clues.

cheers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
