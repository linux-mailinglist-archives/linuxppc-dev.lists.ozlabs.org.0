Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E11D28D2BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 19:01:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9hdj14SCzDqgq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 04:01:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=BVgO/RpF; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9hbr6M9DzDqSk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 03:59:36 +1100 (AEDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7013625309
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 16:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602608373;
 bh=osZ8tJsN1XJAdwSi1ibvFjOI4ppbEHzl507BtoRa3RY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BVgO/RpFUbXU0rUhiHQ4PV7seCBjZCA5VZpjLt9fb7pnoZxE7/J2v8gFkpMq7al/x
 NMjFN0+OeJ/sVOOsN2LLPY3YNMD8GoZ5ncaUEdxxceVdpuik78E54GRrZLBAYex/Fk
 VhTmOSSHk5b6rOkFbDuFk7NR3TEllYJasaYjeEQ4=
Received: by mail-oi1-f175.google.com with SMTP id h10so112334oie.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 09:59:33 -0700 (PDT)
X-Gm-Message-State: AOAM530tTOJcKFr87dlfDRWhLQEkQMRQ6Ll/8SM4yZNqkam4/DYjSDzB
 veeMgynRKSmJ5sPbZCG1IfIktTaYyameQ8jRYP4=
X-Google-Smtp-Source: ABdhPJyCyAZiLNWtZEpxTAWgjVYup7xXC2n8Dw2lOiZtXYQDhs3t2O/klyNtVYYJ8v1GO87o7QPqDtWtI4WZYBPYbfs=
X-Received: by 2002:aca:d845:: with SMTP id p66mr382549oig.47.1602608372672;
 Tue, 13 Oct 2020 09:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201013081804.17332-1-ardb@kernel.org>
 <ae9ab2560f6d7b114726efb1ec26f0a36f695335.camel@linux.ibm.com>
In-Reply-To: <ae9ab2560f6d7b114726efb1ec26f0a36f695335.camel@linux.ibm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 13 Oct 2020 18:59:21 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFZVR46_oeYTxJ59q-7u+zFCFtOQuSQoiEzKLhXzpydow@mail.gmail.com>
Message-ID: <CAMj1kXFZVR46_oeYTxJ59q-7u+zFCFtOQuSQoiEzKLhXzpydow@mail.gmail.com>
Subject: Re: [PATCH v2] ima: defer arch_ima_get_secureboot() call to IMA init
 time
To: Mimi Zohar <zohar@linux.ibm.com>
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>,
 Chester Lin <clin@suse.com>, linux-security-module@vger.kernel.org,
 linux-integrity <linux-integrity@vger.kernel.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Oct 2020 at 18:46, Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> [Cc'ing linuxppc-dev@lists.ozlabs.org]
>
> On Tue, 2020-10-13 at 10:18 +0200, Ard Biesheuvel wrote:
> > Chester reports that it is necessary to introduce a new way to pass
> > the EFI secure boot status between the EFI stub and the core kernel
> > on ARM systems. The usual way of obtaining this information is by
> > checking the SecureBoot and SetupMode EFI variables, but this can
> > only be done after the EFI variable workqueue is created, which
> > occurs in a subsys_initcall(), whereas arch_ima_get_secureboot()
> > is called much earlier by the IMA framework.
> >
> > However, the IMA framework itself is started as a late_initcall,
> > and the only reason the call to arch_ima_get_secureboot() occurs
> > so early is because it happens in the context of a __setup()
> > callback that parses the ima_appraise= command line parameter.
> >
> > So let's refactor this code a little bit, by using a core_param()
> > callback to capture the command line argument, and deferring any
> > reasoning based on its contents to the IMA init routine.
> >
> > Cc: Chester Lin <clin@suse.com>
> > Cc: Mimi Zohar <zohar@linux.ibm.com>
> > Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
> > Cc: James Morris <jmorris@namei.org>
> > Cc: "Serge E. Hallyn" <serge@hallyn.com>
> > Link: https://lore.kernel.org/linux-arm-kernel/20200904072905.25332-2-clin@suse.com/
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> > v2: rebase onto series 'integrity: improve user feedback for invalid bootparams'
>
> Thanks, Ard.  Based on my initial, limited testing on Power, it looks
> good, but I'm hesistant to include it in the integrity 5.10 pull
> request without it having been in linux-next and some additional
> testing.  It's now queued in the next-integrity-testing branch awaiting
> some tags.
>

Thanks. No rush as far as I am concerned, although I suppose Chester
may want to rebase his arm64 IMA enablement series on this.

Suggestion: can we take the get_sb_mode() code from ima_arch.c in
arch/x86, and generalize it for all EFI architectures? That way, we
can enable 32-bit ARM and RISC-V seamlessly once someone gets around
to enabling IMA on those platforms. In fact, get_sb_mode() itself
should probably be factored out into a generic helper for use outside
of IMA as well (Xen/x86 has code that does roughly the same already)
