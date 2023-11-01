Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCA97DDE60
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 10:26:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UZmw6z/v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL1qG4XKKz3cX4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 20:26:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UZmw6z/v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL1pL5JTvz2yh5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 20:26:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 414E7611AF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 09:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C78C433CC;
	Wed,  1 Nov 2023 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698830758;
	bh=eaaJjEZhTenWLCZhye+UdansPziF4x972nE5tF/JyQI=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=UZmw6z/vuL6JUmJl8tQlkf5wuaDKMpPz2VI08X3y65Jvku38/sxZ6P3Wz4HkraOfp
	 2NyjO6r35KgV8FEJcMY1hILRA9mvsxEERO45iTU10DniRzQ7Yh5i/BW3LKfzguwTu3
	 UiHlcN4wAKUBm01GN/5rjoA1wrSmSKNU3KRmP/kuKPLwM/WicMnzepg8gBESiG+oRh
	 I7BfqGdjurdG5c9ulS3/J2++HRtEF/cOYMTKVbh8P/+lbvD2Yitz1RBIqjrEpBhOPP
	 aZ2nOFBKFolFBcDlGZD2spcwRfb2iYb7I2svqlWSJ8SvNzi12wSRxui3WdZm4d90wW
	 wEsRXtL4coxZA==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailauth.nyi.internal (Postfix) with ESMTP id 4A41927C005C;
	Wed,  1 Nov 2023 05:25:57 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 01 Nov 2023 05:25:57 -0400
X-ME-Sender: <xms:pBlCZUsfqVkJDSwaiM75O706VqVtvWBhnYnqAg6FvYsK2SipFCqlLg>
    <xme:pBlCZRfROUoEhq626kXKO_ffk4zX3Mdr16JdcE2Dj4tJY7Pjed4dhDzhn1R-z8dAQ
    h4d3GBovz8Kah-OBM0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddtgedgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
    frrghtthgvrhhnpedvtddtffejfeeggefgleefgfeghfehfeefffetgffgleegudevveet
    hfefjeevkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudej
    tddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusg
    druggv
X-ME-Proxy: <xmx:pBlCZfwIDTdGEPnGwZ9zfgKR5tDmi6WPvfLeNeqqKjHdcWB-vg4Ibw>
    <xmx:pBlCZXOn0jvcShb8PFUOJy1U_jhbqOj16DFLonpn6d90Ns8Ry-iQdA>
    <xmx:pBlCZU9iag-IS4b9exBO5LlaECpA4cAhTpSCP3ZI20oIWkYwx2VEpA>
    <xmx:pRlCZYbn7Q-c9AWYaj8IC6JjZsraK-3nE5V2dN97D5mx9xQkbo7ZcQ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 86BFAB60089; Wed,  1 Nov 2023 05:25:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
MIME-Version: 1.0
Message-Id: <da1413c0-d81a-47b6-8283-0fb3da7975e6@app.fastmail.com>
In-Reply-To: <20231031171401.GA17989@bhelgaas>
References: <20231031171401.GA17989@bhelgaas>
Date: Wed, 01 Nov 2023 10:25:25 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Bjorn Helgaas" <helgaas@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>
Subject: Re: [pci:controller/xilinx-xdma] BUILD REGRESSION
 8d786149d78c7784144c7179e25134b6530b714b
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
Cc: Nathan Chancellor <nathan@kernel.org>, linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 31, 2023, at 18:14, Bjorn Helgaas wrote:
> On Tue, Oct 31, 2023 at 09:59:29AM -0700, Nick Desaulniers wrote:
>> On Tue, Oct 31, 2023 at 7:56=E2=80=AFAM Bjorn Helgaas <helgaas@kernel=
.org> wrote:

>> >   arch/powerpc/xmon/xmon.c:             release_output_lock();
>> >
>> > That said, the unused functions do look legit:
>> >
>> > grackle_set_stg() is a static function and the only call is under
>> > "#if 0".
>>=20
>> Time to remove it then? Or is it a bug that it's not called?
>> Otherwise the definition should be behind the same preprocessor guards
>> as the caller.  Same for the below.

It would be nice to get rid of all warnings about unused
"static inline" functions and "static const" variables in .c
files. I think both these warnings got added at the W=3D1 level
for compilers that support them at some point, but are ignored
for normal builds without W=3D1 because they are too noisy.

Obviously, all compilers ignore unused inline functions and
const variables in header files regardless of the warning level.

> I don't really care whether we keep the warning or not.
>
> My real complaint is that the 0-day report fingered
> pci/controller/xilinx-xdma, which is completely unrelated, which is a
> waste of time.

I tried to figure this out but couldn't find the real reason either,
clearly there is something wrong with the reporting here, my best
guess would be that there is a spurious build failure elsewhere that
leads to this file sometimes getting flagged as a false-positive.

     Arnd
