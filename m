Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C34F873D641
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 05:21:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lgqx4Tr0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqCmp4vBYz2xq7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 13:21:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lgqx4Tr0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqClv16NHz2ykB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 13:20:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7863360C6D;
	Mon, 26 Jun 2023 03:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60E1C433C8;
	Mon, 26 Jun 2023 03:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687749638;
	bh=0j42pFaHzOUI6swjUOLjkgy+NNh2RUt8s6H5ez2k5IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lgqx4Tr02Iw9n2yo+uU0QlSokM0TVEq9+ArAqcY9hQEFnVFq4ks++nrhAS3lR2TA5
	 uu8czI9zAZg8kicW5bE+OlAFIaJWeudWIOR358LrAYgfnP/irTMaL2gn8aGxjV5jw8
	 M3LXLctJ024YN17riX4Z9Chx+B7cg+0AtR7pqZKrLusTldNVnQwQinz+ZvE0qCYUyz
	 hdSgm3sqlug63AAFT+bTkfnJPK2UFj3ut75xqqNnGaJiZnlrH474nw5PPkyc+O9pYU
	 LdIsZOw4wDJZEnVWvVRmO22MWwH7oUfdg5/phrjwIDRCxdCUuApOfEA9WJwCWnyaFM
	 i7bIbbup2JaxA==
Date: Sun, 25 Jun 2023 20:20:36 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] objtool: Make 'sec-address' always on
Message-ID: <20230626032036.m7vdthsguezm52wa@treble>
References: <e7e1de1d01194df3ff4053cb0815fc2ddba33213.1687360711.git.christophe.leroy@csgroup.eu>
 <202306241520.4jIgEhK4-lkp@intel.com>
 <2bd6c377-51ac-e2e2-6fcf-9c9b0f96f9cf@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2bd6c377-51ac-e2e2-6fcf-9c9b0f96f9cf@csgroup.eu>
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
Cc: Peter Zijlstra <peterz@infradead.org>, "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, kernel test robot <lkp@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 24, 2023 at 08:30:48AM +0000, Christophe Leroy wrote:
> >>> vmlinux.o: warning: objtool: ibt_selftest+0x14 (.text+0x92b54): sibling call from callable instruction with modified stack frame
> >     vmlinux.o: warning: objtool: .altinstr_replacement+0x19a4: redundant UACCESS disable
> >     vmlinux.o: warning: objtool: iovec_from_user.part.0+0xb1 (.text+0x1c47761): call to copy_iovec_from_user.part.0() with UACCESS enabled
> >     vmlinux.o: warning: objtool: ibt_selftest+0x1e (.text+0x92b5e): return with modified stack frame
> > 
> 
> I can't really see any link between that warning and the changes in the 
> patch.

I suspect it's a pre-existing warning, but because the patch made a
change to the default formatting (adding .text+off), it looks like a new
warning to the bots.

-- 
Josh
