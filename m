Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E112FE53E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 09:41:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLwph2Y7HzDqdX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 19:41:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=daniel.vetter@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=TMAYX7Qp; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLwmm61qKzDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 19:39:34 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id p5so1355537oif.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 00:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kUfE6SE2n4SlWhNh9yX+hYT59DeJtvAevoxz9O0TUik=;
 b=TMAYX7QpeIeo0SfI4thWj5+xPv0DebVU+jxpSwtXWWoVQE84U3WmqKHg2Qft1tihQW
 DB2oOS44TFmyBNUiPyczVFFVRDnnzX7CXxrO4CSZqhf86MPvPEoVPiCfYRdJkxCu76vO
 imVq/j+2Imm/U2YKA+alPP8NkHUHRvLDmkeRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kUfE6SE2n4SlWhNh9yX+hYT59DeJtvAevoxz9O0TUik=;
 b=eFtNI57OEWWD49UlMSCXe+jXORwsEhthYAwxiACwADoYsCoL8WQGeKmlXXX8Rv9Fmk
 QsH5hRw+BNoFPZrVLxvt/M8GST5nMHcOy9Xi1nsvJrPkwVpwZHQlmq0P19cFyxbBPcXs
 jK8jdhS3kYkqin78p8IaKHS0qojkBohGvdDp+N3OODOwCbFRurWQiXHGhxcmh5Fzwrki
 bBBXvHigxa53sCrErd2bDhTaZII3KaknwU6aSiS4SvbQ+NEmMQ9TXe1MbJvccp1IwN5P
 A/TYWqwQwPBXvJ9HoZjoh3vh1gsYUDB3gG/s14jjs0crjLvxWndFJMUwaizwTDqj2ezw
 9jlw==
X-Gm-Message-State: AOAM5306f+UISqSGLTDAR5OWXkM93uiXi11rb908OkCQOu6x9so1dwe1
 39jxoVVS7sQuSGyMXNDz4/4Dyn1LBTa0xps8Etzv3A==
X-Google-Smtp-Source: ABdhPJwdBtD3B1cBobpcMyhJG7mZaplWKuBOFYhagzM+X5GOmA44nSE9377UdftyPqlQOfXqfDOSago3v5JpojgiclM=
X-Received: by 2002:aca:ad92:: with SMTP id w140mr5422725oie.128.1611218370352; 
 Thu, 21 Jan 2021 00:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-9-hch@lst.de>
 <CAKMK7uFo3epNAUdcp0vvW=VyWMMTZghGyRTPbz_Z37S6nem_2A@mail.gmail.com>
 <20210121082820.GA25719@lst.de>
In-Reply-To: <20210121082820.GA25719@lst.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 21 Jan 2021 09:39:19 +0100
Message-ID: <CAKMK7uHKwpjTC8DZ=yDtHpEaLXN7D5C+mOGK52jjkdR=6vib3Q@mail.gmail.com>
Subject: Re: [PATCH 08/13] drm: remove drm_fb_helper_modinit
To: Christoph Hellwig <hch@lst.de>
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
Cc: Petr Mladek <pmladek@suse.com>, Jiri Kosina <jikos@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, live-patching@vger.kernel.org,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 21, 2021 at 9:28 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Jan 21, 2021 at 09:25:40AM +0100, Daniel Vetter wrote:
> > On Thu, Jan 21, 2021 at 8:55 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > drm_fb_helper_modinit has a lot of boilerplate for what is not very
> > > simple functionality.  Just open code it in the only caller using
> > > IS_ENABLED and IS_MODULE.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > I didn't spot any dependencies with your series, should I just merge
> > this through drm trees? Or do you want an ack?
>
> I'd prefer an ACK - module_loaded() is only introduced earlier in this
> series.

I was looking for that but didn't find the hunk touching drm somehow ...

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
