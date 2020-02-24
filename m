Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DBD16A3E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 11:29:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QywY0y7XzDqWw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 21:29:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QmcedYlA; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48QytQ2NFqzDqNZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 21:27:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582540042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CjqxRZHSo8X8I7NzxQEu+Tymmt/ghwg/SLEiDBOhiic=;
 b=QmcedYlAV+SmriSISCI5Z83KHbhzO9Z/gE5+5vvx3vsO/MD7tebpzrhFSo+0sSWihfO8kG
 IfpoMcptnzz3RZmR6/H4jZQNuHRWo5jZNWRardBOvm733PUW7bVvOPxjd2zbLLDlgRYljf
 OgwQi8I+BKMRaamQmS3yMctu0Ff9O4E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-0bmVWB6xP5enjg8IMIvioA-1; Mon, 24 Feb 2020 01:25:49 -0500
X-MC-Unique: 0bmVWB6xP5enjg8IMIvioA-1
Received: by mail-wr1-f72.google.com with SMTP id d15so5113445wru.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Feb 2020 22:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dckTTjxyBibi0/eHSJpegNMnKv/ZFpoC0SMhoS98gYQ=;
 b=gvo/nd1luGOkjH2IcvgXk128fmo0Kf4JC2ZdUqhfLY200XvkqZSmV612/X1EGLG+Ys
 B5yDe/2kiEqS6Al5MMUZsDihy+AR4y83Yv3zXAocW5GSMs0kHWK5dLzdsOwWe2zdtkT5
 AEwyNnfrvO88zKY83+pJ8lMzLvRhaZF38QqMlbn+TfHfh0844DWBrNV36qI/qmSIQCUj
 zPtHCuK1YMykUQOPHc2H8THtg9YRcuulfIwavkGiAHMCP8CokUpyyW7lYIqa0r3Ak6oz
 deiXsNR5IVsOl5kxBv8Rnv9sMWKUJAg70iXKLqzSb+hatWRLStHaVBiji8aytQiyZzdz
 Z5qw==
X-Gm-Message-State: APjAAAUEnGOxYzS+tl6OC55mRnhNv3LYHgfkRIV0CHx0cdCRpsD2XQu9
 c/Vr1/tccHy8idYOmH60HOe3Nv5zs3YYSDW8TAC1SZXhWnaOGPIizc0rw9Lz694k1BKALNp1CP7
 pHkrwgevidsO2JcDkuOP/tauzyg4DafjHlfsp4A0AVg==
X-Received: by 2002:a1c:6755:: with SMTP id b82mr20610978wmc.126.1582525547929; 
 Sun, 23 Feb 2020 22:25:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqyxA5kdvYr5b57CvBHEyg7SYwjy39EA3KJkD+2t/YLueVtODgOYqrVfSMUaLHTeag8+AJUU1fdINXjmJPOfgzU=
X-Received: by 2002:a1c:6755:: with SMTP id b82mr20610946wmc.126.1582525547617; 
 Sun, 23 Feb 2020 22:25:47 -0800 (PST)
MIME-Version: 1.0
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-3-git-send-email-bhsharma@redhat.com>
 <63d6e63c-7218-d2dd-8767-4464be83603f@arm.com>
 <af0fd2b0-99db-9d58-bc8d-0dd9d640b1eb@redhat.com>
 <f791e777-781c-86ce-7619-1de3fe3e7b90@arm.com>
 <351975548.1986001.1578682810951.JavaMail.zimbra@redhat.com>
 <04287d60-e99e-631b-c134-d6dc39e6a193@redhat.com>
 <974f3601-25f8-f4e6-43a8-ff4275e9c174@arm.com>
In-Reply-To: <974f3601-25f8-f4e6-43a8-ff4275e9c174@arm.com>
From: Bhupesh Sharma <bhsharma@redhat.com>
Date: Mon, 24 Feb 2020 11:55:35 +0530
Message-ID: <CACi5LpOK6Q3ud3M3zakexLJNOtHy9TODHyYSHVwE3JHVakKzqA@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 2/5] arm64/crash_core: Export TCR_EL1.T1SZ in
 vmcoreinfo
To: Amit Kachhap <amit.kachhap@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org,
 Will Deacon <will@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 kexec mailing list <kexec@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>, James Morse <james.morse@arm.com>,
 Dave Anderson <anderson@redhat.com>, bhupesh linux <bhupesh.linux@gmail.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Amit,

