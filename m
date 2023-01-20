Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D93A674852
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 01:52:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NygvJ0DpNz3fG3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 11:52:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=mHrv+P2K;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mpy5pc4Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=mHrv+P2K;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mpy5pc4Y;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NygtJ6Yk4z3cCk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 11:51:36 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 663865C0041;
	Thu, 19 Jan 2023 19:51:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 19 Jan 2023 19:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1674175891; x=
	1674262291; bh=oVodv+f7tO66O7huZdWKERwv7Beigm5tN48FcTUIthc=; b=m
	Hrv+P2KS6He5GJADam0ymxMgPpSjBSs0fPLtwhPwL6V7rjBYswNdNvugTQOIJ+Dy
	5awXIu77v5YBmJIw9qsFOv01IVRtF1y6nKHlTTMuzFRhu/fCRl3GK3sCOerjph2w
	SkTaYIz9o5C+aTeTY3Yzajdq4g7OJN+iFydgUJiDMNbFdqWypg+VJpCPeHtBhR5B
	oygQTVHXy7Xmn4p6YaFvp6EqsW1mX/GPxCgkYVI5KQ6XV/oN6c6SfRITRvAZZEd/
	D39pqLOdc+wSWHjkD0Xk8wee3AiSNjNyh/nWQU/Aoqtw2qvkPHTbgg2GNUwl/YEt
	KSLR68cKOcRBU0le6/SsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674175891; x=
	1674262291; bh=oVodv+f7tO66O7huZdWKERwv7Beigm5tN48FcTUIthc=; b=m
	py5pc4Y2rCa/bfxvG8c/0IDTR8Idu8DxfDeWdixFkb1e7DMaIzfvvcTaeFf4t0RH
	Qi4vF/dBWRuw2wlH3CYlIph5krdY2Ygbi647jn6xavgeKyGgITh0nkqnEyd/p/SZ
	JzrNaoX3tIZ+XoqFU+EFIwkQBEdl32eCKMeo+AOUU9fJbl5dcSU532dUsxPFVESB
	UhZESekMjsQ970nLj2UL/JVPEsO5pXRy9/cM/157F8rbERSqB6qEDCD9tJVKgTMX
	qzmxcLKo/L+Iar8RAhyBSrU8lXU3mY9bAu+4Ng/Jzz529g+usEcBejj3hpGyc8KE
	goHUqmvzHbuotZT9/sYeg==
X-ME-Sender: <xms:k-XJY1Y6arPjWIo4a1gJXxsGlC2UvOFtV5yFLxQNSmdCUo2aKl52lg>
    <xme:k-XJY8Y24ncutrKZQ3_CXiFIC4ILLo42YkW1DG6rk3kf1iRXO1Jj40WwyMOOyA1HV
    6IxAgRSUE7IOXKD8A>
X-ME-Received: <xmr:k-XJY3-Ob3LUc0hMAyyEduWZc8XiMxYWhs-ikc1pys7SPJBL8XYs4pRcEkdoQRh0MfkPvYrsgvOtKbvDvJyVULosP79cDMHVNrnMJhhyLoqQPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:k-XJYzoyfbcSAlEER27ZarmJ_hbUsoU23B0eW8fQIGh9aoiCM_DNGg>
    <xmx:k-XJYwpDKnFpwt9GYqUy-hK4XRU00g7ltsKPlzCOrnNtAgWONwF1qA>
    <xmx:k-XJY5QjWCGMHwbwP2g5T0-vqtcznSP-CJTKQICX5vxKb4m2vO1KQg>
    <xmx:k-XJY1RDTgVQBiZmUbfoXzrECbMHy28KEIsgHiNQeqbay0Jh5JiORg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 19:51:27 -0500 (EST)
Message-ID: <26945a8372ddde0c2bea9f2382ea9f1e74b9fe63.camel@russell.cc>
Subject: Re: [PATCH v3 04/24] powerpc/secvar: Handle format string in the
 consumer
From: Russell Currey <ruscur@russell.cc>
To: Nicholas Piggin <npiggin@gmail.com>, Andrew Donnellan
 <ajd@linux.ibm.com>,  linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org
