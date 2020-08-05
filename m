Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8109F23C644
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 08:57:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BM2VN5mlPzDqjy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 16:57:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eB7I0ztJ; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BM2Sg0tm0zDqZk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 16:55:30 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id t6so3785101pjr.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 23:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SGZKUpYTKCkpMjR2/gp6H6g/7u9i9ZZGE+6qybYiQ1Y=;
 b=eB7I0ztJTU4WSthYXqaqoUu5nSugYMxc2h5yrlbERDylgNa5sZlC76hDkZJW/uGdnY
 ryKSBxW9gyHVLeTlXc6NsDiakiPlYlrOyMvJ/xlp1jS23dc0hXzSpa4Cl8FGA2UIilYA
 xGMU+MW5UDmVHJoqO/4M1gy3YcmzlczR8Qs7pwBwCQYHulXFSBfKNUF6DAjG7tHwurKS
 7hWQMmdU4QDHD8vWyntNOXjcA3mFqaj6QqyYjBEkYf1TZi4lLIy+F25pU0WA1Rj6B2y7
 ueSqb9UzN5PuY4e2y/IURP+J0HzudC0TfY1mYMtZYIEsE+gjxsAiOLOeySmE5XCqXHBz
 MfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SGZKUpYTKCkpMjR2/gp6H6g/7u9i9ZZGE+6qybYiQ1Y=;
 b=rATqZxV2Cdrd9UfTQeg8hVKEktWbUMyAu4ToxTmUnfMUmZ0terImIrnPMjuZ9XUNep
 Dr+8v86Rsj2eMJNSKzFDdy/4Zo31s1y8ASnaYi2B/ukFLBFNiQEl6ECSFk/gcKyJ6Dzs
 tE2Hz1oTXCvn/KL7NkqNX15/6dylL/IRtxVObL9Njkn7Tokv1u1c5PRk7zAqkvhdjSzb
 4+vfL+CeifGSesYNbeyKdH/QMNFmRM0o5B1P2htQYvH7K0L1DWy4AH6Wv61m8SYIsucM
 ePeT4pk8eQ21TXJUpeOdHpAB4gm5MEEJOb6yGXyzXJ9T+dnxT+P4xOlTXGoTbPGdlsAX
 EqYA==
X-Gm-Message-State: AOAM531sqFWCe+o7RtQ4L0bBpDA/KWQKkIcWK3eepg+lS+xf5H3n/Fc7
 WlsxnErYk8jiJbFPO7Prwww=
X-Google-Smtp-Source: ABdhPJx4V/D/s9pzIYwlx+8snhleVdhwnfP6tP4uC6/N2c5q73hqwxsDv7A3bUhT6kOfk3YclbwQTg==
X-Received: by 2002:a17:90a:c58b:: with SMTP id
 l11mr1847841pjt.195.1596610526653; 
 Tue, 04 Aug 2020 23:55:26 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id h5sm1835143pfq.146.2020.08.04.23.55.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 23:55:26 -0700 (PDT)
Date: Tue, 4 Aug 2020 23:55:12 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 3/3] ASoC: fsl_sai: Replace synchronous check with
 fsl_sai_dir_is_synced
Message-ID: <20200805065511.GA1131@Asurada-Nvidia>
References: <20200805063413.4610-1-shengjiu.wang@nxp.com>
 <20200805063413.4610-4-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805063413.4610-4-shengjiu.wang@nxp.com>
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 05, 2020 at 02:34:13PM +0800, Shengjiu Wang wrote:
> As new function fsl_sai_dir_is_synced is included for checking if
> stream is synced by the opposite stream, then replace the existing
> synchronous checking with this new function.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Nice, thanks!
