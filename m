Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFD01E80FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 16:53:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YSHV5yKrzDqk5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 00:53:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=N2lJ9F/4; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YSBp3WLGzDqNV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 May 2020 00:49:21 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id x11so1234205plv.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IteRcXXajwbtNBJuddDZT526vs0ZDhNnSpFmn8yamV0=;
 b=N2lJ9F/4/3HpzR/J93sxrFdqGlVz2QNhGMFIycNuy00m6veP+w2xnnditHihQIFXnL
 XCqnug4fq5fbhUlWxzOjXXHpHuSdsRGl38B/e6pOTxpS3O0ArAhFReLuF1TrhT95SEC1
 m9Mxjr53v0I0p+Z26i7nqIoQoQyWYIDSUoGm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IteRcXXajwbtNBJuddDZT526vs0ZDhNnSpFmn8yamV0=;
 b=O8cVcwG5v2I+2wCHWmtEN3HqW47JHs6b9ojXINj/KqdUJy7mJhBouPRyUBGsc3gs9d
 ySWD+DS96w1081STIqGXUa3wQC7dS++NZ/ngIg6IrxWy4LgRt916NU0I3bb3P3llLqio
 KqWNQhs/Xg/vC0yk9H4McBSxpU3StWp96z3sIEd7b5tT7XwlEtXHzq3Trn8tE5Uy8Ejc
 8vLveuYB4tDpNwk5xXByYp+uRX5OlujRUT5EhnZOYVL4XTT3gHUroXDHQjjt86Pu9kpw
 SPRO0apGm7SZuV1V9jSSx/D/9CDez8FIsnFxxJZtYlMCY4C768VKd1ofYY2IXfmkSTI6
 cI6g==
X-Gm-Message-State: AOAM532b3VJOhYfRwRXZPqtTYaGuu01HJZo12aaK8olnbXEDF1GmMyCi
 mpy6aBWs3pu91mY+iiQGJxjIWA==
X-Google-Smtp-Source: ABdhPJzFHib1KyRD9/QyczMF6fwrQXT/kFQagYx7n1WCZ6zEYqL92DxL1gm98yo73HrZ3ypBekLGug==
X-Received: by 2002:a17:902:ab8b:: with SMTP id
 f11mr9427824plr.145.1590763757769; 
 Fri, 29 May 2020 07:49:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id w185sm1049497pfw.145.2020.05.29.07.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 07:49:16 -0700 (PDT)
Date: Fri, 29 May 2020 07:49:15 -0700
From: Kees Cook <keescook@chromium.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [Intel-gfx] [PATCH 06/13] ocfs2: use new sysctl subdir helper
 register_sysctl_subdir()
Message-ID: <202005290748.043EFFA3F@keescook>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-7-mcgrof@kernel.org>
 <202005290121.C78B4AC@keescook>
 <20200529114912.GC11244@42.do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529114912.GC11244@42.do-not-panic.com>
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
Cc: jack@suse.cz, rafael@kernel.org, airlied@linux.ie, amir73il@gmail.com,
 clemens@ladisch.de, dri-devel@lists.freedesktop.org,
 joseph.qi@linux.alibaba.com, sfr@canb.auug.org.au, mark@fasheh.com,
 rdna@fb.com, yzaikin@google.com, arnd@arndb.de,
 intel-gfx@lists.freedesktop.org, julia.lawall@lip6.fr, jlbec@evilplan.org,
 nixiaoming@huawei.com, vbabka@suse.cz, axboe@kernel.dk, tytso@mit.edu,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ebiederm@xmission.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
 viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 29, 2020 at 11:49:12AM +0000, Luis Chamberlain wrote:
> Yikes, sense, you're right. Nope, I left the random config tests to
> 0day. Will fix, thanks!

Yeah, I do the same for randconfig, but I always do an "allmodconfig"
build before sending stuff. It's a good smoke test.

-- 
Kees Cook
