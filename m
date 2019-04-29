Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 104A2E7A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 18:22:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t9121hMdzDqS7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 02:22:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.17.13; helo=mout.kundenserver.de;
 envelope-from=lkml@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t8zd6JNczDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 02:21:16 +1000 (AEST)
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mwwm5-1gaMFo1KN1-00yOxX; Mon, 29 Apr 2019 18:20:39 +0200
Subject: Re: [PATCH 22/41] drivers: tty: serial: cpm_uart: fix logging calls
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-23-git-send-email-info@metux.net>
 <a00ba23b-e73e-c964-a6d0-347cb605b8c8@c-s.fr>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <fc01df37-3e7e-0c71-745d-63fbd83c1079@metux.net>
Date: Mon, 29 Apr 2019 18:20:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <a00ba23b-e73e-c964-a6d0-347cb605b8c8@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:tyjLH/89kE1DHJTcj7yQUi5/jAAZ5RWHEAZ1BEYsF/kWEbRkhEH
 ZeaoyF1df0iBCTPcuY9nMjeSr96B+reEDpUpVACuMx58hYfg0Ovl49rQYub23PLjPK+yUID
 slNmJJYsTtoV+aOWQj1HRbA5ynpZ744EoI0A3tjgNZt1lZntfjDIcPBJU9Pfhs6+X+GK7WP
 t2o2PeOOqkzRGtr61EECg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VjVnj6n6CTk=:oLoFfSXyDvVj4bcXT6Ih/4
 kL0M02IkYcM23hQBqWuWitHhRHbYjCdwo7yZCm+3pBB5no8X/Ztr8zkGyrVRrPMSlNYX0gK3B
 zLkvJlnWomR5UquIKZ13gZBV4/wjOl1kSv+4LiRfmqDVFOKnXIw+UAnjDoRPwbvqi2dxuhVHa
 IXOpQP00pNeser50seIPI/ovlbFbXJMBOVj1rt+0+0uSk0wstKhVVSaWsva/3NcMpYr44iwKN
 pL8XlLZaS2QOBl/ynF7SoVxFIvZnEMQhJorItjLuphNxXCvtzj8rhqLrrkkajgQ/0pjUy4Tiq
 3WJvabYmjDHm85gs3l1RGTIP/leL/aifhMaOXM4Qx1sHVTJJxlMw1it7I31wrFqe0C0T5Tnk3
 +5c0iqDZF6VBw0XsN+FMTdvwwN5so9je+rNUHID3sD5Yvm8xjw93Uo6bviA4/IiHvX0mEdSAj
 xKxitSG92ozPUuigbzb+oogChLmFoFbXi6s3ER6JiRSVDa9POQO26X1cecixkOz2/SyaNrtd5
 wi3bBiZX/zwK/cEVJZg0BMo3ilxjtajTeiY2OsNJmCcBp61mptn8TueHekBXTEmqhyvIWEcks
 Pwcb//riDg9W1mzMTxm5SPvVgmRR3xYRVRFYmTDZ46n62kPQaVUbket7jbv2AqHlWLKiCqkR4
 n4RNCb4xflN9afHD65/ruEWM68k3MVK9H9CPTVyg90priPsyjBaWTOwBYdw4mnSSnWx3W9pFV
 HxWHJkWswPIQsZuk5ib+4UBHe5duPTXhYEDd7bKV8coJopag7yNzn+KUAT2H9z/JPgKcId2QY
 fg2wigxSa7xJUSvPOamObTx2eMiO5lok3NOq7YtNTSlPbcGNlc13ID61c5JH/6t6NJ6lPjs
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
 liviu.dudau@arm.com, linux-mips@vger.kernel.org, vz@mleia.com,
 linux@prisktech.co.nz, matthias.bgg@gmail.com, khilman@baylibre.com,
 linux-serial@vger.kernel.org, sudeep.holla@arm.com, sparclinux@vger.kernel.org,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29.04.19 17:59, Christophe Leroy wrote:

> If we want to do something useful, wouldn't it make more sense to
> introduce the use of dev_err() in order to identify the faulting device
> in the message ?

Well, I could get the struct device* pointer via pinfo.port->dev,
but I wasn't entirely sure that it's always defined before these
functions could be called.

Shall I change it to dev_*() ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
