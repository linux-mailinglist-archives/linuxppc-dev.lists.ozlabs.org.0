Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9E710158
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 23:04:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tvCq3S9ZzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 07:04:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=mleia.com
 (client-ip=178.79.152.223; helo=mail.mleia.com; envelope-from=vz@mleia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=mleia.com
X-Greylist: delayed 590 seconds by postgrey-1.36 at bilbo;
 Wed, 01 May 2019 07:02:57 AEST
Received: from mail.mleia.com (mleia.com [178.79.152.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tvB91CplzDqNn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 07:02:56 +1000 (AEST)
Received: from mail.mleia.com (localhost [127.0.0.1])
 by mail.mleia.com (Postfix) with ESMTP id 6A35D4668DD;
 Tue, 30 Apr 2019 21:53:00 +0100 (BST)
Subject: Re: [PATCH 41/41] drivers: tty: serial: lpc32xx_hs: fill mapsize and
 use it
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-42-git-send-email-info@metux.net>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <3cfc4396-b152-e9a6-bf29-a4c901ac90e6@mleia.com>
Date: Tue, 30 Apr 2019 23:52:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1556369542-13247-42-git-send-email-info@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20190430_215300_466850_76BEA83B 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message. 
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
Cc: sudeep.holla@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 slemieux.tyco@gmail.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 linux@prisktech.co.nz, sparclinux@vger.kernel.org, lorenzo.pieralisi@arm.com,
 macro@linux-mips.org, khilman@baylibre.com, matthias.bgg@gmail.com,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Enrico,

On 04/27/2019 03:52 PM, Enrico Weigelt, metux IT consult wrote:
> Fill the struct uart_port->mapsize field and use it, insteaf of

typo, s/insteaf/instead/

> hardcoded values in many places. This makes the code layout a bit
> more consistent and easily allows using generic helpers for the
> io memory handling.
> 
> Candidates for such helpers could be eg. the request+ioremap and
> iounmap+release combinations.
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
