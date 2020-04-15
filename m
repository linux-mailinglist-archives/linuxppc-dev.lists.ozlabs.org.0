Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D921A923F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 07:02:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4929GP1tvpzDr2w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 15:02:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cmpxchg.org (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=hannes@cmpxchg.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=cmpxchg-org.20150623.gappssmtp.com
 header.i=@cmpxchg-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Tcxzc6xC; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4929DV423fzDr1P
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 15:01:12 +1000 (AEST)
Received: by mail-qv1-xf41.google.com with SMTP id p19so1122703qve.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ef3HLI/XX5ogd42JRuoGnEbb/Ln3ZxgvuLj5jaeUWkI=;
 b=Tcxzc6xC3iVTZShTUf3CIv3N8B5ZyCbru12fLV5+tpVooL5/Bo3MM2R4w1+y/qKNnw
 9lu0zJBRs+VK1Bc14YzwiZC+K/efs95VT8GzxaoJoz3t2WhfDZxWX+BgsMNU20r8wRPv
 WS98QN/V8NZIzymtO0juNqdA9Tg6/2OTyjU7Zm1KL9ejebzf7wo1d0uOEsRrlg17M8fg
 qYmffi6H6MwGLJe4epZjwPPvjWIdIXS0xtejpuhYYUqQSrz2GfoywvJh6tC6sCJVyKe7
 xzOQhWdIv/o82YQJCk9DtMPUw2B8iLWuNwugd4l1OepDEbLixuOHRPHRALsrInJO+Rsn
 o1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ef3HLI/XX5ogd42JRuoGnEbb/Ln3ZxgvuLj5jaeUWkI=;
 b=TJH79Xlg1PX1hIl/KsM3RPgVpytNLNpeN9g7nbNpnDnJnTgSzVg+rHKyO4JnKefrk5
 1ZpWCsvETrBtt3C0r7klJm6Aov7X7OCGCtzae6OukmWcMfItxHX8pK5TKepFSJY/eZ6n
 5V2d+1AFwjCRboC9Gcpe/+KLCQkJE+2Bxvv9sJnzitlWfjzWzqum8ploE++xZrHiTzMt
 hJG1FmTc45wY/2QjQ5Mkugz+4yPLSznVnIut1R4v4GnLYCYrm87xcd0pKFy/IwHz//wE
 haowPh4UiXAhtl38wo8rCnrsGvjpsScStJxr0PdetXIawLfy42tKdo3kovMt8APKB5nx
 pSrw==
X-Gm-Message-State: AGi0PuaXxwK9KJTmusy+GQKkVYZmye/30ONsaY4eopzkv5txw7zDrQb8
 0+rCPykObQFlnjabdbNHTKJgmA==
X-Google-Smtp-Source: APiQypJRjg+PyUSZjrIkjpxdMfgyPb9bMEWnffTFRMxoE1aQMUITXzNurR0P/0BN6q0H0W5xTyhSBA==
X-Received: by 2002:a0c:e88d:: with SMTP id b13mr3243342qvo.245.1586926868219; 
 Tue, 14 Apr 2020 22:01:08 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::e623])
 by smtp.gmail.com with ESMTPSA id 10sm6168833qtp.4.2020.04.14.22.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 22:01:07 -0700 (PDT)
Date: Wed, 15 Apr 2020 01:01:06 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 1/2] mm, treewide: Rename kzfree() to kfree_sensitive()
Message-ID: <20200415050106.GA154671@cmpxchg.org>
References: <20200413211550.8307-1-longman@redhat.com>
 <20200413211550.8307-2-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413211550.8307-2-longman@redhat.com>
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
Cc: linux-btrfs@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 kasan-dev@googlegroups.com, samba-technical@lists.samba.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 James Morris <jmorris@namei.org>, Matthew Wilcox <willy@infradead.org>,
 cocci@systeme.lip6.fr, linux-wpan@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-integrity@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 13, 2020 at 05:15:49PM -0400, Waiman Long wrote:
> As said by Linus:
> 
>   A symmetric naming is only helpful if it implies symmetries in use.
>   Otherwise it's actively misleading.

As the btrfs example proves - people can be tempted by this false
symmetry to pair kzalloc with kzfree, which isn't what we wanted.

>   In "kzalloc()", the z is meaningful and an important part of what the
>   caller wants.
> 
>   In "kzfree()", the z is actively detrimental, because maybe in the
>   future we really _might_ want to use that "memfill(0xdeadbeef)" or
>   something. The "zero" part of the interface isn't even _relevant_.
> 
> The main reason that kzfree() exists is to clear sensitive information
> that should not be leaked to other future users of the same memory
> objects.
> 
> Rename kzfree() to kfree_sensitive() to follow the example of the
> recently added kvfree_sensitive() and make the intention of the API
> more explicit. In addition, memzero_explicit() is used to clear the
> memory to make sure that it won't get optimized away by the compiler.
> 
> The renaming is done by using the command sequence:
> 
>   git grep -w --name-only kzfree |\
>   xargs sed -i 's/\bkzfree\b/kfree_sensitive/'
> 
> followed by some editing of the kfree_sensitive() kerneldoc and the
> use of memzero_explicit() instead of memset().
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Waiman Long <longman@redhat.com>

Looks good to me. Thanks for fixing this very old mistake.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
