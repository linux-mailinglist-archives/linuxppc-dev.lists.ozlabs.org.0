Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DE3416080
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 16:05:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFcQ35CcNz300x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 00:05:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Tol7q1BX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Tol7q1BX; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFcPP5rdSz2xvL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 00:05:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632405913;
 bh=v9iF97NdAGPQvgPFcO/Y9Uj+o4ZHWXMnUL5LEW7rCeY=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=Tol7q1BXU51XdXg6be5in08LTvf1c/zPHUS5/NCVe5EPWcOpKDlA8+7X8e9pw7Dsd
 I0qQZXUYl7gtS6OZu3NwF3RmzAb23707skVfX1Kb2NLkFuCme536ndL9XebfNtfwK7
 eg75qiCrQT/x4V4ciC9IJhDXMTSk6SJm7Q/tbZ6S4AX71c64iOCXQqSPltm80XZzls
 cWIrfdNWdwPIuHNtNZhr7IstrVMEkGAfa8frSzpZzq5Of9Dh3BSXZqEm1u5kvHX8SG
 l7iaxZU8ei7POOa3ukQUHHKaDoyoSe+5WBHWbcxfT2za7hvob32b28ELWtkLvkyQ0C
 9KXovuTT9IPLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HFcPP0TQSz9sX3;
 Fri, 24 Sep 2021 00:05:13 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
In-Reply-To: <bug-213837-206035-ilyQ6qrWP6@https.bugzilla.kernel.org/>
References: <bug-213837-206035@https.bugzilla.kernel.org/>
 <bug-213837-206035-ilyQ6qrWP6@https.bugzilla.kernel.org/>
Date: Fri, 24 Sep 2021 00:05:10 +1000
Message-ID: <87sfxvl755.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

bugzilla-daemon@bugzilla.kernel.org writes:
> https://bugzilla.kernel.org/show_bug.cgi?id=213837
>
> --- Comment #7 from Erhard F. (erhard_f@mailbox.org) ---
> Created attachment 298919
>   --> https://bugzilla.kernel.org/attachment.cgi?id=298919&action=edit
> dmesg (5.15-rc2 + patch, PowerMac G5 11,2)
>
> (In reply to mpe from comment #6)
>> Can you try this patch, it might help us work out what is corrupting the
>> stack.
> With your patch applied to recent v5.15-rc2 the output looks like this:
>
> [...]
> stack corrupted? stack end = 0xc000000029fdc000
> stack: c000000029fdbc00: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ........
...

> Can't make much sense out of it but hopefully you can. ;)

Thanks. Obvious isn't it? ;)

  stack corrupted? stack end = 0xc000000029fdc000
  stack: c000000029fdbc00: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ........
  stack: c000000029fdbc10: 00000ddc 7c000010 cccccccc cccccccc  ....|...........
  stack: c000000029fdbc20: 29fc4e41 673d4bb3 5a5a5a5a 5a5a5a5a  ).NAg=K.ZZZZZZZZ
  stack: c000000029fdbc30: cccccccc cccccccc 00000ddc 8e000010  ................
  stack: c000000029fdbc40: cccccccc cccccccc 41fc4e41 673d41a3  ........A.NAg=A.
  stack: c000000029fdbc50: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ........
  stack: c000000029fdbc60: 00000ddc 8e00000c cccccccc cccccccc  ................
  stack: c000000029fdbc70: 79fc4e41 673d4dab 5a5a5a5a 5a5a5a5a  y.NAg=M.ZZZZZZZZ
  stack: c000000029fdbc80: cccccccc cccccccc 00000ddc 90000008  ................
  stack: c000000029fdbc90: cccccccc cccccccc 91fc4e41 673d4573  ..........NAg=Es
  stack: c000000029fdbca0: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ........
  stack: c000000029fdbcb0: 00000dd7 ac000016 cccccccc cccccccc  ................
  stack: c000000029fdbcc0: c9fc4e41 673d4203 5a5a5a5a 5a5a5a5a  ..NAg=B.ZZZZZZZZ
  stack: c000000029fdbcd0: cccccccc cccccccc 00000ddc 6c000004  ............l...
  stack: c000000029fdbce0: cccccccc cccccccc e1fc4e41 673d474b  ..........NAg=GK
  stack: c000000029fdbcf0: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ........
  stack: c000000029fdbd00: 00000ddc 88000000 cccccccc cccccccc  ................
  stack: c000000029fdbd10: 19fd4e41 673d4143 5a5a5a5a 5a5a5a5a  ..NAg=ACZZZZZZZZ
  stack: c000000029fdbd20: cccccccc cccccccc 00000ddb 6c00000e  ............l...
  stack: c000000029fdbd30: cccccccc cccccccc 31fd4e41 673d4f43  ........1.NAg=OC
  stack: c000000029fdbd40: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ........
  stack: c000000029fdbd50: 00000ddc 8e000008 cccccccc cccccccc  ................
  stack: c000000029fdbd60: 69fd4e41 673d407b 5a5a5a5a 5a5a5a5a  i.NAg=@{ZZZZZZZZ
  stack: c000000029fdbd70: cccccccc cccccccc 00000ddc 92000008  ................
  stack: c000000029fdbd80: cccccccc cccccccc 81fd4e41 673d4633  ..........NAg=F3
  stack: c000000029fdbd90: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ........
  stack: c000000029fdbda0: 00000ddb 42000018 cccccccc cccccccc  ....B...........
  stack: c000000029fdbdb0: b9fd4e41 673d42fb 5a5a5a5a 5a5a5a5a  ..NAg=B.ZZZZZZZZ
  stack: c000000029fdbdc0: cccccccc cccccccc 00000ddc 7e000018  ............~...
  stack: c000000029fdbdd0: cccccccc cccccccc d1fd4e41 673d4a1b  ..........NAg=J.
  stack: c000000029fdbde0: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ........
  stack: c000000029fdbdf0: 00000ddc 8e000004 cccccccc cccccccc  ................
  stack: c000000029fdbe00: 09fe4e41 673d4ee3 5a5a5a5a 5a5a5a5a  ..NAg=N.ZZZZZZZZ
  stack: c000000029fdbe10: cccccccc cccccccc 00000dd9 7200001c  ............r...
  stack: c000000029fdbe20: cccccccc cccccccc 21fe4e41 673d4fa3  ........!.NAg=O.

That's slab data.

It's not clear what the actual data is, but because you booted with
slub_debug=FZP we can see the red zones and poison.

The cccccccc is SLUB_RED_ACTIVE, and 5a5a5a5a is POISON_INUSE (see poison.h)


  stack: c000000029fdbe30: c0000000 29fdbeb0 cccccccc cccccccc  ....)...........

