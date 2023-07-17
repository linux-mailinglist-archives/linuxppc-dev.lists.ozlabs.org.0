Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D6756DA1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 21:50:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2pkWsLaj;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rs+yyEhn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4XkV73SBz2ygq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 05:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2pkWsLaj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rs+yyEhn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 363 seconds by postgrey-1.37 at boromir; Tue, 18 Jul 2023 05:49:58 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Xjf3mt0z2yDQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 05:49:58 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1689623030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BIYuBceOvZxFcNDniGd0KrPzPzR4CRiWHjc/79HQdoA=;
	b=2pkWsLajD3WSzZpO5sVNUa3P6XkSNWZvfID18WmcLhV+6Alkt07jKtfYra98Gs9Y0YCpQT
	tsjv7Oj1rfWuJCS7sJshZNMDHpJH8S85+NKqPtvFOfdtZPAQxY54Gm86XZZJKDz3r5uOqw
	I1wqvHxV0R+PSs0Xg3eBtxXpaNKrED9LRbOZQobYmiMjQlmovZOBGoPWgxSuUs1aLwqiHK
	irAbGzEdAmuRrNj9Ep6dAL5DwpIs/arkk0oID7z5QNHhTi5W4DmkmWfrouJAfslOUfypDP
	nxir+Wu7iP7Uc6zawc1ysOcwpffaeMJ04blepYDfY6Lx+OsNZjA/shOKhGQzMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1689623030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BIYuBceOvZxFcNDniGd0KrPzPzR4CRiWHjc/79HQdoA=;
	b=rs+yyEhnNnmpnbiKwcLxUFW6oNy+iudM04d9wU+M2uXz54/ai7Wej9xR3yhwXpvHUiL6PI
	xhiCrITvMPI8mfAw==
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/build: vdso linker warning for orphan sections
In-Reply-To: <20230609051002.3342-1-npiggin@gmail.com>
References: <20230609051002.3342-1-npiggin@gmail.com>
Date: Mon, 17 Jul 2023 21:49:48 +0206
Message-ID: <871qh6wcgb.fsf@jogness.linutronix.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nicholas,

On 2023-06-09, Nicholas Piggin <npiggin@gmail.com> wrote:
> Add --orphan-handlin for vdsos, and adjust vdso linker scripts to deal
> with orphan sections.

I'm reporting that I am getting a linker warning with 6.5-rc2. The
warning message is:

ld: warning: discarding dynamic section .rela.opd

and bisects to:

8ad57add77d3 ("powerpc/build: vdso linker warning for orphan sections")

Despite the warning, my ppc64 system seems to run fine. Let me know if
you need any other information from me.

I noticed [0] this with 6.5-rc1 but didn't contact the right people.

John Ogness

[0] https://lore.kernel.org/lkml/871qhf1q3j.fsf@jogness.linutronix.de
