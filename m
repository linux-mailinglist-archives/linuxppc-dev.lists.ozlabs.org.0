Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1B23FC8E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 15:54:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzTFV4hq1z2yR7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 23:54:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=HQ7YjqNn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=HQ7YjqNn; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzTDp02dxz2xs2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 23:53:44 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id r7so10937059edd.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 06:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0KsdRco5g3Rxsur7HnzmWia1aqV1LswyiZ+q0x+vuSY=;
 b=HQ7YjqNn+GvyrMyaEw4Ts6k7wU5aPcFPAWZ/MvIgnb/b3nJTG/bZDiK6JU5Urc0OGw
 eYdX1ndiXPm2WmlL+IK4/u/BaFz6AbYdNIgxPmK/jtKVgAB4AXg1YnEwThk50eDSwxKa
 5zamzfT+Mw9ZsLCNbbSg/KnigE4n5pxUzOD+A/0pPF9mh4JO0EwgAg6tp4mjPp+2ybhC
 LKwkjJVc1hih9nB2NRvpLDKH15CvIzCDRkybcb8PHSW6J2tGC65jUPq2wh7pHwEv7mh1
 GGntJW/v2BIHeuezNaO8q8z3cKspObfYA7MpK111176yeraZmzPIIb/SJwoe9ailV5zQ
 GIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0KsdRco5g3Rxsur7HnzmWia1aqV1LswyiZ+q0x+vuSY=;
 b=cYZelfwyOcHUxfVmLl81Igk5mBmYewG9gdlwouxuwWjrp/Fe33vYXubumo84QdaD/k
 eU2fD1ghK/5kOUtyC3L2D2qtnrIzvs0cFD7XeUXKDv41jGISSVLhRqvTvXIrwlVxbbHd
 oxZw7QN33WVtOhFomgZuuELeWFYbGLVH5Ckw/a1GSwm+4AijBxjGrlZjyY34Jj6i0c21
 JS49drYwBkjAcRuunjjTQfH3YosdBNPcAGZf0RfEAAAIP96eRGKN+tpwMhGh4CNp5kuq
 0MjuPI83I4nxQHN5Jr3dFmZIZq2wtj/tTDOjGEBbdGoQ/C6fJc6uBPkxYyb7b9JdKOpY
 2VsQ==
X-Gm-Message-State: AOAM53259pf3UUz/blhD6mbAyKLdypPG3xzzVTrzmugHKYvHYOOQKZgs
 dGbpgxCapyfNbho3JqLLI7TdO6R3D5UMNgYjsyCw
X-Google-Smtp-Source: ABdhPJws3lszVbtjZiLZOptaWsbrL101boZlKAvA+uSpyGqWqgyhydVacfD22Otuw8Ioe1qUU+ZoAgTEh8gbHZtS+70=
X-Received: by 2002:a05:6402:4cf:: with SMTP id
 n15mr30419950edw.269.1630418020725; 
 Tue, 31 Aug 2021 06:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210616085118.1141101-1-omosnace@redhat.com>
 <CAPcyv4jvR8CT4rYODR5KUHNdiqMwQSwJZ+OkVf61kLT3JfjC_Q@mail.gmail.com>
 <CAFqZXNtuH0329Xvcb415Kar-=o6wwrkFuiP8BZ_2OQhHLqkkAg@mail.gmail.com>
In-Reply-To: <CAFqZXNtuH0329Xvcb415Kar-=o6wwrkFuiP8BZ_2OQhHLqkkAg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 31 Aug 2021 09:53:29 -0400
Message-ID: <CAHC9VhTGECM2p+Q8n48aSdfJzY6XrpXQ5tcFurjWc4A3n8Qxjg@mail.gmail.com>
Subject: Re: [PATCH v3] lockdown,selinux: fix wrong subject in some SELinux
 lockdown checks
To: Ondrej Mosnacek <omosnace@redhat.com>
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
 Linux PCI <linux-pci@vger.kernel.org>, linux-cxl@vger.kernel.org,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, X86 ML <x86@kernel.org>,
 James Morris <jmorris@namei.org>, Linux ACPI <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 Linux-pm mailing list <linux-pm@vger.kernel.org>,
 SElinux list <selinux@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Dan Williams <dan.j.williams@intel.com>, Netdev <netdev@vger.kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Security Module list <linux-security-module@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 31, 2021 at 5:09 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> On Sat, Jun 19, 2021 at 12:18 AM Dan Williams <dan.j.williams@intel.com> wrote:
> > On Wed, Jun 16, 2021 at 1:51 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:

...

> > > diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
> > > index 2acc6173da36..c1747b6555c7 100644
> > > --- a/drivers/cxl/mem.c
> > > +++ b/drivers/cxl/mem.c
> > > @@ -568,7 +568,7 @@ static bool cxl_mem_raw_command_allowed(u16 opcode)
> > >         if (!IS_ENABLED(CONFIG_CXL_MEM_RAW_COMMANDS))
> > >                 return false;
> > >
> > > -       if (security_locked_down(LOCKDOWN_NONE))
> > > +       if (security_locked_down(current_cred(), LOCKDOWN_NONE))
> >
> > Acked-by: Dan Williams <dan.j.williams@intel.com>
> >
> > ...however that usage looks wrong. The expectation is that if kernel
> > integrity protections are enabled then raw command access should be
> > disabled. So I think that should be equivalent to LOCKDOWN_PCI_ACCESS
> > in terms of the command capabilities to filter.
>
> Yes, the LOCKDOWN_NONE seems wrong here... but it's a pre-existing bug
> and I didn't want to go down yet another rabbit hole trying to fix it.
> I'll look at this again once this patch is settled - it may indeed be
> as simple as replacing LOCKDOWN_NONE with LOCKDOWN_PCI_ACCESS.

At this point you should be well aware of my distaste for merging
patches that have known bugs in them.  Yes, this is a pre-existing
condition, but it seems well within the scope of this work to address
it as well.

This isn't something that is going to get merged while the merge
window is open, so at the very least you've got almost two weeks to
sort this out - please do that.

-- 
paul moore
www.paul-moore.com
