Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 111EBCFE43
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 17:59:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nhr34j97zDqQT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 02:59:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.208.196; helo=mail-lj1-f196.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nhpG4YWJzDqFJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2019 02:58:12 +1100 (AEDT)
Received: by mail-lj1-f196.google.com with SMTP id l21so18142378lje.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Oct 2019 08:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ab5F2pwpqc92h3f3ztS+IDWHOoh9/XiB514cOnglgi0=;
 b=svNwT+Tb188cZaer+Sx8vwgWEpJmW4+1Te2xzSYqoDB0mazAnohkKXoVmyy1GHEkEi
 ABBJQi00kVVpTItTIWyihj/eTEZPx4F9OXw6WXuoFPazgtmStp2Jz37yID49qLcdWsWk
 YwZPIiDWeRLuwQc/jo8fAZzPHhRr+jKadOP8tRN6obNa5QCn4LbRCHaDYG1NTXnXbmS1
 cRHWGRpL7nJeld5AfvZZGTq3ah8BKCGcuw3p8+UwtzPxICoLNkry9Hg5BhBpq5+B0lRz
 A1jMpErn1swROc/kHSaaVbFKmky4pZxbuB/YqGSS78PcAEeYdvBH1fsHU4kYEn/0p92C
 zO/g==
X-Gm-Message-State: APjAAAXl+GM18wjoJJ//LdoQfdifKiZj4LHa+LHOpmNhWbKNZPAFTkiD
 5mcE1Qr3yJg6l9LhIzQKk9UOAVaBevczJBUTrRM=
X-Google-Smtp-Source: APXvYqwxV2LEz1UdCa3FMvPOFSbvTv7gdUYe9fG/J+gzm1FEJsUueqZ16mbvgHnpFXX7AY7SBWqGM2Z3KF20ATOLDcQ=
X-Received: by 2002:a05:651c:1032:: with SMTP id
 w18mr20289889ljm.256.1570550288646; 
 Tue, 08 Oct 2019 08:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191008141342.GA266797@gmail.com>
In-Reply-To: <20191008141342.GA266797@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Oct 2019 17:57:52 +0200
Message-ID: <CAK8P3a1Ed7Lt-W4gVDVo+atxFNgNhOrLtipJEaOXgWYp6OAnjQ@mail.gmail.com>
Subject: Re: [PATCH] spufs: fix a crash in spufs_create_root()
To: Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
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
Cc: David Howells <dhowells@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 8, 2019 at 4:13 PM Emmanuel Nicolet
<emmanuel.nicolet@gmail.com> wrote:
>
> The spu_fs_context was not set in fc->fs_private, this caused a crash
> when accessing ctx->mode in spufs_create_root().
>
> Signed-off-by: Emmanuel Nicolet <emmanuel.nicolet@gmail.com>

Fixes: d2e0981c3b9a ("vfs: Convert spufs to use the new mount API")
Acked-by: Arnd Bergmann <arnd@arndb.de>

>  arch/powerpc/platforms/cell/spufs/inode.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
> index 1d93e55a2de1..2dd452a047cd 100644
> --- a/arch/powerpc/platforms/cell/spufs/inode.c
> +++ b/arch/powerpc/platforms/cell/spufs/inode.c
> @@ -761,6 +761,7 @@ static int spufs_init_fs_context(struct fs_context *fc)
>         ctx->gid = current_gid();
>         ctx->mode = 0755;
>
> +       fc->fs_private = ctx;
>         fc->s_fs_info = sbi;
>         fc->ops = &spufs_context_ops;
>         return 0;
> --
> 2.23.0
>
