Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9170EA44
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 02:30:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQsXM4XfZz3fBC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 10:30:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=oCPd/VMB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=rientjes@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=oCPd/VMB;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQsWQ69WPz3blS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 10:29:21 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1ae64580e9fso6865ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 17:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684888159; x=1687480159;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p+iGDu91GXvHaUJ4/GkDIwXiVromlKTEDnrVX/jdHHE=;
        b=oCPd/VMBzehzBIwxKD0CUQlcv9XnCqSIGnZFpfNhT9159UiXp4+4s0dt1T5T+r2N8u
         ejdMVEW9GWrQK3u8D/R+OgCl4fi8an2VY0K+/eeCPWT2cGGSET/E3kHkr5iqimXeopNz
         1LhLEfNIl9101bv8HdubYyq2hpbrF89XLwyNahFvZOtnckCP7CoEZsh2L+2+OK9q9Yjc
         K9vC86dI9TWXu3/6r3ILFI/gvIY8hkiVXH1FcP052iNl13PiuUL4NAyi+n5JDzxUMMjc
         YVmWP+V4GT0WZnv89R5QJMFswFGyufptXG7L83ZUIfYIL/yWyXKcEjeZvi21gEBg088G
         o5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684888159; x=1687480159;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+iGDu91GXvHaUJ4/GkDIwXiVromlKTEDnrVX/jdHHE=;
        b=gy0uFmT9UQwsPbwTGvWq4A1su/ukyCqtIeuoQZgaruwMFZQnettg/JouFBZ5XIIiCk
         u+GbgB1sXyH30nkdhnW9UROzw5XBjjNtjY10YmbYsNOPRTxAHBw8dUN8AUJy4qv+IX8p
         cZUtZfxPne8WpoMNFULduC2wFt7AAdfQsqDnKapIhbxpXXtsvw5G4+xLKCBUn1je4k9t
         BHdL7ZhG67x8o1M0wjI1jR18FT96hWmOAWNyH2dnSnloKs0mMiU6CWvj755gPNofEWQf
         bbIyUY0Kr/eJVMCQKYgc8QzTYk68PT5IwnT1QTnq4mWpGNxvI+n1X+2bZWgmimP7P6E6
         NW3g==
X-Gm-Message-State: AC+VfDwL1rxwoVxhUo9Xselwkwx/6y4b5QfUAggQQx+DYVtf1XR8lAFh
	kXhp3dfJeMOPgI5+fD/eXbdIDQ==
X-Google-Smtp-Source: ACHHUZ4WC86fv/HCojVq6Z7bo1LnEN2P8Qa/JJdhSbqAvm7x1JKXoIG4BePTyVsmdwlyiuzkRQj4Vw==
X-Received: by 2002:a17:902:e847:b0:1af:90ce:5263 with SMTP id t7-20020a170902e84700b001af90ce5263mr107385plg.26.1684888158675;
        Tue, 23 May 2023 17:29:18 -0700 (PDT)
Received: from [2620:0:1008:11:c789:c1fb:6667:1766] ([2620:0:1008:11:c789:c1fb:6667:1766])
        by smtp.gmail.com with ESMTPSA id n20-20020a17090a929400b0024de0de6ec8sm137193pjo.17.2023.05.23.17.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 17:29:18 -0700 (PDT)
Date: Tue, 23 May 2023 17:29:17 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
In-Reply-To: <20230523091139.21449-1-vbabka@suse.cz>
Message-ID: <be109b49-8510-5887-72ae-738db9945619@google.com>
References: <20230523091139.21449-1-vbabka@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Andrew Lunn <andrew@lunn.ch>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Roman Gushchin <roman.gushchin@linux.dev>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-renesas-soc@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, linux-snps-arc@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-arm-kern
 el@lists.infradead.org, Qin Jian <qinjian@cqplus1.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Andrew Morton <akpm@linux-foundation.org>, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, Pekka Enberg <penberg@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 May 2023, Vlastimil Babka wrote:

> As discussed at LSF/MM [1] [2] and with no objections raised there,
> deprecate the SLAB allocator. Rename the user-visible option so that
> users with CONFIG_SLAB=y get a new prompt with explanation during make
> oldconfig, while make olddefconfig will just switch to SLUB.
> 
> In all defconfigs with CONFIG_SLAB=y remove the line so those also
> switch to SLUB. Regressions due to the switch should be reported to
> linux-mm and slab maintainers.
> 
> [1] https://lore.kernel.org/all/4b9fc9c6-b48c-198f-5f80-811a44737e5f@suse.cz/
> [2] https://lwn.net/Articles/932201/
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: David Rientjes <rientjes@google.com>

The Kconfig option says that SLAB will be removed in a few cycles.  I 
think we should wait until at least the next LTS kernel is forked at the 
end of the year so that users who upgrade to only the LTS releases can be 
prompted for this change and surface any concerns.  Slab allocation is a 
critical subsystem, so I presume this is the safest and most responsible 
way to do the SLAB deprecation.  Hopefully that timeline works for 
everybody.
