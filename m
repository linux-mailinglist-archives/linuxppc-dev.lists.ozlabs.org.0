Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BECF567A94
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 01:12:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lcz3r108Mz3c1y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 09:12:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2022060401 header.b=KoHiZKsE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=198.137.202.136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2022060401 header.b=KoHiZKsE;
	dkim-atps=neutral
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lcz3G018wz3bl3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 09:12:24 +1000 (AEST)
Received: from [127.0.0.1] ([73.223.250.219])
	(authenticated bits=0)
	by mail.zytor.com (8.17.1/8.15.2) with ESMTPSA id 265NBnGE1003711
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 5 Jul 2022 16:11:50 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 265NBnGE1003711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2022060401; t=1657062712;
	bh=Y98dqt5En+kS/P/7IMzby9wcUq/7fVTjOsj4m2LkPGI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=KoHiZKsEicJF3HWW8BYUbNDtijdyk2YC30lpGok5A71WKH5jN4kSF+1k/ILd0x9By
	 qt8xe3MS+M3LxdPaft1n7lcyMixtVdJ5SQYbrobuHAXvXZD91dHJDhsiyrj0xX6oEB
	 UzBMdQKEXifwQOtQj+6um92/xSJJMJAJk/eweAx0I6RYNd0HPoR17l0lZTdhk7AUif
	 NSyyZN5L500jyETF72C6IrByv8jv42HDJSrxzOzuSo6byDKD6nExbO6sf5LLBoXwBl
	 hJl0pswjsA5H80PdAU7gimYJT6uwlh8+RWtIOHDI250cjEOA3EOFzWqjhIcySx1ZiD
	 mZSs9tkVChZvA==
Date: Tue, 05 Jul 2022 16:11:45 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] random: remove CONFIG_ARCH_RANDOM and "nordrand"
User-Agent: K-9 Mail for Android
In-Reply-To: <YsS0ZLQw+QFA7XdJ@zn.tnic>
References: <20220705190121.293703-1-Jason@zx2c4.com> <YsSStCQQf008hF2F@zn.tnic> <YsSUkapje04MP2a1@zx2c4.com> <YsSXkNBtB6Ciy9iN@zn.tnic> <11C903CC-22A7-48EE-AD63-E71CC8D28B88@zytor.com> <YsS0ZLQw+QFA7XdJ@zn.tnic>
Message-ID: <805B66CB-D847-4547-B6EE-C4FB72B75765@zytor.com>
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

On July 5, 2022 3:00:04 PM PDT, Borislav Petkov <bp@alien8=2Ede> wrote:
>On Tue, Jul 05, 2022 at 02:50:34PM -0700, H=2E Peter Anvin wrote:
>> It's just math=2E The only variable is your confidence level, i=2Ee=2E =
at
>> what level do you decide that the likelihood of pure chance is way
>> smaller than the likelihood of hardware failure=2E
>
>That might be but the likelyhood of certain BIOSes dropping the ball
>after resume is 100%:
>
>7879fc4bdc75 ("x86/rdrand: Sanity-check RDRAND output")
>

What I'm wondering is if we shouldn't be simply instrument *every* invocat=
ion, and set the trust to zero if we ever trip it=2E
