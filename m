Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A43742D5810
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 11:18:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cs8ym5bQ8zDqW2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 21:18:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=lkml@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
X-Greylist: delayed 593 seconds by postgrey-1.36 at bilbo;
 Thu, 10 Dec 2020 21:16:21 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cs8vn28nYzDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 21:16:20 +1100 (AEDT)
Received: from [192.168.1.155] ([95.117.52.229]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MWiYo-1kcBmu2YCO-00X5bV; Thu, 10 Dec 2020 10:57:00 +0100
Subject: Re: [PATCH] drivers: usb: gadget: prefer pr_*() functions over raw
 printk()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <20201208144403.22097-1-info@metux.net>
 <X8+howyVRiTR9gv/@pendragon.ideasonboard.com>
 <9aaa06ad-0bd8-486d-b16b-66927d57cf96@metux.net>
 <X9C0vOLZOnLZoPR8@pendragon.ideasonboard.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <a454b90c-2888-7779-222b-ba642526495a@metux.net>
Date: Thu, 10 Dec 2020 10:56:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <X9C0vOLZOnLZoPR8@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1tUVJHur9zX95g721i8+x6mG6wmouby4GJKEfF1tz4XFWPNrZ/7
 F/0YH1fgIF4zjb7qtk769Vi6cM6ZT1UpgNGxpgfJFc3Y8jNwzPj2TmcoXUq0af5R6PG7Cze
 3ww1YZu6Pn1HrVV0QNEF+0u5U+s59/S9tsVcs7TOCV4xAotexcMORVBjoQdls4A6O5RRf72
 sHzHjeee9qCCdyHhmKrzA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+/dzs/5/GJ8=:skUnKwEcJl+PbraOWO9w9H
 2vjCepwTIasWyxzk35NlqFAu3kvC+fHnZeKqF6HIYRSOaEIsaPZ1AUf6kRbmWDYG+/BBzzwUl
 qzTcmVLWl9oBv5ZhmDBxkBw4sh8C7ovVKl7eDDOJ73BPX82HDFstq8Sq+x1lqGVX+2t1tB9Zk
 J96LqFPLl2wxBkLYDHjQMMFtoWp0D5CieaWpARbNQZ0E9iSRXKfBl7GGjIO5DO2nY7rALbqXc
 42A67Kz5ihKdiPRm/RDFAmWFjp0YNimcTrbqEbFIMy6zcv8lzZnhn+nPZaUc1pArJlv/aXWV3
 9eLyT0IKmMm/krVh6CjgIRb5H1SAM4hu3/l2eEelisk9tvotsrlCQh6qIjOnL832sFYGIDMCn
 Immf3mB00ek7hczjI4XEI9CaTA3XRYSJGojXmKXSeUVUT+zcHS2jLI5XFKFtQXcB+5kpKk9bx
 cxEflSGjxmK21auvPHWaz+USwS6Z/nNcujN3T7LWrTZrXiLmuAwV0IQRA1eYhawi81f7Y+AMm
 rExkYPp6hMXSqc8woziX8o=
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09.12.20 12:27, Laurent Pinchart wrote:

Hi,

>>> I wonder if this shouldn't be dropped instead, commented-out code isn't
>>> very useful.
>>
>> Indeed. Shall I send a separate patch for that ?
> 
> Yes, that would make sense.

Okay, I'm currently doing a more in-depth rework. I'll send another
patch queue later.

Since I don't own the corresponding devices, I can't do much testing
(just build tests and careful review), so I need some help w/ that.

> As most of the files touched by this patch are device drivers, dev_*()
> functions should be used instead of pr_*() where possible. I'd recommend
> a first patch that converts to dev_*(), and then a second patch that
> converts the remaining printk()s, if any, to pr_*() in the contexts
> where no struct device is available or can easily be made available.

I'm now splitting it into per-driver patches. They're getting a bit
bigger, since I'm also replacing some debug macros, etc. In some cases
I'm introducing new helpers for not having to write long expressions
to get the actual dev ptr, adding some prefixes (eg. per usb endpoint
logging, ...).


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
