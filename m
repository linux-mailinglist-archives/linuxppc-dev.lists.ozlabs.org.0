Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 752954F0067
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 12:16:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVtHY2cMnz3084
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 21:16:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ubyq+QT4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=kvalo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ubyq+QT4; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVtGt5PR9z2xMQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 21:16:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5799CB803F2;
 Sat,  2 Apr 2022 10:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68767C340EC;
 Sat,  2 Apr 2022 10:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648894561;
 bh=DkcXIedyA5WoWD32Wfb0ixzTbuY09aixGrQDXb2pWC4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Ubyq+QT4nm5P5Q5jYMYqHGm9WwTMjgbKsyVVjNgMFWMHNbJS2QAto+N13XfwbUGQ5
 E9Cw+1xNlRSRJo1dz2ufaEaviqxRvbpnOggN/BG/X7QcB5g/mOBWeBlxdYW4Opit9h
 eQRyWfKOWWZvM1vnKw7kY792vP4/SQm5M4QlyrtfHhY2qx/H+0+oPU56HnMFrbYR6H
 4btd8Ny9o9VB0BEYnpplH8+CPyvNaz39SKDKNiwxEP7uUvvreHJ5X9oyL1ZgKNMpS6
 iUv66Ozt8HeIcE13uCoRA0PxZUAUclSnr3gyA+gXU79l7Mty5oLwYAwC7GtMblmmGZ
 3iNzO2UFdz/ow==
From: Kalle Valo <kvalo@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH net-next] orinoco: Prepare cleanup of powerpc's asm/prom.h
In-Reply-To: <4e3bfd4ffe2ed6b713ddd99b69dcc3d96adffe34.1648833427.git.christophe.leroy@csgroup.eu>
 (Christophe Leroy's message of "Sat, 2 Apr 2022 12:10:37 +0200")
References: <4e3bfd4ffe2ed6b713ddd99b69dcc3d96adffe34.1648833427.git.christophe.leroy@csgroup.eu>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Sat, 02 Apr 2022 13:15:55 +0300
Message-ID: <878rsnu6xw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> powerpc's asm/prom.h brings some headers that it doesn't
> need itself.
>
> In order to clean it up, first add missing headers in
> users of asm/prom.h
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/net/wireless/intersil/orinoco/airport.c | 1 +
>  1 file changed, 1 insertion(+)

orinoco patches are applied to wireless-next, not net-next.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
