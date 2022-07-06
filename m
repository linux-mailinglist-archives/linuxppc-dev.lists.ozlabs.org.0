Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44333568F73
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 18:44:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdQNg1zjlz3c6f
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 02:44:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2022060401 header.b=uod/87Km;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=198.137.202.136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2022060401 header.b=uod/87Km;
	dkim-atps=neutral
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdQN02SSWz3c0H
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 02:43:26 +1000 (AEST)
Received: from [127.0.0.1] ([73.223.250.219])
	(authenticated bits=0)
	by mail.zytor.com (8.17.1/8.15.2) with ESMTPSA id 266Ggp781236933
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 6 Jul 2022 09:42:51 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 266Ggp781236933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2022060401; t=1657125775;
	bh=zQoEvTxnDh6zWBd1c1ezKVw870QaKisAdMJsMEZ0XiI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=uod/87KmlxnlFtaMoLSH+a3zy87aEMycqPjViqWSmbrvXTDJePOvAvh4NdfmXjyOo
	 /nZjEuDksvqEeMFeyvv3nNTJaLGMHrWkIQZOgcNcM3isnB2T3CVCzQYI731tr8Huo6
	 7H2oEO54ACpyb6iUmo0L2mcfUpp9aQvoLhDCxBbnm5v+FW3EtXCUH3XJpeWQHzzhV/
	 eulgCmnqbY02rNDoS+WZNu79Fosli2i61lGLIGLfx3DdGltUdPqnFp6O9bBcgBWMam
	 2PXfzTFX5aQgK0eGmJfiwxbYGBVaUAWny3Ktqh+1F919S48/9ocINv7En1vi36fb0T
	 n+NARfx8eOcGg==
Date: Wed, 06 Jul 2022 09:42:49 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] random: remove CONFIG_ARCH_RANDOM and "nordrand"
User-Agent: K-9 Mail for Android
In-Reply-To: <YsV+w77z8iSM7dJQ@zn.tnic>
References: <20220705190121.293703-1-Jason@zx2c4.com> <YsSStCQQf008hF2F@zn.tnic> <YsSUkapje04MP2a1@zx2c4.com> <YsSXkNBtB6Ciy9iN@zn.tnic> <11C903CC-22A7-48EE-AD63-E71CC8D28B88@zytor.com> <YsS0ZLQw+QFA7XdJ@zn.tnic> <805B66CB-D847-4547-B6EE-C4FB72B75765@zytor.com> <YsV+w77z8iSM7dJQ@zn.tnic>
Message-ID: <0A608F00-CDC0-494E-AC57-69BA0E3F547F@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-s390@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On July 6, 2022 5:23:31 AM PDT, Borislav Petkov <bp@alien8=2Ede> wrote:
>On Tue, Jul 05, 2022 at 04:11:45PM -0700, H=2E Peter Anvin wrote:
>> What I'm wondering is if we shouldn't be simply instrument *every*
>> invocation, and set the trust to zero if we ever trip it=2E
>
>I guess you can add some logic to rdrand_long() to sanity-check what it
>returns=2E=2E=2E
>
>But would that be worth the effort?
>

I think doing it centrally, as non-arch-specific code, and letting it subs=
ume ad hoc checks for known failure conditions could be a win=2E
