Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6AD1E535
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 00:40:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453Xgf4Yw0zDqNv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:39:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::e43; helo=mail-vs1-xe43.google.com;
 envelope-from=slandden@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dEl4sU5q"; 
 dkim-atps=neutral
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453MG15mXYzDqHn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 01:35:34 +1000 (AEST)
Received: by mail-vs1-xe43.google.com with SMTP id j184so1051686vsd.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 08:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=980y18YdjmALl59G6hcP6zEimSkBXdkpnfC5LT9sZPA=;
 b=dEl4sU5qCzg39opWx9sKU946SAsOAgMnj986H5geqhuO5V5aOb14kg8ib3YOfp+xp0
 oCLeBgPlt1A6ExI43I+0UI8Rw4XzWRzfw4HbeuUOpBTW1Gl+J9ykR3AhCrGbFIqDOXqD
 MansgszdcVbH5jBSN+Tminsuduc949LyAim6qqLQxo7OkNuCWi+ir+PEeqAduOCz0Pnd
 IvWiw/3tOSFnIGwKCGg7m5G/KJ6f4Wj0JcL5aIztSzHfAccblQEdORm7MfujPTYM9Ref
 Xu1b2iPuVe+4ij3QVNPJ7GhkP0HQ0NPPYYObP8KQe4yDlfYOdVEK3YOoz0vjfUBsGyJG
 jvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=980y18YdjmALl59G6hcP6zEimSkBXdkpnfC5LT9sZPA=;
 b=AMrk61HjC+WCZhskRMaqR93S1v6AUTgtBmPg58cPaPvgEKggIrTAOm+BqRIy1wAlxu
 sxfVuheeSn14IBDa8B7QJrsNRCzPFgq23PbRT5FezWp+sfGKYyiLqq/cOxf3pd0nuAeM
 bPNbKF8IPryYyShHRDUH/M28qaDBBJSCSnVDErKznQke92VyIYQovIz2XJn5DDAcJJYr
 Og7uB3rxBCWlEPUJndZn9Q7/OycrHtBHEbDPb03mrpzv3VAoSXDTk4s7auttvDKThh8K
 GzLsilvl/ETEejaHupQZjqO4MliLhxdGEf3jUxS6rqZ0/xAIsU8F/VB57DbkkCQQjI//
 SIrw==
X-Gm-Message-State: APjAAAX9RnLnoZ3kfCNo+vey9lBmQ1P/ZCDAaHb3K4CmrLF9J2wOhQkZ
 000XE6lAfgfxXM+PmeJ7rAziywN5O3ZQL2jeEl0=
X-Google-Smtp-Source: APXvYqwnvzd+/XMd6bd8zJb3YomBXzkYFkFjrmaLwoHy194H1LYhEzN4vDQ889gGZQZ3AbymJEk1SJG7USPvsrENYNU=
X-Received: by 2002:a05:6102:c7:: with SMTP id
 u7mr4187174vsp.226.1557848130976; 
 Tue, 14 May 2019 08:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190513005104.20140-1-shawn@git.icu>
 <20190514022308.32363-1-shawn@git.icu>
 <20190514022308.32363-2-shawn@git.icu>
 <5f31b4964d64aea3fc31165b9cbd0b9d16fd2aa0.camel@russell.cc>
In-Reply-To: <5f31b4964d64aea3fc31165b9cbd0b9d16fd2aa0.camel@russell.cc>
From: Shawn Landden <slandden@gmail.com>
Date: Tue, 14 May 2019 10:35:19 -0500
Message-ID: <CA+49okqe0CLOm7VXPiYp-33DjwkQ5TQXLUNrhuHiUQVBxaT2ng@mail.gmail.com>
Subject: Re: [v2 2/2] [PowerPC] Allow use of SIMD in interrupts from kernel
 code
To: Russell Currey <ruscur@russell.cc>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 15 May 2019 08:38:49 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 14, 2019 at 2:22 AM Russell Currey <ruscur@russell.cc> wrote:
>
> On Mon, 2019-05-13 at 23:23 -0300, Shawn Landden wrote:
> > This second patch is separate because it could be wrong,
> > like I am not sure about how kernel thread migration works,
> > and it is even allowing simd in preemptible kernel code.
> >
> > Signed-off-by: Shawn Landden <shawn@git.icu>
> > ---
>
> Hi Shawn,
>
> This patch doesn't build on 64-bit embedded (ppc64e_defconfig):
>
> arch/powerpc/kernel/process.c:194:13: error: 'interrupted_kernel_fpu_idle' defined but not used [-Werror=unused-function]
>  static bool interrupted_kernel_fpu_idle(void)
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
Thanks for noticing this. I knew what I needed to do, and this was
just sloppiness on my end.
>
> and otherwise adds two sparse warnings:
>
> +arch/powerpc/kernel/process.c:356:13: warning: function 'disable_kernel_altivec' with external linkage has definition
> +arch/powerpc/kernel/process.c:416:6: warning: symbol 'may_use_simd' was not declared. Should it be static?
This is the same problem as above.
>
> There's also some style issues (spaces instead of tabs).
Yes, I have to be careful using nano on a VPS.

New patch coming in 1 sec.
>
> Reported by snowpatch (see https://patchwork.ozlabs.org/patch/1099181/)
>
> - Russell
>
