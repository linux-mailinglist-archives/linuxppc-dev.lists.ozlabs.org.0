Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776118374CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 22:04:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NpDuKI7y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJjQ72t70z3cTb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 08:04:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NpDuKI7y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=chandanbabu@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJVVH1kJKz3bnB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 23:52:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67E1B6144D;
	Mon, 22 Jan 2024 12:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C93C433C7;
	Mon, 22 Jan 2024 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705927923;
	bh=ek12Fo9+h/4gxnTkeDIXoNZF4jS2nFpEnjFmagMNSVw=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=NpDuKI7yKNYuy8wthqSQwDgQQBYVZqJvcFqo3awd88GUCmPF9FN0Fxb4UWuev00Pt
	 8Ili9LGviWHYYkkR5jr7h1ejQf7khSKkLS/lFZ+2bQ8/gZZDN9N9IiB5k9HF57G51i
	 C8hOjqvIXYakMF9uQbsa2COrnB8cwbbFbMwOZn1X5FWIsXZaYPkh4c5MllkP4zPdhV
	 07jL4lUzKOZ93chhgwXdAmTKfvVeU8gSUNdvdQ6NJTWGhnV9Onj4155hB8GZmM55VA
	 7b8go8un2NnBrAQPhWikohnHF906uYAUBQ5yA0k+QVV4nAe+mmyUMYzlc2qlAPh8NU
	 0nbV1Nz5pAs2A==
References: <20240118080326.13137-1-sshegde@linux.ibm.com>
 <20240118080326.13137-3-sshegde@linux.ibm.com>
User-agent: mu4e 1.10.8; emacs 27.1
From: Chandan Babu R <chandanbabu@kernel.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [RFC PATCH 2/3] fs: remove duplicate ifdefs
Date: Mon, 22 Jan 2024 18:20:13 +0530
In-reply-to: <20240118080326.13137-3-sshegde@linux.ibm.com>
Message-ID: <87cyttedjj.fsf@debian-BULLSEYE-live-builder-AMD64>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 23 Jan 2024 08:03:36 +1100
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
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, peterz@infradead.org, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org, anton@tuxera.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 18, 2024 at 01:33:25 PM +0530, Shrikanth Hegde wrote:
> when a ifdef is used in the below manner, second one could be considered as
> duplicate.
>
> ifdef DEFINE_A
> ...code block...
> ifdef DEFINE_A
> ...code block...
> endif
> ...code block...
> endif
>
> There are few places in fs code where above pattern was seen.
> No functional change is intended here. It only aims to improve code
> readability.
>

Can you please post the xfs changes as a separate patch along with Darrick's
RVB tag? This will make it easy for me to apply the resulting patch to the XFS
tree.

-- 
Chandan
