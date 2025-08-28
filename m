Return-Path: <linuxppc-dev+bounces-11400-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD4DB38F9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 02:13:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cC20r20Hfz3bb6;
	Thu, 28 Aug 2025 10:13:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=216.40.44.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756339980;
	cv=none; b=W3bGFFbY3daZI7lnC02rFuV7VuHjp4faJ0hTaOkKZBtBkgXCzJTZCFWd2IhVVQ1smDBeLP0t/beSoZFleHcj5zqQ9xvmqj8CcOAjVvfVh67TDdWb3YvysP/Lz7Xk4oDWw+AKpjv574dTpE8lSGKf4+L24yOYlFjC6+BttFMgH7ccbU4dHqt1XUWib5zDBjZ3wfGa4Rqnaw8VF6HGmREtES5bnXieQ1o84njHsBcZL8FH7X6D/SCM1+TrSGtxBjc8d43jxMAgiil53WuQupwOkSZ3ULUpl8rYXy3lDXewmqhQouLXI5c0iVINmH7yHeO9DvpfgJIY2QbtXEa3adARSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756339980; c=relaxed/relaxed;
	bh=ENqdQ6Zwz+mYedecfjOSlkVkkWQfujwYHCpc+uqQvVQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Su2zpUAyYqHjXKcuGk3a4a61AdhEHDfHY/QDuecs3l0rbegFxmwbc9Djyx0XDzB7c8I4vm3H2FYdp6l3k+QVjdDdke5CwlXu3mkv8nbb4y2XcMhiNB+bANb/XsG9l1x+gcqXatcVywsaM17kLFQMZ7ty0tmKqC/kISrAfHsSzTDCXgXqvQicOmyy/JYDMjPFM252k7cav/qECHc7u6RuRLEE3k14YGmY/uA1EzmdMfku+/z23ZiEbguhQNmAPB1I+t0Xi4v5Z9e7mAiuEgroIEOVgE9/maZUjgp/p2juN2wgpnDNBu/jMTtfiYemF+t6ByHf0Ky408rmXNs4slFHKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass (client-ip=216.40.44.17; helo=relay.hostedemail.com; envelope-from=joe@perches.com; receiver=lists.ozlabs.org) smtp.mailfrom=perches.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=perches.com (client-ip=216.40.44.17; helo=relay.hostedemail.com; envelope-from=joe@perches.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 513 seconds by postgrey-1.37 at boromir; Thu, 28 Aug 2025 10:12:58 AEST
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cC20p39mlz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 10:12:57 +1000 (AEST)
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 23CB7591BA;
	Thu, 28 Aug 2025 00:04:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id 3FD3320026;
	Thu, 28 Aug 2025 00:04:19 +0000 (UTC)
Message-ID: <5b914354f29e58097e373dde76ee26b246a64ce6.camel@perches.com>
Subject: Re: [PATCH] powerpc/powernv: Rename pe_level_printk to pe_printk
 and embed KERN_LEVEL in format
From: Joe Perches <joe@perches.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel
 <linux-kernel@vger.kernel.org>
Date: Wed, 27 Aug 2025 17:04:16 -0700
In-Reply-To: <732ae03a-f0a7-450c-8896-e8a4975a5254@csgroup.eu>
References: <df3a7ca31d2002ca447ab062f5b5e32ced9bec85.camel@perches.com>
	 <732ae03a-f0a7-450c-8896-e8a4975a5254@csgroup.eu>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 3FD3320026
X-Stat-Signature: uau5hkr6errx756ojdmfydbea8w4err6
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19Ba6ut9WVmmTi9/CJjacHvw6XJzPZwXTI=
X-HE-Tag: 1756339459-982349
X-HE-Meta: U2FsdGVkX18cO46/q+eMU6rG9Rt60S6qUj+EUM63rbXb6VN9Iw7P9AjBQMdGD3MLUsHiamW2QjS/gei4KlRbOJBxbB47tqGF6QB7iMpj8J/jjIXhTcA7UuutXlZIL8AWfKFhR89ZCFa4cS9nHHgFDY8h6xxSBtRyt7n8lJ9RaKLOQqHllfK7YvX6x1GYxkIQ2p2+VjxzZkzgccqwAFKvMfwFGAylFn7uw62w4m9d2orZdIP4MxeB7EU5aTon+SMt9/m9Ac6zKw+/4rNN82ihf2YuQ1nPrQnZ8t1KYh5cDK17cBnE3VTp3+91U9KMKrX0bHIIwusVHOcOtbov+F1MfyCuoTxuh7zwaKprhwA03u+TrspOqmqF7+A1rWgLTbaD
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-08-27 at 18:42 +0200, Christophe Leroy wrote:
> Hi Joe
>=20
> Le 21/06/2019 =E0 07:36, Joe Perches a =E9crit=A0:
> > Remove the separate KERN_<LEVEL> from each pe_level_printk and
> > instead add the KERN_<LEVEL> to the format.

Hello Christophe.

It's over 6 years since I wrote that.
Is that the typical review time? ;)

