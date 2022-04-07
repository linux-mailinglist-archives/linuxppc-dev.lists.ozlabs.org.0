Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A84F77DF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 09:42:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYtcq6bfhz3bYy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 17:42:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dFVX11qS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out1-smtp.messagingengine.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=dFVX11qS; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYtc95X8Rz2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 17:41:29 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CD35C5C00F3;
 Thu,  7 Apr 2022 03:41:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 07 Apr 2022 03:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=E5WwNkxjxuplPWCGj
 QQ/3iwf7bpXyQh3ViqACliJVaw=; b=dFVX11qSj0Ex3Yws1r6v4ZgPBlMXVR94K
 YvcSvW8maccat0avzMMo8udpzFr0ZDjkS7PYaELqxgWEZGXzHaGbFQVQUmHJTung
 SYYojpfplangm1RTmaORJ4eNJon8ca1/rElYQTDo2ZWmjvanL6UHwjyEcADBHIrO
 QUbqNIJ1LPI/pbOpKmH3c04TKV0GCC+GOzJ4sgxZYExzhYUCG4WWzCFUMjrqA93u
 CTV/PttKppyJVoAmo3MqndZOFRdtej3NPICAS8jjq5tOlKojbcE+4c2l/4Qro3Ck
 VIuPKFXuTRt0sJtcUt/xv38gYsZLRX17T2KPH+Ili2aSm86n2NNqQ==
X-ME-Sender: <xms:pZVOYuStpV9iaou38vOJl6qEubouyZ4EY4EwrYeObx8OEoLwEmXuiA>
 <xme:pZVOYjz-6-F0TsExhiQn6ec3ZTMIwHOfdT875shsvf-qxKH3V9B0exEif9x4PeY7z
 TmeXELtuHxoBuGrphg>
X-ME-Received: <xmr:pZVOYr1_lZa37nZ8FyDGAOZXzl1xz3TPR1gh8t06491CFjUYXFz-Azun0IkSvqVqmnOOentyJlXzwJ4B_Cg9bttkfTpazF_lt7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejjedguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcu
 vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
 htthgvrhhnpedvfffgffduleekjedtveffleeiieeileffhffhgeekhfeigfekjeetuedv
 veelgeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieek
 khdrohhrgh
X-ME-Proxy: <xmx:pZVOYqCdilv9VpC6hPSuGKyZoqfhM0qCnXxc9PhV12zdRpamG4Zb4A>
 <xmx:pZVOYnihZs9X2EyoVSJu4C96p9vh0bJJcMrO-XDpLeHc4IVcabT-XQ>
 <xmx:pZVOYmosS-8l5WO--_CuqrpyQCL2hyDMtkZuSb6rHWJe6TkZpg3AWg>
 <xmx:pZVOYniPgdruzBOe7mxXmEKmSJ4KnyUEYBj7Hb0AlBmMFtS0kMvyIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Apr 2022 03:41:22 -0400 (EDT)
Date: Thu, 7 Apr 2022 17:41:20 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] macintosh: fix via-pmu and via-cuda build errors
In-Reply-To: <e0d0b771-2459-1050-03f8-1bd1f70d7569@csgroup.eu>
Message-ID: <2187e41c-aecf-ff8c-9e53-d5f0c3f2283f@linux-m68k.org>
References: <20220407023700.7216-1-rdunlap@infradead.org>
 <c8c2b89b-8546-8449-a27e-ef6e89186e26@infradead.org>
 <e0d0b771-2459-1050-03f8-1bd1f70d7569@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463811774-248027180-1649317280=:20562"
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
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-248027180-1649317280=:20562
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 7 Apr 2022, Christophe Leroy wrote:

> Le 07/04/2022 =C3=A0 05:16, Randy Dunlap a =C3=A9crit=C2=A0:
> >=20
> >=20
> > On 4/6/22 19:37, Randy Dunlap wrote:
> >> When CONFIG_INPUT=3Dm, the input_*() family of functions is not
> >> available to builtin drivers.
> >>
> >> When CONFIG_RTC_CLASS is not set, rtc_tm_to_time64() is not defined.
> >>
> >> Fix multiple build errors by making these Kconfig symbols required by
> >> ADB_CUDA (RTC_CLASS) and ADB_PMU (RTC_CLASS and INPUT).
> >=20
> > Ah yes, Finn has already fixed the INPUT problems here.
>=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/d987663bbed18d7db=
f106db6066a759040b4e57a.1647837028.git.fthain@linux-m68k.org/
>=20
> >=20
> > Maybe that patch hasn't been merged anywhere yet?
>=20
> The patch has comments, I guess we are waiting for a new version ?
>=20

I'll send a new version, though I expect it will attract comments too.
---1463811774-248027180-1649317280=:20562--
