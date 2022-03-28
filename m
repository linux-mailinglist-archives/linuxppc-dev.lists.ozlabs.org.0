Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB5F4E90C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 11:08:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRn0d2Vb1z3c1Q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 20:08:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Jau2K2Wn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRmzz51mzz2ywH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 20:07:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Jau2K2Wn; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KRmzm2swPz4x7X;
 Mon, 28 Mar 2022 20:07:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1648458447;
 bh=v1UBLdFGsXMcX/h6bZC2s3eWJwQLx420VUoxxYmsYak=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Jau2K2Wnvnvu6yY6wbeCl0JkYlOu6kb0Mff5EhPVKTjOwNgYWWBmrKmDRumZUWWww
 6+cy1pvfShtmes6SwjGIJqEPr5CyjfYKjakgQMzhHObVgEf6uGSQgPM6GTqLAgo+IK
 mYmnvh5FEfjRqvHcRCkR3gAsdaiYtiaU5Ip1cSK8kJYMqc4LliYmj6EA+YW4SZ8VVH
 B2RhMISgR3A0V7mnWCinfXnfNxwwwkIHNc8NRSJGM1R1N08PKsJxzir1A1+C2y2GaS
 PvHyn8zwtwD7RY6I3bPVw3i1CLyj9lCTlFtbEGd6W84pNxjVyi9lZXEuhP3Ku9RPTl
 jJGXGfEuS6pZA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.18-1 tag
In-Reply-To: <CAHk-=whk4jihDM+zkhZPYRyNO0-YA1_-K9_NyC3EDsX+gkxC-w@mail.gmail.com>
References: <87zglefhxd.fsf@mpe.ellerman.id.au>
 <CAHk-=whk4jihDM+zkhZPYRyNO0-YA1_-K9_NyC3EDsX+gkxC-w@mail.gmail.com>
Date: Mon, 28 Mar 2022 20:07:13 +1100
Message-ID: <87wngefnsu.fsf@mpe.ellerman.id.au>
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
Cc: wangborong@cdjrlc.com, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Wedson Almeida Filho <wedsonaf@google.com>, Petr Mladek <pmladek@suse.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, jniethe5@gmail.com,
 psampat@linux.ibm.com, Miroslav Benes <mbenes@suse.cz>, hbh25y@gmail.com,
 mikey@neuling.org, Joe Lawrence <joe.lawrence@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>, "Aneesh Kumar
 K.V" <aneesh.kumar@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 danielhb413@gmail.com, haren@linux.ibm.com,
 Thierry Reding <treding@nvidia.com>, ganeshgr@linux.ibm.com,
 Corentin Labbe <clabbe@baylibre.com>, mamatha4@linux.vnet.ibm.com,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>, kernel.noureddine@gmail.com,
 nathanl@linux.ibm.com, Paul Menzel <pmenzel@molgen.mpg.de>,
 YueHaibing <yuehaibing@huawei.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, guozhengkui@vivo.com, kjain@linux.ibm.com,
 chenjingwen6@huawei.com, Nick Piggin <npiggin@gmail.com>, oss@buserror.net,
 rmclure@linux.ibm.com, maddy@linux.ibm.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, sachinp@linux.ibm.com,
 bigunclemax@gmail.com, ldufour@linux.ibm.com, hbathini@linux.ibm.com,
 Athira Jajeev <atrajeev@linux.vnet.ibm.com>, farosas@linux.ibm.com,
 Geoff Levand <geoff@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sourabhjain@linux.ibm.com, Julia Lawall <Julia.Lawall@inria.fr>,
 Ritesh Harjani <riteshh@linux.ibm.com>, cgel.zte@gmail.com,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, tobias@waldekranz.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Fri, Mar 25, 2022 at 3:25 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Livepatch support for 32-bit is probably the standout new feature, otherwise mostly just
>> lots of bits and pieces all over the board.
>
> Heh. I would have expected 32-bit ppc to be entirely legacy by now, so
> it's a bit surprising to see that being a standout feature.

We still get the odd bug report from people running mainline, or recent
stable kernels, on 32-bit.

And obviously Christophe has been doing lots of work on the Linux side,
so in that sense 32-bit is alive and well.

Having said that I don't think we'll see any new 32-bit CPU designs, so
the clock is slowly ticking.

> That said:
>
>> There's a series of commits cleaning up function descriptor handling,
>
> For some reason I also thought that powerpc had actually moved away
> from function descriptors, so I'm clearly not keeping up with the
> times.

No you're right, we have moved away from them, but not entirely.

Functions descriptors are still used for 64-bit big endian, but they're
not used for 64-bit little endian, or 32-bit.

cheers
