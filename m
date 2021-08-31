Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9753FCD21
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 21:00:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gzc2f1wClz2yJR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 05:00:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=m/p6PQxM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=m/p6PQxM; dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gzc1x2YNmz2xsT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Sep 2021 04:59:48 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id a25so983594ejv.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 11:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K4O58ZgiMsf0cCMtsvw/t7AJFM1T3tlDvm3uUGsU/to=;
 b=m/p6PQxMro/Ee7fR7WvozEwx71BnscpCpL2xs1XR6unVL7bfCWki5mm/DL8tzkxtlv
 IgmDAUJlZv7+KUUNuYAb3NRkVROzdUIxdGRwwrqEOUO0vD6Cu/HZq+bSFieTd9983AeD
 YktyhmMz20Tq1h8uROtJTQQFwlHuUy+Bds8+ZIoQqHDYDTRBZ7xIrXRop6SBBaMcqz3D
 KSsC4i4L46l25F26x2rXCk4fmowpOEt5kNPUpUjO3ZN5jtoqzJulRjdNVM64Yw8ZBWOt
 rXYGE77kjE3hfKV3j/NE4j8c0xfhsFszf/XJGAR6u3atTQlztdBXyq7sYYSIi6VfUO2y
 mhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K4O58ZgiMsf0cCMtsvw/t7AJFM1T3tlDvm3uUGsU/to=;
 b=SLi1Xp+3Rk5w1hUzY4uT0Ck6Cbw8pEKV8KnrkYqghj8qUzxmy4ORcDvIIlEVCcJZHV
 VaEEQ0wLiNVRssmEQ5f91aCekx7Kk3nOg9FNrTQIWNITAaLNwXHEcJnQKqwexjyrYp8W
 Zqx2iF4vl7y/kOgHnopEiEgDU/TWyrOtewSfess+u5eRQC0jTZZZY64a95+S7C/+cBFk
 3WVmF7oUxQyftiNQwMgwW4nZDhnZKvtEE6pp7Fh+gEancilitiE1Ee9x0//Gt+HLzX+z
 Q0XtkGpLeYSadrfWfHx3bfA21+YMuy0Ges7qJeo9gBlhnqF5pu73UVdn2ObqY0iHPRGO
 tilQ==
X-Gm-Message-State: AOAM533PKHsxVsr6cEHQ1wlSzUW2JEW2MP3bcjwxreCgo2LRC/71bYTU
 Kbs44cDeSezkzTJvoN8aTZ8g3+rKYpDGB3ve626s
X-Google-Smtp-Source: ABdhPJynhzjWiT5WygcinC1v/vpSrVXtKhAajoj91Y8oOaAf641QOi9pajzp20JXEjTMXZ2nBzK8acBfiZKG6sYGsHg=
X-Received: by 2002:a17:906:2cd6:: with SMTP id
 r22mr31706715ejr.398.1630436382385; 
 Tue, 31 Aug 2021 11:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210616085118.1141101-1-omosnace@redhat.com>
 <CAPcyv4jvR8CT4rYODR5KUHNdiqMwQSwJZ+OkVf61kLT3JfjC_Q@mail.gmail.com>
 <CAFqZXNtuH0329Xvcb415Kar-=o6wwrkFuiP8BZ_2OQhHLqkkAg@mail.gmail.com>
 <CAHC9VhTGECM2p+Q8n48aSdfJzY6XrpXQ5tcFurjWc4A3n8Qxjg@mail.gmail.com>
 <CAPcyv4i8YXo=xOL2vO67KLABQRDNAxzrzT=a1xtwtrts5pVPKw@mail.gmail.com>
In-Reply-To: <CAPcyv4i8YXo=xOL2vO67KLABQRDNAxzrzT=a1xtwtrts5pVPKw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 31 Aug 2021 14:59:31 -0400
Message-ID: <CAHC9VhReGcV=cngDMmAcEiS2NpkXZQ6b09go9m0omzxLdrUQXg@mail.gmail.com>
Subject: Re: [PATCH v3] lockdown,selinux: fix wrong subject in some SELinux
 lockdown checks
To: Dan Williams <dan.j.williams@intel.com>
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

On Tue, Aug 31, 2021 at 2:58 PM Dan Williams <dan.j.williams@intel.com> wrote:
> On Tue, Aug 31, 2021 at 6:53 AM Paul Moore <paul@paul-moore.com> wrote:
> > On Tue, Aug 31, 2021 at 5:09 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> > > On Sat, Jun 19, 2021 at 12:18 AM Dan Williams <dan.j.williams@intel.com> wrote:
> > > > On Wed, Jun 16, 2021 at 1:51 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> >
> > ...
> >
> > > > > diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
> > > > > index 2acc6173da36..c1747b6555c7 100644
> > > > > --- a/drivers/cxl/mem.c
> > > > > +++ b/drivers/cxl/mem.c
> > > > > @@ -568,7 +568,7 @@ static bool cxl_mem_raw_command_allowed(u16 opcode)
> > > > >         if (!IS_ENABLED(CONFIG_CXL_MEM_RAW_COMMANDS))
> > > > >                 return false;
> > > > >
> > > > > -       if (security_locked_down(LOCKDOWN_NONE))
> > > > > +       if (security_locked_down(current_cred(), LOCKDOWN_NONE))
> > > >
> > > > Acked-by: Dan Williams <dan.j.williams@intel.com>
> > > >
> > > > ...however that usage looks wrong. The expectation is that if kernel
> > > > integrity protections are enabled then raw command access should be
> > > > disabled. So I think that should be equivalent to LOCKDOWN_PCI_ACCESS
> > > > in terms of the command capabilities to filter.
> > >
> > > Yes, the LOCKDOWN_NONE seems wrong here... but it's a pre-existing bug
> > > and I didn't want to go down yet another rabbit hole trying to fix it.
> > > I'll look at this again once this patch is settled - it may indeed be
> > > as simple as replacing LOCKDOWN_NONE with LOCKDOWN_PCI_ACCESS.
> >
> > At this point you should be well aware of my distaste for merging
> > patches that have known bugs in them.  Yes, this is a pre-existing
> > condition, but it seems well within the scope of this work to address
> > it as well.
> >
> > This isn't something that is going to get merged while the merge
> > window is open, so at the very least you've got almost two weeks to
> > sort this out - please do that.
>
> Yes, apologies, I should have sent the fix shortly after noticing the
> problem. I'll get the CXL bug fix out of the way so Ondrej can move
> this along.

Thanks Dan.

-- 
paul moore
www.paul-moore.com