Date: Fri, 20 Jan 2023 11:51:24 +1100
In-Reply-To: <CPVRR82TD4YN.2330YD9C5FHMQ@bobo>
References: <20230118061049.1006141-1-ajd@linux.ibm.com>
	 <20230118061049.1006141-5-ajd@linux.ibm.com>
	 <CPVRR82TD4YN.2330YD9C5FHMQ@bobo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
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
Cc: sudhakar@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, bgray@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-01-19 at 11:17 +1000, Nicholas Piggin wrote:
> On Wed Jan 18, 2023 at 4:10 PM AEST, Andrew Donnellan wrote:
> > From: Russell Currey <ruscur@russell.cc>
> >=20
> > The code that handles the format string in secvar-sysfs.c is
> > entirely
> > OPAL specific, so create a new "format" op in secvar_operations to
> > make
> > the secvar code more generic.=C2=A0 No functional change.
> >=20
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> >=20
> > ---
> >=20
> > v2: Use sysfs_emit() instead of sprintf() (gregkh)
> >=20
> > v3: Enforce format string size limit (ruscur)
> > ---
> > =C2=A0arch/powerpc/include/asm/secvar.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> > =C2=A0arch/powerpc/kernel/secvar-sysfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23 ++++------------
> > --
> > =C2=A0arch/powerpc/platforms/powernv/opal-secvar.c | 25
> > ++++++++++++++++++++
> > =C2=A03 files changed, 33 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/secvar.h
> > b/arch/powerpc/include/asm/secvar.h
> > index 07ba36f868a7..8b6475589120 100644
> > --- a/arch/powerpc/include/asm/secvar.h
> > +++ b/arch/powerpc/include/asm/secvar.h
> > @@ -11,12 +11,15 @@
> > =C2=A0#include <linux/types.h>
> > =C2=A0#include <linux/errno.h>
> > =C2=A0
> > +#define SECVAR_MAX_FORMAT_LEN=C2=A0=C2=A030 // max length of string re=
turned
> > by ->format()
> > +
> > =C2=A0extern const struct secvar_operations *secvar_ops;
> > =C2=A0
> > =C2=A0struct secvar_operations {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int (*get)(const char *=
key, u64 key_len, u8 *data, u64
> > *data_size);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int (*get_next)(const c=
har *key, u64 *key_len, u64
> > keybufsize);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int (*set)(const char *=
key, u64 key_len, u8 *data, u64
> > data_size);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssize_t (*format)(char *buf)=
;
> > =C2=A0};
> > =C2=A0
> > =C2=A0#ifdef CONFIG_PPC_SECURE_BOOT
> > diff --git a/arch/powerpc/kernel/secvar-sysfs.c
> > b/arch/powerpc/kernel/secvar-sysfs.c
> > index 462cacc0ca60..d3858eedd72c 100644
> > --- a/arch/powerpc/kernel/secvar-sysfs.c
> > +++ b/arch/powerpc/kernel/secvar-sysfs.c
> > @@ -21,26 +21,13 @@ static struct kset *secvar_kset;
> > =C2=A0static ssize_t format_show(struct kobject *kobj, struct
> > kobj_attribute *attr,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 char *buf)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssize_t rc =3D 0;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_node *node;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *format;
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0node =3D of_find_compatible_=
node(NULL, NULL, "ibm,secvar-
> > backend");
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!of_device_is_available(=
node)) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0rc =3D -ENODEV;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0goto out;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char tmp[SECVAR_MAX_FORMAT_L=
EN];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssize_t len =3D secvar_ops->=
format(tmp);
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D of_property_read_stri=
ng(node, "format", &format);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0goto out;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (len <=3D 0)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -EIO;
>=20
> AFAIKS this does have a functional change, it loses the return value.
> Why not return len if it is < 0, and -EIO if len =3D=3D 0?

In v2 mpe suggested the following:

   I'm not sure you should pass that raw error back to sysfs. Some of
   the
   values could be confusing, eg. if you return -EINVAL it looks like a
   parameter to the read() syscall was invalid. Might be better to just
   return -EIO.
  =20
Following that advice, I don't think we should return something other
than -EIO, but we should at least pr_err() to document the error - this
isn't something that should ever fail.

>=20
> Thanks,
> Nick

