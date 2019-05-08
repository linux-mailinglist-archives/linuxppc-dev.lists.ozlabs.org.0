Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB9F17BB4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 16:38:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zfHJ3T12zDqGS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 00:38:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=richardcochran@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GFOAMN4G"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zfFB4FNtzDqFm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 00:37:02 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id g9so468582pfo.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2019 07:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ftxd/yGo/xg+LooGM3ZD/VdN0H7EkQxNojOlbdPB8hk=;
 b=GFOAMN4G1WRghAnlNyjXeaqSsonA/53S0DSqWPf54QwuNQDT1NbIYLzp9w3fhZJFtN
 aiSKheRl2EusqiUpf3wsoy3fr5QmJu1rSfg7kWe0o/uADF8HeDLcbksODBQwBwlmizbz
 8XE1Cb7/QP0JCLcxO6ebcvY7JlWjixRPUtMymB2ehb9bUFpAAwJKTN2pvQ0A+dib+RCT
 SGekeXxhObb5v1F6knvIdK+gQPPbU5Yy/oJwAIO2vXK2hVb78feJqIh2E0lghsfK6QgE
 jktmdNu03tVA+o+IS/rc4DicflXeoMssjytPTXhMO9HCDWJsir2kCt5jeSX/yqcF5Uj7
 LG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ftxd/yGo/xg+LooGM3ZD/VdN0H7EkQxNojOlbdPB8hk=;
 b=ozyeGBkwkJaXbf3gkffjICq5zD1URRaa6pr7/wwiA6GwJbC9hvejPDwqUlnRLMs/st
 UyPtDkIxA+27lgQthDs86QGQrLtUql9ro/+xcNB7RhP85I7HmV1u2RQ7tsmLmDH/7kDM
 Dyu4CifvdiG//dHOGHiVvDxGUtQiUrqrSK43uGwiB8NjTbAMqzGZFbokaXi/g4Lu+a6H
 X0S9eUwQdvuLkYwmCHqkRphATZaKbDoh7wMj3LBGSeWZxMxr6e8CH6gdE1eRcups91Rn
 wlGeyZ0xwKdub2QrQf7uMAREoxbqgfYXhZdR9p7eqgR/9FhDpSzUKsDvhaROVIXCyaCu
 PFFw==
X-Gm-Message-State: APjAAAWF3zvkU1Opw3/AU6X9Dsw5ykPn8qeFAKYytknrWy04DENnpzPw
 f2ysW2QnhIaiZs9bGIeQPkY=
X-Google-Smtp-Source: APXvYqwFTky+u99b+yN1sIumvpHzai76th7uvSwoCwE6E1F3oFzkKw34NCWTmOtkhi1n2S8pol/jMQ==
X-Received: by 2002:a63:465b:: with SMTP id v27mr6811806pgk.38.1557326218322; 
 Wed, 08 May 2019 07:36:58 -0700 (PDT)
Received: from localhost (c-73-222-71-142.hsd1.ca.comcast.net. [73.222.71.142])
 by smtp.gmail.com with ESMTPSA id t26sm10739342pgk.62.2019.05.08.07.36.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 07:36:57 -0700 (PDT)
Date: Wed, 8 May 2019 07:36:54 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Po Liu <po.liu@nxp.com>
Subject: Re: [EXT] Re: [PATCH v1] timer:clock:ptp: add support the dynamic
 posix clock alarm set for ptp
Message-ID: <20190508143654.uj7266kcbhf744c3@localhost>
References: <1557032106-28041-1-git-send-email-Po.Liu@nxp.com>
 <20190507134952.uqqxmhinv75actbh@localhost>
 <VI1PR04MB51359553C796D25765720FCC92320@VI1PR04MB5135.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB51359553C796D25765720FCC92320@VI1PR04MB5135.eurprd04.prod.outlook.com>
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

On Wed, May 08, 2019 at 03:30:01AM +0000, Po Liu wrote:
> > Sorry, NAK, since we decided some time ago not to support timer_* operations
> > on dynamic clocks.  You get much better application level timer performance
> > by synchronizing CLOCK_REALTIME to your PHC and using clock_nanosleep()
> > with CLOCK_REALTIME or CLOCK_MONOTONIC.
> 
> The code intend to get alarm by interrupt of ptp hardware. The code
> to fix ptp not support to application layer to get the alarm
> interrupt.  Do you mean the synchronizing at application layer by
> PHC (using clock_nanosleep()) to the CLOCK_REALTIME source? Then the
> kernel could using the hrtimer with CLOCK_REALTIME?

Yes, or with CLOCK_MONOTONIC.

> > > This won't change the user space system call code. Normally the user
> > > space set alarm by timer_create() and timer_settime(). Reference code
> > > are tools/testing/selftests/ptp/testptp.c.
> > 
> > That program still has misleading examples.  Sorry about that.  I'll submit a
> > patch to remove them.
> 
> Is there any replace method for an application code to get alarm interrupt by the ptp source?

No the alarm functionality has been removed.  It will not be coming
back, unless there are really strong arguments to support it.

Here is the result of a study of a prototype alarm method.  It shows
why the hrtimer method is better.

   https://sourceforge.net/p/linuxptp/mailman/message/35535965/

Thanks,
Richard
