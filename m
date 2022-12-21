Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E21E653225
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 15:05:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcZw06Kjbz3cGv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 01:05:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lagTYOtC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=kbol=4t=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lagTYOtC;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NcZv31tsDz3bTF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 01:04:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF652617C2;
	Wed, 21 Dec 2022 14:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B314C433EF;
	Wed, 21 Dec 2022 14:04:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lagTYOtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1671631461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IGwYRqmYe1tulaCQh1AZycwBWtT5OF47TSgo9FHLK5I=;
	b=lagTYOtCAGuSUYb+3GhNLPs3gh4BK/ut2Ty1C0Zx/sNDZM3HKgGiXpx98TDP1cPHAMtqLv
	oAGcsn0dxWMuMfzdzx69weIAPh2P482PdMfkYbtTgVx2dppl2WcyBQlOxO5xiwZ63ZAEh1
	fIqORygw+AM/2k3hIVRyob1MkEkdBHc=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 65bed60f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 21 Dec 2022 14:04:21 +0000 (UTC)
Date: Wed, 21 Dec 2022 15:04:17 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v12 0/6] implement getrandom() in vDSO
Message-ID: <Y6MSYWHl1dV2nFzK@zx2c4.com>
References: <20221212185347.1286824-1-Jason@zx2c4.com>
 <86cfa465-2485-ff24-16f5-9014e25a0e98@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86cfa465-2485-ff24-16f5-9014e25a0e98@csgroup.eu>
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
Cc: Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Carlos O'Donell <carlos@redhat.com>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "patches@lists.linux.dev" <patches@lists.linux.dev>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 20, 2022 at 05:17:52PM +0000, Christophe Leroy wrote:
> I would have liked to give it a try on powerpc, but the series 
> conflicts. I tried both on v6.1 and on linus/master from now:

I'll send a rebased v+1 shortly.

Jason
