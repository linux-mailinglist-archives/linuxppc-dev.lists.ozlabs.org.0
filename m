Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB3155E555
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 16:29:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXRnG5gFXz3cdQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 00:29:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=tpeev2+k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=tpeev2+k;
	dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXRmg6vH8z2ypH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 00:29:07 +1000 (AEST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 6149022246;
	Tue, 28 Jun 2022 16:29:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1656426540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MpRKtZpFLktkgTbi7m0M2Z6Uxt/QW82l1sKys2neJSI=;
	b=tpeev2+k0VwkguJMzUXow/hE9mwgT6YIGphV0rguswqfC1KlbgkrV+R/nvNDq6k/j9benF
	uhP7vsQ6MP+MoW/2HUjS+56XWs1HG99Abmjc0jyqL0tR2fhMQ2JS8zT8vMEDfJlhuE1jCU
	/BmS4vN6wyRQbS/0J46mkeG1y9Cr98Q=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 28 Jun 2022 16:29:00 +0200
From: Michael Walle <michael@walle.cc>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next 2/2] soc: fsl: guts: check return value after
 calling of_iomap() in fsl_guts_get_soc_uid()
In-Reply-To: <20220628140249.1073809-2-yangyingliang@huawei.com>
References: <20220628140249.1073809-1-yangyingliang@huawei.com>
 <20220628140249.1073809-2-yangyingliang@huawei.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f7204602d78a5a077cfb7a0c91bde64a@walle.cc>
X-Sender: michael@walle.cc
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
Cc: arnd@arndb.de, shawnguo@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 2022-06-28 16:02, schrieb Yang Yingliang:
> of_iomap() may return NULL, so we need check the return value.
> 
> Fixes: 786dde1e59d7 ("soc: fsl: guts: add serial_number support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Michael Walle <michael@walle.cc>
