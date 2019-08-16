Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF06C90433
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 16:54:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4695ts68QFzDqw0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 00:54:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=debian.org
 (client-ip=80.12.242.132; helo=smtp.smtpout.orange.fr;
 envelope-from=marillat@debian.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from smtp.smtpout.orange.fr (smtp10.smtpout.orange.fr
 [80.12.242.132])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4695rj2LclzDqBg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 00:52:20 +1000 (AEST)
Received: from christian.marillat.net ([90.112.40.151]) by mwinf5d20 with ME
 id pqsD200063FgnAJ03qsD23; Fri, 16 Aug 2019 16:52:15 +0200
X-ME-Helo: christian.marillat.net
X-ME-Date: Fri, 16 Aug 2019 16:52:15 +0200
X-ME-IP: 90.112.40.151
Received: from marillat by christian.marillat.net with local (Exim 4.92.1)
 (envelope-from <marillat@debian.org>)
 id 1hydaP-000645-7h; Fri, 16 Aug 2019 16:52:13 +0200
From: Christian Marillat <marillat@debian.org>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: 5.2.7 kernel doesn't boot on G5
In-Reply-To: <87ef1ljjct.fsf@igel.home> (Andreas Schwab's message of "Fri, 16
 Aug 2019 16:05:54 +0200")
References: <87mugdtf08.fsf@christian.marillat.net>
 <CA+7wUsw5eTdwJG3UytWr9CajVhpUkyOGufmvUvqQJoEWq4nWhQ@mail.gmail.com>
 <a84c86b3-4c6c-f7a2-ad3f-6e075e6ebe25@c-s.fr>
 <87a7cal3pd.fsf@christian.marillat.net>
 <e582fcf0-a311-07f7-5445-c3471ec5c783@c-s.fr>
 <87zhk9tgdb.fsf__22033.2117214397$1565960670$gmane$org@christian.marillat.net>
 <87ef1ljjct.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEX+1pnqg1n5oHiqVDFh
 Jg0YCQfMakOBPRwFLaSqAAACXElEQVQ4jW3UwW/bIBQGcJbD7jgS58Ak77oIB66rQsp9Nct1
 lOzlOslu+Pf3PRx3qTSUVjG/fg/bPCoE7QUP8nOoU/G1xlrnEIRZ4YrrWEOYKkaD3CCXekpj
 SCkeOQWwS0JeQ0ghMHJmBrgFfMCoiKXoGfQdyOMySzmsoFaQijot5RYR6wFlumF6I16N7AyG
 PiBiaxW1LoC5rn0uKY3TP9gBZCelMduUEu74A/AwX7DIeGWYGFBca4auByT7CLKB1G9c670U
 Cpk74EnSeQXTRiv1P0Cmk2oGjB9AZY40SFXEBp9sZ1St7gFCg77s5dYR0QNEBi1JFpclCy+e
 4gredls7tchwOsU53OHrSzFqePEIqQH7Pq3QP2etykQW24JuudG8liqvGjuFkdUcraNhBdyu
 xNKkshqOVjKE9hzUXgjB1Px8cSg1N/iMHVJyyQy3LZUghiUB0HgjKhOVPeVLEP4OKOOWCLk9
 4TmGuKxh40QcIWtdVujdOfIOavKTy9xbBUBoV4F+je7qyFt+h7TAgSGlH/x2rcWkI4cv3oa5
 MvzCnvf4u2Ix7TBf3sIIeNkYsdtsLYbDj6+WDucT4DtAbDYFO8KIfaTfI6+xMzvc1mvPtTgA
 QGOL9BM9tRNm0tgmz+ePSzH8MQz9U+dWcIQuFaNogBjh6XBc6+QKblU8bRiMMBrPgXMYq3Xc
 DuLb0oKd0Vh6bmC5rcWuQT9lfanzmBg8HwQujsAw3rrDiGuGoUEL4KieMxdIWNu2VmygsNro
 FkDiHVThY3c78G/8b/Bvd5CFb288Hngeicrz6S8N2xFYrI8TOAAAAABJRU5ErkJggg==
Date: Fri, 16 Aug 2019 16:52:13 +0200
Message-ID: <87o90ptb6q.fsf@christian.marillat.net>
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
Cc: Mathieu Malaterre <malat@debian.org>,
 Christian Marillat <marillat@debian.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16 ao=C3=BBt 2019 16:05, Andreas Schwab <schwab@linux-m68k.org> wrote:

> On Aug 16 2019, Christian Marillat <marillat@debian.org> wrote:
>
>> On 15 ao=C3=BBt 2019 19:50, christophe leroy <christophe.leroy@c-s.fr> w=
rote:
>>
>> [...]
>>
>>> Can you test with latest stable version, ie 5.2.8 ?
>>
>> Built from my G5 with make-kpkg and still doesn't boot :
>
> FWIW, 5.2.0 is working fine on my G5 (PowerMac7,3).

Mine is a PowerMac11,2 "Quadcore" and / is on a RAID0

As 4.19.5 boot I don't think is a hardware problem.

Christian
