Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC6E1650D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 15:52:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44z1JJ6q4yzDqHZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 23:52:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=richardcochran@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oMQjJcPi"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44z1FS2H2GzDqHH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 23:50:01 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id 13so8394694pfw.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=S8BQEP1OV6vKoSe5VDyJlLX4UR1XhupCQW202rhq/sQ=;
 b=oMQjJcPiNX92IlwTDMAW4qr/DdkOFqHLv0mxlbPfOeLaWsnqFZadYEibjkDIgY2NoM
 /65COGgPxkzIo+amIzo6LPYgGDGhJxntl4IHC1R/RwjQFVpiP4UXGWuwbHOfyZ8euQcE
 ir9EJkZF9XcN0WR7nfl/JhEl0+MZHZx/FFJIdaszpfSQ9rsW7hA8LTHBLq1t+IWpekyS
 iyEd6m3PD3RorhuG5Xmkci0vdJw7KlYnHW5KDkeG+yBLz7q4YH3GU/dqJHBkQriNNSBe
 xEnRNdM5sxiM7Y2G+ogZwJCOOm3oWbLZc2p+U6WW1oVu9v/vdRNQ/7P9oOscBiCmAEP7
 h3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S8BQEP1OV6vKoSe5VDyJlLX4UR1XhupCQW202rhq/sQ=;
 b=F36aJ+8MZwdQkIuscKEMxed80o9Ye9MXPLvTTSYSRX/ewXG8jwUnxG4vej6GXE2AiF
 peJpgjmsDEuGSa6bMojHisGtwSSieyW1FqUqNFrWx3NmesIDUCZmyDnZCYbUl/ioeo6c
 8F2ZPyAb1g5+CX/7wHKFdGMGZKk53dhCkQz3yt1vGuwnFNzQFVbp3O9W5EwOicyL9uAa
 I80uDowJq45J3Ce2ihOiJXv2UV/WYcc+Wvtc2VyM6Z6jpzAffGN7fhDOlk0U4TmUH7hD
 NX43iJH7GCP8UIDn34lYBWKL8qKbehaQdTxmypN9Vq32KbDRVk9j9XsSK1SNIMpffkUW
 8lqA==
X-Gm-Message-State: APjAAAWtPLLe3B4nX+Ex8Fk6CtgH40SXTkDH2vyKeSMnlcvTgRAqqzO2
 +8+lxAn5NEKb1qNWKUM0D0s=
X-Google-Smtp-Source: APXvYqwNMrdvjlCOgIU9TBbSh3DwQp1FscE2sA0W7mHk+F+dufo6InfjIlXwfy6OIa5H5Al1dkWeIA==
X-Received: by 2002:aa7:98c6:: with SMTP id e6mr2436297pfm.191.1557236995744; 
 Tue, 07 May 2019 06:49:55 -0700 (PDT)
Received: from localhost (c-73-222-71-142.hsd1.ca.comcast.net. [73.222.71.142])
 by smtp.gmail.com with ESMTPSA id v6sm8275551pgk.77.2019.05.07.06.49.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 06:49:54 -0700 (PDT)
Date: Tue, 7 May 2019 06:49:52 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Po Liu <po.liu@nxp.com>
Subject: Re: [PATCH v1] timer:clock:ptp: add support the dynamic posix clock
 alarm set for ptp
Message-ID: <20190507134952.uqqxmhinv75actbh@localhost>
References: <1557032106-28041-1-git-send-email-Po.Liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557032106-28041-1-git-send-email-Po.Liu@nxp.com>
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

On Sun, May 05, 2019 at 05:02:05AM +0000, Po Liu wrote:
> Current kernel code do not support the dynamic posix clock alarm set.
> This code would support it by the posix timer structure.
> 
> 319  const struct k_clock clock_posix_dynamic = {
> 
> 320         .clock_getres   = pc_clock_getres,
> 321         .clock_set      = pc_clock_settime,
> 322         .clock_get      = pc_clock_gettime,
> 323         .clock_adj      = pc_clock_adjtime,
> 324 +       .timer_create   = pc_timer_create,
> 325 +       .timer_del      = pc_timer_delete,
> 326 +       .timer_set      = pc_timer_set,
> 327 +       .timer_arm      = pc_timer_arm,
> }
> 

Sorry, NAK, since we decided some time ago not to support timer_*
operations on dynamic clocks.  You get much better application level
timer performance by synchronizing CLOCK_REALTIME to your PHC and
using clock_nanosleep() with CLOCK_REALTIME or CLOCK_MONOTONIC.

> This won't change the user space system call code. Normally the user
> space set alarm by timer_create() and timer_settime(). Reference code
> are tools/testing/selftests/ptp/testptp.c.

That program still has misleading examples.  Sorry about that.  I'll
submit a patch to remove them.

> +static int pc_timer_create(struct k_itimer *new_timer)
> +{
> +	return 0;
> +}
> +

This of course would never work.  Consider what happens when two or
more timers are created and armed.

Thanks,
Richard
