Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CCF596317
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 21:26:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6h2q03fPz3bry
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 05:26:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Il9X/STp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Il9X/STp;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6h245JWdz2yjC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 05:25:30 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id 24so10097142pgr.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 12:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=a5SjQ9AEC/AYbATxtS93Zgv94cT2xe13yj4SFSKvsIA=;
        b=Il9X/STp6V9jcUaGx2WOrl/2yrZHrsz8cT7ebvlampboepQs9dAGad0VvgT4Olatjk
         OlDXwGxAQgmZiUQHOpJeM8neJBE8yN5R1PrOofZJcNJ1sDP2dSicGonwkrMYrdOqqmsW
         p1Ly68BgWg5AoIE0+KzMypl+WrEopij9J65M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=a5SjQ9AEC/AYbATxtS93Zgv94cT2xe13yj4SFSKvsIA=;
        b=ICrbCb01zfyRaaEdiFsfruMI08AqDJ68W3fD04t2Vcp7BlOPSMMnPuXeo9sUuB10EL
         reO731q2pLq6GvoiWSDNk8qY7F6IN6YBpqo9BEN/l+cgS2xev4/h5fr3xFK+KJjMhgU7
         sxgJX7LvZwU+SOp9meg15Ln4WBwHQ3NHYKuKC8FLSvVZGHsCfWMh14T+gs0xkdYNpQn1
         AiYn9RMOWAFOHMTg3tLCfRM7FAKd/FmME4eUOe1cgreqysygV5ZV+doTpHWYcLpLNJ10
         6gB8hDnBM3EY3Q4hgWDm7JBngrTjGQS3GhyKP8HfhISSR21Sl0w5e4FuQU6rRQqO+Wd/
         LZSw==
X-Gm-Message-State: ACgBeo2rvHbhQWM77Uu83T4tUuNNAWLeJ62vgZYWcGb2D9P+yeEReAs5
	+buJ6+4dMpPy191Jn2FlDySr8g==
X-Google-Smtp-Source: AA6agR6WWo3/u3APAWhN8/0GZ1YW43LvZbtp82A+6RH1w8ZWfwDxYgvZvBY+tvcaBAYnXQRFDompUw==
X-Received: by 2002:a05:6a00:189d:b0:52d:d4ae:d9f7 with SMTP id x29-20020a056a00189d00b0052dd4aed9f7mr22322238pfh.18.1660677926802;
        Tue, 16 Aug 2022 12:25:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m9-20020a17090ade0900b001f3162e4e55sm6643744pjv.35.2022.08.16.12.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 12:25:26 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linuxppc-dev@lists.ozlabs.org,
	linux-hardening@vger.kernel.org,
	ajd@linux.ibm.com
Subject: Re: [PATCH] gcc-plugins: Undefine LATENT_ENTROPY_PLUGIN when plugin disabled for a file
Date: Tue, 16 Aug 2022 12:25:08 -0700
Message-Id: <166067790682.7084.237943534143309650.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816051720.44108-1-ajd@linux.ibm.com>
References: <20220816051720.44108-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: erhard_f@mailbox.org, Kees Cook <keescook@chromium.org>, yury.norov@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Aug 2022 15:17:20 +1000, Andrew Donnellan wrote:
> Commit 36d4b36b6959 ("lib/nodemask: inline next_node_in() and
> node_random()") refactored some code by moving node_random() from
> lib/nodemask.c to include/linux/nodemask.h, thus requiring nodemask.h to
> include random.h, which conditionally defines add_latent_entropy()
> depending on whether the macro LATENT_ENTROPY_PLUGIN is defined.
> 
> This broke the build on powerpc, where nodemask.h is indirectly included
> in arch/powerpc/kernel/prom_init.c, part of the early boot machinery that
> is excluded from the latent entropy plugin using
> DISABLE_LATENT_ENTROPY_PLUGIN. It turns out that while we add a gcc flag
> to disable the actual plugin, we don't undefine LATENT_ENTROPY_PLUGIN.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] gcc-plugins: Undefine LATENT_ENTROPY_PLUGIN when plugin disabled for a file
      https://git.kernel.org/kees/c/2d08c71d2c79

-- 
Kees Cook

