Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3FA72BC9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 11:54:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45trKd1dv3zDqNP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 19:54:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45trHb5bKYzDqGg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 19:52:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SGvqCL4O"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45trHb0rTRz8vk9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 19:52:43 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45trHb0Gf0z9sLt; Wed, 24 Jul 2019 19:52:43 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SGvqCL4O"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45trHZ5Zb6z9s3l;
 Wed, 24 Jul 2019 19:52:42 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id i10so88191208iol.13;
 Wed, 24 Jul 2019 02:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DhDzbuvFs0yJ/WUz3ukdt8uO4k/3AKV8qsjWlE0aKEw=;
 b=SGvqCL4O1tDMyTtUF8VzsVIaleRAOFgk1B28yr96Tc5DkoDBmOCfKpb+8DoWOK/MrX
 2D3N8WoY7chRvw1ox0YQgUQqnONnS6yXFvZAdnPH8u3VnvSIbpzzJWjXzHKMfgCzGy90
 Ikf3cqKH73hhRrRiXIlELX/hkzMl6g8ZyiraOiMiFY1ELoTqUl6cQObs2IC8PxxVkObK
 aWQF7OxsUJrsYaSNx4NsIbUmrMO0Z5iz6Yan+Wsf7OjG4e87Tlz+wka5UxTeg/6hajeb
 Vt/ISV+jdgor/H1Sg1FLW5SZ9D6Q5TXu4MG5mHRGgirz3QzqaPNgRt7teGd54t14d4E/
 ruvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DhDzbuvFs0yJ/WUz3ukdt8uO4k/3AKV8qsjWlE0aKEw=;
 b=j4zSCrU0P2F+6AnJ5kC+a32pMaAfR4FkQbDEGcIWGolPw1cdWVeOWn3xDiPtTrfa/F
 VSgx3HgVZHy93yszg56V1YoUOi8xX2JbiluFa6G9qeLqsWA3638Mmc9HsmwMYskULvYf
 QjLNNnrKHcwew3z0V0isODkaCvoQPJg6qcgNs/RkgodW9O9X2m1CEDLHiKW2S1pJgSaq
 P8rYePft1dJBCDtjDalJs8EFyHlYXgcb5/ff5YylLpWXjh4lAWKEm34beU9C8hfNhMZk
 FTz2XfwEwfib8Evjc9S5zuNHl2RAbzQWZZVwLktivkTOrQ4XusXiDYyTl2CZ4B086dA2
 hx+w==
X-Gm-Message-State: APjAAAVYQGaKm1qWcqWecubwjVLb9TTwO6qJ2syEauMV1eDFQs9Q2xK+
 q+KgzmWfSsNNL713G08aWk76szxORTHdDF0WmtA=
X-Google-Smtp-Source: APXvYqzWo9lCX65m/qQJPiWc2w2e8N/+FLhFIZ0DpQbgEIju2e27m5KvrfTquDsr7BpwzrPpgtrGq0LH0Cy0lwpS2eI=
X-Received: by 2002:a5d:8497:: with SMTP id t23mr50409358iom.298.1563961959018; 
 Wed, 24 Jul 2019 02:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <1560459027-5248-1-git-send-email-nayna@linux.ibm.com>
 <1560459027-5248-3-git-send-email-nayna@linux.ibm.com>
 <87o92910fg.fsf@concordia.ellerman.id.au>
 <6d2988c1-9b89-448b-4537-c3c6673b6dd1@linux.vnet.ibm.com>
In-Reply-To: <6d2988c1-9b89-448b-4537-c3c6673b6dd1@linux.vnet.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 24 Jul 2019 19:52:28 +1000
Message-ID: <CAOSf1CFHYv5VsBMEnNAqa7v7WakPfdpGpbENmG8chusm=hW21g@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc: expose secure variables via sysfs
To: Nayna <nayna@linux.vnet.ibm.com>
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
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, linux-integrity@vger.kernel.org,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2019 at 12:35 AM Nayna <nayna@linux.vnet.ibm.com> wrote:
>
> On 07/05/2019 02:05 AM, Michael Ellerman wrote:
> > Hi Nayna,
>
> Hi Michael, Oliver,
>
> > Nayna Jain <nayna@linux.ibm.com> writes:
> >> As part of PowerNV secure boot support, OS verification keys are stored
> >> and controlled by OPAL as secure variables. These need to be exposed to
> >> the userspace so that sysadmins can perform key management tasks.
> >>
> >> This patch adds the support to expose secure variables via a sysfs
> >> interface It reuses the the existing efi defined hooks and backend in
> >> order to maintain the compatibility with the userspace tools.
> > Which tools? Can you include a log demonstrating how they're used, ie.
> > so that I can test the sequence of commands.
> >
> >> Though it reuses a great deal of efi, POWER platforms do not use EFI.
> >> A new config, POWER_SECVAR_SYSFS, is defined to enable this new sysfs
> >> interface.
> > Sorry I haven't been able to keep up with all the discussions, but I
> > thought the consensus was that pretending to be EFI-like was a bad idea,
> > because we don't have actual EFI and we're not implementing an entirely
> > compatible scheme to EFI anyway.

My read is the consensus was that pretending to be EFI is a bad idea
unless we're going to behave like EFI.

> > Greg suggested just putting the variables in sysfs, why does that not
> > work? Matthew mentioned "complex semantics around variable deletion and
> > immutability" but do we have to emulate those semantics on powerpc?
>
> Sorry for the delay in the response.
>
> Yes, I agree. The purpose of the v2 version of the patchset was to try
> and quickly address Matthew's concerns. This version of the patchset:

> * is based on Greg's suggestion to use sysfs

As far as I can tell Greg made that suggestion here:

https://lwn.net/ml/linux-fsdevel/20190603072916.GA7545@kroah.com/

Then walked back on that suggestion after Matthew pointed out that
efivars is separate because of the immutability requirement and the
odd update semantics:

https://lwn.net/ml/linux-fsdevel/20190605081301.GA23180@kroah.com/

Considering the whole point of this is to present the same user-facing
interface so shouldn't you be dealing with all the problems that
interface creates?

> * is not using any EFI configs
That's true, but...

> * is not exposing secure variables via efivarfs
> * is STILL using some of the existing EFI code, that is used by EFI to
> expose its variables via sysfs, to avoid code duplication.

We avoid some of the potential problems of selecting CONFIG_EFI and we
gain a bunch of other potential problems since you've hacked the
makefiles to build code that's normally CONFIG_EFI only.

> * is using efivar hooks to expose secure variables for tool compatibility

Here's the real problem. For compatibility with the existing userspace
tooling, which expects UEFI,  you need to present the same interface
with the same semantics. Trying to not use efivarfs means you've
already lost since you no longer have the same interface. So how is
this an improvement? I think the options here are to either:

1) Come up with a new interface, implement it, and adapt the user
tooling to deal with the new API.

*or*

2) Use efivarsfs and fix the based i-cant-believe-its-not-efi variable
backend so it behaves *exactly* like the UEFI get/setVariable APIs.
This means that you need to validate the update certificates at
runtime. I don't think this is a huge strech since you're already
implementing the validator.

1) gives you the flexibility to change the key hierarchy and whatnot,
while 2) means we've got less weird powerpc crap for users to deal
with. I have no strong opinions about which you choose to do, but
don't do this.

Oliver
