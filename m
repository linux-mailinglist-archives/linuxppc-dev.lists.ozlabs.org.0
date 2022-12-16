Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA53C64F5AC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 01:11:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYmc25Vz7z3bjX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 11:11:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=atuW7kj1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=vincent.mailhol@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=atuW7kj1;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYGYC1qwSz2xHJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 15:37:34 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 79so989141pgf.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 20:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XLygs21yUm+BsQ9K/jaILqjtoVN7cCv+GmldKd5jCoY=;
        b=atuW7kj1tICjX6XOEoGlMKRElIbgy8WI/deoKifcFx1519QZRpDCOoxmKj7EgE2l4w
         PKzJI7L2ZbVuy2LOhWOolJwT0c6HGC5z3GYIC7j6xM/AunIUu1/hMOhZv9S06C7VFhC1
         4Q2nDbmd0YUF9RndxPqP2p/GdMMZ3K4yhoxZk3FVJ0hYXbi4IN4jZVfHJrGPnQoXbTYJ
         YAB5z7iNwRy7E4EGbWHbVIEyT9ICXQ8iqfiE3z4SLn1NrJW7NLywpAeLKJB/g9wvfmaM
         r5jcdkMrnO+dY5EbBAyyZATVFCQYX6igkBalPuLJ6BkhstYEmOV58RsJNRueXOX7Ax8G
         6CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLygs21yUm+BsQ9K/jaILqjtoVN7cCv+GmldKd5jCoY=;
        b=r9N44lc5zfeSPb7VgZI3SDBloUrLdrvcn2keQblLN8Ow/ICb4A6lw6WiUfrNbv/Bbp
         s9uVY5UDwXV3HbP+y3gcf8IZonDiXpVLRWSos42DXgcCQGK87+bgrVSnXMy10S8ytP0i
         BKTDMW7KblTySrGeyXFVmsDxvBpT++1VcLE611qkSod5dWDBVZVjkYSfFc/N/57rEku+
         7hjyhhJbiKc+PZo+tSWWk6PjMaAMrZECB4W9dT+Mct/sw60edXvn6DsZtV+0wjeJan7g
         Qs+BxA0yJ8n+joz6U4gYJUG3vBml3IjVLiwOiJt9FJjck6UoQzRpckw5Ls9Rhd2za1/i
         sPYQ==
X-Gm-Message-State: AFqh2kr9aWRfNeDXbASk52+6QPrA+uUYW9rTW7lmaAa3FAyyQE0gsS5r
	lGyoU+2tB/Pahp5nj03v7fqTvTn7nv/N7zKIIXE=
X-Google-Smtp-Source: AMrXdXt5JWumad1PiboheGKsXmVaNjeH8snNXdAqZ+Iojn+pij8j6t8nwEgKCk6P8kauAlDPnokzu+Szv1Dew2bD4rM=
X-Received: by 2002:a63:584c:0:b0:484:2672:2c6a with SMTP id
 i12-20020a63584c000000b0048426722c6amr142358pgm.535.1671165451321; Thu, 15
 Dec 2022 20:37:31 -0800 (PST)
MIME-Version: 1.0
References: <639b23c8.DdUNqMCLdxZ7gLv2%lkp@intel.com>
In-Reply-To: <639b23c8.DdUNqMCLdxZ7gLv2%lkp@intel.com>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Fri, 16 Dec 2022 13:37:20 +0900
Message-ID: <CAMZ6RqJ7-GTPe7tNdhTYCF6OrnagfNL_7EXrhn5HD=YB8dtCGw@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION 459c73db4069c27c1d4a0e20d055b837396364b8
To: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 17 Dec 2022 11:11:00 +1100
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
Cc: kvm@vger.kernel.org, linux-parisc@vger.kernel.org, linux-arm-msm@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-can@vger.kernel.org, linux-xfs@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, loongarch@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue. 15 Dec. 2022 at 22:57, kernel test robot <lkp@intel.com> wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 459c73db4069c27c1d4a0e20d055b837396364b8  Add linux-next specific files for 20221215
>
> Error/Warning reports:

(...)

> Documentation/networking/devlink/etas_es58x.rst: WARNING: document isn't included in any toctree

A patch for this warning is on its way:
  https://lore.kernel.org/linux-next/20221213051136.721887-1-mailhol.vincent@wanadoo.fr/T/#u

(...)

Yours sincerely,
Vincent Mailhol
