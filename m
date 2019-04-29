Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE206E2E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 14:39:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t4456TQ2zDq5k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 22:39:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=lkml@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t41n1tpQzDq5k
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 22:37:46 +1000 (AEST)
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MPoPd-1h7YiS0myB-00MpYJ; Mon, 29 Apr 2019 14:37:11 +0200
Subject: Re: [PATCH 01/41] drivers: tty: serial: dz: use dev_err() instead of
 printk()
To: Greg KH <gregkh@linuxfoundation.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-2-git-send-email-info@metux.net>
 <20190427133117.GC11368@kroah.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <bae3f23b-8823-f089-c40e-024ba225555f@metux.net>
Date: Mon, 29 Apr 2019 14:37:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190427133117.GC11368@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:KHUlUYtstuOEVXKZKNHyCnLCt6mq7L7HHLmuMvln4md2is42m2D
 Gvo9vOwjIRj6LOt0W8pXYE9v/qI7Zt147k18Yao4ebuIrvwMIQUsLt/uhZdnIkf6TXIF/2S
 i841E/m6um4E5qYu5wWiUl7XOuDGZarAmJeOQLoXfq89S/4wJw/bTUhC+J+wfkeAy6LT8O0
 2Q4XNEfbMs6baSq1jfeqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qsR2mgXWc80=:kOaVYs2+zc60ka2vcrJS1G
 6jjjD2rzIyURBuqEL6QGX/rLYjQoEewtndqbo2z/Zeq3LWRQK7VVV/g3jzsqHfHK0pRbR3iWW
 lHzYu+Ocphgh3aYHOj1tT4XVJikTmy1DGrmwSaYPiqxxRYGEOHHKgsd8MwiJvcyFqrJmY4bZf
 CmMGOlXqmGS4/mcQcfpGcPWy/tHy81F4dTNC+fHe1ORcaaPnQILx0hNuDe34B22WYlKx/NSnB
 G26mudb1+zA7rCK11WN5pz1xNscoklrB4MG7l23BtLE3kTqFh2AD2CWhWMF650iI91vzCekSl
 81iaSY9aOKIG/IWZlr4bOF2ADTZFekb5jsCGBI9fJ0XxDOOZmKOfU4m5yoYV3qUZjIkjqdwjR
 BNGBKyeNceGPrXYEpckfa+hDYD5k/aFeWiymyqiRbWXtiTGL1l91toEPNqF8usmeATFJZo30c
 2tPDHQVcb5UtItD0TEupC6+LC8CUPRmifWN4DmMjmQs+rYTCL7XWL72+ruXo4kMgAfKDXW0IG
 d6AUbAR06eze8qNuIXBOydRC/nRDTIv9BLJwnixcfqonqBiXSLRQ9XEhmZMC+gCQEmQPvRuGo
 v/L1GiKVpib2P2r06lK31PMfqW4f59ibIiaMTwNj/cpXrKc1s7+ephQ78zpKUW19SiZDmrDpJ
 CD2b/FyvoP+mFBB5xvOL+xjqTCggBjuFXC+oC8/QD0xSSAX2fub+agHpSpCGZT2CmyXSPquCS
 nDXXmSecoORpQFCPaPHR5Z12wTg4UfBlSqiv6ZT6mrUg8zSf+/GRQVmfBVM=
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
Cc: linux-ia64@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, andrew@aj.id.au,
 khilman@baylibre.com, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 sparclinux@vger.kernel.org, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27.04.19 15:31, Greg KH wrote:
> On Sat, Apr 27, 2019 at 02:51:42PM +0200, Enrico Weigelt, metux IT consult wrote:
>> Using dev_err() instead of printk() for more consistent output.
>> (prints device name, etc).
>>
>> Signed-off-by: Enrico Weigelt <info@metux.net>
>> ---
>>  drivers/tty/serial/dz.c | 8 ++++----
> 
> Do you have this hardware to test any of these changes with?

Unfortunately not :(


--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
