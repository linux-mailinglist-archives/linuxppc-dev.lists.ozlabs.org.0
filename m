Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EFC1A4A58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 21:23:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zSbN2bvRzDqY5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 05:23:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=Aouysy5T; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zSXm1GdVzDr0v
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 05:20:55 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id z90so2251905qtd.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 12:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=16bINEUNdNhK+AwM3+iDZL0tGkjvgNJMmBbTUZOzPIA=;
 b=Aouysy5TDHorqU4e9b8RTjHwsvi8y1PrgQM4zLBGJhptnIAu3k2eNyQssH3U9Nq7ta
 zGH07GYvg0yX3cDKOpiI6ZYRp9KP1mUUDytc0ubP8ZnLxi0EzauRDdVqcIDAnUxrz7km
 Mf6AMHDqiizq7CFxRmhAY+vC2XRXh821PByishLyahyIBFHIhuFjJhYKKcHHWRf79k/6
 +0mhKtev6/LNteALWWr9URXva6DMWAbnPsRa+4nZutDzKcpMoqBpF28DsfOFBxD+57U0
 qmNZwyThqHjT1j2IcG3gxwrnpDk7O2LuBQuT34Fb9TSDxRdmca9iOHAtdKtFaO+NWbpe
 5Nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=16bINEUNdNhK+AwM3+iDZL0tGkjvgNJMmBbTUZOzPIA=;
 b=GC+1OvwmBx9Zg2h2KTUKeMb/VoywhA5Gb2RprQXKNZusUxvV/qvrAJRDrcTm1Y084y
 Yh2XWoxnwogfdxXJZskDTzo13N9WlT0lyzLEoOw7NxAZ1GRY0ar6CqMvpHGWTaSKF5xT
 4k3QA6qU0/LaAEQc4BxJ5qsCJXxPZOTPcZeMvlkUN00XBFR2fnJiMbdks29f6uAznUsC
 tUNaB/tUS/4G0+8T0QHvOWaqEUgNjpVowVkZvU0gZgjgVwPBvf/MVB3iwgrC+Z1h44lw
 ATI4sFdXoxD6GM70nRra9vWZc7RNEP0VbNDWZKRt0dvKpDrjUV1z1a7daILrIiJRnlk/
 tU4A==
X-Gm-Message-State: AGi0Pub3oHmj9rz5caQtJaspvatON45dOJhlfd/yIT+nP6lfgUNauGWm
 JRmqqvtIC5b279mNY9AdY0ipeA==
X-Google-Smtp-Source: APiQypJL2bIZS0O4AtwrP4A7fATr71ZDj8B7mjOr0/Tb4V1fxik9NY2b8ZbSyeaBCnRwfVLnCCLpIg==
X-Received: by 2002:ac8:303a:: with SMTP id f55mr692753qte.270.1586546451761; 
 Fri, 10 Apr 2020 12:20:51 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id a136sm2281799qkb.15.2020.04.10.12.20.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Apr 2020 12:20:51 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Linux-next POWER9 NULL pointer NIP since 1st Apr.
From: Qian Cai <cai@lca.pw>
In-Reply-To: <20200409101413.35d9c72d@gandalf.local.home>
Date: Fri, 10 Apr 2020 15:20:49 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <06A2EA93-B730-4DB1-819F-D27E7032F0B3@lca.pw>
References: <15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw>
 <87eeszlb6u.fsf@mpe.ellerman.id.au>
 <0675B22E-8F32-432C-9378-FDE159DD1729@lca.pw>
 <20200407093054.3eb23e45@gandalf.local.home>
 <EA9F9A54-87BC-477A-BE8A-7D53F80C5223@lca.pw>
 <20200409101413.35d9c72d@gandalf.local.home>
