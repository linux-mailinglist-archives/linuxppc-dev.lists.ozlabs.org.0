Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C29976B31DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 00:02:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXl7j4tgSz3bgn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 10:02:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gNMhkjOP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXl6q4f8Rz30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 10:01:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gNMhkjOP;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PXl6q3NsJz4xD5;
	Fri, 10 Mar 2023 10:01:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678402899;
	bh=BWSn0lLbqlLFTN2KrlWGAvIfOF/lG9xhXJ2PJ5SfzFc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gNMhkjOP+ETg7IZNFsVHqUxECrDXTSgVlwo20E9+dCd+JmK1tQd7yKE3V6vpP/Sbp
	 XHePmFPBNHK9ki+nDOVGrdP7RP+eUnwOKDGMvB/9E7GOwRVTml+2RGI7BZfOlZSLVS
	 maX7iIUQv+9K+7RL71Tjg3DdYWHK+Ywl+9Td+8g9AkwCqHpGuUh13Rb1AOuvMq+6tX
	 LTjUG/YG6TrYHQxiiPOOjt6wghYV8qhfpC31LOn1xyg5JeDVbWLp9/Fr/lZZrGhD3r
	 3LE1/Pp4gZavklbthU8XuRh7dlU304ovNPh6f/sdqlcgfwiVS01Sdod8gN2iPxOI1R
	 DQTpHu2akFDcw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>, Stefano
 Stabellini
 <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] hvc/xen: prevent concurrent accesses to the shared ring
In-Reply-To: <ZAm8BDGTMaI0XmMI@Air-de-Roger>
References: <20221130150919.13935-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2211301657200.4039@ubuntu-linux-20-04-desktop>
 <Y4nkFZal7oy+aICa@Air-de-Roger> <Y5cgYLNwtPbmP1JL@Air-de-Roger>
 <ZAm8BDGTMaI0XmMI@Air-de-Roger>
Date: Fri, 10 Mar 2023 10:01:39 +1100
Message-ID: <87zg8lo7fw.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Roger Pau Monn=C3=A9 <roger.pau@citrix.com> writes:
> On Mon, Dec 12, 2022 at 01:36:48PM +0100, Roger Pau Monn=C3=A9 wrote:
>> On Fri, Dec 02, 2022 at 12:40:05PM +0100, Roger Pau Monn=C3=A9 wrote:
>> > On Wed, Nov 30, 2022 at 05:08:06PM -0800, Stefano Stabellini wrote:
>> > > On Wed, 30 Nov 2022, Roger Pau Monne wrote:
>> > > > The hvc machinery registers both a console and a tty device based =
on
>> > > > the hv ops provided by the specific implementation.  Those two
>> > > > interfaces however have different locks, and there's no single loc=
ks
>> > > > that's shared between the tty and the console implementations, hen=
ce
>> > > > the driver needs to protect itself against concurrent accesses.
>> > > > Otherwise concurrent calls using the split interfaces are likely to
>> > > > corrupt the ring indexes, leaving the console unusable.
>> > > >
>> > > > Introduce a lock to xencons_info to serialize accesses to the shar=
ed
>> > > > ring.  This is only required when using the shared memory console,
>> > > > concurrent accesses to the hypercall based console implementation =
are
>> > > > not an issue.
>> > > >
>> > > > Note the conditional logic in domU_read_console() is slightly modi=
fied
>> > > > so the notify_daemon() call can be done outside of the locked regi=
on:
>> > > > it's an hypercall and there's no need for it to be done with the l=
ock
>> > > > held.
>> > >
>> > > For domU_read_console: I don't mean to block this patch but we need =
to
>> > > be sure about the semantics of hv_ops.get_chars. Either it is expect=
ed
>> > > to be already locked, then we definitely shouldn't add another lock =
to
>> > > domU_read_console. Or it is not expected to be already locked, then =
we
>> > > should add the lock.
>> > >
>> > > My impression is that it is expected to be already locked, but I thi=
nk
>> > > we need Greg or Jiri to confirm one way or the other.
>> >
>> > Let me move both to the 'To:' field then.
>> >
>> > My main concern is the usage of hv_ops.get_chars hook in
>> > hvc_poll_get_char(), as it's not obvious to me that callers of
>> > tty->poll_get_char hook as returned by tty_find_polling_driver() will
>> > always do so with the tty lock held (in fact the only user right now
>> > doesn't seem to hold the tty lock).
>> >
>> > > Aside from that the rest looks fine.
>
> I guess I could reluctantly remove the lock in the get_chars hook,
> albeit I'm not convinced at all the lock is not needed there.

I don't know the xen driver, but other HVC backends have a lock around
their private state in their get_chars() implementations.

See eg. hvterm_raw_get_chars().

cheers