On Fri, Feb 21, 2020 at 2:36 PM Amit Kachhap <amit.kachhap@arm.com> wrote:
>
> Hi Bhupesh,
>
> On 1/13/20 5:44 PM, Bhupesh Sharma wrote:
> > Hi James,
> >
> > On 01/11/2020 12:30 AM, Dave Anderson wrote:
> >>
> >> ----- Original Message -----
> >>> Hi Bhupesh,
> >>>
> >>> On 25/12/2019 19:01, Bhupesh Sharma wrote:
> >>>> On 12/12/2019 04:02 PM, James Morse wrote:
> >>>>> On 29/11/2019 19:59, Bhupesh Sharma wrote:
> >>>>>> vabits_actual variable on arm64 indicates the actual VA space size=
,
> >>>>>> and allows a single binary to support both 48-bit and 52-bit VA
> >>>>>> spaces.
> >>>>>>
> >>>>>> If the ARMv8.2-LVA optional feature is present, and we are running
> >>>>>> with a 64KB page size; then it is possible to use 52-bits of addre=
ss
> >>>>>> space for both userspace and kernel addresses. However, any kernel
> >>>>>> binary that supports 52-bit must also be able to fall back to 48-b=
it
> >>>>>> at early boot time if the hardware feature is not present.
> >>>>>>
> >>>>>> Since TCR_EL1.T1SZ indicates the size offset of the memory region
> >>>>>> addressed by TTBR1_EL1 (and hence can be used for determining the
> >>>>>> vabits_actual value) it makes more sense to export the same in
> >>>>>> vmcoreinfo rather than vabits_actual variable, as the name of the
> >>>>>> variable can change in future kernel versions, but the architectur=
al
> >>>>>> constructs like TCR_EL1.T1SZ can be used better to indicate intend=
ed
> >>>>>> specific fields to user-space.
> >>>>>>
> >>>>>> User-space utilities like makedumpfile and crash-utility, need to
> >>>>>> read/write this value from/to vmcoreinfo
> >>>>>
> >>>>> (write?)
> >>>>
> >>>> Yes, also write so that the vmcoreinfo from an (crashing) arm64
> >>>> system can
> >>>> be used for
> >>>> analysis of the root-cause of panic/crash on say an x86_64 host usin=
g
> >>>> utilities like
> >>>> crash-utility/gdb.
> >>>
> >>> I read this as as "User-space [...] needs to write to vmcoreinfo".
> >
> > That's correct. But for writing to vmcore dump in the kdump kernel, we
> > need to read the symbols from the vmcoreinfo in the primary kernel.
> >
> >>>>>> for determining if a virtual address lies in the linear map range.
> >>>>>
> >>>>> I think this is a fragile example. The debugger shouldn't need to k=
now
> >>>>> this.
> >>>>
> >>>> Well that the current user-space utility design, so I am not sure we
> >>>> can
> >>>> tweak that too much.
> >>>>
> >>>>>> The user-space computation for determining whether an address lies=
 in
> >>>>>> the linear map range is the same as we have in kernel-space:
> >>>>>>
> >>>>>>     #define __is_lm_address(addr)    (!(((u64)addr) &
> >>>>>> BIT(vabits_actual -
> >>>>>>     1)))
> >>>>>
> >>>>> This was changed with 14c127c957c1 ("arm64: mm: Flip kernel VA
> >>>>> space"). If
> >>>>> user-space
> >>>>> tools rely on 'knowing' the kernel memory layout, they must have to
> >>>>> constantly be fixed
> >>>>> and updated. This is a poor argument for adding this to something t=
hat
> >>>>> ends up as ABI.
> >>>>
> >>>> See above. The user-space has to rely on some ABI/guaranteed
> >>>> hardware-symbols which can be
> >>>> used for 'determining' the kernel memory layout.
> >>>
> >>> I disagree. Everything and anything in the kernel will change. The
> >>> ABI rules apply to
> >>> stuff exposed via syscalls and kernel filesystems. It does not apply
> >>> to kernel internals,
> >>> like the memory layout we used yesterday. 14c127c957c1 is a case in
> >>> point.
> >>>
> >>> A debugger trying to rely on this sort of thing would have to play
> >>> catchup whenever it
> >>> changes.
> >>
> >> Exactly.  That's the whole point.
> >>
> >> The crash utility and makedumpfile are not in the same league as other
> >> user-space tools.
> >> They have always had to "play catchup" precisely because they depend
> >> upon kernel internals,
> >> which constantly change.
> >
> > I agree with you and DaveA here. Software user-space debuggers are
> > dependent on kernel internals (which can change from time-to-time) and
> > will have to play catch-up (which has been the case since the very star=
t).
> >
> > Unfortunately we don't have any clear ABI for software debugging tools =
-
> > may be something to look for in future.
> >
> > A case in point is gdb/kgdb, which still needs to run with KASLR
> > turned-off (nokaslr) for debugging, as it confuses gdb which resolve
> > kernel symbol address from symbol table of vmlinux. But we can
> > work-around the same in makedumpfile/crash by reading the 'kaslr_offset=
'
> > value. And I have several users telling me now they cannot use gdb on
> > KASLR enabled kernel to debug panics, but can makedumpfile + crash
> > combination to achieve the same.
> >
> > So, we should be looking to fix these utilities which are broken since
> > the 52-bit changes for arm64. Accordingly, I will try to send the v6
> > soon while incorporating the comments posted on the v5.
>
> Any update on the next v6 version. Since this patch series is fixing the
> current broken kdump so need this series to add some more fields in
> vmcoreinfo for Pointer Authentication work.

Sorry for the delay. I was caught up in some other urgent arm64
user-space issues.
I am preparing the v6 now and hopefully will be able to post it out
for review later today.

Thanks,
Bhupesh

