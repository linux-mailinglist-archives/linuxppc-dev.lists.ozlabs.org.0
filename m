Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF1A4FA05F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 02:00:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZwHr024tz3bhQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 10:00:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kbnf+OTm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Kbnf+OTm; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZwHD2pBmz2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 10:00:24 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id i20so1939748wrb.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Apr 2022 17:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=M4fK1yo1NBIHG/5W6ZdoT+jscsUpt52urbAtX6EHweY=;
 b=Kbnf+OTmmmZ25Py7KZVEogMix9TXNLbqSs+Rby4Mck4nWKvGBvMG0Yu2oTCcjsopxe
 tac9vGLoQEqTba+57ySJl6CUS1A6BZRfBgzMYRR8hAbHS4wtx3oQCU0T6hEeF8h3Wljb
 p+UQLEGEkM6V1/rISJRGHb/h1YLXES7qXMHhPMOgiTRwGCT6g3mjF7XMWDXnqmX1KcCf
 5t92VacE8vcq5J0j4lKxfq/44xUYXoNAVfxhlKmHVeFvv/MrkmHedjUiuMd7R6ykF5Go
 jYmTt7ztJv9nQIMfoTzEGMD+MIMTr7RyTmna9GZkjOGr866lASWUreb/L/vHg0ygsbM9
 xMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=M4fK1yo1NBIHG/5W6ZdoT+jscsUpt52urbAtX6EHweY=;
 b=CceCkvrASadQZRYvOCKlCLRIWzJ4HU7r6t7qfpFO9v9MfKDMqJ1Q8ba5CgJE1guQDM
 c7rxFOQDODqo+ISRQus2xFrAmPwUTD8AN1RZNFcqg8m4Rl0/soa4c7oKjFy0H84H+e+3
 NzNY4CY4dhOFUxF3LFEb0PshOXzPskhxsrhWcQbCEfmE/ukGhj4Qi240cEhNpOwdyTwy
 o5Tf/Ug594WkxkuyhV4pcnxhlN7QiB9LxUZR/jBOFq/k7a2MBg4IrggPp9Zh415WvXqp
 6MaZXa/r0e44S1i+Q6LJABIbrOrbGLsiYlwc6VWuIAlWdC+VHVqSD5mrhyWGg4fE8eLG
 pXLQ==
X-Gm-Message-State: AOAM530WfqHrbnsqZ8sEh9VN8L9jHIkxny3YMW3L/nxsTW4kKAEzY1c8
 rlpA6pjM0jyEVifvGli4N6I=
X-Google-Smtp-Source: ABdhPJwsgzMxfu8oKABBvDjW9kco9sUI3QmbrtC5b9hgDi2efhG+oHaYpnT8EByLRhIHH6Va2p0drA==
X-Received: by 2002:a5d:6989:0:b0:206:1517:9b66 with SMTP id
 g9-20020a5d6989000000b0020615179b66mr16236897wru.583.1649462421298; 
 Fri, 08 Apr 2022 17:00:21 -0700 (PDT)
Received: from smtpclient.apple ([185.238.38.242])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a1cf607000000b00389a5390180sm11277078wmc.25.2022.04.08.17.00.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Apr 2022 17:00:20 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH net-next 03/15] net: dsa: mv88e6xxx: Replace usage of
 found with dedicated iterator
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <20220408235051.2a4hh7p3lee3a3xv@skbuf>
Date: Sat, 9 Apr 2022 02:00:18 +0200
Content-Transfer-Encoding: 7bit
Message-Id: <56F3A9DE-C80A-4932-AFEA-BB82251C1199@gmail.com>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-4-jakobkoschel@gmail.com>
 <20220408123101.p33jpynhqo67hebe@skbuf>
 <C2AFC0FB-08EC-4421-AF44-8C485BF48879@gmail.com>
 <20220408235051.2a4hh7p3lee3a3xv@skbuf>
To: Vladimir Oltean <olteanv@gmail.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
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
Cc: Andrew Lunn <andrew@lunn.ch>, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 Ariel Elior <aelior@marvell.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Manish Chopra <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, "Bos, H.J." <h.j.bos@vu.nl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakub Kicinski <kuba@kernel.org>, Di Zhu <zhudi21@huawei.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, UNGLinuxDriver@microchip.com,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Xu Wang <vulab@iscas.ac.cn>, Colin Ian King <colin.king@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Casper Andersson <casper.casan@gmail.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 9. Apr 2022, at 01:50, Vladimir Oltean <olteanv@gmail.com> wrote:
> 
> On Sat, Apr 09, 2022 at 01:44:00AM +0200, Jakob Koschel wrote:
>>> Let's try to not make convoluted code worse. Do the following 2 patches
>>> achieve what you are looking for? Originally I had a single patch (what
>>> is now 2/2) but I figured it would be cleaner to break out the unrelated
>>> change into what is now 1/2.
>> 
>> I do agree with not making convoluted code worse, but I was reluctant with
>> e.g. introducing new functions for this because others essentially
>> have the opposite opinion on this.
>> 
>> I however like solving it that way, it makes it a lot cleaner.
> 
> Yeah, I think 'just adapt to the context and style and intentions of the
> code you're changing and don't try to push a robotic one-size-fits-all
> solution' is sensible enough for an initial guiding principle.
> 
>>> If you want I can submit these changes separately.
>> 
>> Sure if you want to submit them separately, go ahead. Otherwise I can
>> integrate it into a v2, whatever you prefer essentially.
> 
> If you're moving quickly feel free to pick them up. I have lots of other
> things on my backlog so it won't be until late next week until I even
> consider submitting these.

I'm planning to send a v2 earlier than that, so I'll just integrate it there.

Thanks,
Jakob

