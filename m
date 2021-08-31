Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8F3FCD20
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 20:59:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gzc1207b9z2yPS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 04:59:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=kicsjtll;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=kicsjtll; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gzc0L5Yf5z2xsT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Sep 2021 04:58:19 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id bg1so5929028plb.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 11:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hja3k4ZIoHMyQ4VMtlG5szRRbScDh1UjpE02C2d4Keg=;
 b=kicsjtll2NsAKBfjPi48UpmCfWsb4FJEcTRGcrE5uks4vHLsX71gqk79m8Us/tamin
 XNurIf+3NS5RgfXBPJDOh5b+AFFP3+H7hsFSxfL9Vwb+FBInOrB3bUMzGzI4HG1pv0yo
 qByPbg69R4mh1iyiutn783XwUDEuViZZh+wWLzAxV8KNPAXLYMLnMQ7ZIC5dBF/jJ0Uf
 ATOJBlEbDfKr49CyoQE3NS/wdpgXRK43XqUolPGY7v+/2iaZWnEhp4NxfHpSzOq8tAFY
 KPm7dvp3HOyllOHPqJ3OaYwVF710GR7FGM2+FU87sCMEW7HnJZYMbvATrp2kicNQo/Lp
 wZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hja3k4ZIoHMyQ4VMtlG5szRRbScDh1UjpE02C2d4Keg=;
 b=ZsUbIghFyMNMi47MynSeFld2a7sXmtmsKoMdXQIrKNPR4I/byTaba+3CZXPbuCBei+
 5WBiH1fELTn7tH50vp+LVrzDyC6MDY7DVYrdXr0vai3STG766RBts3Fjx3bRZ2R5gO+4
 8+pIhkyFYCs2tyuZ5eV2h4hxJtJLrZKPxpi5Tq8bQ2znOIl+Jcf2oXIGDNeR5LERNi99
 NWYSRzSlzNFr/1rTiBjp7DJ+/ILSzkIZJTgPT0aZJtpnl6GgpR6XLX1MoeyzlGiLbrhr
 O8NO+HmJZgIaB8XTVJCIBGP1Qe2htD35IzSqEhBXtsMC5U1BVDs62u5ZVbGTbKZsOIPJ
 W8Zg==
X-Gm-Message-State: AOAM531QD6lRN5LmOWfaMKZd6NHbv2NLhxo9hQAU7MF7YEI8UFkfqhCm
 q5dooerF7/bmNEg+cl2j6rFj19moB/sJut5vlvDZbA==
X-Google-Smtp-Source: ABdhPJwoE2JSRabTcXsiA1AgYUTphGBwkKAbOMuVGJ2LSP+gzTcAsVPbn/x852sYGDfXxMDArhTShQzlDIpbLKeNN64=
X-Received: by 2002:a17:90a:708c:: with SMTP id
 g12mr7220358pjk.13.1630436296443; 
 Tue, 31 Aug 2021 11:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210616085118.1141101-1-omosnace@redhat.com>
 <CAPcyv4jvR8CT4rYODR5KUHNdiqMwQSwJZ+OkVf61kLT3JfjC_Q@mail.gmail.com>
 <CAFqZXNtuH0329Xvcb415Kar-=o6wwrkFuiP8BZ_2OQhHLqkkAg@mail.gmail.com>
 <CAHC9VhTGECM2p+Q8n48aSdfJzY6XrpXQ5tcFurjWc4A3n8Qxjg@mail.gmail.com>
In-Reply-To: <CAHC9VhTGECM2p+Q8n48aSdfJzY6XrpXQ5tcFurjWc4A3n8Qxjg@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 31 Aug 2021 11:58:05 -0700
Message-ID: <CAPcyv4i8YXo=xOL2vO67KLABQRDNAxzrzT=a1xtwtrts5pVPKw@mail.gmail.com>
Subject: Re: [PATCH v3] lockdown,selinux: fix wrong subject in some SELinux
 lockdown checks
To: Paul Moore <paul@paul-moore.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, X86 ML <x86@kernel.org>,
 James Morris <jmorris@namei.org>, Linux ACPI <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 Linux-pm mailing list <linux-pm@vger.kernel.org>,
 SElinux list <selinux@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Casey Schaufler <casey@schaufler-ca.com>, Netdev <netdev@vger.kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Linux Security Module list <linux-security-module@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 31, 2021 at 6:53 AM Paul Moore <paul@paul-moore.com> wrote:
>
> On Tue, Aug 31, 2021 at 5:09 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> > On Sat, Jun 19, 2021 at 12:18 AM Dan Williams <dan.j.williams@intel.com> wrote:
> > > On Wed, Jun 16, 2021 at 1:51 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> ...
>
> > > > diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
> > > > index 2acc6173da36..c1747b6555c7 100644
> > > > --- a/drivers/cxl/mem.c
> > > > +++ b/drivers/cxl/mem.c
> > > > @@ -568,7 +568,7 @@ static bool cxl_mem_raw_command_allowed(u16 opcode)
> > > >         if (!IS_ENABLED(CONFIG_CXL_MEM_RAW_COMMANDS))
> > > >                 return false;
> > > >
> > > > -       if (security_locked_down(LOCKDOWN_NONE))
> > > > +       if (security_locked_down(current_cred(), LOCKDOWN_NONE))
> > >
> > > Acked-by: Dan Williams <dan.j.williams@intel.com>
> > >
> > > ...however that usage looks wrong. The expectation is that if kernel
> > > integrity protections are enabled then raw command access should be
> > > disabled. So I think that should be equivalent to LOCKDOWN_PCI_ACCESS
> > > in terms of the command capabilities to filter.
> >
> > Yes, the LOCKDOWN_NONE seems wrong here... but it's a pre-existing bug
> > and I didn't want to go down yet another rabbit hole trying to fix it.
> > I'll look at this again once this patch is settled - it may indeed be
> > as simple as replacing LOCKDOWN_NONE with LOCKDOWN_PCI_ACCESS.
>
> At this point you should be well aware of my distaste for merging
> patches that have known bugs in them.  Yes, this is a pre-existing
> condition, but it seems well within the scope of this work to address
> it as well.
>
> This isn't something that is going to get merged while the merge
> window is open, so at the very least you've got almost two weeks to
> sort this out - please do that.

Yes, apologies, I should have sent the fix shortly after noticing the
problem. I'll get the CXL bug fix out of the way so Ondrej can move
this along.
