Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C5851CE4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 19:37:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WGH26Iu0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYY8h5jh1z3dWK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 05:37:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WGH26Iu0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYY7z2kPbz3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 05:36:29 +1100 (AEDT)
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-7d2e21181c1so1783223241.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 10:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707762984; x=1708367784; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WXKqSYyybXp6uV6dewa2nvBTpPzl9LPRGTDSAu1cgDM=;
        b=WGH26Iu0J16gTpEvMAPybyyjz9Nr5WCM5cTRqPTbNbxC2eG56oG2rL6Lyz7/MeS9rL
         8HNATWx5HA4mZjiQGNwXw5QrhKEdZH1ngs3Jj8PhDMmEjaYk34CRdE2RvAAaDum3/Sfh
         IyeUiNZZn/r+kTHPnP7Wqbx7i3mVfID0bya8gFhiBPhvPPmkPVMX3tNcw1RHd9IKoLxM
         h5Rl2B2psGMyuAvjKfs/frb+5RpWMJbosTJa9hzvMGu29SL/1Xi8Bk5WKwrFQpy4j8y+
         zZXJd0+dKyT7kZqB3dzSZbTnGuPhZDtIeAs8JYUYOd1zbHI0D4LTsyfurFGg+U4F/jrv
         ZE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707762984; x=1708367784;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXKqSYyybXp6uV6dewa2nvBTpPzl9LPRGTDSAu1cgDM=;
        b=ccyZi/uYLES9v3NYMCnC8+SzWURUpWdXWW02rEU3kMI5u3Q8lHDHnm3RVt+QLlCbpY
         aSUDjGcaHR297Fcx9UXPLQ1blnlXVAaR6XQjbocEVBI+wv9W0CaLe2al08T/lW6Acl7Q
         8hIEpFJHtcadVL9z/CAqXkcECm9ZPvv/XnTKuyRP/d0h+NpnOM2TAKUElpgnV2GfN4w8
         A15x/OmXcfakl9Elz7orVbEyW5tuiYXDnXv2Xep1uRSKmqDPtaz4Bf+1sjCm5MJ6ZwII
         BujtA1K48+o7gJGxtyg/yfwVoHmbhKyFn8oz775W3vfvSlFXz2VoYcJsycD1IsI8qcMi
         By0w==
X-Gm-Message-State: AOJu0YzjtKdOKHu7V6y5CG4qUYtOmv7tOuilP+O+KsrO8lWr5F1zw1VI
	1eLr2ez6+14//YxdhgHg7CjkOEmtyailWN8jRuezz+KuFTWU/B7lDmsL9TN36vtHsZEdSxA5x6k
	kDGjfiiZOtvDDwRXViPptOefmDj+vpyLzDgjKPHmueK5CL8sYZmI=
X-Google-Smtp-Source: AGHT+IEGZANl6emZY1UqGcSik514xyBzWU+XBPYnRHQZC/PhIexcuWbWZ04L9aeTVXS9UkOAD0ILzGf2zegYmfLzUl4=
X-Received: by 2002:a67:e445:0:b0:46d:19df:f3b2 with SMTP id
 n5-20020a67e445000000b0046d19dff3b2mr6250849vsm.7.1707762984219; Mon, 12 Feb
 2024 10:36:24 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 13 Feb 2024 00:06:12 +0530
Message-ID: <CA+G9fYuRwO6FLZ4do1wR0RdiZh9NGpRLKckQcKN2aAkqBH7k0g@mail.gmail.com>
Subject: Powerpc: ps3av.c:(.text+0x19e8): undefined reference to `video_get_options'
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	clang-built-linux <llvm@lists.linux.dev>
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
Cc: Geoff Levand <geoff@infradead.org>, Dan Carpenter <dan.carpenter@linaro.org>, Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I encountered the following build warnings/errors while compiling the powerpc
kernel on Linux next-20240208 .. next-20240212 tag with clang toolchain.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

powerpc64le-linux-gnu-ld: drivers/ps3/ps3av.o: in function `ps3av_probe':
ps3av.c:(.text+0x19e8): undefined reference to `video_get_options'
make[3]: *** [/builds/linux/scripts/Makefile.vmlinux:37: vmlinux] Error 1
make[3]: Target '__default' not remade because of errors.

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2cFkli5H02fikrpga6PluAWLAMa/


--
Linaro LKFT
https://lkft.linaro.org
