Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB019ED61
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 20:38:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wMqT6JBqzDqQB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 04:37:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=BVBcnvGx; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wMnw0kQCzDq6q
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 04:36:35 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id e5so16163497edq.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 11:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UPuR6CYRhgjnpRT4NKAzGMXkYe/js8V/JzGHlIXiVwI=;
 b=BVBcnvGxbeEwOe6CYJrk0ROu8sLpOhFOtkOI/GkrWdicdUOuFa4HVvdXwt3l/Qc9uI
 37/lPj7jl3/IpEUKQXiNELVwx1HuBIXNikCLObDTrRVTq0bjPQ0UHf7zOSN8ZaseOwqY
 ksHRrwea1GLDHfKu0WX/JRlhTlVyRtJZCdq1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UPuR6CYRhgjnpRT4NKAzGMXkYe/js8V/JzGHlIXiVwI=;
 b=dJAH95uyrn5rxWDy/C6ZcX3U6AjLv/HWCW2gGjElXi1kMF4u5rOrca60+v6pbVQO4D
 MroAx4cSA+Q7qcxXX7jUpoA7aeLRm3nCOEwcDKpW8ACUatvCNT0Zh0NvjimBlbNcy6rd
 yvyWcwlW7qOcRWzMsBRzRcfFV/KuHcUwlOU9BA6ujZ4ECpdzH4Mn5w+UCKhEGvFeRHSX
 tLx0BcM7kgIz0V3mnqm47dbd+A0wfarfLgR5YTI8WUEHz+Uz+QjmYj5JY/fKOb6FRsWM
 fhXRf3wEErIgJC4IqqsgtsIKO7t85Q/BeKRIBiwu6A0LgraVa9WLsUqwbrSLO2tB7JcO
 mP2g==
X-Gm-Message-State: AGi0PuZMzosykrHwxiMHItCgPDnubLGt11o9sUjlO1zIjA6YPltqsYiI
 RJ+KCKHuaUC8RXwRt0NWJQq0YpCAUEs=
X-Google-Smtp-Source: APiQypLEtPBD4n0j9RIqnMYTpqzclmaKh3C/6GsEv9V0JRsXkC9oQXCHQG4HLFvVGg8kPL1n/Y60fQ==
X-Received: by 2002:a17:906:ce4c:: with SMTP id
 se12mr17564874ejb.153.1586111791193; 
 Sun, 05 Apr 2020 11:36:31 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id s4sm2360793edw.19.2020.04.05.11.36.30
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Apr 2020 11:36:31 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id g3so12460444wrx.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 11:36:30 -0700 (PDT)
X-Received: by 2002:a2e:8911:: with SMTP id d17mr10353536lji.16.1586111332130; 
 Sun, 05 Apr 2020 11:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <87h7xyrt5d.fsf@mpe.ellerman.id.au>
In-Reply-To: <87h7xyrt5d.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 Apr 2020 11:28:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgkkmNV5tMzQDmPAQuNJBuMcry--Jb+h8H1o4RA3kF7QQ@mail.gmail.com>
Message-ID: <CAHk-=wgkkmNV5tMzQDmPAQuNJBuMcry--Jb+h8H1o4RA3kF7QQ@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.7-1 tag
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, Apr 5, 2020 at 5:53 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> There is one conflict in fs/sysfs/group.c, between our:
>
>   9255782f7061 ("sysfs: Wrap __compat_only_sysfs_link_entry_to_kobj function to change the symlink name")
[...]

The conflict was trivial.

But I want to kvetch a bit about that commit. It's doing some odd stuff.

In particular, it's wrapping things "the wrong way". Our naming rules
are that the double underscore versions are the internal helper
functions that you generally shouldn't use unless you have some extra
reason for it, and then the non-underscore versions are the preferred
and simpler user interface to those internal implementations.

IOW, the _wrapper_ doesn't have double underscores, it's the _wrappee_
that has the underscores.

That commit does the exact reverse of that usual pattern, which is
very confusing.

Now, I see _why_ you do that - normally the non-underscore version is
the "real" interface and the one we've always exported, and then the
double underscore is the special internal thing that maybe exposes
some internal detail (or maybe only does one special case of it and
leaves out locking or whatever).

In this case, for hysterical raisins, we only _had_ that
double-underscore version, and you basically added the new case and
did it without the underscores.

So I see why it happened the way it did, but I do think the end result
makes no sense and is odd and surprising.

The thing is, we have exactly *one* user of that double-underscore
version: tpm-chip.c (ok, there are two calls in that file, but it's a
single user).

So I think it should just have removed the __ version entirely. Make
tpm-chip just use the new semantics, and pass in the extra NULL
argument.

I guess I'll just do that as a cleanup patch on top, but it feels a
bit odd to have to do that cleanup when the original patch could have
just done the obvious thing.

                    Linus
