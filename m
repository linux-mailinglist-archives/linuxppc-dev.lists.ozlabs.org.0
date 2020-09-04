Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B0D25E690
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 10:41:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bk7LL4xHdzDqpf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 18:41:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432;
 helo=mail-wr1-x432.google.com; envelope-from=hkallweit1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YSI+ZBRC; dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjkzG1VpxzDqpM
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Sep 2020 03:23:20 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id k15so7451254wrn.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Sep 2020 10:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E8FqCt6t38dImRby4iUwfizmSh/d4KR9tnYbKg3B/eQ=;
 b=YSI+ZBRCs/5Nvq8g5P85uNlZ+Qjvymf0Z8KPoBQev9L+hoIp/gIyFp47CoP/ZU0GvA
 QYqx41dk9zz/luwPsOkcA1VBBK5q2nslMBJQvTP42vbRLOi6ePbK/umrncp1iPRpDVz0
 LGXRwXdJetqXllgb68v5tE+2zOGWusfwjUwCCdoHQME1k6k2mGe5PzDS6m0MS+G2CxxP
 13PX7HV3tg8KghDnKOa97xNbTCfiDnzWF91xNUPrZQlIR+XOHiWiYf7Gn3NM+GP8s6Wg
 63zWRAE1L7e7louDXaGb3oc2Ew26tKEbrC7WkpDsPBrUYryK7dY3Xu1ooXnU7kMVrw/g
 +pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E8FqCt6t38dImRby4iUwfizmSh/d4KR9tnYbKg3B/eQ=;
 b=KRU6JDMt1MJqnmfoT1vL77DD1Cfe5dxHdQivS2ftTi90iNI5wQR24o56EUHQ2CEy2s
 2VlXEF4xlBq7gQgqiND6qCeiSd/LWkAsUVNmPo2dkY3UhJFh2UL3pwgKf27sF5SPzVdE
 k/hAP+2gKymIcSYdLpIx9fp/tOMgByisoTg1Nw5jj075U52GApBfqLpU85jlBIGCC/VN
 2ZyXmXcsl/Z1Um3aA0/PpG551Sx0K6v3wDVVzSjjVI1sapa74tTU+3IY1EArhdYWmjeX
 /V9X9dJnT7ITB1BC6RC017SozxO1DKo1iPXUWX3L58ZlbMr5Dld2CL9og9NEJchFelsm
 dqHQ==
X-Gm-Message-State: AOAM531aN3IU08FsTzCBRUwF8+EHdZI1DYbMM91wweRXFUBB6YoIOpI1
 HH3sXQuSkH04WqlmHNGgWDXLR1dvDqVmHHqh7/Y=
X-Google-Smtp-Source: ABdhPJzZbm/lXPnbc0DhAMosvgWOhh1osZwTonHob0iZla64Gha6jca4b7y6JtA5gIY5gVM+BELGvWmeJvBwqLmh+Ic=
X-Received: by 2002:adf:e74d:: with SMTP id c13mr8246340wrn.45.1599240196353; 
 Fri, 04 Sep 2020 10:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <1598940515.6e06nwgi0c.astroid@bobo.none>
 <6054f0ec-d994-105b-6399-6cdb65ddd1b6@alliedtelesis.co.nz>
In-Reply-To: <6054f0ec-d994-105b-6399-6cdb65ddd1b6@alliedtelesis.co.nz>
From: Heiner Kallweit <hkallweit1@gmail.com>
Date: Fri, 4 Sep 2020 19:23:05 +0200
Message-ID: <CAFSsGVvRMQoEoBN1hpao_4uM1yF2wwuKPbMkAcwFWyE1X8HDbQ@mail.gmail.com>
Subject: Re: fsl_espi errors on v5.7.15
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Content-Type: multipart/alternative; boundary="000000000000d0723905ae801f03"
X-Mailman-Approved-At: Sat, 05 Sep 2020 18:36:43 +1000
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000d0723905ae801f03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri 4. Sep 2020 at 01:58, Chris Packham <
Chris.Packham@alliedtelesis.co.nz> wrote:

