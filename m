Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9FD8CC447
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 17:41:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=JXCw+3DE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkwPK1jGJz78jv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 01:35:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=JXCw+3DE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkwNW31qGz3g9B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 01:35:05 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0C7FD40E0254;
	Wed, 22 May 2024 15:34:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wqTkxvV73S00; Wed, 22 May 2024 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1716392094; bh=Xmy+3e1HHHTBNLSRHwnL6nlYDa9k9Cp2lomF07Vmx8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXCw+3DEfJjYLRkVQzMmJsoxUxb+crd9QUp2D6N8qTU23wQL1oV/VtjD7TdS7JbIs
	 r/ysPLnKN+8KFBqQI0a83WEVeCL4oTMhh5DZFqSrqA7bkpu9x04N+VTgYZCEBJ/5rE
	 cF75WoiavAXMd0B122qI8/O1e77WlcDAJ9dCSAmE3klJV19jAfqDu1m38BrupUhDhf
	 McCnH9C/SxtmUWB4ZWy5Ep1KCbpARCkfZGVRcoJtdktYekLjaCweHv1FSsr8QnZKxV
	 MsfwK+qVnWgOK1/GdEEjcmmGtEPJRMgsihVhLM4n/ngg9kdOpCgZIZSvYM0TL6xWnq
	 4jylzsuUSB1IjGPQ88EmHuVUx7hXBAM+D4CaJbfMkWOrRJE9cUoFUlURqrY1puKJ16
	 ysex2xRY8nflVtq5FqraGbEihfAsc7KEoW5Fnqp6FoeClUWqOv79qdQSG/XUYSLE7s
	 DGO3ISzCpus26E9YbSQJHqlEy1YbQ0/66Mns9aScxJpE4fEv4mcmt+QY1qxS8HBudo
	 e0bCVVs4yU9214jWMb2XPWbIUUKHxdI+MFUYjP+WEtD8nDFg15JEoJ2PbUQ2r8rh0+
	 bJceLUXnJIZhUDNAcPpqnp/+2KR14NZ0O0qfKPV13VuanhWMBH7GNccH9UM1LMR+kB
	 zeOfji83xzWdJqjiOI7FwJKw=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2368F40E0177;
	Wed, 22 May 2024 15:34:34 +0000 (UTC)
Date: Wed, 22 May 2024 17:34:33 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Balasubrmanian, Vignesh" <vigbalas@amd.com>
Subject: Re: [PATCH v2 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Message-ID: <20240522153433.GCZk4QiX4Hf0OuI48E@fat_crate.local>
References: <87wmo4o3r4.ffs@tglx>
 <4a090901-9705-40aa-ac3d-d67c52660f22@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a090901-9705-40aa-ac3d-d67c52660f22@amd.com>
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
Cc: "felix.willgerodt@intel.com" <felix.willgerodt@intel.com>, "matz@suse.de" <matz@suse.de>, "George, Jini Susan" <JiniSusan.George@amd.com>, "keescook@chromium.org" <keescook@chromium.org>, "jhb@FreeBSD.org" <jhb@freebsd.org>, "binutils@sourceware.org" <binutils@sourceware.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Balasubrmanian, Vignesh" <Vignesh.Balasubrmanian@amd.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 22, 2024 at 06:42:55PM +0530, Balasubrmanian, Vignesh wrote:
> > > +enum custom_feature {
> > > +     FEATURE_XSAVE_FP =3D 0,
> > > +     FEATURE_XSAVE_SSE =3D 1,
> > > +     FEATURE_XSAVE_YMM =3D 2,
> > > +     FEATURE_XSAVE_BNDREGS =3D 3,
> > > +     FEATURE_XSAVE_BNDCSR =3D 4,
> > > +     FEATURE_XSAVE_OPMASK =3D 5,
> > > +     FEATURE_XSAVE_ZMM_Hi256 =3D 6,
> > > +     FEATURE_XSAVE_Hi16_ZMM =3D 7,
> > > +     FEATURE_XSAVE_PT =3D 8,
> > > +     FEATURE_XSAVE_PKRU =3D 9,
> > > +     FEATURE_XSAVE_PASID =3D 10,
> > > +     FEATURE_XSAVE_CET_USER =3D 11,
> > > +     FEATURE_XSAVE_CET_SHADOW_STACK =3D 12,
> > > +     FEATURE_XSAVE_HDC =3D 13,
> > > +     FEATURE_XSAVE_UINTR =3D 14,
> > > +     FEATURE_XSAVE_LBR =3D 15,
> > > +     FEATURE_XSAVE_HWP =3D 16,
> > > +     FEATURE_XSAVE_XTILE_CFG =3D 17,
> > > +     FEATURE_XSAVE_XTILE_DATA =3D 18,
> > > +     FEATURE_MAX,
> > > +     FEATURE_XSAVE_EXTENDED_START =3D FEATURE_XSAVE_YMM,
> > > +     FEATURE_XSAVE_EXTENDED_END =3D FEATURE_XSAVE_XTILE_DATA,
> > > +};
> > Why can't this use the existing 'enum xfeature' which is providing
> > exactly the same information already?
> First version of patch was similar to what you mentioned here and other
> review comments to use existing kernel definitions.
> https://lore.kernel.org/linux-mm/20240314112359.50713-1-vigbalas@amd.co=
m/T/
>=20
> As per the review comment https://lore.kernel.org/linux-mm/202403141629=
54.GAZfMmAnYQoRjRbRzc@fat_crate.local/
> , modified the patch to be a independent of kernel internal definitions=
.
> Though this enum and below function=C2=A0 "get_sub_leaf" are not useful=
 now,=C2=A0 it
> will be required when we extend for a new/different features.

No, Thomas' sugggestion is to use the existing xfeature enum - not
define the same thing again.

Why do you need that enum custom_feature thing if you can use

/*
 * List of XSAVE features Linux knows about:
 */
enum xfeature {

from arch/x86/include/asm/fpu/types.h

?

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