I would expect it doesn't apply anyway
though it should make the object size
a tiny bit smaller.

> >=20
> > pfix in pe_level_printk could also be used uninitialized so
> > add a new else and set pfx to the hex value of pe->flags.
> >=20
> > Rename pe_level_printk to pe_printk and update the pe_<level>
> > macros.
> >=20
> > Signed-off-by: Joe Perches <joe@perches.com>
> > ---
> >   arch/powerpc/platforms/powernv/pci-ioda.c | 14 ++++++++++++--
> >   arch/powerpc/platforms/powernv/pci.h      | 11 +++++------
> >   2 files changed, 17 insertions(+), 8 deletions(-)
>=20
> I can't see the added value of this patch, it adds more lines than it=20
> removes.
>=20
> Christophe
>=20
> >=20
> > diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/p=
latforms/powernv/pci-ioda.c
> > index 10cc42b9e541..60fc36ae626a 100644
> > --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> > +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> > @@ -50,15 +50,23 @@
> >   static const char * const pnv_phb_names[] =3D { "IODA1", "IODA2", "NP=
U_NVLINK",
> >   					      "NPU_OCAPI" };
> >  =20
> > -void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
> > -			    const char *fmt, ...)
> > +void pe_printk(const struct pnv_ioda_pe *pe, const char *fmt, ...)
> >   {
> >   	struct va_format vaf;
> >   	va_list args;
> >   	char pfix[32];
> > +	char level[PRINTK_MAX_SINGLE_HEADER_LEN + 1] =3D "\0";
> >  =20
> >   	va_start(args, fmt);
> >  =20
> > +	while (printk_get_level(fmt)) {
> > +		size_t size =3D printk_skip_level(fmt) - fmt;
> > +
> > +		memcpy(level, fmt,  size);
> > +		level[size] =3D '\0';
> > +		fmt +=3D size;
> > +	}
> > +
> >   	vaf.fmt =3D fmt;
> >   	vaf.va =3D &args;
> >  =20
> > @@ -74,6 +82,8 @@ void pe_level_printk(const struct pnv_ioda_pe *pe, co=
nst char *level,
> >   			(pe->rid & 0xff00) >> 8,
> >   			PCI_SLOT(pe->rid), PCI_FUNC(pe->rid));
> >   #endif /* CONFIG_PCI_IOV*/
> > +	else
> > +		sprintf(pfix, "(flags: 0x%lx)", pe->flags);
> >  =20
> >   	printk("%spci %s: [PE# %.2x] %pV",
> >   	       level, pfix, pe->pe_number, &vaf);
> > diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platfo=
rms/powernv/pci.h
> > index be26ab3d99e0..870b21f55b3f 100644
> > --- a/arch/powerpc/platforms/powernv/pci.h
> > +++ b/arch/powerpc/platforms/powernv/pci.h
> > @@ -205,15 +205,14 @@ extern unsigned long pnv_pci_ioda2_get_table_size=
(__u32 page_shift,
> >   		__u64 window_size, __u32 levels);
> >   extern int pnv_eeh_post_init(void);
> >  =20
> > -__printf(3, 4)
> > -extern void pe_level_printk(const struct pnv_ioda_pe *pe, const char *=
level,
> > -			    const char *fmt, ...);
> > +__printf(2, 3)
> > +extern void pe_printk(const struct pnv_ioda_pe *pe, const char *fmt, .=
..);
> >   #define pe_err(pe, fmt, ...)					\
> > -	pe_level_printk(pe, KERN_ERR, fmt, ##__VA_ARGS__)
> > +	pe_printk(pe, KERN_ERR fmt, ##__VA_ARGS__)
> >   #define pe_warn(pe, fmt, ...)					\
> > -	pe_level_printk(pe, KERN_WARNING, fmt, ##__VA_ARGS__)
> > +	pe_printk(pe, KERN_WARNING fmt, ##__VA_ARGS__)
> >   #define pe_info(pe, fmt, ...)					\
> > -	pe_level_printk(pe, KERN_INFO, fmt, ##__VA_ARGS__)
> > +	pe_printk(pe, KERN_INFO fmt, ##__VA_ARGS__)
> >  =20
> >   /* Nvlink functions */
> >   extern void pnv_npu_try_dma_set_bypass(struct pci_dev *gpdev, bool by=
pass);

