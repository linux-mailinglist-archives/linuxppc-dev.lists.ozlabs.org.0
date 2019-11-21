Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B427E105AAA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 20:56:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jr0v1STGzDqxg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 06:56:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Jqyk2Xh4zDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 06:54:33 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2001:558:600a:cc:f9f3:9371:b0b8:cb13])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 37D6215044652;
 Thu, 21 Nov 2019 11:54:23 -0800 (PST)
Date: Thu, 21 Nov 2019 11:54:22 -0800 (PST)
Message-Id: <20191121.115422.718114631247576545.davem@davemloft.net>
To: krzk@kernel.org
Subject: Re: [PATCH] drivers: net: Fix Kconfig indentation, continued
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191121132828.28828-1-krzk@kernel.org>
References: <20191121132828.28828-1-krzk@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 21 Nov 2019 11:54:23 -0800 (PST)
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
Cc: alex.aring@gmail.com, sgruszka@redhat.com, netdev@vger.kernel.org,
 helmut.schaa@googlemail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath9k-devel@qca.qualcomm.com,
 linux-wpan@vger.kernel.org, pontus.fuchs@gmail.com, stefan@datenfreihafen.org,
 linuxppc-dev@lists.ozlabs.org, kvalo@codeaurora.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 21 Nov 2019 21:28:28 +0800

> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style.  This fixes various indentation mixups (seven spaces,
> tab+one space, etc).
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to net-next.
