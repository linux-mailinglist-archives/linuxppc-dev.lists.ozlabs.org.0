Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B5423C40E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 05:44:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLyDX55sczDqdn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 13:44:44 +1000 (AEST)
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
 header.s=20161025 header.b=qIlbbKG9; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLyBv0XKNzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 13:43:18 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id ha11so3561776pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 20:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iQ39NfCRpC8old6W/LK5W1TFVyUKRmxvr/lOL0aiW4s=;
 b=qIlbbKG9h9yj25xaWWwslH5pEhAoXFvHvxxdw1Lh1QPQZU8yZgiaKSSZO+XsBwLO3J
 G9rr6Qo+kjErZl0BXLMensSNIEAHM110mIuipHLfCax3qtPL4K3UOxdHndx4RxuWqTYC
 u5Lm+wo8vzZeubksd+gF5yl0FATX/WAkjgvQBr8N5sgvFRwkFtjOivoNTaGHqKs/kVS+
 5ksKFDdTm3OyzEH/RgiiTds8n0fs+AUtam5cKALYneqHx0XA+juoBXXQAc5k2hDdO37d
 av8tQClndNBX0wGCNWWreOaQJ/aExs5UDhWiK9b1oQO5knq08q+RZZw57834nQAxNvB8
 R3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iQ39NfCRpC8old6W/LK5W1TFVyUKRmxvr/lOL0aiW4s=;
 b=Uw+EV09EgtK6DzlAE58IQIwdbPRIU6dlDkMOJjYo8UG4TukAHjOVHfE4EJPOut2Q+m
 cRKYaJTSZx48oqF07u1SaQFq8KfpFkiZTNb+IUXP4w86vwjXFqSp9LhejE+b34wbDTSK
 u0EI2SWHbILKKQTAuWnwdks7rO+RXGnRO4m1I3c0irHQylspPTf5NSeY4pI7dqD4Sk7o
 i6xPIow/4A/jTK8NZvEdXPwj0z0OcOKc6A2vQ87FvX+4LOLpQzPrBhGZL6uiVQCrrMmr
 9grfYe01DP1ZGhw0L27Plbx4YpJvva6oqhsz5SoCpFjgUoPsKEACDPXXDBMYpXrXlZol
 ul/g==
X-Gm-Message-State: AOAM53132kc1WLXe6qul5zv/jFBfpYexXSxFYuYJRnAeMIvwnD+ja9sA
 7d9nA5q7eELkPUFCkBagvgU=
X-Google-Smtp-Source: ABdhPJxqLYWvll9i8XBUjWuZrkB2d4SKoLlGUSOgZFb5VKeAkUJl9BcJtGw96aePleICT4meo2KXVQ==
X-Received: by 2002:a17:902:9f85:: with SMTP id
 g5mr1222539plq.13.1596598994895; 
 Tue, 04 Aug 2020 20:43:14 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id b13sm879344pjl.7.2020.08.04.20.43.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 20:43:14 -0700 (PDT)
Date: Tue, 4 Aug 2020 20:43:00 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 1/2] ASoC: fsl_sai: Clean code for synchronous mode
Message-ID: <20200805034300.GA10174@Asurada-Nvidia>
References: <1596594233-13489-1-git-send-email-shengjiu.wang@nxp.com>
 <1596594233-13489-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596594233-13489-2-git-send-email-shengjiu.wang@nxp.com>
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

On Wed, Aug 05, 2020 at 10:23:52AM +0800, Shengjiu Wang wrote:
> Tx synchronous with Rx: The RMR is the word mask register, it is used
> to mask any word in the frame, it is not relating to clock generation,
> So it is no need to be changed when Tx is going to be enabled.
> 
> Rx synchronous with Tx: The TMR is the word mask register, it is used
> to mask any word in the frame, it is not relating to clock generation,
> So it is no need to be changed when Rx is going to be enabled.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Can you rename the PATCH subject to something more specific?
For example, "Drop TMR/RMR settings for synchronous mode".

Please add this once it's addressed:
Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
