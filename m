Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 385F3583FBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 15:16:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltrkk1Hk5z2xJX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 23:16:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=m96c49tz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net (client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=m96c49tz;
	dkim-atps=neutral
X-Greylist: delayed 597 seconds by postgrey-1.36 at boromir; Thu, 28 Jul 2022 23:15:40 AEST
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ltrk44DV1z2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 23:15:40 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5A0BF6E2;
	Thu, 28 Jul 2022 13:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5A0BF6E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1659013533; bh=Rn0/Mu+SAV+BNOe5JrY+OgsjZ+DlbTUQOY3Wh6DCw/k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m96c49tz3s79D6TTEd1k8GPvfm82e0IJVCx5NOOZMZU6J7Own9cLUVHxdRak8M9DO
	 CH32YY5xjA+LWRctPVF5Esm+z6iKfpguO+jq+9iyx+EKhqjAvbZdhNR0Fn0XYk0QW9
	 17sgW+HmEzs2kIPs6KwpvMrlhxpuM79G0nERz+2sLTXGTf+BaRslO+68jzF/h6/FwX
	 MQkMWGK1DS1SAzg3k7y3W/PQUSTRenCH3dwHnC+wL4k3vs8Px6sBYKLxnyP8o4yrAm
	 AMexj741a1aD2Pc589uhExlMa0J+GeZaeiS1d8k+dF0oRFtL8oTNLG+g9DebTkQOSu
	 2UelDwQnk6vhA==
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org,
 linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc-tw-discuss@lists.sourceforge.net
Subject: Re: [PATCH 2/3] Documentation: use different label names for each
 arch's elf_hwcaps.rst
In-Reply-To: <20220728033332.27836-3-bagasdotme@gmail.com>
References: <20220727220050.549db613@canb.auug.org.au>
 <20220728033332.27836-3-bagasdotme@gmail.com>
Date: Thu, 28 Jul 2022 07:05:32 -0600
Message-ID: <87y1wdcrqb.fsf@meer.lwn.net>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Yanteng Si <siyanteng@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Will Deacon <will@kernel.org>, Alex Shi <alexs@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Sphinx reported duplicate label warning:
>
> WARNING: duplicate label elf_hwcaps_index, other instance in Documentation/arm64/elf_hwcaps.rst
>
> The warning is caused by elf_hwcaps_index label name is already used for
> arm64 documentation, whileas powerpc use the same name.
>
> Disambiguate the label name for each architecture's documentation. While
> at it, also adjust original reference in translated documentation.
>
> Link: https://lore.kernel.org/linuxppc-dev/20220727220050.549db613@canb.auug.org.au/
> Fixes: 3df1ff42e69e91 ("powerpc: add documentation for HWCAPs")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/arm64/elf_hwcaps.rst                    | 2 +-
>  Documentation/powerpc/elf_hwcaps.rst                  | 2 +-
>  Documentation/translations/zh_CN/arm64/elf_hwcaps.rst | 2 +-
>  Documentation/translations/zh_TW/arm64/elf_hwcaps.rst | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

A better solution in cases like this is to just delete the label
entirely.  I'm not quite sure how we got started with this habit of
adding unneeded labels, but they just clutter up the text - and, as
we've seen, add warnings.

These labels aren't needed for anything, so I'd just take them out.

Thanks,

jon
