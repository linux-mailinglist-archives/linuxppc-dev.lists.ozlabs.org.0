Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF77B92BE3F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 17:26:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aSYi90ft;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJPwc4JXWz3dFw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 01:26:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aSYi90ft;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJPvr4tCPz30Vk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 01:25:59 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-426602e8050so21897205e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2024 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720538753; x=1721143553; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sEP9HFUIvOyMzrlfw2zh4onk/mGWAtEnPNTkOS2BI8k=;
        b=aSYi90ftHa2E2b/aGIeq6qp2pjLYoyDbvShFE8LqG4zz4VCY7/AFawMGgyAzPmSmI/
         hZLAWEbEIkqTS6Opw5adghRcE92Y8mgqXQpiFAbtRsHfg9Tji6qpJNQ1XlbaIZiNOlmo
         PW6JgGHgvwNu0xnF7BfHbP39GU2FrAcTyUzWFjJmzO79eJOd79WS8TyTGW33jqhQuJ3O
         tgR2TOUaO9DVWshoer9+X4e830GGUzOMOdBS55c2oB7u1VO+BuLJDqGKazZC1DzWQeNR
         NfcZon8Od/fQLiZTzxH2fxabqlU8Yr1ObPWLrF2Aa6wC3V33gejPyFBQ6T7newVxxrv9
         UQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538753; x=1721143553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEP9HFUIvOyMzrlfw2zh4onk/mGWAtEnPNTkOS2BI8k=;
        b=sXbX0TnekSswL9gAhUE4Wb/iYOb8J6UUOwrPzY7MgmXOHDIsqvMScicU7bZ9DA8f3X
         jY3sRfHxzvMuQAqx9RjEt0tL2fB3LdgMnFdk7Eah7mqaLSlAhWdvz1cpilK547saswgx
         B9hcPYv7BqBFMQchYmbIe/cRE4up/Bn7kbnR9elugt1vEesE71U7M3lnyVybHVFM7iAZ
         9ls5WUFTbYxDaNpVvOpwXWHguuWxWZ8i8jPotushFcksdD7Q1xkotQrEJP+697V0v9DE
         sEzDvV04/thDfDmZS6q2yM7p3ovTqWEa+W/wdNURxaNRyT5soMXeyxTIgyHM14KDWlk7
         W/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWzZFYVGt00BVzn7LGQ7R2BrWnKNinREoq4fPsmE4J0X+sLpFFzGu3L+3jT2I2NYTB6Lx1VJzDnRntqicEjwpYvvkWAQdtCmYbqlyC01A==
X-Gm-Message-State: AOJu0Yw7EFJNHp9Tk6D/XG3FeS0Veg7DhP5QctojJ4yJtQwUIIULgld6
	6npYz8T7HPsy8qwelJwRL5i6AtoFmLDjy6EPaufXk4BKC/0KT0yfuc3hLkMm
X-Google-Smtp-Source: AGHT+IGaU+IhfijAp8zflrrfJXXMbDU1JKbjE4Rpg8g3NjL5OvpVpNRl2dIMiWa8Bd6kfcsTT2jamg==
X-Received: by 2002:a5d:58f1:0:b0:367:8900:c621 with SMTP id ffacd0b85a97d-367ceaca897mr1943578f8f.56.1720538752641;
        Tue, 09 Jul 2024 08:25:52 -0700 (PDT)
Received: from skbuf ([188.25.110.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab136sm2849553f8f.98.2024.07.09.08.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:25:51 -0700 (PDT)
Date: Tue, 9 Jul 2024 18:25:49 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <20240709152549.3yak6yeij7x5dlal@skbuf>
References: <20240624162128.1665620-1-leitao@debian.org>
 <202406261920.l5pzM1rj-lkp@intel.com>
 <20240626140623.7ebsspddqwc24ne4@skbuf>
 <Zn2yGBuwiW/BYvQ7@gmail.com>
 <20240708133746.ea62kkeq2inzcos5@skbuf>
 <Zow5FUmOADrqUpM9@gmail.com>
 <20240709135811.c7tqh3ocfumg6ctt@skbuf>
 <Zo1UC/grXeIocGu5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zo1UC/grXeIocGu5@gmail.com>
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
Cc: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org, Roy.Pledge@nxp.com, llvm@lists.linux.dev, open list <linux-kernel@vger.kernel.org>, horms@kernel.org, oe-kbuild-all@lists.linux.dev, kuba@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 09, 2024 at 08:15:23AM -0700, Breno Leitao wrote:
> Hello Vladimir,
> 
> On Tue, Jul 09, 2024 at 04:58:11PM +0300, Vladimir Oltean wrote:
> 
> > On Mon, Jul 08, 2024 at 12:08:05PM -0700, Breno Leitao wrote:
> > > I thought about a patch like the following (compile tested only). What
> > > do you think?
> > 
> > To be honest, there are several things I don't really like about this
> > patch.
> > 
> > - I really struggled with applying it in the current format. Could you
> >   please post the output of git format-patch in the future?
> 
> This is the output of `git format-patch` shifted right by a tab.

I don't want to insist too much on it, but this is not correct. In the
process of shifting the patch to the right, something ate the leading
space on each patch context line. The patch is ill-formatted even if the
first tab is removed. Try to keep it simple and either attach it or post
it without any change whatsoever.

> > I have prepared and tested the attached alternative patch on a board and
> > I am preparing to submit it myself, if you don't have any objection.
> 
> Sure, not a problem. You just asked how that would be possible, and I
> decided to craft patch to show what I had in mind. I am glad we have a
> way moving forward.
> 
> Thanks for solving it.

I mean I did suggest dynamic allocation for the array since my first
reply in this thread, which is essentially what the patch is..
Given that dynamic allocation was already mentioned and then you
suggested to replace NR_CPUS with something dynamic, I took that as an
alternative proposal and an invitation at using VLAs, which is what I
was commenting on, and what I was saying I don't think would work.

By VLAs I mean:
-	u16 channels[NR_CPUS];
+	u16 channels[num_possible_cpus()];

Anyway...
