Return-Path: <linuxppc-dev+bounces-9080-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D64EFACB71D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 17:25:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9yMP2MSRz2y8l;
	Tue,  3 Jun 2025 01:25:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:470:ea4a:1:5054:ff:fec7:86e4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748877905;
	cv=none; b=YTAF4V0qwMPSOOjUcvGG4m0zPcatgxMKnmnkr4ua0brz64/blegWe+0tKMleOi8EloIMTmj4e7YpnTNWOU5XSLWHGmlY0WezCZ45KNp+xueQqHQfNjUG6WlrgxkalGPZh6feNGUqTOYB1H553OqOqOLM363XBP65ILzDxNCydJzLWmOGlCt7OcJqgI7GydOG5DMR3FDIn5/j0EGgfnlkOeUFWdLyOfNEqkCTUgi85QUwQvbkOpjWY70JSl8A9Cb8nGElp/yuZyYeiOo0GWwluByhV3YkyZex2u/060QVvyRCq6vFJPdNxoRXYcVAZ4rXH0Yp++bZcbuQ71eypvAWKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748877905; c=relaxed/relaxed;
	bh=wg+7CJ80bXnmYz8m8LaLQp816Yk+yAblH0z8mCujKYo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OQwV2t9TYNDl4cs7FantgsheioiLyYKyGFmx/4zCto5bL0d8uwQHqUF2Yx38wCTtSzLa9nPZ3apUtdQjiIpY2MFOkdu5gPafF28q+wTFhvEvjUFCI7jWUy/g4lUUlsK2gE8EiaearFe96mpNtN+m/78p2geIluSJ9PJQXy4YCTfcetoQ1rc5jkNZw5OphmxWI3FsGLNkeMkzNhyCY5xrnqGzUDUlsuY7Y0qhSv+HbfsbOU+VLtWYaW975Nj+x25ZUZrU1pcJdcE+KRGIle2dCpZsU/4XUwSyMn1/x1eHcmNCqCVsnbhW6Z5yukK0mRCSJ7jxSepGIYpdMHoVwxChEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass (client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4; helo=smtp.gentoo.org; envelope-from=sam@gentoo.org; receiver=lists.ozlabs.org) smtp.mailfrom=gentoo.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gentoo.org (client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4; helo=smtp.gentoo.org; envelope-from=sam@gentoo.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 506 seconds by postgrey-1.37 at boromir; Tue, 03 Jun 2025 01:25:04 AEST
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9yMN0zrvz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 01:25:04 +1000 (AEST)
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A5F393412DE;
	Mon, 02 Jun 2025 15:16:19 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,  linmag7@gmail.com,  Al
 Viro <viro@ftp.linux.org.uk>,  arnd@arndb.de,  chris@zankel.net,
  dinguyen@kernel.org,  glaubitz@physik.fu-berlin.de,  ink@unseen.parts,
  jcmvbkbc@gmail.com,  kees@kernel.org,  linux-alpha@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-csky@vger.kernel.org,
  linux-hexagon@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-m68k@lists.linux-m68k.org,  linux-mips@vger.kernel.org,
  linux-openrisc@vger.kernel.org,  linux-parisc@vger.kernel.org,
  linux-riscv@lists.infradead.org,  linux-s390@vger.kernel.org,
  linux-sh@vger.kernel.org,  linux-snps-arc@lists.infradead.org,
  linux-um@lists.infradead.org,  linuxppc-dev@lists.ozlabs.org,
  loongarch@lists.linux.dev,  mattst88@gmail.com,  monstr@monstr.eu,
  richard.henderson@linaro.org,  sparclinux@vger.kernel.org,
  x86@kernel.org
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
In-Reply-To: <20250602041118.GA2675383@ZenIV>
Organization: Gentoo
References: <87cyfejafj.fsf@gentoo.org> <87v7rik020.fsf@gentoo.org>
	<20250602041118.GA2675383@ZenIV>
User-Agent: mu4e 1.12.9; emacs 31.0.50
Date: Mon, 02 Jun 2025 16:16:14 +0100
Message-ID: <878qma41j5.fsf@gentoo.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Al Viro <viro@zeniv.linux.org.uk> writes:

> On Sat, Apr 05, 2025 at 06:09:11PM +0100, Sam James wrote:
>> Sam James <sam@gentoo.org> writes:
>> 
>> > Lovely cleanup and a great suggestion from Al.
>> >
>> > Reviewed-by: Sam James <sam@gentoo.org>
>> >
>> > I'd suggest adding a:
>> > Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
>> 
>> Al, were you planning on taking this through your tree?
>
> FWIW, I expected it to get sent to Linus as "please, run this
> sed script before -rc1" kind of thing, script being something
> like
>
> sed -i -e 's/int pte_swp_exclusive/bool pte_swp_exclusive/' \
> 	`git grep -l 'int pte_swp_exclusive'`
>
> with suggested commit message...  It's absolutely regular and
> that kind of tree-wide change is easier handled that way.

Ah, sorry. Both Magnus and I are new and irregular kernel contributors,
but I've seen that before and should've thought of it.

> [...]

cheers,
sam

