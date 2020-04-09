Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0881A35B4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 16:17:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yjsQ3yhGzDr4N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 00:17:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=bany=5z=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yjnP5lTvzDqP9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 00:14:17 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C2212083E;
 Thu,  9 Apr 2020 14:14:14 +0000 (UTC)
Date: Thu, 9 Apr 2020 10:14:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Qian Cai <cai@lca.pw>
Subject: Re: Linux-next POWER9 NULL pointer NIP since 1st Apr.
Message-ID: <20200409101413.35d9c72d@gandalf.local.home>
In-Reply-To: <EA9F9A54-87BC-477A-BE8A-7D53F80C5223@lca.pw>
References: <15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw>
 <87eeszlb6u.fsf@mpe.ellerman.id.au>
 <0675B22E-8F32-432C-9378-FDE159DD1729@lca.pw>
 <20200407093054.3eb23e45@gandalf.local.home>
 <EA9F9A54-87BC-477A-BE8A-7D53F80C5223@lca.pw>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 9 Apr 2020 06:06:35 -0400
Qian Cai <cai@lca.pw> wrote:

> >> I=E2=80=99ll go to bisect some more but it is going to take a while.
> >>=20
> >> $ git log --oneline 4c205c84e249..8e99cf91b99b
> >> 8e99cf91b99b tracing: Do not allocate buffer in trace_find_next_entry(=
) in atomic
> >> 2ab2a0924b99 tracing: Add documentation on set_ftrace_notrace_pid and =
set_event_notrace_pid
> >> ebed9628f5c2 selftests/ftrace: Add test to test new set_event_notrace_=
pid file
> >> ed8839e072b8 selftests/ftrace: Add test to test new set_ftrace_notrace=
_pid file
> >> 276836260301 tracing: Create set_event_notrace_pid to not trace tasks =
=20
> >  =20
> >> b3b1e6ededa4 ftrace: Create set_ftrace_notrace_pid to not trace tasks
> >> 717e3f5ebc82 ftrace: Make function trace pid filtering a bit more exac=
t =20
> >=20
> > If it is affecting function tracing, it is probably one of the above two
> > commits. =20
>=20
> OK, it was narrowed down to one of those messed with mcount here,

Thing is, nothing here touches mcount.

>=20
> 8e99cf91b99b tracing: Do not allocate buffer in trace_find_next_entry() i=
n atomic

Touches reading the trace buffer.

> 2ab2a0924b99 tracing: Add documentation on set_ftrace_notrace_pid and set=
_event_notrace_pid

Documentation.

> 6a13a0d7b4d1 ftrace/kprobe: Show the maxactive number on kprobe_events

kprobe output.

> c9b7a4a72ff6 ring-buffer/tracing: Have iterator acknowledge dropped events

Reading the buffer.

> 06e0a548bad0 tracing: Do not disable tracing when reading the trace file

Reading the buffer.

> 1039221cc278 ring-buffer: Do not disable recording when there is an itera=
tor

Reading the buffer.

> 07b8b10ec94f ring-buffer: Make resize disable per cpu buffer instead of t=
otal buffer

Resizing the buffer.

> 153368ce1bd0 ring-buffer: Optimize rb_iter_head_event()

Reading the buffer.

> ff84c50cfb4b ring-buffer: Do not die if rb_iter_peek() fails more than th=
rice

Reading the buffer.

> 785888c544e0 ring-buffer: Have rb_iter_head_event() handle concurrent wri=
ter

Reading the buffer.

> 28e3fc56a471 ring-buffer: Add page_stamp to iterator for synchronization

Reading the buffer.

> bc1a72afdc4a ring-buffer: Rename ring_buffer_read() to read_buffer_iter_a=
dvance()

Reading the buffer.

> ead6ecfddea5 ring-buffer: Have ring_buffer_empty() not depend on tracing =
stopped

Reading the buffer.

> ff895103a84a tracing: Save off entry when peeking at next entry

Reading the buffer.

> bf2cbe044da2 tracing: Use address-of operator on section symbols

Affects trace_printk()

> bbd9d05618a6 gpu/trace: add a gpu total memory usage tracepoint

New tracepoint infrastructure (just new trace events for gpu)

> 89b74cac7834 tools/bootconfig: Show line and column in parse error

Extended command line boot config.

> 306b69dce926 bootconfig: Support O=3D<builddir> option

Extended command line boot config

> 5412e0b763e0 tracing: Remove unused TRACE_BUFFER bits

Removed unused enums.

> b396bfdebffc tracing: Have hwlat ts be first instance and record count of=
 instances

Affects only the hard ware latency detector (most likely not even
configured in the kernel).

So I don't understand how any of the above commits can cause a problem.

-- Steve
