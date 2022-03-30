Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0621D4EC586
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 15:22:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT6Xl048tz3c0H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 00:21:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=d336lr51;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT6X45mLnz2xtT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 00:21:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=d336lr51; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KT6Wn3vdXz4x7X;
 Thu, 31 Mar 2022 00:21:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1648646482;
 bh=dk4FOANK6JU7pzkzEVjtS+8Y7BNzj7t8GPyYaZ3tiZ4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=d336lr51US2buYm52hHjZsIp2WTAUmi+yu3MvJUFrqnyldISO5BRrnYobpSqhx0PQ
 8yfwsltno3nwnEw/PJOBwAegBV1cbvbUeDkDUS3w24PHjUwiKBFqf5+qrqkIq7ROOw
 d8TeUIpAFLdXmmvcXguwpwcHoJnqc2BJVi2AcmrdNNvcsg/px6dSwtFqg+RLRRGp27
 yyDKgDJSrMEea/UfpVAD8imQqf6+e0z2gAsylP1O3hhRJ1OefYqfa6Xji+lwchhGtH
 dk/B2u/YsHeoaLKBrsveIYi2YZR5pwkiuUNSvxgVVqM2FuMeToLDKNa7qIYj0TNZgf
 TcSZmFqMojg7Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.18-1 tag
In-Reply-To: <20220330112733.GG163591@kunlun.suse.cz>
References: <87zglefhxd.fsf@mpe.ellerman.id.au>
 <CAHk-=whk4jihDM+zkhZPYRyNO0-YA1_-K9_NyC3EDsX+gkxC-w@mail.gmail.com>
 <87wngefnsu.fsf@mpe.ellerman.id.au>
 <20220330112733.GG163591@kunlun.suse.cz>
Date: Thu, 31 Mar 2022 00:21:03 +1100
Message-ID: <87k0cbfuf4.fsf@mpe.ellerman.id.au>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 jniethe5@gmail.com, ganeshgr@linux.ibm.com, wangborong@cdjrlc.com,
 bigunclemax@gmail.com, Miroslav Benes <mbenes@suse.cz>, hbh25y@gmail.com,
 mikey@neuling.org, Joe Lawrence <joe.lawrence@redhat.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 danielhb413@gmail.com, haren@linux.ibm.com, mamatha4@linux.vnet.ibm.com,
 Corentin Labbe <clabbe@baylibre.com>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Thierry Reding <treding@nvidia.com>, kernel.noureddine@gmail.com,
 nathanl@linux.ibm.com, Petr Mladek <pmladek@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, guozhengkui@vivo.com, kjain@linux.ibm.com,
 chenjingwen6@huawei.com, Nick Piggin <npiggin@gmail.com>, oss@buserror.net,
 rmclure@linux.ibm.com, maddy@linux.ibm.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, psampat@linux.ibm.com,
 sachinp@linux.ibm.com, Anders Roxell <anders.roxell@linaro.org>,
 ldufour@linux.ibm.com, hbathini@linux.ibm.com,
 Athira Jajeev <atrajeev@linux.vnet.ibm.com>, farosas@linux.ibm.com,
 Geoff Levand <geoff@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sourabhjain@linux.ibm.com, Julia Lawall <Julia.Lawall@inria.fr>,
 Ritesh Harjani <riteshh@linux.ibm.com>, cgel.zte@gmail.com,
 Vaibhav Jain <vaibhav@linux.ibm.com>, tobias@waldekranz.com,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jakob Koschel <jakobkoschel@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Mon, Mar 28, 2022 at 08:07:13PM +1100, Michael Ellerman wrote:
>> Linus Torvalds <torvalds@linux-foundation.org> writes:
>> > On Fri, Mar 25, 2022 at 3:25 AM Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>>=20
>> > That said:
>> >
>> >> There's a series of commits cleaning up function descriptor handling,
>> >
>> > For some reason I also thought that powerpc had actually moved away
>> > from function descriptors, so I'm clearly not keeping up with the
>> > times.
>>=20
>> No you're right, we have moved away from them, but not entirely.
>>=20
>> Functions descriptors are still used for 64-bit big endian, but they're
>> not used for 64-bit little endian, or 32-bit.
>
> There was a patch to use ABIv2 for ppc64 big endian. I suppose that
> would rid usof the gunction descriptors for good.

It would be nice.

The hesitation in the past was that the GNU toolchain developers don't
officially support BE+ELFv2, though it is in use so it does work.

> Maybe it's worth resurrecting?

Yeah maybe we should think about it again. If it builds with clang/lld
that would be a real plus.

cheers
