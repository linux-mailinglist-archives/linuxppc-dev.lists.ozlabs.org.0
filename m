Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E3E89E243
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 20:11:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jzpMVUSH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDYv36rrGz3vbH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 04:11:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jzpMVUSH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDYtL4Wlyz2xYY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 04:11:06 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e3ca4fe4cfso23906585ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Apr 2024 11:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712686264; x=1713291064; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9dSAKFdynyhKujjaxO9n/FtMdq9OcS8F/T8JeifJ1k=;
        b=jzpMVUSHYB8Zc63t/ZzB0dVXtnG3UgPNpaW/cGt25W2rBRzXVZLeDtZ/d/C76rszNe
         AYsLqKmtMkNrFUBrdzR6ft2r47c8y3BGYhbM2NJdV9dQ+yHQSCtmGbNiJAUw7YWiTdXi
         GYY5Ga8YhKXG5WMnhbW3gGlZUt2UMQbqAFDfyKqv1aTSav2r9TrBeIRbDQipykisdSaK
         UIZSrKoIBB8rBGjA8npdv9BoDmxYlKsmMkH4pfJ3fV7VdChaAzgJqlC0AwIQAdl5XmCZ
         hORTtlLRM2/MUoxuArFGHooYiiY7YpwdBdepnN/rrLDx0OrSvkC1jvOApHdhibRVDstZ
         wPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712686264; x=1713291064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9dSAKFdynyhKujjaxO9n/FtMdq9OcS8F/T8JeifJ1k=;
        b=N1d3xZA8ZDF/pBQvc+vne3uRS0wcztn6zhK4Pv9jxpMXr0avNpcMlmZDHpaXa4wCDR
         gqNfV/T0RaTdalFs6Cs9QdA8f2MIcBi0va5WgG1JcyKDsvPDOe0o3ifgfntg5g8jlW2A
         1nuy8GOAI6QOcwP1WXmPBnbnU+QsFeWBmGDMwI8CapCWbFy/WMss2S0f/QsZ9bbPjbPB
         P5YKk0rZU8lqH4ah66MZBOqqpGyV4pP9aiJMYaXKualuPcKtncocDYY1nZq/coYQ1q8U
         ER/uk+XyEIi2SnBYfVzOWlDyHrbooKttU25H/k75pEg2b91GsZaV8SWgjYgKLs6pxZ+d
         tupw==
X-Forwarded-Encrypted: i=1; AJvYcCVr0RY7RhqxW5muBRg5BG5apy9ys5bwIiBBzQHhQbcjVeum88REL3i7tuA6NbXE378w+W3gT1h+5/yGtezrvgwVIQxEFJWIBELjl658LQ==
X-Gm-Message-State: AOJu0YzFJFO6WnOtamrax0SP3Wiq/mbGWoUjlg7WUbFTJBZ6oH6iHUD1
	rxXjMcpQ10T9iSCioCqew95xenJ9wzQl+MudSBxXBmfmlHVuiBH9
X-Google-Smtp-Source: AGHT+IGrjPVdFECKS3becNGGDDo38peM0R3uLnfzfKLi+hNrIYGQpqn6EkGBto25qlTyktqlNq6njg==
X-Received: by 2002:a17:902:82c8:b0:1e2:3e1e:3d9 with SMTP id u8-20020a17090282c800b001e23e1e03d9mr529751plz.63.1712686263974;
        Tue, 09 Apr 2024 11:11:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902f25200b001e256cb48f7sm9195770plc.197.2024.04.09.11.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 11:11:03 -0700 (PDT)
Date: Tue, 9 Apr 2024 11:11:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH v3 03/15] kunit: Add test cases for backtrace warning
 suppression
Message-ID: <aad25d52-83ed-492f-9d56-71d26895173b@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-4-linux@roeck-us.net>
 <CABVgOSknXkT=WU-fwi5wP4bWv04DKByxSYAPmhYhC--FaQH-PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABVgOSknXkT=WU-fwi5wP4bWv04DKByxSYAPmhYhC--FaQH-PQ@mail.gmail.com>
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
Cc: x86@kernel.org, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, loongarch@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.
 kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 09, 2024 at 04:29:42PM +0800, David Gow wrote:
> > +ifeq ($(CCONFIG_KUNIT_SUPPRESS_BACKTRACE),y)
> 
> s/CCONFIG_/CONFIG_/ ?
> 
> 
Odd, I know I tested this (and it still works ;-).
The additional "C" must have slipped in at some point.
Thanks for noticing!

Guenter
