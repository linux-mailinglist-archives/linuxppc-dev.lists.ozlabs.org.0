Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C492554E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 10:23:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UM2TWAmm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDXpq6q1Vz3d2m
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 18:23:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UM2TWAmm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDXp13vksz2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 18:22:31 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ee75ffce77so20545941fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2024 01:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719994949; x=1720599749; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TMQqT/Muz0iwxmBm/vQkZCAi7Byb2pCrA2WM9iHg1No=;
        b=UM2TWAmm+yP1X9wa1Kt8sRhuf7q1zkgZLzF8P8IpEFGY8p8Jav68aJK7HoQkAZLmel
         lqOeuM9O64zl0x6P/c1dzxiDdBprrVnBjeQaYHBYjsuPB2Ak0vLxvMXYUZtdIRhOZFAD
         U0DJnLauRhG6Dfl9DG3ivt7R4U5AMWAVKPCFAVTR4HShalCEF6xX6mGL0WPNVGu2NVxP
         my7S94y264D86Tzk/KSDhsVQo6oOkTB8L3zBWv9tgq8ZOkAYPIjgB5tyBonZ5+qDNwPM
         3nREW0oX0al7kvgWMCpnuENJJU4GX330FqAIVE4LgQpNfFvWBgKAZh/j2vYJuPLFFFUG
         lUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719994949; x=1720599749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMQqT/Muz0iwxmBm/vQkZCAi7Byb2pCrA2WM9iHg1No=;
        b=gaCCN9dVayy62Nll1BBL6pY4n9iAIKMN55iztFEwGx2lIMr669wGnteMxQdobhCP7n
         A2+bjRB8vKu4FU1qDu0lur7EBxhxN0jiljP/PFo1kGZ+ukrrIsWH/Bck+r/LUOCWC6p9
         Z4m5HbQsAo8wBDKkZ5u5O2BdgHCp84TqUR/B68goZi9T0ydDc5Hrn1NFgmhoCqB+tK6R
         K7hf34gIMCUQf+cTKvekPCSTc7yd2Msoo5fith868PBgW31eppiBf/TDC+Q6Xl+O0oE3
         L6H5hFJs+CUU2heKJPIUZAMAhJGjzGIyWD/W8pxMUs7RmQ5Zz4lLGRES+UTzl+vlHyLN
         L0GA==
X-Forwarded-Encrypted: i=1; AJvYcCXcaidz+mWMIdMQP+lP6i9hEHtn3y5Tu8OKoDt5sZFfDHX6MBg0aZs2owvWQ7a3dNwq1axuK/rDaNWQwldsFEvRDCz62KOJN0/nKvqnZw==
X-Gm-Message-State: AOJu0YysQwxYEVGozDCgyqQz8EBhym0+qcF5WsD9WvFaqvF5UqyvBn4o
	XVDmh5eP/FU6OydtL8LN7cll7v9aSVbv9DlheCokEAYqS3zIGgHDwBvkHMNnokc=
X-Google-Smtp-Source: AGHT+IGgmL2y9QM4c4g0Wf6Xz0uaCMi9coDigbGLy4p0by/hZmKG4KPflaiBbCeCe+DcbaFV7kidJA==
X-Received: by 2002:a2e:bc88:0:b0:2ee:7a54:3b14 with SMTP id 38308e7fff4ca-2ee7a543b8dmr26465461fa.7.1719994949278;
        Wed, 03 Jul 2024 01:22:29 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70802959d41sm10094847b3a.96.2024.07.03.01.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 01:22:28 -0700 (PDT)
Date: Wed, 3 Jul 2024 10:22:11 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
Message-ID: <ZoUKM9-RiOrv0_Vf@pathway.suse.cz>
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <202407021326.E75B8EA@keescook>
 <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Wei Liu <wei.liu@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Dexuan Cui <decui@microsoft.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>, John Ogness <john.ogness@linutronix.de>, Jani Nikula <jani.nikula@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 2024-07-03 09:57:26, Jocelyn Falempe wrote:
> 
> 
> On 02/07/2024 22:29, Kees Cook wrote:
> > On Tue, Jul 02, 2024 at 02:26:04PM +0200, Jocelyn Falempe wrote:
> > > kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> > > callback.
> > > This patch adds a new struct kmsg_dump_detail, that will hold the
> > > reason and description, and pass it to the dump() callback.
> > 
> > Thanks! I like this much better. :)
> > 
> > > 
> > > To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> > > function and a macro for backward compatibility.
> > > 
> > > I've written this for drm_panic, but it can be useful for other
> > > kmsg_dumper.
> > > It allows to see the panic reason, like "sysrq triggered crash"
> > > or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> > > 
> > > v2:
> > >   * Use a struct kmsg_dump_detail to hold the reason and description
> > >     pointer, for more flexibility if we want to add other parameters.
> > >     (Kees Cook)
> > >   * Fix powerpc/nvram_64 build, as I didn't update the forward
> > >     declaration of oops_to_nvram()
> > 
> > The versioning history commonly goes after the "---".
> 
> ok, I was not aware of this.
> > 
> > > [...]
> > > diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
> > > index 906521c2329c..65f5a47727bc 100644
> > > --- a/include/linux/kmsg_dump.h
> > > +++ b/include/linux/kmsg_dump.h
> > > @@ -39,6 +39,17 @@ struct kmsg_dump_iter {
> > >   	u64	next_seq;
> > >   };
> > > +/**
> > > + *struct kmsg_dump_detail - kernel crash detail
> > 
> > Is kern-doc happy with this? I think there is supposed to be a space
> > between the "*" and the first word:
> > 
> >   /**
> >    * struct kmsg...
> > 
> > 
> Good catch, yes there is a space missing.
> 
> I just checked with "make htmldocs", and in fact include/linux/kmsg_dump.h
> is not indexed for kernel documentation.
> And you can't find the definition of struct kmsg_dumper in the online doc.
> https://www.kernel.org/doc/html/latest/search.html?q=kmsg_dumper
> 
> > Otherwise looks good to me!
> > 
> 
> Thanks.
> 
> As this patch touches different subsystems, do you know on which tree it
> should land ?

Andrew usually takes patches against kernel/panic.c.

Or you could take it via the DRM tree, especially if you already have the code
using the string.

Also I could take it via the printk tree. The only complication is
that I am going to be away the following two weeks and would come
back in the middle of the merge window. I do not expect much problems
with this change but...

Best Regards,
Petr
