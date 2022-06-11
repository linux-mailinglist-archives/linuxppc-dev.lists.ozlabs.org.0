Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51827547326
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 11:23:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKsnf1v3qz3cFW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 19:23:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=ZCKpis6s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=qlft=ws=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=ZCKpis6s;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKsn22GzJz3015
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 19:22:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1FF4D60ABC;
	Sat, 11 Jun 2022 09:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C667C34116;
	Sat, 11 Jun 2022 09:22:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZCKpis6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654939361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+VJZNV6229HxkzVhPTFcAaMsHDNyC/F9ZlzY6G3c2Xw=;
	b=ZCKpis6sA9rSlL985IbDrqK6FXPPQgAnpKOPcVHzrfD6u9njc3lC+W1q9lcTBwmMPZm2ff
	wPgxBWItOmLZD0XDk4Ph9Kq3Pv2sqXF4tSuG1ce7h9dfh2ujIUTkJ2eC52nSnnNxn7AKuv
	au5klxC6pRGZ8UNKRf2PNF3/wKIAXbU=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 51139443 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Sat, 11 Jun 2022 09:22:41 +0000 (UTC)
Date: Sat, 11 Jun 2022 11:22:39 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/rng: wire up during setup_arch
Message-ID: <YqRe3wHSuM6dcsCU@zx2c4.com>
References: <20220611081114.449165-1-Jason@zx2c4.com>
 <956d2faa-4dae-fc75-2c03-387c77806f2b@csgroup.eu>
 <f6e5a9c4-f39d-749f-d124-884f11a8edfb@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f6e5a9c4-f39d-749f-d124-884f11a8edfb@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Sat, Jun 11, 2022 at 11:17:23AM +0200, Christophe Leroy wrote:
> Also, you copied stable. Should you add a Fixes: tag so that we know 
> what it fixes ?

I suppose the fixes tag would be whatever introduced those files in the
first place, so not all together useful. But if you want something, feel
free to append these when applying the commit:

Fixes: a4da0d50b2a0 ("powerpc: Implement arch_get_random_long/int() for powernv")
Fixes: a489043f4626 ("powerpc/pseries: Implement arch_get_random_long() based on H_RANDOM")
Fixes: c25769fddaec ("powerpc/microwatt: Add support for hardware random number generator")

Jason
