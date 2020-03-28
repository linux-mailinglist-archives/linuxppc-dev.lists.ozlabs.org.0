Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD91196438
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 08:34:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48q9Tf3tVpzDr75
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 18:34:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=afzal.mohd.ma@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jl9qdfm3; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48q9Rw1CdLzDqck
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 18:33:00 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id v23so4392717ply.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 00:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+lojOXOS3R1T9zdX8YSaUVNPC+Uk4217Q9UeUwGqUmA=;
 b=jl9qdfm3jYBUJpt5JTOg0fpX+frk2U8CDB7NHla700eqbFzeaU5ddRrnkF9ulMws0I
 c9g6XZd+U1YMZF9/3LdLKd5v8wOHCvTpOK+41v0dC3rQjbl2zkCOwiKzOqyresW/3Mhq
 BcOd0bkAnUi+Zs7kVOtOgih+P95QQehDeut+bVNmK8w/pAqzhJa2/sY/cLipp5Rtomn+
 y0jJ0Kfcg23Own5fnZnDcgXrP0oJy8MDqN1sdD4UE300VgF+beh9dCTKovy8+8QPgJF7
 tM2KC+Uqrh6IJRCMsJf7pzvSFnZ37F703JjyJuB4ywUQrA0N8cjQpQZ/4AufrBOA8und
 kRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+lojOXOS3R1T9zdX8YSaUVNPC+Uk4217Q9UeUwGqUmA=;
 b=go4UTP4Op3CaDlnSdzK3c6j2AX4H1kMfeQgAjgREr/KiSJqzF3yuYvX5+M/0G3fQB9
 mglvHc1EK2qIpHWZhNfE/gOUYUoIXqGY4Nc9B0KyEqZd9lZRwdE8aVxy3Y2Vmrz+zwt6
 G7ocdCQ8iRp5Vnu1JmNO4PdK9TiqGV6WnMV7fYiJKAjRe16+wg8Gpl9PAdJf17cwSuCA
 GW7QXuzp0hoNQ/NYAEcKLyMJwCK1Dh5tJCrOmFPKZFFobzNMxnatf28vnluiCAp9beo3
 cyNvxL38MqmymXJUF3fZ9FWBkSS7LNvO5Hmjkik4u/+0yuPYGhCbi48Yc6F6E4qGmgjs
 Kgbg==
X-Gm-Message-State: ANhLgQ3pr7TAvfHyLaGVu8JFGW35AqmP2JX+Zlih3Hlj2C3BEy9qKmOj
 ksv3+ZoWrDneV1Xda1ugdiU=
X-Google-Smtp-Source: ADFU+vvZAKeuGMHdxTRxMDuAgPAhSOtHeclFmaO/lZBPjDGm3MtGtV8wn85/n9JVZFDDDkLW/Z1SiA==
X-Received: by 2002:a17:90b:4906:: with SMTP id
 kr6mr3699363pjb.13.1585380776339; 
 Sat, 28 Mar 2020 00:32:56 -0700 (PDT)
Received: from localhost ([49.205.220.152])
 by smtp.gmail.com with ESMTPSA id 132sm5624219pfc.183.2020.03.28.00.32.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Mar 2020 00:32:55 -0700 (PDT)
Date: Sat, 28 Mar 2020 13:02:53 +0530
From: afzal mohammed <afzal.mohd.ma@gmail.com>
To: Brian Cain <bcain@codeaurora.org>
Subject: Re: [PATCH 0/6] Kill setup_irq()
Message-ID: <20200328073253.GA5250@afzalpc>
References: <20200321174303.GA7930@afzalpc>
 <cover.1585320721.git.afzal.mohd.ma@gmail.com>
 <059b01d604ab$637355b0$2a5a0110$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <059b01d604ab$637355b0$2a5a0110$@codeaurora.org>
User-Agent: Mutt/1.9.3 (2018-01-21)
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-alpha@vger.kernel.org, 'Thomas Gleixner' <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Brian,

On Fri, Mar 27, 2020 at 09:48:38PM -0500, Brian Cain wrote:

> > Note 2: hexagon final image creation fails even w/o my patch

> 	What's the nature of the failure in "Note 2"?

drivers/base/firmware_loader/main.o: In function `fw_is_builtin_firmware':
/devel/src/kernel6/drivers/base/firmware_loader/main.c:132:(.text+0xc8): relocation truncated to fit: R_HEX_16_X against symbol `__start_builtin_fw' defined in .modinfo section in .tmp_vmlinux1
Makefile:1077: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

[ i had deleted the toolchain earlier, since you asked, download again &
checked ]

Regards
afzal
