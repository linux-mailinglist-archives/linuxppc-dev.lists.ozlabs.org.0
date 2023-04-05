Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 066AB6D8310
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 18:08:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps8gb6X58z3f4v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 02:08:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=VNUObGKk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ffwll.ch (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=VNUObGKk;
	dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps8fl6Lgjz3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 02:07:42 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5005c57f95cso76624a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Apr 2023 09:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1680710851; x=1683302851;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ir3s/Lf5lvCAlrm1TfcesrDtB2jAmtZCISN/6dp3hBc=;
        b=VNUObGKko6sqyyipxJHZOjjD7Vgl2nINPanPLg9CF5dNFM42M+zPkinw5lJovFp5IT
         KgryiwfHZwGoUCHvFhE9cgxsLTI65w6qpIN9bd0/wPOfFcL5qWWLKMUORCChrg/EDytj
         /mEZ5jrCc5FzC1si2MslaSmste3VoXKbRjv7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710851; x=1683302851;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ir3s/Lf5lvCAlrm1TfcesrDtB2jAmtZCISN/6dp3hBc=;
        b=24e9Nr8GkL9t4ULVlNKT0DeStCplXVJSE9ExFuEnPDUPqvLaNmqQqls6VyT+zg+GyE
         JPWdzg4AppLOQ/USuI+RbSyubi3ReBnbTTr4cVvHv9AM6ZEnwaJPaJCJj87Zcf1egt2R
         xYOL4pmnCJTVBM1ga0XQeCHKnnKDIbh53PDzlT2xT58zmbcZ/Qy+4MDcEIXnlL+90YSn
         lc809yGguswzbndTooQj0XhkTQ8rHrKF+akRMQvg6Z4p6me3gN3qA1ej/lhiIfAx5fUh
         JgxfWQmN8VQ6P4avMqpBbdwtIJHbzRNGEKkIe+nqgI4/CmbNZf9iErNC7L/KmycLfbiF
         QWyQ==
X-Gm-Message-State: AAQBX9cqhQr42MMNoT4rFTKllaaWLXlTqt7Y4SEb3bumK+R0xg1Iyk2O
	1TB/OuY+WWlY4vARgZqVY5BXXg==
X-Google-Smtp-Source: AKy350aQMCCIGd+ttlIn6lmvnbNQhhwBJ1Oi0jxEBwn9z6WIX2aUYNMX4MoVCA82q+F4FspzQF+uZA==
X-Received: by 2002:a17:906:10c9:b0:931:4285:ea16 with SMTP id v9-20020a17090610c900b009314285ea16mr2360239ejv.7.1680710851411;
        Wed, 05 Apr 2023 09:07:31 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id a23-20020a170906369700b0092a59ee224csm7492153ejc.185.2023.04.05.09.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 09:07:31 -0700 (PDT)
Date: Wed, 5 Apr 2023 18:07:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 01/18] fbdev: Prepare generic architecture helpers
Message-ID: <ZC2cwIJJlyDWge+B@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Helge Deller <deller@gmx.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
References: <20230405150554.30540-1-tzimmermann@suse.de>
 <20230405150554.30540-2-tzimmermann@suse.de>
 <92fe3838-41f0-4e27-8467-161553ff724f@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92fe3838-41f0-4e27-8467-161553ff724f@app.fastmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>, linux-mips@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Thomas Zimmermann <tzimmermann@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 05, 2023 at 05:53:03PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 5, 2023, at 17:05, Thomas Zimmermann wrote:
> > Generic implementations of fb_pgprotect() and fb_is_primary_device()
> > have been in the source code for a long time. Prepare the header file
> > to make use of them.
> >
> > Improve the code by using an inline function for fb_pgprotect() and
> > by removing include statements.
> >
> > Symbols are protected by preprocessor guards. Architectures that
> > provide a symbol need to define a preprocessor token of the same
> > name and value. Otherwise the header file will provide a generic
> > implementation. This pattern has been taken from <asm/io.h>.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Moving this into generic code is good, but I'm not sure
> about the default for fb_pgprotect():
> 
> > +
> > +#ifndef fb_pgprotect
> > +#define fb_pgprotect fb_pgprotect
> > +static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
> > +				unsigned long off)
> > +{ }
> > +#endif
> 
> I think most architectures will want the version we have on
> arc, arm, arm64, loongarch, and sh already:
> 
> static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
>                                 unsigned long off)
> {
>        vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> }
> 
> so I'd suggest making that version the default, and treating the
> empty ones (m68knommu, sparc32) as architecture specific
> workarounds.

Yeah I was about to type the same suggestion :-)
-Daniel

 
> I see that sparc64 and parisc use pgprot_uncached here, but as
> they don't define a custom pgprot_writecombine, this ends up being
> the same, and they can use the above definition as well.
> 
> mips defines pgprot_writecombine but uses pgprot_noncached
> in fb_pgprotect(), which is probably a mistake and should have
> been updated as part of commit 4b050ba7a66c ("MIPS: pgtable.h:
> Implement the pgprot_writecombine function for MIPS").
> 
>     Arnd

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
