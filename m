Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8F67E76D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 02:52:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=W5NK1hJg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRMJy0ygjz3cTZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 12:52:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=W5NK1hJg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRMJ60Thwz3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 12:51:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AE47CB821BA;
	Fri, 10 Nov 2023 01:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D84AC433C8;
	Fri, 10 Nov 2023 01:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1699581104;
	bh=lxHFf+cJVyuGyX81+L2NmmRwViLV5SlJHHQH9byJyfg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=W5NK1hJgRBAVp5r2VqL12zxpJ8rvnR5T+pYrM8pR+cz343NvxRUsURFNl1RJdu4Ms
	 +jIItb/Kb0CiAfLpjCyjC59peLSsmErjgsurwkNzmxSnQLR8TbSiUTVYv9ILJfRS/w
	 HiD/fJvaSgA6zFNJP+HT+qcJ9MImLla9ZAmHdYQA=
Date: Thu, 9 Nov 2023 17:51:42 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Daniel Walker <danielwa@cisco.com>
Subject: Re: [PATCH 0/8] generic command line v6
Message-Id: <20231109175142.49428d5f51325680764663bf@linux-foundation.org>
In-Reply-To: <20231110013817.2378507-1-danielwa@cisco.com>
References: <20231110013817.2378507-1-danielwa@cisco.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Rob Herring <robh@kernel.org>, linux-efi@vger.kernel.org, Tomas Mudrunka <tomas.mudrunka@gmail.com>, Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, devicetree@vger.kernel.org, Sean Anderson <sean.anderson@seco.com>, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Pratyush Brahma <quic_pbrahma@quicinc.com>, linux-mips@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Nicolas Schier <nicolas@fjasle.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu,  9 Nov 2023 17:38:04 -0800 Daniel Walker <danielwa@cisco.com> wrote:

> This release is an up-rev of the v5 patches. No additional features have
> been added. Some changes were mode to function names and some changes to
> Kconfig dependencies. Also updated the config conversion for mips.
> 
> There are a number of people who have expressed interest in these
> patches either by asking for them to be merge or testing them. If
> people are so inclined please continue to request them to be merge
> or to ask the status of the next release. It's helpful to motivate me to
> release them again and for the maintainers to see the interest
> generated.
> 
> These patches have been used by Cisco Systems, Inc. on millions of
> released products to great effect. Hopefully they can be used by the
> entire Linux eco system.
> 

fyi, none of the above is suitable for a [0/N] changelog - it's all
transitory stuff which tells readers nothing much about what the
patchset does.

And that info is sorely missed.  I can see that it's a code cleanup,
but I'm sure Cisco wouldn't expend resources to maintain such a thing. 
There's something else here.

In [1/8] I see "Even with mips and powerpc enhancement the needs of
Cisco are not met on these platforms" and "This unified implementation
offers the same functionality needed by Cisco on all platform which we
enable it on".

Well OK, what are these needs?   What functionality changes does this
patchset offer which Cisco finds useful?  IOW, what were the
requirements?  What's wrong with the old code and how does this
patchset fix/enhance that?


I see the patchset updates nothing under Documentation/.  Should it do
so?  Could it do so?


I don't know what is the expected merge patch for this work.  I can
grab them if no other maintainer is in the firing line.
