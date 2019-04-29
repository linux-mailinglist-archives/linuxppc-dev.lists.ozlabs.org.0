Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A467EA20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 20:29:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tCqt4LfQzDqPm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 04:29:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=lkml@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tCpM4GnvzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 04:28:25 +1000 (AEST)
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N0FE1-1gWweB2srv-00xJGe; Mon, 29 Apr 2019 20:27:00 +0200
Subject: Re: [PATCH 13/41] drivers: tty: serial: uartlite: fill mapsize and
 use it
To: Peter Korsgaard <peter@korsgaard.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-14-git-send-email-info@metux.net>
 <87muk8rg82.fsf@dell.be.48ers.dk>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <cb01328c-6308-d9c7-17ba-644d983b0a50@metux.net>
Date: Mon, 29 Apr 2019 20:26:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <87muk8rg82.fsf@dell.be.48ers.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:au94e1eq1t1YlnnJViJhE/K6kMah+BGDcbk5VT8+2eMOcjazNzP
 K5DjPTgP9xkJSFVa90iiUwfTMbygt1pa/q/QVqLjBcRjKGldPhF1PlUIGuwEcvTYnwNYXHD
 4V5xXevhSRFXCoXSYK9fBGWVz8C7Tl/uH4wFGRM4rQiiRQ/9UA/oGA18KOJhfyGX6iPZWpN
 XbvZlLq2pR9jNFgvXr4Sg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9sF2aDxgqew=:FGiiUO8PT3ifq3hod8tMoL
 +SEtG8hOTCH9pJUceAM5iP2H5Es8lUmMB0syxlho4LBC+yxxXRhOFRB2cWsSjbWIidwwPruTU
 0EH2VtAuQux2vVmh6WCiw729yobnsE6+P1JmGeH3xjLZdERrEdqLAdFjESsBb3Q0acApejZtZ
 zF8Viv5HEqMjOgJ1mYJhsAFbtXu1GQ8IITc7sTnty/rlKmhJexVwNJgnBjdqF5ZvLqLxecutK
 kZYcw0VOhspQU0gpK38Kxzp7r0nRLryCZTn/J1G4yqdgXd9ZksMtMoU9Aq3CF83pBTmKEuMfc
 W6iTXMoanXU5yPYQUsjPJ4X8CSucyPOh99f8HWSnnz59FeA5v7yE/kp7l1fIlr5K1u57DIYas
 R7YtCVkI4bBRX3RmDPo/y1IOHz2JqWRDKz2GpU26JYmU2yzf9ADZMm3w9nHD2iQOS21515NNx
 aQoEbBqIk+5kUHNVp2sw8kl8W5rbQ5QZSsgH/c8toQw67UhsUeuPvx425Yp7z4mplQmH4NlbT
 NgVx6Ahvz5wR9VoYhgLcei+Vz3/MqzReS6oP0JQ4aQh/MwUkU8lJwFW9tBu361Ays/BqoFyDb
 xiUN4IP0nNNMQp9V228OUBdjFFGdu4aU8k6c+QTT3D33uXP0z0uWrG8na7KNTfy7xff4cGQ0o
 TMDfGeX3+/tR9Z8ZWz8juRpzoZCUwqW4ATnaFyO1hO1XGHBPU/Tr30mlExcmRm/bx7EI73fMC
 AI9rD1w3c+BVcecBqTfQ0HHodM0p73pOlAR0KOmXf0piKKh5JjRv5OoDRY4=
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org, macro@linux-mips.org,
 andrew@aj.id.au, gregkh@linuxfoundation.org, slemieux.tyco@gmail.com,
 liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linux-mips@vger.kernel.org,
 linux@prisktech.co.nz, matthias.bgg@gmail.com, khilman@baylibre.com,
 linux-serial@vger.kernel.org, sudeep.holla@arm.com, sparclinux@vger.kernel.org,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org, vz@mleia.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29.04.19 17:19, Peter Korsgaard wrote:
>>>>>> "Enrico" == Enrico Weigelt, metux IT consult <info@metux.net> writes:
> 
>  > Fill the struct uart_port->mapsize field and use it, insteaf of
> 
> s/insteaf/instead/

Fixed.

>  > hardcoded values in many places. This makes the code layout a bit
>  > more consistent and easily allows using generic helpers for the
>  > io memory handling.
> 
>  > Candidates for such helpers could be eg. the request+ioremap and
>  > iounmap+release combinations.
> 
>  > Signed-off-by: Enrico Weigelt <info@metux.net>
> 
> Acked-by: Peter Korsgaard <peter@korsgaard.com>

thanks for review.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
