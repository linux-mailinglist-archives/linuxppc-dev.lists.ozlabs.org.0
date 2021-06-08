Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7983339EF9B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 09:30:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzhhs5FTjz302L
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 17:30:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=n9p23/ha;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f;
 helo=mail-qv1-xf2f.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n9p23/ha; dkim-atps=neutral
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzhhM6VX7z2yXZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 17:29:38 +1000 (AEST)
Received: by mail-qv1-xf2f.google.com with SMTP id 5so17801qvf.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 00:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mjJ37PmArsSDJUKmBe6EYoic7gWOGcLryXC0FyHwl6U=;
 b=n9p23/haum6EphyEVQ5DyGGD8//kQWp4SzqvdoDvzUhFGPlrT5NSasjGHw6U3Jl7fE
 3aJqwmCFY371QrorKhtxeyP9kKqewth5iSyXZ6ADi0ycDZQJZEJTa1SONQGqrhDVmqi6
 +bbfr957dW7r4axXOtm0XmDlLVDFFoNeU8cIUVjebPf4CM0j6N7JW2zazbPn9eIZ9Ojz
 oIM1SfrmHw+Wtzx2cJGbFs9vYvnydfyxvDGts6Lgdx6EKEX9qslQ6t4jxOfNHKW2ihwC
 rxVmKmqD084M1Q9DOySfpzUODh1emItF032y2TKOLdJRMUYzI+nP2Y27FAJKs4kC80Rt
 iKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mjJ37PmArsSDJUKmBe6EYoic7gWOGcLryXC0FyHwl6U=;
 b=J7i1IrEaM7eqAHGXNsRa4LXyoY/lbkG40Xa3qbGwPW7ijYrgiMf9UwbWxh8ea0B9EJ
 fszvZ4WkNdW8pOh32LQZQw4NCpBl1a52rdQC3YLcsFvAzfFl+zwYKjEPVNtwt8bw81uy
 3MVDd3I0n+yllveLc4zSf2NmbWwuX6a9RSqqkSM9n6FsJWgJFW9Gwl1kjx42F6fqmmS8
 DlYBttKJB934do+t0eBA91OVaHAUU5DOk+NOnVyKErcfdzEx8RPpkN81kM7DaknFdGoc
 x7AsWuohhLbaqqfuCaLYAKK5Hpx+DbsTIZp4Ck681JE98uPy3ksZYmGMQJjYMlv1IieO
 yX8Q==
X-Gm-Message-State: AOAM533hog4sC19bQbbBa/P7jQwnnV1gSpwuDoOeHZapdE3SCIdSok3t
 hgPMTZllMLft+netcnGug1uXhCJWDyX3C28927U=
X-Google-Smtp-Source: ABdhPJyo+0l3/CHTOa1jT5ydMhO2jKP1hSlIOWWAclutR0PCYMx6AjJEfPZRKrxVAjcmGJv9ggOUNLF1g5gUGV+YTcc=
X-Received: by 2002:a0c:d809:: with SMTP id h9mr14075712qvj.47.1623137373373; 
 Tue, 08 Jun 2021 00:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210604092228.199588-1-heying24@huawei.com>
 <CAOSf1CELBh4F334LK6+zy+BPOXKcOm92QZw4g71hQ7oQNa68nw@mail.gmail.com>
 <9dc8b323-7846-0975-16f0-6e3e447383a4@huawei.com>
In-Reply-To: <9dc8b323-7846-0975-16f0-6e3e447383a4@huawei.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 8 Jun 2021 17:29:21 +1000
Message-ID: <CAOSf1CGXp=F2aqP6=c3vhd4e=L7+2_V5mMOpiseAQa7L1NsZ_w@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Fix kernel-jump address for ppc64 wrapper boot
To: He Ying <heying24@huawei.com>
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 8, 2021 at 4:33 PM He Ying <heying24@huawei.com> wrote:
>
> Hello,
>
> =E5=9C=A8 2021/6/8 13:26, Oliver O'Halloran =E5=86=99=E9=81=93:
> > On Fri, Jun 4, 2021 at 7:39 PM He Ying <heying24@huawei.com> wrote:
> >>  From "64-bit PowerPC ELF Application Binary Interface Supplement 1.9"=
,
> >> we know that the value of a function pointer in a language like C is
> >> the address of the function descriptor and the first doubleword
> >> of the function descriptor contains the address of the entry point
> >> of the function.
> >>
> >> So, when we want to jump to an address (e.g. addr) to execute for
> >> PPC-elf64abi, we should assign the address of addr *NOT* addr itself
> >> to the function pointer or system will jump to the wrong address.
> > How have you tested this?
>
> I tested ppc64-elf big-endian. I changed the Kconfig so that ppc64
> big-endian
>
> selects PPC64_WRAPPER_BOOT. I used qemu to run the cuImage and found
>
> the problem. It made me confused. By applying this patch, I found it work=
s.
>
> I thought it works for ppc64le too. So I upstream this patch.
>
> >
> > IIRC the 64bit wrapper is only used for ppc64le builds. For that case
> > the current code is work because the LE ABI (ABIv2) doesn't use
> > function descriptors. I think even for a BE kernel we need the current
> > behaviour because the vmlinux's entry point is screwed up (i.e.
> > doesn't point a descriptor) and tools in the wild (probably kexec)
> > expect it to be screwed up.
>
> Yes, you're right. PPC64_WRAPPER_BOOT is only used for ppc64le builds
> currently.
>
> LE ABI (ABI v2) doesn't use function descriptors. Is that right? I don't
> test that. If so,
>
> this patch should be dropped. But why does ppc64 have different ABIs? So
> strange.

Yeah, it is strange. When LE support was added the toolchain team took
the opportunity to revamp the ABI since BE and LE binaries were never
going to be compatible. IIRC there is a slight performance advantage
to using v2 since function descriptors added an extra load when
performing a non-local function call. I think.

> If the wrapper is built to ppc64be, my patch is tested right. The entry
> point in the ELF
>
> header is always right so you can assign the header->e_entry to the
> function pointer
>
> and then jump to the entry by calling the function. But in the ppc
> wrapper, the address
>
> is intialized to 0 or malloced to be an address later. In this
> situation, I think my patch
>
> should be right for ppc64be.

Yeah maybe it's fine. I just have some memories of running into some
bizzare edge case at some point. It might have been the entrypoint of
the zImage rather than the vmlinux which had (has?) that problem.
