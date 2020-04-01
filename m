Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B1D19A8B3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:34:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sgxj3w2MzDqml
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:34:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sjmeoWUL; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sgCZ5NcRzDr3t
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 20:00:58 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id m15so2414877pje.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 02:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=G5w9RBvrR3WV0wIE+sZQB1JGP6d9WKUVbo/9PkL3ClU=;
 b=sjmeoWULrkH1tiyyfW9jHoKfBl3e7nyRSF1aUIblVFaUN/mu296kgU21YgdIGWfn+h
 zdURn18aS4+snbifdkA1s8BDLF2XTBAIZiLLvnZzpJ7Z/R/5ZPGja9hFa9g/lFBdu6u1
 h+D5feCaKVjJtUQWO+hmHyqgbmlwfb9+PWujHtTL1phLMdPyxe8xvOpLGayNk8KKHKBt
 zynsSQExMsahWUIXTBddC8Zele2NgjqgiirumN9kWYEoaDFCrwjOSdab1kDdwjlN3qop
 vnG8sC7/w9Lu5S3owEeowz43YC4rYgr6lpvyvSUakiOEb0XDaDVBwV/EFKJbOTucUzRu
 Wo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G5w9RBvrR3WV0wIE+sZQB1JGP6d9WKUVbo/9PkL3ClU=;
 b=NL3LmARroozUPrRS+IoDasHhiY5LjHf2/YUGXAw/myqWSP+wIM1PL6ra/3SSLrLI0K
 XkR+GqiaqotM7ByfGX4yoaUul7hEa2BoloQzoPO7UvpHEdIVgduOsQT0eMNzLHQaasYq
 mdIJcdkt78dyazNZL9Ps81VfD4WazKJ+JlbbjeFGclMk7NZg36iVJLUKphUat3EYQzdR
 Uy8goKMhDZhtCtx4mZuLLPInykHy2KGMUTTEcGdfWFj8r/kWS1b1mfNCmCRI5dOZLTND
 kYnrVcrnbCagvoIEeL7omMXUeu+DSxwUf5QrHETdcjj98eqgYNY9YzGqVLkEpKgHfEdo
 wamw==
X-Gm-Message-State: AGi0PuZqZRrfLOUnQj6eBWSpJ/7RjmK3aIwKt3avsroTXrTdsWE2Qj1t
 I9cfRo0AuEGLf4laXw1ivO0=
X-Google-Smtp-Source: APiQypIG0HKQpeV9kSQbddQPBmsyGFCl3XNlZOs5/znCA1arlAiyTU9vFRvbsaVa5Utw0gmcOea2XA==
X-Received: by 2002:a17:90a:e64e:: with SMTP id
 ep14mr3684476pjb.149.1585731654177; 
 Wed, 01 Apr 2020 02:00:54 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id g11sm1064804pjs.17.2020.04.01.02.00.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 Apr 2020 02:00:54 -0700 (PDT)
Date: Wed, 1 Apr 2020 02:00:50 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v6 1/7] ASoC: fsl_asrc: rename asrc_priv to asrc
Message-ID: <20200401090050.GA7202@Asurada-Nvidia.nvidia.com>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <4a808f376c297f91da0caff9d0f73efb6f152e72.1585726761.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a808f376c297f91da0caff9d0f73efb6f152e72.1585726761.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 01, 2020 at 04:45:34PM +0800, Shengjiu Wang wrote:
> In order to move common structure to fsl_asrc_common.h
> we change the name of asrc_priv to asrc, the asrc_priv
> will be used by new struct fsl_asrc_priv.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
