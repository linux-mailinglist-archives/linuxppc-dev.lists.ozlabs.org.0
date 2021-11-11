Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1DC44CE33
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 01:21:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqMnt5lQYz304V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 11:21:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=LoxML2ro;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out2-smtp.messagingengine.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=LoxML2ro; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqMnB2xT2z2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 11:20:27 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 88D4C5C026E;
 Wed, 10 Nov 2021 19:20:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 10 Nov 2021 19:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-id:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Z4Xz+6xEcDj+0NeWLO8w8RSF9W7GJQNkEgunDvZ8ejc=; b=LoxML2ro
 Ehj8/VSZcVweJFB/ZvPKg3JM1pIZW6A2wiRKtNOtjI05EnEX8KiFtxooXHCDTjQE
 JXm7iCs7AjfASPX3RBO//ZQUANq3n7HmUPwSIV8V2IFzNQ1x5ek5pLioyFaKeYac
 go/3/DAPVQa6kAlrvHNTXr8A7TN1hRN9fjdtPVOyNHFYUh1qK15JHeEQCs9QOZ/0
 S2WHCfqV+LCluq8czo/BJW4ClZtP8s717d535enu1GzuL8KZMv9U/FEuyMyzKEVu
 1Rgi/UTOucP1OlnSAojL47rvBQo0vbTtV1/JwHj8hdoEAF2CxZrJKXJkHLX1OrFH
 weqZeKaMx3pSNg==
X-ME-Sender: <xms:x2GMYeE6NF6OHu-L4jwCw3s16c-QN11vutWueBd49ckXmS8h3mKvtg>
 <xme:x2GMYfVThbaClyOX_2TrgD5qPDlY83IE-dxmF21yMlMxFtSWE-TqFu3L_mGm8o77v
 0_vMmXlxkbHL-iSIz8>
X-ME-Received: <xmr:x2GMYYI1b1OylmwylytNZze05zaR-D_JNAwktZEZhdaSo4GH0jjYGEhFXtaXW3UY4OEum7Q8b2SZO2QS-W29WHLPmwX30vv1CYs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvddtgddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeefffejiefgheevheefvefhteeggfeijeeiveeihfffffdugfefkeelfffhgfeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
 hhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:x2GMYYEAKMVV2GnHyC6xYNE8QeCEDWo-wWFeqMSdv7a_nMFFBRH33w>
 <xmx:x2GMYUXhq3Ox4bPzudDSiovrZ4jQ8F5HNgz3fNWrfVDEDsaZ_3ERDg>
 <xmx:x2GMYbOEFa9xZ2xeaxehrs63YydfXYF_p68e9F-u2V-1CDrFQOTTGQ>
 <xmx:yGGMYSxNNVAB24hZtwbj9lgdCHnRKsEiIxdVCez8h-D2fe4R0szZwg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Nov 2021 19:20:21 -0500 (EST)
Date: Thu, 11 Nov 2021 11:20:09 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Fix sigset_t copy
In-Reply-To: <ed04d4a1-7a60-ee39-f64b-203b299e8875@csgroup.eu>
Message-ID: <cb5f10c3-5630-547-23c1-66a44d7c8892@linux-m68k.org>
References: <08bbe7240b384016e0b2912ecf3bf5e2d25ef2c6.1636501628.git.fthain@linux-m68k.org>
 <ed04d4a1-7a60-ee39-f64b-203b299e8875@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-88831904-1636589924=:27"
Content-ID: <5c1556be-eba3-979a-fca0-533951763259@nippy.intranet>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "Christopher M. Riedl" <cmr@bluescreens.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-88831904-1636589924=:27
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <48a2d42c-41dc-69ad-20-46aed9554e35@nippy.intranet>

On Wed, 10 Nov 2021, Christophe Leroy wrote:

> Le 10/11/2021 =C3=A0 00:47, Finn Thain a =C3=A9crit=C2=A0:
>=20
> > Christophe, I hope this change is the one you wanted to see upstream=20
> > (?). If it is acceptable please add your signed-off-by tag.
>=20
> I'm on holidays, I was planing to handle this next week.
>=20

OK. I'll leave it with you.
---1463811774-88831904-1636589924=:27--