But then here we have an obvious pointer (big endian FTW).

And it points nearby, just slightly higher in memory, so that looks
suspiciously like a stack back chain pointer. There's more similar
values if you look further.

But we shouldn't be seeing the stack yet, it's meant to start (end) at
c000000029fdc000 ...

  stack: c000000029fdbe40: 00000ddc 94000000 cccccccc cccccccc  ................
  stack: c000000029fdbe50: 59fe4e41 673d4933 5a5a5a5a 5a5a5a5a  Y.NAg=I3ZZZZZZZZ
  stack: c000000029fdbe60: cccccccc cccccccc 00000dd9 60000024  ............`..$
  stack: c000000029fdbe70: cccccccc cccccccc 71fe4e41 673d416b  ........q.NAg=Ak
  stack: c000000029fdbe80: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ........
  stack: c000000029fdbe90: 00000ddc 6000000c cccccccc cccccccc  ....`...........
  stack: c000000029fdbea0: c0000000 29fdbf20 00000000 00000002  ....).. ........
  stack: c000000029fdbeb0: c0000000 29fdbf30 00000ddc 7e00001c ....)..0....~...     <---
  stack: c000000029fdbec0: c0000000 29fdbf40 c1fe4e41 673d4723  ....)..@..NAg=G#
  stack: c000000029fdbed0: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ........
  stack: c000000029fdbee0: c0000000 29fdbf60 cccccccc cccccccc  ....)..`........
  stack: c000000029fdbef0: c0000000 29fdbf70 5a5a5a5a 5a5a5a5a  ....)..pZZZZZZZZ
  stack: c000000029fdbf00: cccccccc cccccccc 00000ddc 60000010  ............`...
  stack: c000000029fdbf10: c0000000 29fdbf90 00000000 00000002  ....)...........
  stack: c000000029fdbf20: c0000000 29fdbf01 001d3029 96167689  ....).....0)..v.
  stack: c000000029fdbf30: c0000000 29fdbfc0 c0000004 7f6f1800 ....)........o..     <---
  stack: c000000029fdbf40: c0000000 29fdbfc0 5a5a5a5a 5a5a5a5a  ....)...ZZZZZZZZ
  stack: c000000029fdbf50: c0000000 000ea33c 00000000 00000000  .......<........
  stack: c000000029fdbf60: c0000000 29fdbfe0 c0000000 05cdb700  ....)...........
  stack: c000000029fdbf70: c0000000 29fdbff0 cccccccc cccccccc  ....)...........
  stack: c000000029fdbf80: c0000000 000ea33c 00000000 00328780  .......<.....2..
  stack: c000000029fdbf90: c0000000 29fdc010 001d3029 96167689  ....).....0)..v.
  stack: c000000029fdbfa0: c0000000 29fdc020 00000000 000008e4  ....).. ........
  stack: c000000029fdbfb0: 00000000 00000201 001d3029 96167689  ..........0)..v.
  stack: c000000029fdbfc0: c0000000 29fdc040 cccccccc cccccccc ....)..@........     <---
  stack: c000000029fdbfd0: c0000000 000c2344 001d3029 96167689  ......#D..0)..v.
  stack: c000000029fdbfe0: c0000000 29fdc001 001d3029 96167689  ....).....0)..v.
  stack: c000000029fdbff0: c0000000 29fdc080 00000088 554c539a  ....).......ULS.

... which is here:

  stack: c000000029fdc000: c0000000 000c1d9c 001d3029 96167689  ..........0)..v.
  stack: c000000029fdc010: c0000000 29fdc0d0 c0000004 7f6f1700  ....)........o..
  stack: c000000029fdc020: c0000000 29fdc0a0 c0000000 05cdb580  ....)...........
  stack: c000000029fdc030: c0000000 29fdc0b0 c0000004 7f6f1700  ....)........o..
  stack: c000000029fdc040: c0000000 29fdc0c0 00000000 00000001  ....)...........


So it looks like you have actually overran your stack, rather than
something else clobbering your stack.

Can you attach your System.map for that exact kernel? We might be able
to work out what functions we were in when we overran.

You could also try changing CONFIG_THREAD_SHIFT to 15, that might keep
the system running a bit longer and give us some other clues.

cheers
