Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6570855E554
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 16:28:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXRlV6mk7z3cK6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 00:28:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=CT1XHrct;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=CT1XHrct;
	dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXRks1tRVz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 00:27:32 +1000 (AEST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 4498222246;
	Tue, 28 Jun 2022 16:27:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1656426446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JHFbXd+WNtNIJszeKeAq0pw48IrQ1dnM0j78sJ1LNLI=;
	b=CT1XHrctn/p9QrSCpS0yYSjSmCtZ/F8BJDs5EhDC57YFKCtnE0lH9vNzjaDEpHUM7sXzrI
	HiLecE56ocS4JE0BIx06jXp+yzJatOIsntln1TlfUqUzqizz1rMVzIlLn/if3Uq13lWVj6
	N6iWnX086nc/79yXg2u4WAFqgky5EoA=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 28 Jun 2022 16:27:23 +0200
From: Michael Walle <michael@walle.cc>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next 1/2] soc: fsl: guts: fix return value check in
 fsl_guts_init()
In-Reply-To: <20220628140249.1073809-1-yangyingliang@huawei.com>
References: <20220628140249.1073809-1-yangyingliang@huawei.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <42601e860097651547fb9baecd660b5c@walle.cc>
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
> In case of error, of_iomap() returns NULL pointer not ERR_PTR().
> The IS_ERR() test in the return value check should be replaced
> with NULL test and return -ENOMEM as error value.
> 
> Fixes: ab4988d6a393 ("soc: fsl: guts: embed fsl_guts_get_svr() in 
> probe()")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Thanks!

Reviewed-by: Michael Walle <michael@walle.cc>
