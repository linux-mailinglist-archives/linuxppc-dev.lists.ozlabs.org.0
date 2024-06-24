Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6A4914DC2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 14:53:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=hj8g+3Oo;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZCi/NfA7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W77F631WSz3ccf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 22:53:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=hj8g+3Oo;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZCi/NfA7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.145; helo=fout2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W77DP3L4Nz30VT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 22:53:09 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 8F9E313801B5;
	Mon, 24 Jun 2024 08:53:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 24 Jun 2024 08:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1719233588; x=1719319988; bh=xWKRucLiTm
	pWwmmRX8FZ+pQR2gzXCPeFFp5WbUeFfbU=; b=hj8g+3OooVka8gNBjbWNY0qyAL
	Z6vhvHJoz9J9I0++1woXG7Ge7EifFpbLdlmvrkBZicJ0Vuzhe4E65yfemaw0dpnz
	ezbi2d09aLDF7ImuAp7ePDjUCcxqHHTdYBm1BZek/TB0JoKaPQYXQIQoZ6Ju8mOB
	wJHI0OVjjjp4u23oFnNEB7nzInWRR+TgaFrQTVv59rGbcP+I49knsJba70p5D5dX
	Q5dWWoC06j/c71Hvbmvv7UXEBlX1BHogMWVK0cFu3TYfKqxJtX6AOJv/ZHj8k8Wz
	mczS6v5JUo7LbjeTVmLp9rK2m7s3ayQKBQJwHt4h6ceJB75BnOFzmPxvTpcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719233588; x=1719319988; bh=xWKRucLiTmpWwmmRX8FZ+pQR2gzX
	CPeFFp5WbUeFfbU=; b=ZCi/NfA7A/RQ9uffYWdnOth3zq0Nr7nYZ6oyyv9JWPOj
	xm28gfJIalTQ9/Kdb3z5NDEv5ViTQHpwDzh6N2EeBHUDTVkRXgciUBMMS7AkgJUj
	m/mZbf+ejaW10hmpd2gpqA98HnK/cBDtPVX3x7KTkifmry6qtJLpqiIaPkXjblZ4
	K7U1Q9y0NRupMUuTkp76UIKEdKjVDI2+kJz8w5XDLyPvrBl9f3pDL8siN6LnFZYc
	NHOsGh9Hg19uIehl2i3Z+NCBcSIcICMOlvBqO5de2EYJe0DcK20O5S+BIXOjPhfU
	Ags7pPfYnlnunrnOo2Ffj4stHt2oG0X14wweQw4qyQ==
X-ME-Sender: <xms:NGx5ZiVg1gGRlt9ve2AaCtdW00-4mkL4YYmnOlzPKKmgIemKoVjYew>
    <xme:NGx5ZulJumI0JaGXmMii6JT6fzQIe9Qzlss726rjLTBIdsG1udtt43SlcJaGFmM4z
    _U7v720kyBtwitGg-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:NGx5ZmYm5Y8_qZxXMutSnpZE-wAmIMkn8Co-Mc0N0PmSj90GZrpw9g>
    <xmx:NGx5ZpVp_EN-CxgbfK-hH9-RsnW40Aj5LDE45CtCcZJj11OxT0IahQ>
    <xmx:NGx5ZsmW9IB7O6E2KjShAvsf5qyGRubEB8ghp8lTi4rt0SC82Pq-OQ>
    <xmx:NGx5Zudlz3chAaIISEKXN8oIN5P3itL3KhonJd_OA7jWYnsbt1Oh_g>
    <xmx:NGx5ZnCn48KYTyY9DzCFIK7ydsxiaLAQcCK1tdYkGjcqKFPdDXZkeYYz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 47B3CB6008D; Mon, 24 Jun 2024 08:53:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
MIME-Version: 1.0
Message-Id: <b31072d5-865b-4cda-be37-d93c36397d39@app.fastmail.com>
In-Reply-To: <20240620162316.3674955-3-arnd@kernel.org>
References: <20240620162316.3674955-1-arnd@kernel.org>
 <20240620162316.3674955-3-arnd@kernel.org>
Date: Mon, 24 Jun 2024 14:52:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/15] syscalls: fix compat_sys_io_pgetevents_time64 usage
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, guoren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "musl@lists.openwall.com" <musl@lists.openwall.com>, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, LTP List <ltp@lists.linux.it>, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Xi Ruoyao <libc-alpha@sourceware.org>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, stable@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2024, at 18:23, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Using sys_io_pgetevents() as the entry point for compat mode tasks
> works almost correctly, but misses the sign extension for the min_nr
> and nr arguments.
>
> This was addressed on parisc by switching to
> compat_sys_io_pgetevents_time64() in commit 6431e92fc827 ("parisc:
> io_pgetevents_time64() needs compat syscall in 32-bit compat mode"),
> as well as by using more sophisticated system call wrappers on x86 and
> s390. However, arm64, mips, powerpc, sparc and riscv still have the
> same bug.
>
> Changes all of them over to use compat_sys_io_pgetevents_time64()
> like parisc already does. This was clearly the intention when the
> function was originally added, but it got hooked up incorrectly in
> the tables.
>
> Cc: stable@vger.kernel.org
> Fixes: 48166e6ea47d ("y2038: add 64-bit time_t syscalls to all 32-bit 
> architectures")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/include/asm/unistd32.h         | 2 +-
>  arch/mips/kernel/syscalls/syscall_n32.tbl | 2 +-
>  arch/mips/kernel/syscalls/syscall_o32.tbl | 2 +-
>  arch/powerpc/kernel/syscalls/syscall.tbl  | 2 +-
>  arch/s390/kernel/syscalls/syscall.tbl     | 2 +-
>  arch/sparc/kernel/syscalls/syscall.tbl    | 2 +-
>  arch/x86/entry/syscalls/syscall_32.tbl    | 2 +-
>  include/uapi/asm-generic/unistd.h         | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)

The build bot reported a randconfig regressions with this
patch, which I've now fixed up like this:

diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index d7eee421d4bc..b696b85ac63e 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -46,8 +46,8 @@ COND_SYSCALL(io_getevents_time32);
 COND_SYSCALL(io_getevents);
 COND_SYSCALL(io_pgetevents_time32);
 COND_SYSCALL(io_pgetevents);
-COND_SYSCALL_COMPAT(io_pgetevents_time32);
 COND_SYSCALL_COMPAT(io_pgetevents);
+COND_SYSCALL_COMPAT(io_pgetevents_time64);
 COND_SYSCALL(io_uring_setup);
 COND_SYSCALL(io_uring_enter);
 COND_SYSCALL(io_uring_register);

This was already broken on parisc the same way, but the
mistake in sys_ni.c turned into a link failure for every
compat architecture after my patch.

      Arnd
