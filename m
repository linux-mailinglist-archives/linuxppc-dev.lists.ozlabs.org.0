Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7513E42171
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 11:53:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P2HR6s7pzDr5d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 19:53:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.193; helo=mail-qt1-f193.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P2Fn4c6YzDr1C
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 19:51:41 +1000 (AEST)
Received: by mail-qt1-f193.google.com with SMTP id h21so17828913qtn.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 02:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MsS2zjAtz2/RHX261bCXw3o3t0glrhV60YubFfcMrXo=;
 b=E8S8FpcdXBNwEra/DK7XNHiKGz/7TPpkRiTJgKlZ2P/8+sSdG77xMOtngqbH4VLMUt
 KEH5hHq/fw1H38Aaa4hlx4oifDMWuR7q+zKc6UCvPZoJQKJ4WqNXJCQ1xckEGLosnbQX
 3y9MUeJKnu9feTPjUmpjtZBGDcjYEAAno7iimlbWd5MSM9P+K6xLm5dhdgyrWHjmuqRB
 iS1qSi3OshX8y0kEKP4M3dqRHQQ1xy6DnESzsIPD1UhtL1jGw+OgZizBKKEIyx9pqld/
 a+5xp7ywO7eAtK/OnwhmQjMzLWOm82BR5oLde4RTlGKIemx+Mv/mzNL1WRiJiXhod8xD
 4XqA==
X-Gm-Message-State: APjAAAV6nJKMKnPdwkXPGKS2mqUv/dSdZ/1ckudyRvSiQVYlmGcAobTU
 eIwl9OvH0Oy0aQnJ2OIzrlzAOVnmrWhf72P0z6M=
X-Google-Smtp-Source: APXvYqxtOsPgKJeZqoOW4U1KGZxgCJkWOpAo/NnnA5Xt851IFkpQJiGQzHnu54c5uYfso+a1ZekmQk8BHoX0w/qdo3A=
X-Received: by 2002:aed:2bc1:: with SMTP id e59mr49125846qtd.7.1560333098136; 
 Wed, 12 Jun 2019 02:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190611181309.GA17098@kroah.com>
In-Reply-To: <20190611181309.GA17098@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 12 Jun 2019 11:51:21 +0200
Message-ID: <CAK8P3a1otKxoJUNH=-tZfzFy9qzQQc61i8AZPh-L7e-Ybd8kpg@mail.gmail.com>
Subject: Re: [PATCH] cxl: no need to check return value of debugfs_create
 functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2019 at 8:13 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> @@ -64,8 +64,6 @@ int cxl_debugfs_adapter_add(struct cxl *adapter)
>
>         snprintf(buf, 32, "card%i", adapter->adapter_num);
>         dir = debugfs_create_dir(buf, cxl_debugfs);
> -       if (IS_ERR(dir))
> -               return PTR_ERR(dir);
>         adapter->debugfs = dir;
>

Should the check for 'cxl_debugfs' get removed here as well?
If that is null, we might put the subdir in the wrong place in the
tree, but that would otherwise be harmless as well, and the
same thing happens if 'dir' is NULL above and we add the
files in the debugfs root later (losing the ability to clean up
afterwards).

int cxl_debugfs_adapter_add(struct cxl *adapter)
{
        struct dentry *dir;
        char buf[32];

        if (!cxl_debugfs)
                return -ENODEV;

It's still a bit odd to return an error, since the caller then just
ignores the return code anway:

        /* Don't care if this one fails: */
        cxl_debugfs_adapter_add(adapter);

It would seem best to change the return type to 'void' here for
consistency.

     Arnd