To: Steven Rostedt <rostedt@goodmis.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Apr 9, 2020, at 10:14 AM, Steven Rostedt <rostedt@goodmis.org> =
wrote:
>=20
> On Thu, 9 Apr 2020 06:06:35 -0400
> Qian Cai <cai@lca.pw> wrote:
>=20
>>>> I=E2=80=99ll go to bisect some more but it is going to take a =
while.
>>>>=20
>>>> $ git log --oneline 4c205c84e249..8e99cf91b99b
>>>> 8e99cf91b99b tracing: Do not allocate buffer in =
trace_find_next_entry() in atomic
>>>> 2ab2a0924b99 tracing: Add documentation on set_ftrace_notrace_pid =
and set_event_notrace_pid
>>>> ebed9628f5c2 selftests/ftrace: Add test to test new =
set_event_notrace_pid file
>>>> ed8839e072b8 selftests/ftrace: Add test to test new =
set_ftrace_notrace_pid file
>>>> 276836260301 tracing: Create set_event_notrace_pid to not trace =
tasks =20
>>>=20
>>>> b3b1e6ededa4 ftrace: Create set_ftrace_notrace_pid to not trace =
tasks
>>>> 717e3f5ebc82 ftrace: Make function trace pid filtering a bit more =
exact =20
>>>=20
>>> If it is affecting function tracing, it is probably one of the above =
two
>>> commits. =20
>>=20
>> OK, it was narrowed down to one of those messed with mcount here,
>=20
> Thing is, nothing here touches mcount.

Yes, you are right. I went back to test the commit just before the =
5.7-trace merge request,
I did reproduce there. The thing is that this bastard could take more =
6-hour to happen,
so my previous attempt did not wait long enough. Back to the square =
one...

>=20
>>=20
>> 8e99cf91b99b tracing: Do not allocate buffer in =
trace_find_next_entry() in atomic
>=20
> Touches reading the trace buffer.
>=20
>> 2ab2a0924b99 tracing: Add documentation on set_ftrace_notrace_pid and =
set_event_notrace_pid
>=20
> Documentation.
>=20
>> 6a13a0d7b4d1 ftrace/kprobe: Show the maxactive number on =
kprobe_events
>=20
> kprobe output.
>=20
>> c9b7a4a72ff6 ring-buffer/tracing: Have iterator acknowledge dropped =
events
>=20
> Reading the buffer.
>=20
>> 06e0a548bad0 tracing: Do not disable tracing when reading the trace =
file
>=20
> Reading the buffer.
>=20
>> 1039221cc278 ring-buffer: Do not disable recording when there is an =
iterator
>=20
> Reading the buffer.
>=20
>> 07b8b10ec94f ring-buffer: Make resize disable per cpu buffer instead =
of total buffer
>=20
> Resizing the buffer.
>=20
>> 153368ce1bd0 ring-buffer: Optimize rb_iter_head_event()
>=20
> Reading the buffer.
>=20
>> ff84c50cfb4b ring-buffer: Do not die if rb_iter_peek() fails more =
than thrice
>=20
> Reading the buffer.
>=20
>> 785888c544e0 ring-buffer: Have rb_iter_head_event() handle concurrent =
writer
>=20
> Reading the buffer.
>=20
>> 28e3fc56a471 ring-buffer: Add page_stamp to iterator for =
synchronization
>=20
> Reading the buffer.
>=20
>> bc1a72afdc4a ring-buffer: Rename ring_buffer_read() to =
read_buffer_iter_advance()
>=20
> Reading the buffer.
>=20
>> ead6ecfddea5 ring-buffer: Have ring_buffer_empty() not depend on =
tracing stopped
>=20
> Reading the buffer.
>=20
>> ff895103a84a tracing: Save off entry when peeking at next entry
>=20
> Reading the buffer.
>=20
>> bf2cbe044da2 tracing: Use address-of operator on section symbols
>=20
> Affects trace_printk()
>=20
>> bbd9d05618a6 gpu/trace: add a gpu total memory usage tracepoint
>=20
> New tracepoint infrastructure (just new trace events for gpu)
>=20
>> 89b74cac7834 tools/bootconfig: Show line and column in parse error
>=20
> Extended command line boot config.
>=20
>> 306b69dce926 bootconfig: Support O=3D<builddir> option
>=20
> Extended command line boot config
>=20
>> 5412e0b763e0 tracing: Remove unused TRACE_BUFFER bits
>=20
> Removed unused enums.
>=20
>> b396bfdebffc tracing: Have hwlat ts be first instance and record =
count of instances
>=20
> Affects only the hard ware latency detector (most likely not even
> configured in the kernel).
>=20
> So I don't understand how any of the above commits can cause a =
problem.
>=20
> -- Steve

