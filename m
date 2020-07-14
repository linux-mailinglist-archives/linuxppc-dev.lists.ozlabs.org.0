Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 223BF21EDB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 12:13:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5bvH5h5SzDqcF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 20:13:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=YrcDDo2h; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5bs50TSLzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 20:11:36 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id q5so20590346wru.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=OqMAzxBrcdwm6YGTWbUrnUhO2V+3iZLXbZ6mNMhNbgU=;
 b=YrcDDo2hP5M68Ak8M7jsKPUTs7yD6/ADyMMgpPJg442GJRgPGP+jCxljWP3trEqyTE
 QOK/gRwpRbKojsplhpXoZipPym/tq9vaDlYDnM8AoXUuGx1MmGgAD38eAYYxbNAHn1aX
 z8h9SSiDlHidMaX1MKCyAlI/GZvt0IAKvagEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=OqMAzxBrcdwm6YGTWbUrnUhO2V+3iZLXbZ6mNMhNbgU=;
 b=mLBZVImwlazKK23SMX/L6RTq3AD5delV9VSGjS7yVBC3pUezpiS33ItO8E4lQrvgnj
 fx5EsU8zJIFih43DYTyVfxAUvM00s/qpy5xoFBS7PPx2lAnXC6J5whSbB5KlYSncP28f
 lgtoJ1RNJs7t+E7R7PdvnnkeertKe7M8PVEJGumxawJtW90di4ky554lEtCNnBJ0nlwP
 ERuGaynrnMpDol6x+/E75e91gNrDtd0MbSPEfGTgrhhMLV8jvkz2rNwdBFutcAWcoGRr
 hHr/IrLnYLEaHAt0eXAqXGue/VULYJNRTmUSuyBEvaDF7aUXBTb+04+XQTzJ/9F/W1xT
 FRBQ==
X-Gm-Message-State: AOAM532VQUbQUXhBf5Q4ud3RIgYGQB9rh3mIdeCGJ9ml28T1OEtwaUHm
 CzYkvjyXqmOc9l4SL+Q4NkT0GA==
X-Google-Smtp-Source: ABdhPJwmiWZVvfzELvtSnftev0XNz5kRmchhtWQAJnH3b79CIxD1ms2dJU5USjC+U/HesEOe1K7f7A==
X-Received: by 2002:adf:8444:: with SMTP id 62mr4044229wrf.278.1594721493115; 
 Tue, 14 Jul 2020 03:11:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d201sm3498227wmd.34.2020.07.14.03.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 03:11:32 -0700 (PDT)
Date: Tue, 14 Jul 2020 12:11:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-mm@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net, Wu Hao <hao.wu@intel.com>,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 linux-leds@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, linux-s390@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>,
 Hannes Reinecke <hare@suse.com>, linux-scsi@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org,
 keyrings@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, nd@arm.com
Subject: Re: [PATCH 06/20] Documentation: gpu/komeda-kms: eliminate
 duplicated word
Message-ID: <20200714101129.GB3278063@phenom.ffwll.local>
Mail-Followup-To: "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-mm@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net, Wu Hao <hao.wu@intel.com>,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 linux-kbuild@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 linux-leds@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, linux-s390@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>,
 Hannes Reinecke <hare@suse.com>, linux-scsi@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org,
 keyrings@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 nd@arm.com
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-7-rdunlap@infradead.org>
 <20200708050821.GA1121718@jamwan02-TSP300>
 <20200714101005.GA3278063@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714101005.GA3278063@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 12:10:05PM +0200, Daniel Vetter wrote:
> This and next patch merged to drm-misc-next, thanks.

Oops strike this, I just noticed that Jon said he's picked it all up.

Oh well, the confusion, I managed to stop the script before it published
anything at least :-)
-Daniel

> 
> On Wed, Jul 08, 2020 at 01:08:21PM +0800, james qian wang (Arm Technology China) wrote:
> > Hi Randy
> > 
> > On Tue, Jul 07, 2020 at 11:04:00AM -0700, Randy Dunlap wrote:
> > > Drop the doubled word "and".
> > > 
> > > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > > Cc: Jonathan Corbet <corbet@lwn.net>
> > > Cc: linux-doc@vger.kernel.org
> > > Cc: James (Qian) Wang <james.qian.wang@arm.com>
> > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > > Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> > > Cc: Mali DP Maintainers <malidp@foss.arm.com>
> > > ---
> > >  Documentation/gpu/komeda-kms.rst |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > --- linux-next-20200701.orig/Documentation/gpu/komeda-kms.rst
> > > +++ linux-next-20200701/Documentation/gpu/komeda-kms.rst
> > > @@ -41,7 +41,7 @@ Compositor blends multiple layers or pix
> > >  frame. its output frame can be fed into post image processor for showing it on
> > >  the monitor or fed into wb_layer and written to memory at the same time.
> > >  user can also insert a scaler between compositor and wb_layer to down scale
> > > -the display frame first and and then write to memory.
> > > +the display frame first and then write to memory.
> > 
> > Thank you for the patch.
> > 
> > Reviewed-by: James Qian Wang <james.qian.wang@arm.com>
> 
> James, for simple patches like this just go ahead and merge them. You're
> the maintainer for this, just slapping an r-b onto a patch and no
> indiciation whether you will pick it up only confuses people and increases
> the risk that patches get lost.
> 
> So either pick up right away, or state clearly that you will pick it up
> later, or that you expect someone else to merge this.
> 
> Thanks, Daniel
> > 
> > >  Writeback Layer (wb_layer)
> > >  --------------------------
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
