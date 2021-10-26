Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD97C43B430
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 16:30:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdvPl5Stzz30CK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 01:30:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=sANo+1Tn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20210112.gappssmtp.com
 header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=sANo+1Tn; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdvP25wcBz2yLv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 01:30:12 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id w15so14395539edc.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wJSGFytkkdPheB+wlk955znZt0m/KBc4qQJPUDxpyPw=;
 b=sANo+1Tne2i5Hv2mCCMeAhl0VxMgfF0YX0e60QWrmhXe7LzpBaTDBClGhYRoPML4ny
 8/JThRqJbNcFapRZxTpVFWFr1v1j5kG/XahTeep8+Z8b5dzqWGXzy/e0NlbjQsaK8G3N
 +t+Rkzg7Yec+g1gcMvi050G26Vy4x71gampIaLNpfrrzjNhSl3vjGAvCpP59o6CL7O8d
 CTxMaMYSwl/rLKRCRf7jPCpT/78zTXYeiRQ4G3AJfQ5CZJd/hGBHzTubFtHOCQHaIr2h
 548O9lotYZRkdLgU+SQsYZHEGA89qKQ/ontY01cGfo5wFOY+MSMI7bU5naRy5xvB609Z
 609w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wJSGFytkkdPheB+wlk955znZt0m/KBc4qQJPUDxpyPw=;
 b=ug0+NFgt3M8d+nDd/NrqPG7JqDa63ejILjqqwDB+dpdqfIyvDfTTKzB3s4+tNO6XgS
 oaJxQRLRAcjwEpNzcEPkDp2NOsOTKnXcRXCe6rVhtiNlPHj1uHyuL7XwpkaeHmwYVxD+
 OgbUaW+sTpN0isu1V+oQJCzlaE3VFH5z0jmACgofe4pzFJG7Attq+FDT3WlUpJzrssJN
 4dFzwFFU2OuJPb4HiLrE7mQMIAJa+M5BkKxN4V2Hr61PFl+cfsdwZ3Pf6haFpfr2R+Y1
 rTv4amnB/HzDFgyvh1VnKiJAdO6SdrYCqltX1FmhFqPVU9RpL5uWEITlA0osdmBbLF4/
 ErvQ==
X-Gm-Message-State: AOAM5339qZJobxH305YUskxftVlcA3ssKnuklbHY0uJmqmvqppaCmI1/
 8WMcseNzPPrkYnvU5Evq5ParBkzXeiwKHsSJdmQ4
X-Google-Smtp-Source: ABdhPJzAsQP0OAB+yYut6tHR+uRO8G4JL5eHkcZxmzYtC/7OerWPHYb1y9xLveuncd1s4fZzTrey1LV3hCwICiSozeI=
X-Received: by 2002:a17:907:7601:: with SMTP id
 jx1mr31210516ejc.69.1635258482206; 
 Tue, 26 Oct 2021 07:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211026133147.35d19e00@canb.auug.org.au>
 <87k0i0awdl.fsf@mpe.ellerman.id.au>
In-Reply-To: <87k0i0awdl.fsf@mpe.ellerman.id.au>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 26 Oct 2021 10:27:51 -0400
Message-ID: <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Richard Guy Briggs <rgb@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 26, 2021 at 6:55 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > Hi all,
> >
> > Today's linux-next merge of the audit tree got conflicts in:
> >
> >   arch/powerpc/kernel/audit.c
> >   arch/powerpc/kernel/compat_audit.c
> >
> > between commit:
> >
> >   566af8cda399 ("powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENERIC")
> >
> > from the powerpc tree and commits:
> >
> >   42f355ef59a2 ("audit: replace magic audit syscall class numbers with macros")
> >   1c30e3af8a79 ("audit: add support for the openat2 syscall")
> >
> > from the audit tree.
>
> Thanks.
>
> I guess this is OK, unless the audit folks disagree. I could revert the
> powerpc commit and try it again later.
>
> If I don't hear anything I'll leave it as-is.

Hi Michael,

Last I recall from the powerpc/audit thread there were still some
issues with audit working properly in your testing, has that been
resolved?  If nothing else, -rc7 seems a bit late for this to hit
-next for me to feel comfortable about this.

-- 
paul moore
www.paul-moore.com
