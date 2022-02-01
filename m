Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9FF4A5B97
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 12:53:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp3HJ6NSsz3c5j
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 22:53:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O1m9OImI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp3Gj2DVtz2xb8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 22:53:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=O1m9OImI; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jp3Gf6Sbxz4xhm;
 Tue,  1 Feb 2022 22:53:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643716395;
 bh=72NDvLDF+EGQrbYf55zwYRS+DChn+NbwVDSQSwlQYfA=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=O1m9OImIn+drh2RSrriDy05oHQ8wtR7C6LumavT9/KZeBDhKR6XKEm07vgfWOfXf0
 37rUMabEioCZKboqQU8VmROErtGJOniNCiFFHfTR/Yl8VP/bug13Od89CStsNrPbvY
 8+P4QaJAPt7YWIjqOcKVSSYrrfvRyx/PSoENA4LYNQmZgsjCErdkj00ILRCcPr1cE6
 S51lZ2q/y5kZNfYgWiZpaUYTS5oW4XdEkuW2lY/EuaHBOmIE76qw4JsCncS9LMh5pI
 t3ioUqg5zoU4Ipd/n2WOVs1YvCj/whTvov7GnFkBsapQIXAiBcl+Fj/RShHotXTkfx
 B1s2OtkCy9vRA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Libre-Soc General Development
 <libre-soc-dev@lists.libre-soc.org>, linuxppc-dev@lists.ozlabs.org, Luke
 Kenneth Casson Leighton <lkcl@lkcl.net>, lkcl <luke.leighton@gmail.com>,
 openpower-hdl-cores
 <openpower-hdl-cores@mailinglist.openpowerfoundation.org>
Subject: Re: microwatt booting linux-5.7 under verilator
In-Reply-To: <1643696448.f3llnvzeyb.astroid@bobo.none>
References: <CAPweEDw710zFK8KLZY5gsQxEkQKrDiFkNRgABY9HJZ1rxpeVCg@mail.gmail.com>
 <1643598916.2hjoqtw60c.astroid@bobo.none>
 <994E627C-0194-4634-8DBC-0845493E6744@gmail.com>
 <1643696448.f3llnvzeyb.astroid@bobo.none>
Date: Tue, 01 Feb 2022 22:53:14 +1100
Message-ID: <87o83qn6qd.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from lkcl's message of January 31, 2022 2:19 pm:
>> 
>> On January 31, 2022 3:31:41 AM UTC, Nicholas Piggin <npiggin@gmail.com> wrote:
>>>Hi Luke,
>>>
>>>Interesting to read about the project, thanks for the post.
>> 
>> no problem. it's been i think 18 years since i last did linux kernel work.
>> 
>>>> i also had to fix a couple of things in the linux kernel source
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/joel/microwatt.git
>>>
>>>I think these have mostly (all?) been upstreamed now.
>> 
>> i believe so, although last i checked (6 months?) there was some of dts still to do. instructions online all tend to refer to joel or benh's tree(s)
>> 
>>>> this led me to add support for CONFIG_KERNEL_UNCOMPRESSED
>>>> and cut that time entirely, hence why you can see this in the console
>>>log:
>>>> 
>>>>     0x5b0e10 bytes of uncompressed data copied
>>>
>>>Interesting, it looks like your HAVE_KERNEL_UNCOMPRESSED support
>>>patch is pretty trivial. 
>> 
>> yeah i was really surprised, it was all there
>> 
>>> We should be able to upstream it pretty
>>>easily I think?
>> 
>> don't see why not.
>
> Okay then we should.
>
>> 
>> the next interesting thing which would save another hour when emulating HDL at this astoundingly-slow speed of sub-1000 instructions per second would be in-place execution: no memcpy, just jump.
>> 
>> i seem to recall this (inplace execution) being a standard option back in 2003 when i was doing xda-developers wince smartphone reverse-emgineering, although with it being 19 years ago i could be wrong
>
> Not sure of the details on that. Is it memcpy()ing out of ROM or RAM to 
> RAM? Is this in the arch boot code? (I don't know very well).

If you build with CONFIG_RELOCATABLE=y and CONFIG_RELOCATABLE_TEST=y the
kernel will run wherever you load it (must be 64K aligned), without
copying itself down to zero first. That will save you a few cycles.

cheers
