Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1DE8F6C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 00:08:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468gZ42HdQzDrHF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 08:08:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=debian.org
 (client-ip=80.12.242.124; helo=smtp.smtpout.orange.fr;
 envelope-from=marillat@debian.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
 [80.12.242.124])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Ypr1BRkzDr6D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 03:48:50 +1000 (AEST)
Received: from christian.marillat.net ([90.112.40.151]) by mwinf5d37 with ME
 id pVom2000E3FgnAJ03Vom5u; Thu, 15 Aug 2019 19:48:47 +0200
X-ME-Helo: christian.marillat.net
X-ME-Date: Thu, 15 Aug 2019 19:48:47 +0200
X-ME-IP: 90.112.40.151
Received: from marillat by christian.marillat.net with local (Exim 4.92.1)
 (envelope-from <marillat@debian.org>)
 id 1hyJri-0002Z3-NA; Thu, 15 Aug 2019 19:48:46 +0200
From: Christian Marillat <marillat@debian.org>
To: christophe leroy <christophe.leroy@c-s.fr>
Subject: Re: 5.2.7 kernel doesn't boot on G5
In-Reply-To: <a84c86b3-4c6c-f7a2-ad3f-6e075e6ebe25@c-s.fr> (christophe leroy's
 message of "Thu, 15 Aug 2019 19:29:12 +0200")
References: <87mugdtf08.fsf@christian.marillat.net>
 <CA+7wUsw5eTdwJG3UytWr9CajVhpUkyOGufmvUvqQJoEWq4nWhQ@mail.gmail.com>
 <a84c86b3-4c6c-f7a2-ad3f-6e075e6ebe25@c-s.fr>
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
Date: Thu, 15 Aug 2019 19:48:46 +0200
Message-ID: <87a7cal3pd.fsf@christian.marillat.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 16 Aug 2019 08:03:08 +1000
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
Cc: Mathieu Malaterre <malat@debian.org>, marillat@debian.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15 ao=C3=BBt 2019 19:29, christophe leroy <christophe.leroy@c-s.fr> wrot=
e:

> Le 15/08/2019 =C3=A0 19:05, Mathieu Malaterre a =C3=A9crit=C2=A0:
>> Does that ring a bell to anyone here ? Thanks
>
> Apparently that's 5.2.0, not 5.2.7

Yes, 5.2.7 is the Debian package version. Sorry for the mistake.

Christian
