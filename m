Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92530445CB8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 00:37:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlg5r3cbbz2ypn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 10:37:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=oKaa+R3g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out4-smtp.messagingengine.com (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=oKaa+R3g; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlg5859tgz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 10:36:26 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5EB005C0058;
 Thu,  4 Nov 2021 19:36:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 04 Nov 2021 19:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Ak1wm7
 tM/XES823I2nGDgpJTYsMXRWfGMqKlNaoc8HU=; b=oKaa+R3gfvhNDHf5TWNqYt
 A6YEdr6foN171c4lvdp8QFNIUQmNfmJSvPku1Ya2pLwO5KyVIuN0NRMfZtu882Nd
 s757R+5y2vSSXDxfIuvYEvDiiUzTkWpSk+76NoYwf1cckpFDq77dTAzCzxZZq41k
 H2ayHhKP4wfwvH/zelgsm0egtk/DT2DbkT0Z7ePfU8JqemZPM7gcIUWbxdbt7uPx
 XQNGKLOJCzuR89A7fJfItpKacIFkb6Q1s8Xlbk2frFAXen6L0M+FLoWPLFzabQFl
 zOWNynK6tX3nJedeBhx8BW7Q1b/qNYEiR4w3jhRM8YyT+lF42Atk+zeKJk0EMFwQ
 ==
X-ME-Sender: <xms:d26EYQxFmPMvbg8eKH4JOxTFQC4GDwdZlotoV5kqzD3-SekqbNZXPA>
 <xme:d26EYURK5NxaNk8-HEezm48i4jYz56jMR-k4jV7GXgVjQrUUIojuGc94IGeMl-dfj
 SazC3S7zdVHpQLtk3Y>
X-ME-Received: <xmr:d26EYSUP_Y15ITPqy1ZdfthVqtT1E8EYhxO_MwXwgWsuP0fllWJkgn1GElltBoWy4IiQQuPzK3fXcjVDSBYHcye2hQdcb4ashoE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdehgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeduffeltdefteeufefhleduheefgfejueegfeegffeiudejudfgvdeukedtgedv
 ueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdr
 ohhrgh
X-ME-Proxy: <xmx:d26EYegcWiGXkWtIz75khLmfrLrHqi21dkupCXW6chAJb5t2S_guCg>
 <xmx:d26EYSCDejsvetHTUZXZiIeiVFp4GCmjrvPGup9UejzRI9GyxDZ00A>
 <xmx:d26EYfIwX4fNQ7xKiYloiBrW2gXGll6aKZh0sq9YLfTBaig3UdPHVg>
 <xmx:d26EYVPUplJLkX9DC6hgJxrtgpn8-oNywOPfGPJofxeOlEIycWJvyA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Nov 2021 19:36:20 -0400 (EDT)
Date: Fri, 5 Nov 2021 10:36:18 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
In-Reply-To: <a1e6c282-c8fd-9671-5df6-cd7ca06fdbb3@csgroup.eu>
Message-ID: <de4b689-236e-505e-2632-6ce89110a1e9@linux-m68k.org>
References: <6919111c-02fa-c6b9-bb05-04161e52f340@yahoo.com>
 <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
 <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
 <48c3ed15-2ecf-cc12-c287-2b61457f5fb@nippy.intranet>
 <a1e6c282-c8fd-9671-5df6-cd7ca06fdbb3@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463811774-309288174-1636068978=:9477"
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
Cc: "Christopher M. Riedl" <cmr@linux.ibm.com>,
 Stan Johnson <stanley.johnson.001@protonmail.com>,
 linuxppc-dev@lists.ozlabs.org, Riccardo Mottola <riccardo.mottola@libero.it>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-309288174-1636068978=:9477
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 4 Nov 2021, Christophe Leroy wrote:

> Le 02/11/2021 =C3=A0 03:20, Finn Thain a =C3=A9crit=C2=A0:
> > Hi Christopher,
> >=20
> > After many builds and tests, Stan and I were able to determine that thi=
s
> > regression only affects builds with CONFIG_USER_NS=3Dy. That is,
> >=20
> > d3ccc9781560  + CONFIG_USER_NS=3Dy  -->  fail
> > d3ccc9781560  + CONFIG_USER_NS=3Dn  -->  okay
> > d3ccc9781560~ + CONFIG_USER_NS=3Dy  -->  okay
> > d3ccc9781560~ + CONFIG_USER_NS=3Dn  -->  okay
> >=20
> > Stan also tested a PowerMac G3 system and found that the regression is =
not
> > present there. Thus far, only PowerMac G4 systems are known to be affec=
ted
> > (Stan's Cube and Riccardo's PowerBook).
> >=20
> > I asked Stan to try v5.15-rc after reverting commit d3ccc9781560.
> > Unexpectedly, this build had the same issue. So, it appears there are
> > multiple bad commits that produce this Xorg failure, of which d3ccc9781=
560
> > is just the first.
> >=20
> > But there's no easy way to identify the other bad commits using bisecti=
on.
> > So I've addressed this message to you. Can you help fix this regression=
?
> >=20
>=20
> I'm wondering if this commit is really the cause of the problem.
>=20
> Are you using GCC 11 ?
>=20
> If yes, I think it could be a false positive, fixed by
> https://github.com/linuxppc/linux/commit/7315e457d6bc
>=20
> Can you try with GCC 10 or older ?
>=20

AFAIK, all of Stan's builds were made with gcc 10.

> Can you cherry pick 7315e457d6bc ("powerpc/uaccess: Fix __get_user() with
> CONFIG_CC_HAS_ASM_GOTO_OUTPUT") on top of d3ccc9781560 and see what happe=
ns ?
>=20

$ git checkout d3ccc9781560
$ git cherry-pick 7315e457d6bc
Auto-merging arch/powerpc/include/asm/uaccess.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/uaccess.h
error: could not apply 7315e457d6bc... powerpc/uaccess: Fix __get_user() wi=
th CONFIG_CC_HAS_ASM_GOTO_OUTPUT

There is no __get_user_asm2_goto in this tree, and __get_user_asm2 already
has the "=3D&r" constraint:

#define __get_user_asm2(x, addr, err)                   \
        __asm__ __volatile__(                           \
                "1:     lwz%X2 %1, %2\n"                        \
                "2:     lwz%X2 %L1, %L2\n"              \
                "3:\n"                                  \
                ".section .fixup,\"ax\"\n"              \
                "4:     li %0,%3\n"                     \
                "       li %1,0\n"                      \
                "       li %1+1,0\n"                    \
                "       b 3b\n"                         \
                ".previous\n"                           \
                EX_TABLE(1b, 4b)                        \
                EX_TABLE(2b, 4b)                        \
                : "=3Dr" (err), "=3D&r" (x)                 \
                : "m" (*addr), "i" (-EFAULT), "0" (err))=20
---1463811774-309288174-1636068978=:9477--
