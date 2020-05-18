Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A461D8B6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 01:06:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QvlF310wzDqfC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 09:06:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=X8YMwEb7; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QvjR74bhzDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 09:04:43 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id j21so5509270pgb.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 16:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=r1Le0nR4tySg2kT1BHFLkI6EUe6Y+WJSI4SzoGFWd78=;
 b=X8YMwEb7Lw6MWj/O2T9yVdzE4Qn1LZvj16YoPpFa5Bi9kpMAY6JEpRegNVtbbNZZln
 KaAi1nbXmSCB4kMjiVjJAR72mczRt1j1ih6NIC8arnMSF3X7aErbEVibKj2suB6EpYAR
 RG79hUO+hsivoJncAPGCJZq+f0OcKGtG0P49o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r1Le0nR4tySg2kT1BHFLkI6EUe6Y+WJSI4SzoGFWd78=;
 b=lsKlFnKxAXT7XRmvU1uOPAxyME0DzZtDJLFVSuJ2D4Jj9Tvf5Zvu+URp+P0E8/Mhmy
 ElcdxhZVpjLxFELWIG1XeojvP7JWmYmG2tm0bAbXVzKyuzAbDw1jd5fe6j+zAGVpD64r
 zFFJRSkvu5akhjX32SNpaDt4iXNf/QAqG6kwynfLylPPjaSW9LAKDb/LLnOXIhwWhXWq
 zOuQkFyZnSYSahjfH6X9F/hvpACpAD59QeJEy/TIma4E/zm7oGfVFmdHavpC5W3HQXL7
 uE6TXz7nie3k+uSGznnfe4azYeWTwn1Tvg4w627UAY+nEqAeQJa5BOhh6SxFD7zpNOXM
 4wqw==
X-Gm-Message-State: AOAM533j9eAMevDmupfaDFF09VSU0ICKjo+CyFKx/i3A4yT7t8YZq7N9
 Ku5syKfmgRzNk7h2j3L7Fj1DPQ==
X-Google-Smtp-Source: ABdhPJxe14AahgZj+S3UqpTlkNaNE8HgOPicSyURsr+inLr9Ituh4PyX3CXubeVAnZK/edydfrJA3Q==
X-Received: by 2002:a63:ef03:: with SMTP id u3mr3765193pgh.254.1589843079916; 
 Mon, 18 May 2020 16:04:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id mn19sm478872pjb.8.2020.05.18.16.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 16:04:39 -0700 (PDT)
Date: Mon, 18 May 2020 16:04:37 -0700
From: Kees Cook <keescook@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 6/6] ramoops: Add max_reason optional field to ramoops
 DT node
Message-ID: <202005181603.C8CBA854@keescook>
References: <20200515184434.8470-1-keescook@chromium.org>
 <20200515184434.8470-7-keescook@chromium.org>
 <CAL_JsqLVgdUEP74nJOHOBD2abK=3YfCqX9GmL2iXdPNctcRdjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLVgdUEP74nJOHOBD2abK=3YfCqX9GmL2iXdPNctcRdjw@mail.gmail.com>
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Jonathan Corbet <corbet@lwn.net>,
 Anton Vorontsov <anton@enomsg.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, devicetree@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Benson Leung <bleung@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 18, 2020 at 04:45:32PM -0600, Rob Herring wrote:
> On Fri, May 15, 2020 at 12:44 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > From: Pavel Tatashin <pasha.tatashin@soleen.com>
> 
> Subject still has 'max_reason'.
> 
> >
> > Currently, it is possible to dump kmsges for panic, or oops.
> > With max_reason it is possible to dump messages for other
> 
> And here.

Ah yeah, this was, I think, describing the internal field name, but I
see it would be less confusing to refer to this by the DT name. I will
adjust it. Thanks!

-Kees

> 
> > kmesg_dump events, for example reboot, halt, shutdown, kexec.
> >
> > Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
> > Link: https://lore.kernel.org/lkml/20200506211523.15077-6-keescook@chromium.org/
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  .../devicetree/bindings/reserved-memory/ramoops.txt | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
> > index 0eba562fe5c6..b7886fea368c 100644
> > --- a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
> > +++ b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
> > @@ -30,7 +30,7 @@ Optional properties:
> >  - ecc-size: enables ECC support and specifies ECC buffer size in bytes
> >    (defaults to 0: no ECC)
> >
> > -- record-size: maximum size in bytes of each dump done on oops/panic
> > +- record-size: maximum size in bytes of each kmsg dump.
> >    (defaults to 0: disabled)
> >
> >  - console-size: size in bytes of log buffer reserved for kernel messages
> > @@ -45,7 +45,16 @@ Optional properties:
> >  - unbuffered: if present, use unbuffered mappings to map the reserved region
> >    (defaults to buffered mappings)
> >
> > -- no-dump-oops: if present, only dump panics (defaults to panics and oops)
> > +- max-reason: if present, sets maximum type of kmsg dump reasons to store
> > +  (defaults to 2: log Oopses and Panics). This can be set to INT_MAX to
> > +  store all kmsg dumps. See include/linux/kmsg_dump.h KMSG_DUMP_* for other
> > +  kmsg dump reason values. Setting this to 0 (KMSG_DUMP_UNDEF), means the
> > +  reason filtering will be controlled by the printk.always_kmsg_dump boot
> > +  param: if unset, it will be KMSG_DUMP_OOPS, otherwise KMSG_DUMP_MAX.
> > +
> > +- no-dump-oops: deprecated, use max_reason instead. If present, and
> > +  max_reason is not specified, it is equivalent to max_reason = 1
> 
> And here (3 times).
> 
> > +  (KMSG_DUMP_PANIC).
> >
> >  - flags: if present, pass ramoops behavioral flags (defaults to 0,
> >    see include/linux/pstore_ram.h RAMOOPS_FLAG_* for flag values).
> > --
> > 2.20.1
> >

-- 
Kees Cook
