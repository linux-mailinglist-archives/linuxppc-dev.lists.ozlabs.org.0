Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CED5B58FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 13:09:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR3kj563Wz3bnM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 21:09:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=R3ojdf1N;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DKF04ZAx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.26; helo=wnew1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=R3ojdf1N;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DKF04ZAx;
	dkim-atps=neutral
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR3jz5ClBz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 21:08:22 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id C18AF2B05921;
	Mon, 12 Sep 2022 07:08:17 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 12 Sep 2022 07:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1662980897; x=
	1662984497; bh=/kHMHzVLnW7nKHI+ajKAZXJpfsTcICyybx2c3gBqWbY=; b=R
	3ojdf1Nub7rgFuZoyr6MZ70LCY3f6Ct3tvru34oNhEIzYkRFtmj7PC732hBfVYGX
	Lsgxlm/IpnXzrzxHL/3DaLd8ZQSKfh6U2Ea3UCgrhPWQzmEhDbmNZ8sBPlBls3au
	F7CD4cPhDWiV8PWI18SgY2A5Yq+ogpy7BiL81vJ+YMddVMQz8Bcc/2SHJgJZ0ZnG
	9fIj3rxtQkFjnsTTx9Bh81ptIuH4Dfo7aWH8mnDTzjVTY5L7bndJo4Iux0raXz5Q
	bwUhe/LTCZZQF3t6JP2XF1kOLO8LJZSVlNkI76tBWH1y77kQyHMjAOgUpXHu9T1q
	iwHX9Jw0F/r/DM3m5EafQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1662980897; x=1662984497; bh=/
	kHMHzVLnW7nKHI+ajKAZXJpfsTcICyybx2c3gBqWbY=; b=DKF04ZAxOu9cWXX3Q
	sttOIGWBGLyAXpcektCUIbGpSz+0oO8i2bD94NF3pEf6IQO0J+QXYUHKdA9t/6f/
	Kihb+tvhWztPf8SE2tZHmbddc5vurYI0+Au9ReRktDoiinTmjMaoqm8hTFr5VpLv
	ngYiViTF84jaVfXaeXsCTVWfVqOHHAZGPx+Yo36epjdYEAsw+cnSNc0TxVx8KzQj
	mOZ/2qx5lYd4uX7/ju1BQIlVJP7QIJLdz3kLIhwG3NMetTj28pFTiKYe/1ahU3Ws
	tHcJ4bAkBltcBfqPnL9tq+kcwN8GpJ9hC89U2/w5wpVC59qfp7OMdG6KyV5/RdCC
	1fueA==
X-ME-Sender: <xms:IBMfY2KMtHpjfQWCC6JcGMLzn4mdL08HArohDQbunod3T4sP9iZijQ>
    <xme:IBMfY-LtTSMv8aNzQoKZu6p3keSdAXCkHdduxNwCgzauysz3YbDQjoMxsNDQ-O1OZ
    GJ1Y8BexkWeTOIEs_8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduvddgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepjeeghfeutdejjeehudevgeehveduffejkefhveefgfettdehgeeiledufeeu
    vdfhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:IBMfY2utn0sxwu-tkzqzXtxnhDXVVD-Uz9e5sKf7BIFqsPTAVWFXtw>
    <xmx:IBMfY7ZkUpaQT2kRCwKkdWNifa3E12EFWcxhcARQMGEY9MDdjKI1bA>
    <xmx:IBMfY9YpnO8D9Kn9aYC0kG9bDGolZB5wJg3U52z2sLWHyxGcg_IN0A>
    <xmx:IBMfY8wQ0UCmIMGjzTjrEbhfppmwfNUMv2Jkcj_vLVRu5q6529QXxNq4Xw0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8548FB60086; Mon, 12 Sep 2022 07:08:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <be29926f-226e-48dc-871a-e29a54e80583@www.fastmail.com>
In-Reply-To: <77355969-0ffd-cd1f-5f0d-3cc7059fade6@csgroup.eu>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-3-rmclure@linux.ibm.com>
 <CMUACJ7N6P9U.2UABBGZM71SQ6@bobo>
 <e14f1d52-e37d-4a00-a879-d755a5095d48@www.fastmail.com>
 <77355969-0ffd-cd1f-5f0d-3cc7059fade6@csgroup.eu>
Date: Mon, 12 Sep 2022 13:07:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Rohan McLure" <rmclure@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 02/20] powerpc: Use generic fallocate compatibility syscall
Content-Type: text/plain;charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 12, 2022, at 1:00 PM, Christophe Leroy wrote:
> Le 12/09/2022 =C3=A0 11:57, Arnd Bergmann a =C3=A9crit=C2=A0:
>> On Mon, Sep 12, 2022, at 10:38 AM, Nicholas Piggin wrote:
>>=20
>> The powerpc difference is that in little-endian mode, only
>> the 'len' argument is swapped but the 'offset' argument is
>> still high/low:
>>=20
>> long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2,
>>                                      u32 len1, u32 len2)
>> {
>>         return ksys_fallocate(fd, mode, ((loff_t)offset1 << 32) | off=
set2,
>>                              merge_64(len1, len2));
>> }
>>=20
>> It's probably best to first fix this by using merge_64(offset1,
>> offset2) and allow that patch to be backported to stable kernels,
>> before changing it over to the generic code in a separate patch
>> within that series.
>>=20
>> A related issue seems to exist in ppc_fadvise64_64(), which
>> uses the wrong argument order on ppc32le compat tasks, in addition
>> to having at least three different calling conventions across
>> architectures.
>
> Do ppc32le exist at all ?
>
> Native ppc32 is be only, and I'm not aware that ppc64 is able to run=20
> ppc32le compat tasks.

I'm not aware of anyone using it, but commit 6e944aed8859
("powerpc/64: Make COMPAT user-selectable disabled on littleendian
by default.") added support to the kernel, and commit
57f48b4b74e7 ("powerpc/compat_sys: swap hi/lo parts of 64-bit
syscall args in LE mode") changed the compat syscall helpers
to pass 64-bit arguments correctly but apparently got fallocate()
and fadvise64_64() wrong.

With Rohan's series, we use generic implementation, which
is the sensible ABI but the change is technically an ABI
change for ppc32le, and it makes sense to split the change
that fixes the behavior from the cleanup.

       Arnd
