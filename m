Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E0A22615C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 15:55:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9NXF2zknzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 23:55:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9NTY6KgKzDqYM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 23:52:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NZDdQ69l; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9NTW12L1z9sSd;
 Mon, 20 Jul 2020 23:52:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595253168;
 bh=jrMlPlBxW1GZFZ8mZiLoaaU7Ca1RgPX/T0pyBnXiqBA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NZDdQ69lCSHOqXjZhNhF3631UR0VkEWjPdcp5cMjIfauK8gHzRFdElVSbjAxbKtnc
 w4RvedKy47+RSwJwSPT0jmBeBGy0KryHiJRLNCKLEsLF5V8w1MGl4zFqrPsRp3qWuR
 IVIZDrujiAw/51O5RttyD7iF6E8IA40ZKSVe5ZJV9ZMzaW2mF/iGcMhVzXe1Pc+yhy
 DnI5DfxH+Q39kT82MAotJe3NO8Ufxz4hzrq84GyLy99L7arzWwl7x218hEPKZvKABQ
 rjTHiP681QhfChVZvFZcOJ0XXINpKkOB2NEEBWgptElu2OfoVfqS9g01oNc0n3aH8t
 R6uYQpo2/u+VA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Daniel Axtens
 <dja@axtens.net>
Subject: Re: [PATCH] powerpc/fault: kernel can extend a user process's stack
In-Reply-To: <20200720105116.GO32107@kitsune.suse.cz>
References: <20191211014337.28128-1-dja@axtens.net>
 <20191211072806.GI3986@kitsune.suse.cz>
 <8736drciem.fsf@dja-thinkpad.axtens.net>
 <20200720105116.GO32107@kitsune.suse.cz>
Date: Mon, 20 Jul 2020 23:52:44 +1000
Message-ID: <878sfethsj.fsf@mpe.ellerman.id.au>
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
Cc: Tom Lane <tgl@sss.pgh.pa.us>, linuxppc-dev@lists.ozlabs.org,
 Daniel Black <daniel@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> Hello,
>
> On Wed, Dec 11, 2019 at 08:37:21PM +1100, Daniel Axtens wrote:
>> > Fixes: 14cf11af6cf6 ("powerpc: Merge enough to start building in
>> > arch/powerpc.")
>>=20
>> Wow, that's pretty ancient! I'm also not sure it's right - in that same
>> patch, arch/ppc64/mm/fault.c contains:
>>=20
>> ^1da177e4c3f4 (Linus Torvalds         2005-04-16 15:20:36 -0700 213)    =
        if (address + 2048 < uregs->gpr[1]
>> ^1da177e4c3f4 (Linus Torvalds         2005-04-16 15:20:36 -0700 214)    =
            && (!user_mode(regs) || !store_updates_sp(regs)))
>> ^1da177e4c3f4 (Linus Torvalds         2005-04-16 15:20:36 -0700 215)    =
                goto bad_area;
>>=20
>> Which is the same as the new arch/powerpc/mm/fault.c code:
>>=20
>> 14cf11af6cf60 (Paul Mackerras 2005-09-26 16:04:21 +1000 234)            =
if (address + 2048 < uregs->gpr[1]
>> 14cf11af6cf60 (Paul Mackerras 2005-09-26 16:04:21 +1000 235)            =
    && (!user_mode(regs) || !store_updates_sp(regs)))
>> 14cf11af6cf60 (Paul Mackerras 2005-09-26 16:04:21 +1000 236)            =
        goto bad_area;
>>=20
>> So either they're both right or they're both wrong, either way I'm not
>> sure how this patch is to blame.
>
> Is there any progress on resolving this?
>
> I did not notice any followup patch nor this one being merged/refuted.

It ended up with this:

https://lore.kernel.org/linuxppc-dev/20200703141327.1732550-2-mpe@ellerman.=
id.au/


Which I was hoping would get some reviews :)

I'll probably merge the whole series into next this week.

cheers
