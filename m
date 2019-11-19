Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C3C102036
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 10:25:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HL5x4lSdzDqjd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 20:25:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="flJtGO6j"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HJsb67P9zDqdP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 19:29:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574152191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H20VJbl/HlqoZLKxB2eEkiVm9bjunStGFexdv/rH5Wg=;
 b=flJtGO6jT+DYa1t/XfLewJGlw+2/qTOj2VYrTLs2wFxoYgEC7OXC/ZC3ERC0B3iK0yrnOr
 vib0hFCSkxnUcOcUmcIqneXZUCGufD6M55LgK0LMUvcVAqMb92yBlGR+LX4mOBz6qYjoam
 mVKBI5X9WOTRVN0rNHxC5DBGiyVxa6A=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-DlCID_4BMrWY85uI3VEB7g-1; Tue, 19 Nov 2019 03:29:49 -0500
Received: by mail-lj1-f198.google.com with SMTP id l12so3977682lji.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 00:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LdTt3n+0i729FTDReSuLECgSQ4aS+lT8YABUAIgw7M4=;
 b=fy3G5VRrBI7HeMd0IoH1vOeSRXdxTyd0sg/ceClnV2AEoJEXEzS7zl/IThzTRAPxoY
 0OYK5Z1raGyWzwMKqS3dfa9GbV2OpYDKTqsGR+A1AysVa7OjBNF5VnRboLg4QnBCMx4b
 uOzhPmJJpTiRzyhhD8dxAXfxHJ2m3jyDfAfbJOPQE7pYveSp09oB80jw8ymklkOOqgFr
 UwrpexJqaxL/fHQN044HkMMF2DKPp/ylrGpw+8wUT6DzRqeaLl8j4ms7wUSkVHTYL2uk
 YwuPQbjPciRIHdtDJ+l0rQU1K8NCanGqmxoqShTZ4cM94krtuBYxxeTkdDVQraobD1zC
 W4kw==
X-Gm-Message-State: APjAAAUr53OMNQ4Op1rbc/kh6aRtQ+zlYnto4srV7/LAIWrqoXhYKpoz
 RjGlVgWnN7NiIS/VVh3HyWjHTq0BpaKCIC7ar5GPp/95b/4fwE33KzPyPpqTMpn5ext1jlXcA3+
 2+R+xl7cX9ZrvZ76D1Oeuec+PR9/O0C47MFH8k7FK3A==
X-Received: by 2002:a2e:98c6:: with SMTP id s6mr2467929ljj.235.1574152187817; 
 Tue, 19 Nov 2019 00:29:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqw2IC2bHi8fy/d2SRNiTEi36NRc3i9RixIH7XOkwEMkhAxGronTJF+riz7NT7kg7+QIn9WK1oeS0ClHOZKD/g0=
X-Received: by 2002:a2e:98c6:: with SMTP id s6mr2467897ljj.235.1574152187559; 
 Tue, 19 Nov 2019 00:29:47 -0800 (PST)
MIME-Version: 1.0
References: <1573459282-26989-1-git-send-email-bhsharma@redhat.com>
 <20191113063858.GE22427@linaro.org>
 <CACi5LpP54d9DKW63G5W6X4euBjAm2NwkHOiM01dB7g8d60s=4w@mail.gmail.com>
 <20191115015959.GI22427@linaro.org>
 <CAJ2QiJJOSspLKRh+jRB_o0o9nmeAsiFKzxGJ8R0pYPRM4iptmw@mail.gmail.com>
In-Reply-To: <CAJ2QiJJOSspLKRh+jRB_o0o9nmeAsiFKzxGJ8R0pYPRM4iptmw@mail.gmail.com>
From: Bhupesh Sharma <bhsharma@redhat.com>
Date: Tue, 19 Nov 2019 13:59:33 +0530
Message-ID: <CACi5LpO_fvzDiXP9+QLga_B7kozRRnE9ix4Xa=xvNx1Kvci=3Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
To: Prabhakar Kushwaha <prabhakar.pkin@gmail.com>
X-MC-Unique: DlCID_4BMrWY85uI3VEB7g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Boris Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bhupesh SHARMA <bhupesh.linux@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Steve Capper <steve.capper@arm.com>,
 kexec mailing list <kexec@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>, Dave Anderson <anderson@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 19, 2019 at 12:03 PM Prabhakar Kushwaha
<prabhakar.pkin@gmail.com> wrote:
>
> Hi Akashi,
>
> On Fri, Nov 15, 2019 at 7:29 AM AKASHI Takahiro
> <takahiro.akashi@linaro.org> wrote:
> >
> > Bhupesh,
> >
> > On Fri, Nov 15, 2019 at 01:24:17AM +0530, Bhupesh Sharma wrote:
> > > Hi Akashi,
> > >
> > > On Wed, Nov 13, 2019 at 12:11 PM AKASHI Takahiro
> > > <takahiro.akashi@linaro.org> wrote:
> > > >
> > > > Hi Bhupesh,
> > > >
> > > > Do you have a corresponding patch for userspace tools,
> > > > including crash util and/or makedumpfile?
> > > > Otherwise, we can't verify that a generated core file is
> > > > correctly handled.
> > >
> > > Sure. I am still working on the crash-utility related changes, but yo=
u
> > > can find the makedumpfile changes I posted a couple of days ago here
> > > (see [0]) and the github link for the makedumpfile changes can be see=
n
> > > via [1].
> > >
> > > I will post the crash-util changes shortly as well.
> > > Thanks for having a look at the same.
> >
> > Thank you.
> > I have tested my kdump patch with a hacked version of crash
> > where VA_BITS_ACTUAL is calculated from tcr_el1_t1sz in vmcoreinfo.
> >
>
> I also did hack to calculate VA_BITS_ACTUAL is calculated from
> tcr_el1_t1sz in vmcoreinfo. Now i am getting error same as mentioned
> by you in other thread last month.
> https://www.mail-archive.com/crash-utility@redhat.com/msg07385.html
>
> how this error was overcome?
>
> I am using
>  - crashkernel: https://github.com/crash-utility/crash.git  commit:
> babd7ae62d4e8fd6f93fd30b88040d9376522aa3
> and
>  - Linux: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t
> commit: af42d3466bdc8f39806b26f593604fdc54140bcb

I will post a formal change for crash-utility shortly that fixes the
same. Right now we are having issues with emails bouncing off
'crash-utility@redhat.com', so my patches sent to the same are in
undelivered state at-the-moment.

For easy testing I will share the link to my github tree (off-line)
[which contains the changes] as well.

Regards,
Bhupesh

