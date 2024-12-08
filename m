Return-Path: <linuxppc-dev+bounces-3850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DF59E8888
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 00:03:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y60sQ407gz2xPf;
	Mon,  9 Dec 2024 10:03:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:a60:0:28:0:1:25:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733699002;
	cv=none; b=D4SarXmxBe0Wjj0a/KNiCJ2nZoP9xyeGkBLZzthhIvPyVtt02mfOWzB79QP8OIm7pQ61veP6u+y0ePTLeVYrbvb37pcBXTcKyXf/8G7gmwRNkrNeei2yqApeDMlOGQM4oYvxA/7wk9xFtw0+8dUTVhgNFfxAF8xCKbY2A65P9izl1A0fu5CAf7zlQGi3zyXwnEwPqymlvbTYljXU8JUmoRK1t5J1hctTJ8f+On0xxOrx4IraY2ULtXtjZeC0uCXAbcmobKy+BmNieafu7JjUU21hfalVzkt2sy0tYiLkUAaDIFp2qu3BYmHVxgrkTwyl7N1nXmzi2R7M0CBRN/ZABw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733699002; c=relaxed/relaxed;
	bh=B0jGX4f2yQt/9jq2KnPHjg0SkkzFZXmlu83DseGgWko=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HZA7ux0Hagy8e3ZDWls+EmVSwG0s30u4inuUpVfPYI0CLka9kq8e4VBZULjRLKPQoDyVMtFaJm35hs0PS1xYQ9D9g5xMCrtvXQVQzl8LuQDesQfL7z9HIHyHahrgZMZsETYP0xsVyodlGKjZdFWaCOFFXR2S2DpP6kjOOChDf4vTHyCjM6ghyhV1WEXgTCXxWwqPEMSFjJ4uhehmJq5mFhFRrEg1bNxdBoq00houU32yraS/wqQbAOBqjlo84dwAN4O2hSHNi1ThHwstMbfBC6jIz5qbvTWxZeNAXUwsdAbUOlASsHRl8i1YbI3W39kwPn9JrDxabf3yPp+yT/Tf7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=2001:a60:0:28:0:1:25:1; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=lists.ozlabs.org) smtp.mailfrom=nefkom.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=2001:a60:0:28:0:1:25:1; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 488 seconds by postgrey-1.37 at boromir; Mon, 09 Dec 2024 10:03:20 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y60sN31fyz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2024 10:03:19 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Y60gg08dmz1sB7H;
	Sun,  8 Dec 2024 23:54:54 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4Y60gf6RgRz1qqlW;
	Sun,  8 Dec 2024 23:54:54 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id T0-rdDGm_aRI; Sun,  8 Dec 2024 23:54:54 +0100 (CET)
X-Auth-Info: p2dcipIOeCHJ4WzOEzV4hDpcyOeAurrqSICwrZBUAPVj2EEyzsLx8mpKpH+qJ2m1
Received: from igel.home (aftr-82-135-83-17.dynamic.mnet-online.de [82.135.83.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun,  8 Dec 2024 23:54:54 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id C74EA2C19F2; Sun,  8 Dec 2024 23:54:53 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,  LKML
 <linux-kernel@vger.kernel.org>,  x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] futex: improve user space accesses
In-Reply-To: <20241122193305.7316-1-torvalds@linux-foundation.org> (Linus
	Torvalds's message of "Fri, 22 Nov 2024 11:33:05 -0800")
References: <20241122193305.7316-1-torvalds@linux-foundation.org>
X-Yow: I had a lease on an OEDIPUS COMPLEX back in '81...
Date: Sun, 08 Dec 2024 23:54:53 +0100
Message-ID: <87bjxl6b0i.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Nov 22 2024, Linus Torvalds wrote:

> Josh Poimboeuf reports that he got a "will-it-scale.per_process_ops 1.9%
> improvement" report for his patch that changed __get_user() to use
> pointer masking instead of the explicit speculation barrier.  However,
> that patch doesn't actually work in the general case, because some (very
> bad) architecture-specific code actually depends on __get_user() also
> working on kernel addresses.
>
> A profile showed that the offending __get_user() was the futex code,
> which really should be fixed up to not use that horrid legacy case.
> Rewrite futex_get_value_locked() to use the modern user acccess helpers,
> and inline it so that the compiler not only avoids the function call for
> a few instructions, but can do CSE on the address masking.

This breaks userspace on ppc32.  As soon as /init in the initrd is
started the kernel hangs (without any messages).

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

