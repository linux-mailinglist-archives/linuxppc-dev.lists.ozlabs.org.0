Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB6475953E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 14:37:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UNoXC15E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5b1y5bgTz3bfS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 22:37:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UNoXC15E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5b146fgMz2yL0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 22:36:55 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6686a05bc66so5067834b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 05:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689770213; x=1692362213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2RDjShEnxx2CITlna+cx0sylIfu7E+lS3FgCJq6HD0=;
        b=UNoXC15EsWDFkjQoZnZY4lnoy8K5+rhFAfW6hitGkvfYJI9XJCRWsq6EwAki92xBNn
         /0oNaXsP/U6xsEiDgwbrog7fQTwE44ZDy1Qc9+PakqjY/e060iSu39wJv0eCaG4ofmxa
         dxSGPtq9ty38PsG/f/1ovUpZ9a/EYlNZVfmqWaHcEUU6R/Sxt3KBeq596HpVP7kkVpqw
         l2Cfxab1A/Pr9AoE/4S2a4F2NtjXf9FnD0Z6MSiQTEGBCYAxXP+KEvV+Tw0z6MkQ0nCI
         O4uni1skj8s9mlYU1eju2GrB5H9lvVdkGajzazCX6NyCiGiHP2qSPrkZbX96jDsR2UMJ
         BRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689770213; x=1692362213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V2RDjShEnxx2CITlna+cx0sylIfu7E+lS3FgCJq6HD0=;
        b=CgJecJ17RAyhxplpzGOvHvgQ+IwgEPdAylKBjkmTBJ0scsdyqbPVVYi06V7sNlIW8G
         xLZMk0RF1MvwyeN/+Rnhgw/Mj3ZhdscCSuezsvIDxDmGFtKY/HBRdTqFIltZ30F+i7ME
         BtWONv54eLpmZgEDVOscqPAudvlE/8BtpH6xSCBU9j76izvM3O4oFBFiESXGwO4xfHMe
         tgWwR74eyGRJE4ICkkmrnEkkWcoqbUa/0P5JmZsjCAo9HMUbe+svJ83Hnj+9hjnQWguD
         aOepvRogmuQ2DyrqtxGMn/yKC5rL7WYbUw5V8XMHIT450vKtFoOSoMH+rNynhzgWQ8xY
         cL8g==
X-Gm-Message-State: ABy/qLYcNGqgxxRoHom7B8Qqz42OrIjUcv3tkcjGiaksH8lXAb/hUBqh
	B+t/xc3Y1K1jy3pCVstnXzKMqFuU0Rge+w==
X-Google-Smtp-Source: APBJJlEDIe9vpBDJWHhVQgQNRN7veJEG2fM1DUO/yd5SkFEj75LXilVEy9YB9KT/RL+4rZvyMDFjgQ==
X-Received: by 2002:a05:6a21:6da6:b0:134:40f0:5d04 with SMTP id wl38-20020a056a216da600b0013440f05d04mr6036578pzb.13.1689770212730;
        Wed, 19 Jul 2023 05:36:52 -0700 (PDT)
Received: from [192.168.0.104] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id k6-20020aa790c6000000b006765cb3255asm3186759pfk.68.2023.07.19.05.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 05:36:52 -0700 (PDT)
Message-ID: <5983cf9d-dc1e-75bd-3624-770951661245@gmail.com>
Date: Wed, 19 Jul 2023 19:36:46 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: Tree for Jul 13 (drivers/video/fbdev/ps3fb.c)
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230713123710.5d7d81e4@canb.auug.org.au>
 <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
 <ZLYHtVuS7AElXcCb@debian.me>
 <f5e6258b-ba76-001b-4942-588f4cbb0aa7@leemhuis.info>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <f5e6258b-ba76-001b-4942-588f4cbb0aa7@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org, Linux Regressions <regressions@lists.linux.dev>, Helge Deller <deller@gmx.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/18/23 17:06, Thorsten Leemhuis wrote:
> I'm missing something here:
> 
> * What makes you think this is caused by bdb616479eff419? I didn't see
> anything in the thread that claims this, but I might be missing something
> * related: if I understand Randy right, this is only happening in -next;
> so why is bdb616479eff419 the culprit, which is also in mainline since
> End of June?
> 

Actually drivers/video/fbdev/ps3bf.c only had two non-merge commits during
previous cycle: 25ec15abb06194 and bdb616479eff419. The former was simply
adding .owner field in ps3fb_ops (hence trivial), so I inferred that the
culprit was likely the latter (due to it was being authored by Thomas).

Thanks for the question.

-- 
An old man doll... just what I always wanted! - Clara

