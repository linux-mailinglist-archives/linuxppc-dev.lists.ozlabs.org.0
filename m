Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A935911D45
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 09:48:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VfFN+Huq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W58bp6tSVz3cZF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 17:48:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VfFN+Huq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W58b805Nzz3cGb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 17:47:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1CF662345;
	Fri, 21 Jun 2024 07:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED54C2BBFC;
	Fri, 21 Jun 2024 07:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718956049;
	bh=+n1uE1MrLQMFhNN+7jwAvQajIquhPpIK6hC9WogIb1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfFN+HuqInMOioum3nOUUAxrTdtVdjbZPYztVw5rmIyxcrJKkfr//GPMMvssZ97mF
	 bc16USxoEeLnXgt2+ZWBhKfJaZxF6h94UXw/6wVZmRCosK7MzmOV/zy0hFkL9oAOTY
	 pLA96PVGw92edy7QBoumKi8/eHn/jpPrkZVF8iciR02xYit0fMKT5AKfFI28z2S/Xo
	 7cTGqzDyXh0801wUzYZXCV5iG5ibGw7x8NUtpfJaovfGEj4d4xgd71H8ZAoG1ltp5R
	 DaYwRoRG9BedSojyfpOn0Rc1oP+3UrPp/XDKQIT4MVW7tJ4oBBcq8vXMRLFcoNlAPv
	 I1hJb8yogM0Jw==
Date: Fri, 21 Jun 2024 09:47:19 +0200
From: Christian Brauner <brauner@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 01/15] ftruncate: pass a signed offset
Message-ID: <20240621-jeden-hinab-e265b0d0807a@brauner>
References: <20240620162316.3674955-1-arnd@kernel.org>
 <20240620162316.3674955-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240620162316.3674955-2-arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, linux-csky@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, ltp@lists.linux.it, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2024 at 06:23:02PM GMT, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The old ftruncate() syscall, using the 32-bit off_t misses a sign
> extension when called in compat mode on 64-bit architectures.  As a
> result, passing a negative length accidentally succeeds in truncating
> to file size between 2GiB and 4GiB.
> 
> Changing the type of the compat syscall to the signed compat_off_t
> changes the behavior so it instead returns -EINVAL.
> 
> The native entry point, the truncate() syscall and the corresponding
> loff_t based variants are all correct already and do not suffer
> from this mistake.
> 
> Fixes: 3f6d078d4acc ("fix compat truncate/ftruncate")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>
