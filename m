Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8C6706BCB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 16:53:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLx1t1vfGz3fFL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 00:53:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=PgX23426;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xFz/jAwV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=PgX23426;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xFz/jAwV;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLx0Y2XCPz3fBx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 00:52:29 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 08E9E3200903;
	Wed, 17 May 2023 10:52:24 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 17 May 2023 10:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1684335144; x=1684421544; bh=5mas8wApaiArBzc/k2qYZpcPuHFX2rPvIJz
	00K7T8oE=; b=PgX23426o57WwtsjjYljjBuol/IGj/CdwDxYdVlzVn9DGm1wDMv
	2FycDR3if/94TiLb5t1Sgx5wgRwymx1kDyNIwk42/KtXRE8cVroHeWsgAD7udiIQ
	lgw15YyHjlw6cKboUDmX2B1BGrMyHuKGFtiHdt3MvWYZYTx0y51flCEMGqwb8oOS
	MDnNcvNC5dTNFZZfjgtys4wAotOWdl5aYw1QNDn9N/EY+a3j4FgO17JnmwNzwyLW
	+L1RWjgOGzhOPrZbZBhgqgdOKvnd6ooChaSPW1J2BgIsil9IBQl3xkgEMrGVh+g1
	nSWTQV1EHEbBLvFTg/YnzpTPVw0G7mO1DaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1684335144; x=1684421544; bh=5mas8wApaiArBzc/k2qYZpcPuHFX2rPvIJz
	00K7T8oE=; b=xFz/jAwV3qJ5yapPW/ZMpohG53y24e2YAUcXPuy6+uQd5ShtE1S
	nbNkfhIECkF4nDilsZdooexk1mf11q39LZVWpdl6P52J/kzZsoB2N0SFf8gocyGD
	DMtBEVRH+WgNUlJPkRfXnJGbmi99k5CknZw2t4g1UhJg3NsLgE5zB0Q9C55B/0F4
	JNDlIYNtMogx+WHJANRHNZRztj1wLJJ2IpebT0ltPcIwhY34S42Pgq6Z5ZbvkDPD
	WJTl1ujvi6Ata9f6/+6uuox7hxfXhVkCc+wDEet+vGxY07P0aV10Ih5tLNtm0ji8
	0k7xvpekdrytg0TcK5ykd3p8oZ1pS3qsf8g==
X-ME-Sender: <xms:JupkZHJXUwAnZPNa3E8RuTbb2CNWsCwq_Z5tikjt7ADc18n-mdUfzQ>
    <xme:JupkZLLDGsX9lwAFQBl3acQpMglzqnsfJXPOSxDYTRNJifjsUqnnrrooI49gkDc3o
    kJ1JoyxhrDHMXiN7qU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeiuddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:JupkZPuWr7PbkG8y0OQs8W5jkT7165Fs-hGwQ1dSVjNGZJuoctIlOg>
    <xmx:JupkZAY3sGGDQXi7i1jIpaf7oriSryY6KsNIDvNuiwje_IZhC_FwBQ>
    <xmx:JupkZOaVQhNp_7gXeWPUGsIHD_hREdvTHdUUFKKteLVNN_aws7nsAg>
    <xmx:KOpkZC4wS1szrrY0RrweYZ6FC1I75qf26i68Ll0F1kXm2bXHzRy53Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EB947B60086; Wed, 17 May 2023 10:52:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-431-g1d6a3ebb56-fm-20230511.001-g1d6a3ebb
Mime-Version: 1.0
Message-Id: <6b7f6f66-7890-47a3-a22d-e29f2944823a@app.fastmail.com>
In-Reply-To:  <CAJZ5v0h0spuxK-7LBJSU9BK2TEOUeMjf7hhKScadkxFN_RwStQ@mail.gmail.com>
References: <20230517131102.934196-1-arnd@kernel.org>
 <20230517131102.934196-11-arnd@kernel.org>
 <CAJZ5v0h0spuxK-7LBJSU9BK2TEOUeMjf7hhKScadkxFN_RwStQ@mail.gmail.com>
Date: Wed, 17 May 2023 16:52:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 10/14] suspend: add a arch_resume_nosmt() prototype
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
Cc: linux-kselftest@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Dennis Zhou <dennis@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>, audit@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>
 , Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 17, 2023, at 15:48, Rafael J. Wysocki wrote:
> On Wed, May 17, 2023 at 3:12=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
>>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The arch_resume_nosmt() has a __weak definition, plus an x86
>> specific override, but no prototype that ensures the two have
>> the same arguments. This causes a W=3D1 warning:
>>
>> arch/x86/power/hibernate.c:189:5: error: no previous prototype for 'a=
rch_resume_nosmt' [-Werror=3Dmissing-prototypes]
>>
>> Add the prototype in linux/suspend.h, which is included in
>> both places.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Do you want me to pick this up?

Yes, please do. Thanks,

     Arnd
