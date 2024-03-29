Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B76CB8920A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 16:40:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=drcScYT5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5l473WD9z3vZl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Mar 2024 02:40:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=drcScYT5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5l3M3RyXz3c4C
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Mar 2024 02:40:13 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e709e0c123so1910535b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711726808; x=1712331608; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iN31wd2vCkiTGMz1OBtEaB4JW8VyiA1XbISlyEebr3E=;
        b=drcScYT5wthXsuphXCgxCeJYjSF1t1bSfgko8Gfnrg/znfl+t71b7YTUXvdpmogCRQ
         +K4zcg4e5hlmmdXqY+1LylWFFEWxi1jbPJoF1HbeKJVTwUjIkNQQghON+LCQrjr1WzML
         gPvZAIzY3myscSZCi7m6EZP8+vP6KtBRxqgGBwLuXrYIrcvTT3xD1sROFuODn56X+Eem
         STJsdecvYvFSpRDh1vXgjO9q99EkfLQ/6wDYpNfkXaVyb2jCPvj2ttlW30vERhcIChC6
         zEY/FhNMVsL5KQwAHP1IKYEcOWDkcpi4O8mbNMeKtGnl5sEhBWWMxKqU9mKZPfOjLEc+
         YDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711726808; x=1712331608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iN31wd2vCkiTGMz1OBtEaB4JW8VyiA1XbISlyEebr3E=;
        b=nJ0PkmnHaigeHJ/itL9GgRLbdhyYbkY7Xhe7XEKQc4gDddaTw4EEYVDAzEpco/062t
         f/ke+zdZL6/FvSJ/Db+kRQL7hKK04aVrl9ysmsbH9Rcu+hxgaeglLCIViVmtv4pe7qFR
         4VM3e37dc0TmOhmZvryaNvU3yu15AhONUyf3bnIFsmbz72rflXGNK8e7DgYIQkAy7VNV
         lggejYOLZv4clOdn0aNgPKhuoSnIio1NbuspAncSegYbBm0gFRtzxuxIinuDhtSWd8eV
         wO4oTGv6vX8Uvm0MRR5MM78kFK/fS26nCDOUVLLzcGQBvBwRGjmjCfrghBSDRoUcyx6n
         HTHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwjeaffsRD9lvSpFi6pTD34FXkZrvCMy2U6OqRLmFNflhWI9FPTjE+CLkRtyGbt6DCiyCW+BMIf1G+dw/FAY1lElGVRkgIb4XAXKy4zw==
X-Gm-Message-State: AOJu0YxlwciqYMMVBesNckiasvvThMgbRr5Ia9sARGQO8EVkCk5HP5D/
	INPHkcovPopdbcaUzj4oXUYvUpPN0De913RgYtMnAWufcHYvqsEq
X-Google-Smtp-Source: AGHT+IF0O7HII5MYlv2g0E+BHBSm5qRGKAR+0KxI+xwk6+g8c7fXn65jtKX0C7ci+tZdnr/ge20LGw==
X-Received: by 2002:a05:6a20:3c90:b0:1a5:6bfb:76de with SMTP id b16-20020a056a203c9000b001a56bfb76demr2694088pzj.2.1711726808383;
        Fri, 29 Mar 2024 08:40:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902db0900b001dd578121d4sm3581907plx.204.2024.03.29.08.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 08:40:07 -0700 (PDT)
Date: Fri, 29 Mar 2024 08:40:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 12/14] sh: Add support for suppressing warning
 backtraces
Message-ID: <d7663e19-74d5-478d-becc-0a080075e7d6@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-13-linux@roeck-us.net>
 <20240327144431.GL403975@kernel.org>
 <320aacc6-b7e5-4c3d-948e-d0743ab26c5d@roeck-us.net>
 <20240327193920.GV403975@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327193920.GV403975@kernel.org>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, l
 inux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 07:39:20PM +0000, Simon Horman wrote:
[ ... ]
> > > 
> > > Hi Guenter,
> > > 
> > > a minor nit from my side: this change results in a Kernel doc warning.
> > > 
> > >       .../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY(). Prototype was for HAVE_BUG_FUNCTION() instead
> > > 
> > > Perhaps either the new code should be placed above the Kernel doc,
> > > or scripts/kernel-doc should be enhanced?
> > > 
> > 
> > Thanks a lot for the feedback.
> > 
> > The definition block needs to be inside CONFIG_DEBUG_BUGVERBOSE,
> > so it would be a bit odd to move it above the documentation
> > just to make kerneldoc happy. I am not really sure that to do
> > about it.
> 
> FWIIW, I agree that would be odd.
> But perhaps the #ifdef could also move above the Kernel doc?
> Maybe not a great idea, but the best one I've had so far.
> 

I did that for the next version of the patch series. It is a bit more
clumsy, so I left it as separate patch on top of this patch. I'd
still like to get input from others before making the change final.

Thanks,
Guenter
