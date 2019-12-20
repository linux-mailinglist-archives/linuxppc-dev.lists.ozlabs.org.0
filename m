Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3066B127A0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 12:35:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fRVw0gFwzDqw2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 22:35:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zx2c4.com (client-ip=192.95.5.64; helo=frisell.zx2c4.com;
 envelope-from=jason@zx2c4.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.b="wufuLG9F"; 
 dkim-atps=neutral
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fRRt4V4bzDqw2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 22:32:24 +1100 (AEDT)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02c2e853
 for <linuxppc-dev@lists.ozlabs.org>;
 Fri, 20 Dec 2019 10:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=NTCmOB9mP2ZB
 OAKNC4UfPr7wELM=; b=wufuLG9FV1QvZ4iig28etBmsw4yHpxUNsHXkr2E29Yin
 4g/lSboBSa5plDJcsdVzyJIvPpsfXzA/V9X7abXxW/G3w5N7DHQUuIbLyFub9Mvi
 DhV2J2ytxQbYQdoCevjclWiB44oAbXcxvoiQCSmqvlTEbahGRjgxb0Atz5Yec8So
 AqO22sFflgXDEX4Ja3YFWEkybW3PUZpS1wQJmfJ0Rjb9WNb7GtdT2MkbYdh7e4Mq
 tBxKvUPk7ckoSacDgGfnFp78v/8IudFoPVKGHzk5/e1vv608A/h0QsgE0mu4uE34
 gzkESLhHmlZr6J6MYZLExVqGiYyC3we5gCYapEQ2XQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cc6d33df
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <linuxppc-dev@lists.ozlabs.org>;
 Fri, 20 Dec 2019 10:35:30 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id h19so4278824oih.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 03:32:19 -0800 (PST)
X-Gm-Message-State: APjAAAXEuN1M0+jOAlbaAgq1xoZCoPxmvpUfjit8/k22hCEbAsUfvUCM
 fIeQSLKtqRLE71JAnRhjYfu2BLCa01ryXdbx7yk=
X-Google-Smtp-Source: APXvYqymjJKpLvIMVqruxQWWH4MkDCG2XjovoaU2ruIv1dRtayeg8ckR+0bHdmZxkj20eJ9FkLfNwp96MfaLy51F0w8=
X-Received: by 2002:a05:6808:a8a:: with SMTP id
 q10mr3388034oij.66.1576841538287; 
 Fri, 20 Dec 2019 03:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20190327123615.rwhk6h3ayfurvapf@linutronix.de>
 <7d97f3c6-4614-ead7-179a-e7e223ea3997@kaod.org>
 <2bbc1490-400d-585e-d74b-924c570b4236@kaod.org>
 <1553836851.2264.2.camel@gmail.com> <1553850306.nyv11r9iej.astroid@bobo.none>
 <20190329113109.3a9bd24e@gandalf.local.home>
 <1553912871.ce5mzizoek.astroid@bobo.none>
 <20190401083827.GE11158@hirez.programming.kicks-ass.net>
 <20190406000611.GA27782@lenoir>
 <1554801792.ruzup3dxhe.astroid@bobo.none>
 <7a5b63a0-2bf5-60bb-8678-b7b36671a29c@zx2c4.com>
 <871rt0mql5.fsf@mpe.ellerman.id.au>
 <42d35390-0661-8d1e-d335-03186ee7ec93@kaod.org>
In-Reply-To: <42d35390-0661-8d1e-d335-03186ee7ec93@kaod.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 20 Dec 2019 12:32:06 +0100
X-Gmail-Original-Message-ID: <CAHmME9phu1QZSdX55sneJpFsSg0M8_xbP2hAb1ha0CYsRzqTUg@mail.gmail.com>
Message-ID: <CAHmME9phu1QZSdX55sneJpFsSg0M8_xbP2hAb1ha0CYsRzqTUg@mail.gmail.com>
Subject: Re: [Qemu-ppc] pseries on qemu-system-ppc64le crashes in
 doorbell_core_ipi()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 Frederic Weisbecker <fweisbec@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Frederic Weisbecker <frederic@kernel.org>,
 David? Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 19, 2019 at 2:08 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:=
>
> There is a patch for msgsndp in my tree you could try :
>
>   https://github.com/legoater/qemu/tree/powernv-5.0
>
> Currently being reviewed. I have to address some remarks from David befor=
e
> it can be merged.

Thanks. I've cherry-picked
https://github.com/legoater/qemu/commit/910c9ea5ecc and can confirm
that I no longer receive the crashes. QEMU 5.1 or 5.0.1 release, I
guess?

Jason
