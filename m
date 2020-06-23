Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E747206873
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 01:32:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49s2cn679dzDqfC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 09:32:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C6iShYJW; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49s2Zr256BzDqbD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 09:30:43 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id k6so149895pll.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 16:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=89qgK7zoxJ0CxIlIbUd135zUy4sjIO0yIPQYW2bQXdo=;
 b=C6iShYJWie7aVa8GVkryo9BBNF5E6UroklqVgSNbUnmSrvA/2+VZNYJpL3shXp5iRK
 YOa71XUddAxmNPhn1KQICzn6sn8ghlmd8u8IPSmWoIj600lgmpjGm/BJzz2+0x6nymui
 xrNQR0cWvVWYaYEihMFcAHbwekRqpAHoivNOD0YJpsLbMqrfhnomGqCk+9sqB/vNzExS
 xcLmA6sRW5m1GbHyQUampD5E8um9yye/cBHTyQ9xOryjd+talV+Xz97xMPw5blS8EJMV
 g43wyqAInEAQSVWC5w90SsQ8Hu3XeyKxUd+rcxLhypmbpHewByKemSeuEd4RuNost1ls
 W9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=89qgK7zoxJ0CxIlIbUd135zUy4sjIO0yIPQYW2bQXdo=;
 b=H+lkP0su+lJKo6dcpCIl6KnqLlNG8VVkKqa+pzN3W2rctrVNMWu6CGmOD5LvojPe/I
 oQ3b/R9FnzafRGQ/IqdVtY7deKzyvsv8gnTXlHuelyKEnLplXRgDyuY5HHoO7futNKD3
 YgedD604esLCLkCiexMRGaCVyXmxJKc/+92rxx54BTBl0v5AkkjBjHNdcrKBOWlTcFDs
 vwnBthjd6Ieptarq4tnbhvFj+eaBq8Jxna16Onjq7LZ74orG8zi0FL5rTLlYRzI+xTIv
 r7qD205TT+7Pf7CNU5Hw3nv3mHm5F93ObfjHi4U/Ru64LfPUPKxgi4Ta0muCCKroKug1
 GO9w==
X-Gm-Message-State: AOAM531I2SJE6z4UIvmPPNAAGNg7kaU38LU1m9Xzw5ZJTbt/i3xsx5WX
 MiDSvke1TH6Nv4XGwmcs85I=
X-Google-Smtp-Source: ABdhPJxaKkxXXN2/KWbYMt8R19keUrj+/zo74qexOzyZbqDPwyo6rkVti8N8GMoMRPk/tKDyOyMfaw==
X-Received: by 2002:a17:90a:7608:: with SMTP id
 s8mr27397634pjk.159.1592955039921; 
 Tue, 23 Jun 2020 16:30:39 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id u35sm14655786pgm.48.2020.06.23.16.30.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 16:30:39 -0700 (PDT)
Date: Tue, 23 Jun 2020 16:30:11 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl-asoc-card: Add WM8524 support
Message-ID: <20200623233003.GA28038@Asurada-Nvidia>
References: <1592895167-30483-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592895167-30483-1-git-send-email-shengjiu.wang@nxp.com>
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

On Tue, Jun 23, 2020 at 02:52:46PM +0800, Shengjiu Wang wrote:
> WM8524 only supports playback mode, and only works at
> slave mode.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
