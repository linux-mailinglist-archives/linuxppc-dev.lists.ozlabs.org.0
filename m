Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AE519F3F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 12:59:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wnbd58xkzDqss
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:59:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wnZ51FlkzDqlK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 20:57:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UgSmH10U; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48wnYz5X2Pz9sQx;
 Mon,  6 Apr 2020 20:57:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1586170668;
 bh=3T/Sm1A0E9UPY5qOETqeF8SyVeK3inqT1uc8wO3uPEM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UgSmH10Uu3lHOI0JliHDuckF5cdxdt2wxO1Hc+gsFghZJ3qGxUrd2rS5O8hy7upoY
 y7ojnOs5snp4BeJoHkfEXuJT7fVOLK+pTuxDc5ScQMstyeV8AEHnk2g8PshC/yHhnB
 wmNmaNLqIxvNTbjSGhvtV1kv2jTYsfAewG3ZAg661qUBw7nwMAEfoWCvKg8K459JUz
 3UN4iAZG7+IyYGuk89I2GslVHzKuXyeeiIDlj+C4ag1EPdKtN7e8Yi0598/C0K+4Aa
 MTUTT/9gc26h3QfDOfUQb8vqZu7hj/nVP7EjYEw0iW36wKqZQcTAhe0P9bPenUFJKp
 3DytM7CwoFx+Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.7-1 tag
In-Reply-To: <CAHk-=wgkkmNV5tMzQDmPAQuNJBuMcry--Jb+h8H1o4RA3kF7QQ@mail.gmail.com>
References: <87h7xyrt5d.fsf@mpe.ellerman.id.au>
 <CAHk-=wgkkmNV5tMzQDmPAQuNJBuMcry--Jb+h8H1o4RA3kF7QQ@mail.gmail.com>
Date: Mon, 06 Apr 2020 20:57:53 +1000
Message-ID: <87blo4swy6.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com, shilpa.bhat@linux.vnet.ibm.com,
 gustavold@linux.ibm.com, aik@ozlabs.ru,
 Nick Desaulniers <ndesaulniers@google.com>, psampat@linux.ibm.com,
 bala24@linux.ibm.com, Grant Likely <grant.likely@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>, afzal.mohd.ma@gmail.com,
 srikar@linux.vnet.ibm.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 Joe Lawrence <joe.lawrence@redhat.com>, maskray@google.com,
 Ilie Halip <ilie.halip@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 chenzhou10@huawei.com, ganeshgr@linux.ibm.com, dougmill@linux.vnet.ibm.com,
 kjain@linux.ibm.com, leonardo@linux.ibm.com,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, agust@denx.de,
 laurentiu.tudor@nxp.com, nathanl@linux.ibm.com, Arnd Bergmann <arnd@arndb.de>,
 alistair@popple.id.au, Nick Piggin <npiggin@gmail.com>, oss@buserror.net,
 Olof Johansson <olof@lixom.net>, maddy@linux.ibm.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, clg@kaod.org,
 courbet@google.com, vaibhav@linux.ibm.com, Bjorn Helgaas <bhelgaas@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Daniel Axtens <dja@axtens.net>,
 farosas@linux.ibm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lpechacek@suse.cz, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sourabhjain@linux.ibm.com, Joe Perches <joe@perches.com>,
 po-hsu.lin@canonical.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Sun, Apr 5, 2020 at 5:53 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> There is one conflict in fs/sysfs/group.c, between our:
>>
>>   9255782f7061 ("sysfs: Wrap __compat_only_sysfs_link_entry_to_kobj function to change the symlink name")
> [...]
>
> The conflict was trivial.
>
> But I want to kvetch a bit about that commit. It's doing some odd stuff.
>
> In particular, it's wrapping things "the wrong way". Our naming rules
> are that the double underscore versions are the internal helper
> functions that you generally shouldn't use unless you have some extra
> reason for it, and then the non-underscore versions are the preferred
> and simpler user interface to those internal implementations.
>
> IOW, the _wrapper_ doesn't have double underscores, it's the _wrappee_
> that has the underscores.
>
> That commit does the exact reverse of that usual pattern, which is
> very confusing.
>
> Now, I see _why_ you do that - normally the non-underscore version is
> the "real" interface and the one we've always exported, and then the
> double underscore is the special internal thing that maybe exposes
> some internal detail (or maybe only does one special case of it and
> leaves out locking or whatever).
>
> In this case, for hysterical raisins, we only _had_ that
> double-underscore version, and you basically added the new case and
> did it without the underscores.
>
> So I see why it happened the way it did, but I do think the end result
> makes no sense and is odd and surprising.

Yeah, that's fair.

I was a bit unsure about taking a fs/sysfs patch to begin with, so I
thought leaving the existing function unchanged was the least risky in
terms of causing any other breakage.

But in hindsight that was the wrong choice, the end result is not
actually what we want.

So we should have done the right patch and then either asked Greg to
take it or put it in a topic branch of my own.

> The thing is, we have exactly *one* user of that double-underscore
> version: tpm-chip.c (ok, there are two calls in that file, but it's a
> single user).
>
> So I think it should just have removed the __ version entirely. Make
> tpm-chip just use the new semantics, and pass in the extra NULL
> argument.
>
> I guess I'll just do that as a cleanup patch on top, but it feels a
> bit odd to have to do that cleanup when the original patch could have
> just done the obvious thing.

Thanks.

cheers