>
>
> On 1/09/20 6:14 pm, Nicholas Piggin wrote:
>
> > Excerpts from Chris Packham's message of September 1, 2020 11:25 am:
>
> >> On 1/09/20 12:33 am, Heiner Kallweit wrote:
>
> >>> On 30.08.2020 23:59, Chris Packham wrote:
>
> >>>> On 31/08/20 9:41 am, Heiner Kallweit wrote:
>
> >>>>> On 30.08.2020 23:00, Chris Packham wrote:
>
> >>>>>> On 31/08/20 12:30 am, Nicholas Piggin wrote:
>
> >>>>>>> Excerpts from Chris Packham's message of August 28, 2020 8:07 am:
>
> >>>>>> <snip>
>
> >>>>>>
>
> >>>>>>>>>>>> I've also now seen the RX FIFO not empty error on the T2080R=
DB
>
> >>>>>>>>>>>>
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set=
!
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set=
!
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set=
!
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set=
!
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren'=
t
> empty!
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>
> >>>>>>>>>>>>
>
> >>>>>>>>>>>> With my current workaround of emptying the RX FIFO. It seems
>
> >>>>>>>>>>>> survivable. Interestingly it only ever seems to be 1 extra
> byte in the
>
> >>>>>>>>>>>> RX FIFO and it seems to be after either a READ_SR or a
> READ_FSR.
>
> >>>>>>>>>>>>
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: tx 70
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: rx 03
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: Extra RX 00
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set=
!
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren'=
t
> empty!
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: tx 05
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: rx 00
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: Extra RX 03
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set=
!
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren'=
t
> empty!
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: tx 05
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: rx 00
>
> >>>>>>>>>>>> fsl_espi ffe110000.spi: Extra RX 03
>
> >>>>>>>>>>>>
>
> >>>>>>>>>>>>      From all the Micron SPI-NOR datasheets I've got access
> to it is
>
> >>>>>>>>>>>> possible to continually read the SR/FSR. But I've no idea wh=
y
> it
>
> >>>>>>>>>>>> happens some times and not others.
>
> >>>>>>>>>>> So I think I've got a reproduction and I think I've bisected
> the problem
>
> >>>>>>>>>>> to commit 3282a3da25bd ("powerpc/64: Implement soft interrupt
> replay in
>
> >>>>>>>>>>> C"). My day is just finishing now so I haven't applied too
> much scrutiny
>
> >>>>>>>>>>> to this result. Given the various rabbit holes I've been down
> on this
>
> >>>>>>>>>>> issue already I'd take this information with a good degree of
> skepticism.
>
> >>>>>>>>>>>
>
> >>>>>>>>>> OK, so an easy test should be to re-test with a 5.4 kernel.
>
> >>>>>>>>>> It doesn't have yet the change you're referring to, and the
> fsl-espi driver
>
> >>>>>>>>>> is basically the same as in 5.7 (just two small changes in 5.7=
).
>
> >>>>>>>>> There's 6cc0c16d82f88 and maybe also other interrupt related
> patches
>
> >>>>>>>>> around this time that could affect book E, so it's good if that
> exact
>
> >>>>>>>>> patch is confirmed.
>
> >>>>>>>> My confirmation is basically that I can induce the issue in a 5.=
4
> kernel
>
> >>>>>>>> by cherry-picking 3282a3da25bd. I'm also able to "fix" the issue
> in
>
> >>>>>>>> 5.9-rc2 by reverting that one commit.
>
> >>>>>>>>
>
> >>>>>>>> I both cases it's not exactly a clean cherry-pick/revert so I al=
so
>
> >>>>>>>> confirmed the bisection result by building at 3282a3da25bd (whic=
h
> sees
>
> >>>>>>>> the issue) and the commit just before (which does not).
>
> >>>>>>> Thanks for testing, that confirms it well.
>
> >>>>>>>
>
> >>>>>>> [snip patch]
>
> >>>>>>>
>
> >>>>>>>> I still saw the issue with this change applied.
> PPC_IRQ_SOFT_MASK_DEBUG
>
> >>>>>>>> didn't report anything (either with or without the change above)=
.
>
> >>>>>>> Okay, it was a bit of a shot in the dark. I still can't see what
>
> >>>>>>> else has changed.
>
> >>>>>>>
>
> >>>>>>> What would cause this, a lost interrupt? A spurious interrupt? Or
>
> >>>>>>> higher interrupt latency?
>
> >>>>>>>
>
> >>>>>>> I don't think the patch should cause significantly worse latency,
>
> >>>>>>> (it's supposed to be a bit better if anything because it doesn't
> set
>
> >>>>>>> up the full interrupt frame). But it's possible.
>
> >>>>>> My working theory is that the SPI_DON indication is all about the =
TX
>
> >>>>>> direction an now that the interrupts are faster we're hitting an
> error
>
> >>>>>> because there is still RX activity going on. Heiner disagrees with
> my
>
> >>>>>> interpretation of the SPI_DON indication and the fact that it
> doesn't
>
> >>>>>> happen every time does throw doubt on it.
>
> >>>>>>
>
> >>>>> It's right that the eSPI spec can be interpreted that SPI_DON refer=
s
> to
>
> >>>>> TX only. However this wouldn't really make sense, because also for =
RX
>
> >>>>> we program the frame length, and therefore want to be notified once
> the
>
> >>>>> full frame was received. Also practical experience shows that SPI_D=
ON
>
> >>>>> is set also after RX-only transfers.
>
> >>>>> Typical SPI NOR use case is that you write read command + start
> address,
>
> >>>>> followed by a longer read. If the TX-only interpretation would be
> right,
>
> >>>>> we'd always end up with SPI_DON not being set.
>
> >>>>>
>
> >>>>>> I can't really explain the extra RX byte in the fifo. We know how
> many
>
> >>>>>> bytes to expect and we pull that many from the fifo so it's not as
> if
>
> >>>>>> we're missing an interrupt causing us to skip the last byte. I've
> been
>
> >>>>>> looking for some kind of off-by-one calculation but again if it we=
re
>
> >>>>>> something like that it'd happen all the time.
>
> >>>>>>
>
> >>>>> Maybe it helps to know what value this extra byte in the FIFO has.
> Is it:
>
> >>>>> - a duplicate of the last read byte
>
> >>>>> - or the next byte (at <end address> + 1)
>
> >>>>> - or a fixed value, e.g. always 0x00 or 0xff
>
> >>>> The values were up thread a bit but I'll repeat them here
>
> >>>>
>
> >>>> fsl_espi ffe110000.spi: tx 70
>
> >>>> fsl_espi ffe110000.spi: rx 03
>
> >>>> fsl_espi ffe110000.spi: Extra RX 00
>
> >>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>
> >>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>
> >>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>
> >>>> fsl_espi ffe110000.spi: tx 05
>
> >>>> fsl_espi ffe110000.spi: rx 00
>
> >>>> fsl_espi ffe110000.spi: Extra RX 03
>
> >>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>
> >>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>
> >>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>
> >>>> fsl_espi ffe110000.spi: tx 05
>
> >>>> fsl_espi ffe110000.spi: rx 00
>
> >>>> fsl_espi ffe110000.spi: Extra RX 03
>
> >>>>
>
> >>>>
>
> >>>> The rx 00 Extra RX 03 is a bit concerning. I've only ever seen them
> with
>
> >>>> either a READ_SR or a READ_FSR. Never a data read.
>
> >>>>
>
> >>> Just remembered something about SPIE_DON:
>
> >>> Transfers are always full duplex, therefore in case of a read the chi=
p
>
> >>> sends dummy zero's. Having said that in case of a read SPIE_DON means
>
> >>> that the last dummy zero was shifted out.
>
> >>>
>
> >>> READ_SR and READ_FSR are the shortest transfers, 1 byte out and 1 byt=
e
> in.
>
> >>> So the issue may have a dependency on the length of the transfer.
>
> >>> However I see no good explanation so far. You can try adding a delay =
of
>
> >>> a few miroseconds between the following to commands in fsl_espi_bufs(=
).
>
> >>>
>
> >>>     fsl_espi_write_reg(espi, ESPI_SPIM, mask);
>
> >>>
>
> >>>     /* Prevent filling the fifo from getting interrupted */
>
> >>>     spin_lock_irq(&espi->lock);
>
> >>>
>
> >>> Maybe enabling interrupts and seeing the SPIE_DON interrupt are too
> close.
>
> >> I think this might be heading in the right direction. Playing about wi=
th
>
> >> a delay does seem to make the two symptoms less likely. Although I hav=
e
>
> >> to set it quite high (i.e. msleep(100)) to completely avoid any
>
> >> possibility of seeing either message.
>
> > The patch might replay the interrupt a little bit faster, but it would
>
> > be a few microseconds at most I think (just from improved code).
>
> >
>
> > Would you be able to ftrace the interrupt handler function and see if y=
ou
>
> > can see a difference in number or timing of interrupts? I'm at a bit of
>
> > a loss.
>
>
>
> I tried ftrace but I really wasn't sure what I was looking for.
>
> Capturing a "bad" case was pretty tricky. But I think I've identified a
>
> fix (I'll send it as a proper patch shortly). The gist is
>
>
>
> diff --git a/drivers/spi/spi-fsl-espi.c b/drivers/spi/spi-fsl-espi.c
>
> index 7e7c92cafdbb..cb120b68c0e2 100644
>
> --- a/drivers/spi/spi-fsl-espi.c
>
> +++ b/drivers/spi/spi-fsl-espi.c
>
> @@ -574,13 +574,14 @@ static void fsl_espi_cpu_irq(struct fsl_espi
>
> *espi, u32 events)
>
>   static irqreturn_t fsl_espi_irq(s32 irq, void *context_data)
>
>   {
>
>          struct fsl_espi *espi =3D context_data;
>
> -       u32 events;
>
> +       u32 events, mask;
>
>
>
>          spin_lock(&espi->lock);
>
>
>
>          /* Get interrupt events(tx/rx) */
>
>          events =3D fsl_espi_read_reg(espi, ESPI_SPIE);
>
> -       if (!events) {
>
> +       mask =3D fsl_espi_read_reg(espi, ESPI_SPIM);
>
> +       if (!(events & mask)) {
>
>                  spin_unlock(&espi->lock);
>
>                  return IRQ_NONE;
>
>          }
>
>
>
> The SPIE register contains the TXCNT so events is pretty much always
>
> going to have something set. By checking events against what we've
>
> actually requested interrupts for we don't see any spurious events.
>
>
Usually we shouldn=E2=80=99t receive interrupts we=E2=80=99re not intereste=
d in, except the
interrupt is shared. This leads to the question: is the SPI interrupt
shared with another device on your system? Do you see spurious interrupts
with the patch under /proc/irq/(irq)/spurious?


>
> I've tested this on the T2080RDB and on our custom hardware and it seems
>
> to resolve the problem.
>
>
>
>

--000000000000d0723905ae801f03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri 4. Sep 2020 at 01:58, Chris Packham &lt;<a href=3D"m=
ailto:Chris.Packham@alliedtelesis.co.nz">Chris.Packham@alliedtelesis.co.nz<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br><br>On 1/09/20 6=
:14 pm, Nicholas Piggin wrote:<br><br>&gt; Excerpts from Chris Packham&#39;=
s message of September 1, 2020 11:25 am:<br><br>&gt;&gt; On 1/09/20 12:33 a=
m, Heiner Kallweit wrote:<br><br>&gt;&gt;&gt; On 30.08.2020 23:59, Chris Pa=
ckham wrote:<br><br>&gt;&gt;&gt;&gt; On 31/08/20 9:41 am, Heiner Kallweit w=
rote:<br><br>&gt;&gt;&gt;&gt;&gt; On 30.08.2020 23:00, Chris Packham wrote:=
<br><br>&gt;&gt;&gt;&gt;&gt;&gt; On 31/08/20 12:30 am, Nicholas Piggin wrot=
e:<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Excerpts from Chris Packham&#39;s me=
ssage of August 28, 2020 8:07 am:<br><br>&gt;&gt;&gt;&gt;&gt;&gt; &lt;snip&=
gt;<br><br>&gt;&gt;&gt;&gt;&gt;&gt;<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=
&gt;&gt;&gt;&gt; I&#39;ve also now seen the RX FIFO not empty error on the =
T2080RDB<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br><br>&gt=
;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: Trans=
fer done but SPIE_DON isn&#39;t set!<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt=
;&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn&#3=
9;t set!<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_espi f=
fe110000.spi: Transfer done but SPIE_DON isn&#39;t set!<br><br>&gt;&gt;&gt;=
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: Transfer done =
but SPIE_DON isn&#39;t set!<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=
&gt;&gt; fsl_espi ffe110000.spi: Transfer done but rx/tx fifo&#39;s aren&#3=
9;t empty!<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_espi=
 ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32<br><br>&gt;&gt;&gt;&gt;=
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt=
;&gt;&gt;&gt; With my current workaround of emptying the RX FIFO. It seems<=
br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; survivable. Interes=
tingly it only ever seems to be 1 extra byte in the<br><br>&gt;&gt;&gt;&gt;=
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; RX FIFO and it seems to be after either a =
READ_SR or a READ_FSR.<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&=
gt;<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_espi ffe110=
000.spi: tx 70<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_=
espi ffe110000.spi: rx 03<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt; fsl_espi ffe110000.spi: Extra RX 00<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&=
gt;&gt;&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: Transfer done but SPIE_DON =
isn&#39;t set!<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_=
espi ffe110000.spi: Transfer done but rx/tx fifo&#39;s aren&#39;t empty!<br=
><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_espi ffe110000.sp=
i: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&=
gt;&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: tx 05<br><br>&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: rx 00<br><br>&gt;&gt=
;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: Extra RX =
03<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_espi ffe1100=
00.spi: Transfer done but SPIE_DON isn&#39;t set!<br><br>&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: Transfer done but rx=
/tx fifo&#39;s aren&#39;t empty!<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt=
;&gt;&gt;&gt; fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32<b=
r><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_espi ffe110000.s=
pi: tx 05<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fsl_espi =
ffe110000.spi: rx 00<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt=
; fsl_espi ffe110000.spi: Extra RX 03<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=
=C2=A0 =C2=A0 =C2=A0 From all the Micron SPI-NOR datasheets I&#39;ve got ac=
cess to it is<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; possi=
ble to continually read the SR/FSR. But I&#39;ve no idea why it<br><br>&gt;=
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; happens some times and not oth=
ers.<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; So I think I&#39;v=
e got a reproduction and I think I&#39;ve bisected the problem<br><br>&gt;&=
gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; to commit 3282a3da25bd (&quot;power=
pc/64: Implement soft interrupt replay in<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt; C&quot;). My day is just finishing now so I haven&#39;t =
applied too much scrutiny<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t; to this result. Given the various rabbit holes I&#39;ve been down on thi=
s<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; issue already I&#39;d=
 take this information with a good degree of skepticism.<br><br>&gt;&gt;&gt=
;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt; OK, so an easy test should be to re-test with a 5.4 kernel.<br><br>&=
gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; It doesn&#39;t have yet the change =
you&#39;re referring to, and the fsl-espi driver<br><br>&gt;&gt;&gt;&gt;&gt=
;&gt;&gt;&gt;&gt;&gt; is basically the same as in 5.7 (just two small chang=
es in 5.7).<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; There&#39;s 6cc0c16=
d82f88 and maybe also other interrupt related patches<br><br>&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; around this time that could affect book E, so it&#39=
;s good if that exact<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; patch is =
confirmed.<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; My confirmation is basic=
ally that I can induce the issue in a 5.4 kernel<br><br>&gt;&gt;&gt;&gt;&gt=
;&gt;&gt;&gt; by cherry-picking 3282a3da25bd. I&#39;m also able to &quot;fi=
x&quot; the issue in<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; 5.9-rc2 by rev=
erting that one commit.<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br><br>&gt;=
&gt;&gt;&gt;&gt;&gt;&gt;&gt; I both cases it&#39;s not exactly a clean cher=
ry-pick/revert so I also<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; confirmed =
the bisection result by building at 3282a3da25bd (which sees<br><br>&gt;&gt=
;&gt;&gt;&gt;&gt;&gt;&gt; the issue) and the commit just before (which does=
 not).<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Thanks for testing, that confirm=
s it well.<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br><br>&gt;&gt;&gt;&gt;&gt;&=
gt;&gt; [snip patch]<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br><br>&gt;&gt;&gt=
;&gt;&gt;&gt;&gt;&gt; I still saw the issue with this change applied. PPC_I=
RQ_SOFT_MASK_DEBUG<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; didn&#39;t repor=
t anything (either with or without the change above).<br><br>&gt;&gt;&gt;&g=
t;&gt;&gt;&gt; Okay, it was a bit of a shot in the dark. I still can&#39;t =
see what<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt; else has changed.<br><br>&gt;&=
gt;&gt;&gt;&gt;&gt;&gt;<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt; What would caus=
e this, a lost interrupt? A spurious interrupt? Or<br><br>&gt;&gt;&gt;&gt;&=
gt;&gt;&gt; higher interrupt latency?<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;<b=
r><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt; I don&#39;t think the patch should cause=
 significantly worse latency,<br><br>&gt;&gt;&gt;&gt;&gt;&gt;&gt; (it&#39;s=
 supposed to be a bit better if anything because it doesn&#39;t set<br><br>=
&gt;&gt;&gt;&gt;&gt;&gt;&gt; up the full interrupt frame). But it&#39;s pos=
sible.<br><br>&gt;&gt;&gt;&gt;&gt;&gt; My working theory is that the SPI_DO=
N indication is all about the TX<br><br>&gt;&gt;&gt;&gt;&gt;&gt; direction =
an now that the interrupts are faster we&#39;re hitting an error<br><br>&gt=
;&gt;&gt;&gt;&gt;&gt; because there is still RX activity going on. Heiner d=
isagrees with my<br><br>&gt;&gt;&gt;&gt;&gt;&gt; interpretation of the SPI_=
DON indication and the fact that it doesn&#39;t<br><br>&gt;&gt;&gt;&gt;&gt;=
&gt; happen every time does throw doubt on it.<br><br>&gt;&gt;&gt;&gt;&gt;&=
gt;<br><br>&gt;&gt;&gt;&gt;&gt; It&#39;s right that the eSPI spec can be in=
terpreted that SPI_DON refers to<br><br>&gt;&gt;&gt;&gt;&gt; TX only. Howev=
er this wouldn&#39;t really make sense, because also for RX<br><br>&gt;&gt;=
&gt;&gt;&gt; we program the frame length, and therefore want to be notified=
 once the<br><br>&gt;&gt;&gt;&gt;&gt; full frame was received. Also practic=
al experience shows that SPI_DON<br><br>&gt;&gt;&gt;&gt;&gt; is set also af=
ter RX-only transfers.<br><br>&gt;&gt;&gt;&gt;&gt; Typical SPI NOR use case=
 is that you write read command + start address,<br><br>&gt;&gt;&gt;&gt;&gt=
; followed by a longer read. If the TX-only interpretation would be right,<=
br><br>&gt;&gt;&gt;&gt;&gt; we&#39;d always end up with SPI_DON not being s=
et.<br><br>&gt;&gt;&gt;&gt;&gt;<br><br>&gt;&gt;&gt;&gt;&gt;&gt; I can&#39;t=
 really explain the extra RX byte in the fifo. We know how many<br><br>&gt;=
&gt;&gt;&gt;&gt;&gt; bytes to expect and we pull that many from the fifo so=
 it&#39;s not as if<br><br>&gt;&gt;&gt;&gt;&gt;&gt; we&#39;re missing an in=
terrupt causing us to skip the last byte. I&#39;ve been<br><br>&gt;&gt;&gt;=
&gt;&gt;&gt; looking for some kind of off-by-one calculation but again if i=
t were<br><br>&gt;&gt;&gt;&gt;&gt;&gt; something like that it&#39;d happen =
all the time.<br><br>&gt;&gt;&gt;&gt;&gt;&gt;<br><br>&gt;&gt;&gt;&gt;&gt; M=
aybe it helps to know what value this extra byte in the FIFO has. Is it:<br=
><br>&gt;&gt;&gt;&gt;&gt; - a duplicate of the last read byte<br><br>&gt;&g=
t;&gt;&gt;&gt; - or the next byte (at &lt;end address&gt; + 1)<br><br>&gt;&=
gt;&gt;&gt;&gt; - or a fixed value, e.g. always 0x00 or 0xff<br><br>&gt;&gt=
;&gt;&gt; The values were up thread a bit but I&#39;ll repeat them here<br>=
<br>&gt;&gt;&gt;&gt;<br><br>&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: tx 70<=
br><br>&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: rx 03<br><br>&gt;&gt;&gt;&g=
t; fsl_espi ffe110000.spi: Extra RX 00<br><br>&gt;&gt;&gt;&gt; fsl_espi ffe=
110000.spi: Transfer done but SPIE_DON isn&#39;t set!<br><br>&gt;&gt;&gt;&g=
t; fsl_espi ffe110000.spi: Transfer done but rx/tx fifo&#39;s aren&#39;t em=
pty!<br><br>&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE=
_TXCNT =3D 32<br><br>&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: tx 05<br><br>=
&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: rx 00<br><br>&gt;&gt;&gt;&gt; fsl_=
espi ffe110000.spi: Extra RX 03<br><br>&gt;&gt;&gt;&gt; fsl_espi ffe110000.=
spi: Transfer done but SPIE_DON isn&#39;t set!<br><br>&gt;&gt;&gt;&gt; fsl_=
espi ffe110000.spi: Transfer done but rx/tx fifo&#39;s aren&#39;t empty!<br=
><br>&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =
=3D 32<br><br>&gt;&gt;&gt;&gt; fsl_espi ffe110000.spi: tx 05<br><br>&gt;&gt=
;&gt;&gt; fsl_espi ffe110000.spi: rx 00<br><br>&gt;&gt;&gt;&gt; fsl_espi ff=
e110000.spi: Extra RX 03<br><br>&gt;&gt;&gt;&gt;<br><br>&gt;&gt;&gt;&gt;<br=
><br>&gt;&gt;&gt;&gt; The rx 00 Extra RX 03 is a bit concerning. I&#39;ve o=
nly ever seen them with<br><br>&gt;&gt;&gt;&gt; either a READ_SR or a READ_=
FSR. Never a data read.<br><br>&gt;&gt;&gt;&gt;<br><br>&gt;&gt;&gt; Just re=
membered something about SPIE_DON:<br><br>&gt;&gt;&gt; Transfers are always=
 full duplex, therefore in case of a read the chip<br><br>&gt;&gt;&gt; send=
s dummy zero&#39;s. Having said that in case of a read SPIE_DON means<br><b=
r>&gt;&gt;&gt; that the last dummy zero was shifted out.<br><br>&gt;&gt;&gt=
;<br><br>&gt;&gt;&gt; READ_SR and READ_FSR are the shortest transfers, 1 by=
te out and 1 byte in.<br><br>&gt;&gt;&gt; So the issue may have a dependenc=
y on the length of the transfer.<br><br>&gt;&gt;&gt; However I see no good =
explanation so far. You can try adding a delay of<br><br>&gt;&gt;&gt; a few=
 miroseconds between the following to commands in fsl_espi_bufs().<br><br>&=
gt;&gt;&gt;<br><br>&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0fsl_espi_write_reg(espi,=
 ESPI_SPIM, mask);<br><br>&gt;&gt;&gt;<br><br>&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0/* Prevent filling the fifo from getting interrupted */<br><br>&gt;&gt;&=
gt;=C2=A0 =C2=A0 =C2=A0spin_lock_irq(&amp;espi-&gt;lock);<br><br>&gt;&gt;&g=
t;<br><br>&gt;&gt;&gt; Maybe enabling interrupts and seeing the SPIE_DON in=
terrupt are too close.<br><br>&gt;&gt; I think this might be heading in the=
 right direction. Playing about with<br><br>&gt;&gt; a delay does seem to m=
ake the two symptoms less likely. Although I have<br><br>&gt;&gt; to set it=
 quite high (i.e. msleep(100)) to completely avoid any<br><br>&gt;&gt; poss=
ibility of seeing either message.<br><br>&gt; The patch might replay the in=
terrupt a little bit faster, but it would<br><br>&gt; be a few microseconds=
 at most I think (just from improved code).<br><br>&gt;<br><br>&gt; Would y=
ou be able to ftrace the interrupt handler function and see if you<br><br>&=
gt; can see a difference in number or timing of interrupts? I&#39;m at a bi=
t of<br><br>&gt; a loss.<br><br><br><br>I tried ftrace but I really wasn&#3=
9;t sure what I was looking for. <br><br>Capturing a &quot;bad&quot; case w=
as pretty tricky. But I think I&#39;ve identified a <br><br>fix (I&#39;ll s=
end it as a proper patch shortly). The gist is<br><br><br><br>diff --git a/=
drivers/spi/spi-fsl-espi.c b/drivers/spi/spi-fsl-espi.c<br><br>index 7e7c92=
cafdbb..cb120b68c0e2 100644<br><br>--- a/drivers/spi/spi-fsl-espi.c<br><br>=
+++ b/drivers/spi/spi-fsl-espi.c<br><br>@@ -574,13 +574,14 @@ static void f=
sl_espi_cpu_irq(struct fsl_espi <br><br>*espi, u32 events)<br><br>=C2=A0=C2=
=A0static irqreturn_t fsl_espi_irq(s32 irq, void *context_data)<br><br>=C2=
=A0=C2=A0{<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct f=
sl_espi *espi =3D context_data;<br><br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 u32 events;<br><br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 events, ma=
sk;<br><br><br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lo=
ck(&amp;espi-&gt;lock);<br><br><br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* Get interrupt events(tx/rx) */<br><br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 events =3D fsl_espi_read_reg(espi, ESPI_SPIE);<=
br><br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!events) {<br><br>+=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mask =3D fsl_espi_read_reg(espi, ESPI_SPIM);=
<br><br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(events &amp; mask)) {<b=
r><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&amp;espi-&gt;lock);<br><br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return IRQ_NONE;<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }<br><br><br><br>The SPIE register contains the TXCNT so ev=
ents is pretty much always <br><br>going to have something set. By checking=
 events against what we&#39;ve <br><br>actually requested interrupts for we=
 don&#39;t see any spurious events.<br><br></blockquote><div dir=3D"auto"><=
br></div><div dir=3D"auto">Usually we shouldn=E2=80=99t receive interrupts =
we=E2=80=99re not interested in, except the interrupt is shared. This leads=
 to the question: is the SPI interrupt shared with another device on your s=
ystem? Do you see spurious interrupts with the patch under /proc/irq/(irq)/=
spurious?</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
br><br>I&#39;ve tested this on the T2080RDB and on our custom hardware and =
it seems <br><br>to resolve the problem.<br><br><br><br></blockquote></div>=
</div>

--000000000000d0723905ae801f03--
