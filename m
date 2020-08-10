Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E942413A0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 01:13:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQWx14J2xzDqTM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 09:13:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YOm0rklr; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQWtz1k4NzDqR7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 09:11:55 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id r11so6556481pfl.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 16:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iyYx+79mwCrZYi3nlfml4tfsSp9D2+EXuOvJ+LHVxHU=;
 b=YOm0rklrG+M8yFJVFuQfstvRO3v/Hq2XyONxrwKB7WZOa58+I2waQdvBPnfANWEeWd
 v5WN019344fkBd/eUIc5q/mc3sglQTBGZDEbM8ImbMp2WhdkG5RRxU7pqJnJaPrw3WCn
 +VCZvNgkDjq9REtEPH2RI17kTTXfMsoGMrpDtzTMLDGVK/Hs4tuMJinvZbhtK5F0CDfW
 vD2Lf3HLMgqNmaMxZfzFed+8IPMFkA3udQF3G1LCYaCNG0raW05Dxr9MbiCOHu/8QXal
 0WXPqS2vz1Z7OsqX/2vdlYryvbQk7whq3a/jKkt4UUUnuIODEDf7pXoMTvj+s4CZjfqc
 IVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iyYx+79mwCrZYi3nlfml4tfsSp9D2+EXuOvJ+LHVxHU=;
 b=h3scjaAS6rMODQtAPl/xfgE2rUVQbaA2fVahljK3aQky8N6psjPPSwnzpB3bNq6lTZ
 rWRtQ0VoVfQN2deCBSsSmsCBDjMNCnGpn4bzQoog2bubOtC83FZAVAWV1iVPl21pgFyt
 vAL7dpADB7Zpdm1xMn6Bo45qQDvcMCNHZJdHH6gBkxfZAqAT6TxiDH3bAuXq3zJF0/bF
 veYXC1k3Ozh4ZqVxEBtFwan5jlHhG9eqX8e1eY0xHxYGmxwNKesLS1ULoA1Gbp1qLmum
 BEMmEqGw3OohVhkX3OoXPwV+L2rtm5A0DnyYTO8gRDHW20dzZe2/QmySA6t5pnFrgowe
 Sx+A==
X-Gm-Message-State: AOAM530/mVmwtFci/PeAYQ3bt5eoRvCcKgBSaKrdOY6Z0SSGEQmGFkM0
 YFxkpPw+miTwKtvP47sS+EA=
X-Google-Smtp-Source: ABdhPJyuVXKLUZzlX+04asv1rO5NDwf3RYoPK3yQ/Y5WBimvbdL5XOOKrIANZFoQMNYFlRtNl7BTDQ==
X-Received: by 2002:a63:705b:: with SMTP id a27mr21206295pgn.405.1597101111429; 
 Mon, 10 Aug 2020 16:11:51 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id y4sm19161705pgb.16.2020.08.10.16.11.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Aug 2020 16:11:51 -0700 (PDT)
Date: Mon, 10 Aug 2020 16:11:45 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Add -EPROBE_DEFER check for regmap init
Message-ID: <20200810231144.GA16645@Asurada-Nvidia>
References: <1596791682-4311-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596791682-4311-1-git-send-email-shengjiu.wang@nxp.com>
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

On Fri, Aug 07, 2020 at 05:14:42PM +0800, Shengjiu Wang wrote:
> Regmap initialization may return -EPROBE_DEFER for clock
> may not be ready, so check -EPROBE_DEFER error type before
> start another Regmap initialization.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
