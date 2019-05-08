Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D41D17EDD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 19:08:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zjbY5FKnzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 03:08:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=richardcochran@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jQl6hDH3"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zjYn3Qb5zDqJl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 03:06:36 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id y3so10232087plp.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2019 10:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=75HU3h4OsAx80C+4HKmkW9WgCjMZ+3MuLOv2/tSvsf8=;
 b=jQl6hDH30YowXP4QHSAKi9IE+6WlJEE9nvbFJQjRbUi7SHucchoX5QX0FEPCcs+kkL
 /jpbzu3fEJoqC4nfdct9P3686RvwnXltHnptuE6rWvUJqv6WrstRah+XYV+aRESaYFn3
 jFlNYGFTnsq7c6nSR/FxyByvG87taz9YhTSvI6cGnvoO5Qfl5OoZqQTuX8wBXJn+ss9d
 0U31LGy5ye/WnB3tucJRtX1bxu/FPDmIq6nqHk2nl515S9PzPdxO9m0clWWhIAvzSPyt
 mkqzEJ8W17t6yXjMve4NC7Px40RyKcqnY7HOmzaicZhAa/EtdMIsysIHDQJ6aZsARyIL
 N5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=75HU3h4OsAx80C+4HKmkW9WgCjMZ+3MuLOv2/tSvsf8=;
 b=CWm5JOfe+2pKPeAM9UrJeaziKz4jnwYThab9Cs5L3tcNKK9efVK8d99gvpeXwU/TLA
 fJ3Zvgzbz1YS/lChRAeEQfH3HEUbiE5r+zZNPdwuSBkaseeiCZA9PmjpsWU3keTfQlBI
 fQCiT8cIBjOf4/VupSMkERKM5uaayVqdG02hEno01zRxGseH7JcVRyHEvZgojH+AfzbJ
 U2O4bXYPFvxU0rqEaMcRe3IcsSN3MX3A20pPZhdIPqbXt8ncrI9meRIW/3Ryc/r5vdDF
 WRQy/W9TSL4tAnpbTO3ebD2sGkBAlQxzdGcD766RDtsv//R4tIXbD+xVQLCBAxz8C36o
 SnHw==
X-Gm-Message-State: APjAAAV5XrdcKk8S6q+mveLGUHEmosk+cVsmcJtNT0pX4r1tMx04K2YH
 yxdLbUoUXM7y+0ZFvMYtubc=
X-Google-Smtp-Source: APXvYqz2ig4LTc8BeA++POHhfq31FLeFbtUnhNuxJeCOWUwYOUw7UcTLduomkOhdm3P5hDWJB/4mKA==
X-Received: by 2002:a17:902:b489:: with SMTP id
 y9mr17545441plr.70.1557335193074; 
 Wed, 08 May 2019 10:06:33 -0700 (PDT)
Received: from localhost (c-73-222-71-142.hsd1.ca.comcast.net. [73.222.71.142])
 by smtp.gmail.com with ESMTPSA id o10sm26434215pfh.168.2019.05.08.10.06.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 10:06:32 -0700 (PDT)
Date: Wed, 8 May 2019 10:06:29 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Po Liu <po.liu@nxp.com>
Subject: Re: [EXT] Re: [PATCH v1] timer:clock:ptp: add support the dynamic
 posix clock alarm set for ptp
Message-ID: <20190508170629.me5smui6n7n62x2l@localhost>
References: <1557032106-28041-1-git-send-email-Po.Liu@nxp.com>
 <20190507134952.uqqxmhinv75actbh@localhost>
 <VI1PR04MB51359553C796D25765720FCC92320@VI1PR04MB5135.eurprd04.prod.outlook.com>
 <20190508143654.uj7266kcbhf744c3@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508143654.uj7266kcbhf744c3@localhost>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Roy Zang <roy.zang@nxp.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, "Y.b. Lu" <yangbo.lu@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "deepa.kernel@gmail.com" <deepa.kernel@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 08, 2019 at 07:36:54AM -0700, Richard Cochran wrote:
> No the alarm functionality has been removed.  It will not be coming
> back, unless there are really strong arguments to support it.

Here is some more background:

    commit 3a06c7ac24f9f24ec059cd77c2dbdf7fbfd0aaaf
    Author: Thomas Gleixner <tglx@linutronix.de>
    Date:   Tue May 30 23:15:38 2017 +0200

    posix-clocks: Remove interval timer facility and mmap/fasync callbacks
    
    The only user of this facility is ptp_clock, which does not implement any of
    those functions.
    
    Remove them to prevent accidental users. Especially the interval timer
    interfaces are now more or less impossible to implement because the
    necessary infrastructure has been confined to the core code. Aside of that
    it's really complex to make these callbacks implemented according to spec
    as the alarm timer implementation demonstrates. If at all then a nanosleep
    callback might be a reasonable extension. For now keep just what ptp_clock
    needs.
 
> Here is the result of a study of a prototype alarm method.  It shows
> why the hrtimer method is better.
> 
>    https://sourceforge.net/p/linuxptp/mailman/message/35535965/

That test was with a PCIe card.  With a SoC that has a PHC as a built
in peripheral, the hardware solution might outperform hrtimers.

So you might consider adding clock_nanosleep() for dynamic posix
clocks.  But your code will have to support multiple users at the same
time.

Thanks,
Richard
