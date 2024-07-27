Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3791793DCFA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 03:45:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fDPTF0TX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW6rY1Djmz3fnK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 11:45:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fDPTF0TX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW6qk03HXz3flj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 11:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=EuosPWo/SMY3Ag8riJ+kOIDiKjmJxa9RY3PBvDWQSxU=; b=fDPTF0TX/T2HkQpbmD8SvDtoca
	LAkH3dE2g4a8UBqTqSdSfS9tMWNzxTge7fyCKqHlzHHpfaRvY6KzpSem8kM4IzcE9u7deXb5gkmso
	P5VA6B5KAZz83Fn3UobaRY64xRECEdP7GWkEG1bkFkbSUhHKKKsj2vJ4BzgfvTPMBQv3smJAQD8cd
	aY9zuKqzSlMnYceRoxmItnYZg4tjELfRmGbLk0x8mnvTjoCaLGcQWswbCZqGLbQ9EfMdWi3VLxBFh
	Sc9x+o2pYB1K+4PhywYUGufozKMueE7FTScvPlWzVJSr4qxWPZIXJSTVYLlyqs0VHsCSByIeca8OK
	rdMFP3Sw==;
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXWTp-0000000AtEt-1Dk6;
	Sat, 27 Jul 2024 01:44:17 +0000
Message-ID: <c7858827-b788-426a-acaa-9563c154f58d@infradead.org>
Date: Sat, 27 Jul 2024 10:44:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: Mark powerpc Cell as orphaned
To: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
References: <20240726123322.1165562-1-mpe@ellerman.id.au>
 <60581044-df82-40ad-b94c-56468007a93e@app.fastmail.com>
Content-Language: en-US
In-Reply-To: <60581044-df82-40ad-b94c-56468007a93e@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Jeremy Kerr <jk@ozlabs.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On 7/26/24 22:15, Arnd Bergmann wrote:
> Geoff, are you using spufs on ps3, and if so, should
> we move arch/powerpc/platforms/cell/spu* to the PS3
> entry in the MAINTAINERS file? I don't think there
> is any advantage in actually moving the files to
> platforms/ps3 if we delete the cell blade support.

ps3_defconfig has both CONFIG_SPU_BASE and CONFIG_SPU_FS
enabled.  I think one of the things users want to use are
the SPUs.

Updating the MAINTAINERS file sounds OK. Do you want to
make the patch for that?

-Geoff
