Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E21956601C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 02:43:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcP6c0vQ4z3c2c
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 10:43:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cML8F2/r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cML8F2/r;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LcP614YBFz2yh9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 10:42:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 592FAB810AC;
	Tue,  5 Jul 2022 00:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA609C3411E;
	Tue,  5 Jul 2022 00:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656981763;
	bh=NH5c7njVSOspj3x3CMKvmR0zmbbUmwx4E9ZZYbEUmyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cML8F2/rNnHbks8e7CnqUhOmIdkzwwsccL1VmbQy1N2i896KnOAyzzcV3IQUw1bun
	 j4wTeQLNJ9g/xMhFZUcxNQ+dywd34+nYX2acDwVvOMgiInFIKtXsefmpSyizqVknnM
	 b7hftZlzd3RUANdcMcdUiaB/qXh3GqfM5UdNLZnt3l1astEM0M8K5ny93L1nZHmdtH
	 WeRFtSh7WOBl/Hl/Vfpay2u18ChiFwaXNlOg9VgXlLpXvH1+HuHeiIaDWTUrspVb7m
	 p2gnRyMtBxZuJJGAX3yv9ZbePsBuE8dM/atdGFhOYKu0YROHQovEZ1YP5l+yyLiPih
	 WoRW00tur0vZA==
Date: Tue, 5 Jul 2022 08:42:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next 1/2] soc: fsl: guts: fix return value check in
 fsl_guts_init()
Message-ID: <20220705004237.GP819983@dragon>
References: <20220628140249.1073809-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628140249.1073809-1-yangyingliang@huawei.com>
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
Cc: arnd@arndb.de, michael@walle.cc, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 28, 2022 at 10:02:48PM +0800, Yang Yingliang wrote:
> In case of error, of_iomap() returns NULL pointer not ERR_PTR().
> The IS_ERR() test in the return value check should be replaced
> with NULL test and return -ENOMEM as error value.
> 
> Fixes: ab4988d6a393 ("soc: fsl: guts: embed fsl_guts_get_svr() in probe()")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied both, thanks!
