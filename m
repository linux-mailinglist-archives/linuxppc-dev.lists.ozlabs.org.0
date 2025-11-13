Return-Path: <linuxppc-dev+bounces-14151-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C8C5885F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 16:56:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6lJ510Cvz2yvV;
	Fri, 14 Nov 2025 02:56:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763049397;
	cv=none; b=M6oyCPZlC7uCzVkW+zj6kJdf9Pl3JeeESAJ9f3ZoWd0GIoT0BMpgeFYiZxaAEjVVojV31sOBLPWAFZCFkmiYwyJV6/rw0L+QnXmerfGbpMSIQW0t0QvMc8VfCy+jkmrlcyTmr7etRIZ+OgFs/MSSDsr9zBdqZWf9+dEjgi9jkHO3xlPf2Oe+VhjZ7JGLl8Q0aeKq730xSA1fy7yk/FzT2KUaSD06HT2CJxv+JDPLTS3k92irFNxiSdmoyHrGylP6oqk795na05C4Dicyt/pvWhi7KtLJn1CENAfKrEP+AAPnaAHejOuwgW8QsJM9MHt0EHmOYzRuYxAzYiXrqWnNiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763049397; c=relaxed/relaxed;
	bh=wee6gM5pY2qUslqcOiD+JEUaJtlOnMS4nX/ecb7in8o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CkU1rgRqfmDb1GTaDvp1Y1k+oquOKN7coEQisGP/PaPQJkEUC4ZaHZv2q0pt9vn7z+oopjCD6rjX5J98jMjmsOGNLnsQCqPV8xY+AhXPtuaKnIHcibtLdlKhr+oubGaB7Q6bmrcBD+b6Ng5KcQAiI4sqAiBsPmM/TH2coi4SzPStwhyds6Yi9XsTj7hT439U/Gb6LOX0hhi9TaXM3ogZK02ZRhGabDra8uE2lir6fXqhDX+WkCwJ55IlrcmNkGcBWxcWEnyA759mzlRmed3EbICl8MWQBmOEOeevqVPKy3LrEXmExgqVoqJqkXspQdD9S8swDteB7i6rTDgfjwHc2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LSegMppm; dkim-atps=neutral; spf=pass (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LSegMppm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6lJ16Jtqz2ynC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 02:56:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763049394; x=1794585394;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qi0VduJ3q4LlN3ypA1D4cqv/xmGMRFYGUvSvvFXqbEg=;
  b=LSegMppmUmSpe8UETFCjUHdQxp3+WkikGQqaVoZdJLaQIXEhLxM7TDne
   yjbhmnqi93XuUGgIgv6T4Mdj7LkycVcwW3aw6s79GiYmnYbgD1y/naBv5
   +fGJWC+FEC4TsnHOljGGXSnMl0kaY9Kv9ZikM58TervSwBkITBckAcjtB
   Yvl1FtPOfCbVB8Nbk22EPlMW1L53PdWnfLH+2x2Jg/bwLcSqw6LS7QMaf
   4S5TWwhFPoJ4H8Ec4/nkYagQjRB7nODiarZL14PWBflkplsTKM3yP1nMy
   bei9zK9AyvpN6xDpHoGJBJ/8F35uad95wHmJkyZmYn6xGS7DV66C72XjT
   A==;
X-CSE-ConnectionGUID: mlItrUkgQpazoYV0zn0UdQ==
X-CSE-MsgGUID: hgyndGQkQciH8HRDBfO6Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75449609"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="75449609"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:56:29 -0800
X-CSE-ConnectionGUID: 5Q3fWISCQ1is7ToHEb2EBw==
X-CSE-MsgGUID: FzBA1utJSVaatum3p4QUZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="220182536"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.164])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:56:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Nov 2025 17:56:16 +0200 (EET)
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Andreas Larsson <andreas@gaisler.com>, Bjorn Helgaas <bhelgaas@google.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-pci@vger.kernel.org, 
    sparclinux@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
    Yinghai Lu <yinghai@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    LKML <linux-kernel@vger.kernel.org>, 
    =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 02/24] sparc/PCI: Remove pcibios_enable_device() as they
 do nothing extra
In-Reply-To: <d221be13-f652-cc75-90d1-92cf38e0110e@linux.intel.com>
Message-ID: <f8231cc3-a3ba-fc58-077e-90cce1a94429@linux.intel.com>
References: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>  <20250822145605.18172-3-ilpo.jarvinen@linux.intel.com> <8fcc0fd4b74f99d5c4d80d3907e7607a7d4c89da.camel@physik.fu-berlin.de> <d221be13-f652-cc75-90d1-92cf38e0110e@linux.intel.com>
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
Content-Type: multipart/mixed; boundary="8323328-135835264-1763049376=:1464"
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-135835264-1763049376=:1464
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 10 Nov 2025, Ilpo J=C3=A4rvinen wrote:

> On Thu, 6 Nov 2025, John Paul Adrian Glaubitz wrote:
>=20
> > Hello Ilpo,
> >=20
> > On Fri, 2025-08-22 at 17:55 +0300, Ilpo J=C3=A4rvinen wrote:
> > > Under arch/sparc/ there are multiple copies of pcibios_enable_device(=
)
> > > but none of those seem to do anything extra beyond what
> > > pci_enable_resources() is supposed to do. These functions could lead =
to
> > > inconsistencies in behavior, especially now as pci_enable_resources()
> > > and the bridge window resource flags behavior are going to be altered
> > > by upcoming changes.
> > >=20
> > > Remove all pcibios_enable_device() from arch/sparc/ so that PCI core
> > > can simply call into pci_enable_resources() instead using it's __weak
> > > version of pcibios_enable_device().
> > >=20
> > > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > > ---
> > >  arch/sparc/kernel/leon_pci.c | 27 ---------------------------
> > >  arch/sparc/kernel/pci.c      | 27 ---------------------------
> > >  arch/sparc/kernel/pcic.c     | 27 ---------------------------
> > >  3 files changed, 81 deletions(-)
> > >=20
> > > diff --git a/arch/sparc/kernel/leon_pci.c b/arch/sparc/kernel/leon_pc=
i.c
> > > index 8de6646e9ce8..10934dfa987a 100644
> > > --- a/arch/sparc/kernel/leon_pci.c
> > > +++ b/arch/sparc/kernel/leon_pci.c
> > > @@ -60,30 +60,3 @@ void leon_pci_init(struct platform_device *ofdev, =
struct leon_pci_info *info)
> > >  =09pci_assign_unassigned_resources();
> > >  =09pci_bus_add_devices(root_bus);
> > >  }
> > > -
> > > -int pcibios_enable_device(struct pci_dev *dev, int mask)
> > > -{
> > > -=09struct resource *res;
> > > -=09u16 cmd, oldcmd;
> > > -=09int i;
> > > -
> > > -=09pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > > -=09oldcmd =3D cmd;
> > > -
> > > -=09pci_dev_for_each_resource(dev, res, i) {
> > > -=09=09/* Only set up the requested stuff */
> > > -=09=09if (!(mask & (1<<i)))
> > > -=09=09=09continue;
> > > -
> > > -=09=09if (res->flags & IORESOURCE_IO)
> > > -=09=09=09cmd |=3D PCI_COMMAND_IO;
> > > -=09=09if (res->flags & IORESOURCE_MEM)
> > > -=09=09=09cmd |=3D PCI_COMMAND_MEMORY;
> > > -=09}
> > > -
> > > -=09if (cmd !=3D oldcmd) {
> > > -=09=09pci_info(dev, "enabling device (%04x -> %04x)\n", oldcmd, cmd)=
;
> > > -=09=09pci_write_config_word(dev, PCI_COMMAND, cmd);
> > > -=09}
> > > -=09return 0;
> > > -}
> > > diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
> > > index ddac216a2aff..a9448088e762 100644
> > > --- a/arch/sparc/kernel/pci.c
> > > +++ b/arch/sparc/kernel/pci.c
> > > @@ -722,33 +722,6 @@ struct pci_bus *pci_scan_one_pbm(struct pci_pbm_=
info *pbm,
> > >  =09return bus;
> > >  }
> > > =20
> > > -int pcibios_enable_device(struct pci_dev *dev, int mask)
> > > -{
> > > -=09struct resource *res;
> > > -=09u16 cmd, oldcmd;
> > > -=09int i;
> > > -
> > > -=09pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > > -=09oldcmd =3D cmd;
> > > -
> > > -=09pci_dev_for_each_resource(dev, res, i) {
> > > -=09=09/* Only set up the requested stuff */
> > > -=09=09if (!(mask & (1<<i)))
> > > -=09=09=09continue;
> > > -
> > > -=09=09if (res->flags & IORESOURCE_IO)
> > > -=09=09=09cmd |=3D PCI_COMMAND_IO;
> > > -=09=09if (res->flags & IORESOURCE_MEM)
> > > -=09=09=09cmd |=3D PCI_COMMAND_MEMORY;
> > > -=09}
> > > -
> > > -=09if (cmd !=3D oldcmd) {
> > > -=09=09pci_info(dev, "enabling device (%04x -> %04x)\n", oldcmd, cmd)=
;
> > > -=09=09pci_write_config_word(dev, PCI_COMMAND, cmd);
> > > -=09}
> > > -=09return 0;
> > > -}
> > > -
> > >  /* Platform support for /proc/bus/pci/X/Y mmap()s. */
> > >  int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_stru=
ct *vma)
> > >  {
> > > diff --git a/arch/sparc/kernel/pcic.c b/arch/sparc/kernel/pcic.c
> > > index 25fe0a061732..3d54ad5656a4 100644
> > > --- a/arch/sparc/kernel/pcic.c
> > > +++ b/arch/sparc/kernel/pcic.c
> > > @@ -641,33 +641,6 @@ void pcibios_fixup_bus(struct pci_bus *bus)
> > >  =09}
> > >  }
> > > =20
> > > -int pcibios_enable_device(struct pci_dev *dev, int mask)
> > > -{
> > > -=09struct resource *res;
> > > -=09u16 cmd, oldcmd;
> > > -=09int i;
> > > -
> > > -=09pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > > -=09oldcmd =3D cmd;
> > > -
> > > -=09pci_dev_for_each_resource(dev, res, i) {
> > > -=09=09/* Only set up the requested stuff */
> > > -=09=09if (!(mask & (1<<i)))
> > > -=09=09=09continue;
> > > -
> > > -=09=09if (res->flags & IORESOURCE_IO)
> > > -=09=09=09cmd |=3D PCI_COMMAND_IO;
> > > -=09=09if (res->flags & IORESOURCE_MEM)
> > > -=09=09=09cmd |=3D PCI_COMMAND_MEMORY;
> > > -=09}
> > > -
> > > -=09if (cmd !=3D oldcmd) {
> > > -=09=09pci_info(dev, "enabling device (%04x -> %04x)\n", oldcmd, cmd)=
;
> > > -=09=09pci_write_config_word(dev, PCI_COMMAND, cmd);
> > > -=09}
> > > -=09return 0;
> > > -}
> > > -
> > >  /* Makes compiler happy */
> > >  static volatile int pcic_timer_dummy;
> >=20
> > This change actually broke driver initialization on SPARC, see:
> >=20
> > https://github.com/sparclinux/issues/issues/22
>=20
> Does the attached patch help?

Second fixup patch attached.

--=20
 i.

--8323328-135835264-1763049376=:1464
Content-Type: text/x-diff; name=sparc-pref2.patch
Content-Transfer-Encoding: BASE64
Content-ID: <474a4557-bd2d-a362-a883-08ba47f89a36@linux.intel.com>
Content-Description: 
Content-Disposition: attachment; filename=sparc-pref2.patch

RnJvbTogSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50
ZWwuY29tPg0KU3ViamVjdDogW1BBVENIXSBTUEFSQy9QQ0k6IENvcnJlY3Qg
NjQtYml0IG5vbi1wcmVmIC0+IHByZWYNCg0KU2lnbmVkLW9mZi1ieTogSWxw
byBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPg0K
DQotLS0NCiBhcmNoL3NwYXJjL2tlcm5lbC9wY2kuYyB8IDE5ICsrKysrKysr
KysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9rZXJuZWwvcGNpLmMgYi9h
cmNoL3NwYXJjL2tlcm5lbC9wY2kuYw0KaW5kZXggYTk0NDgwODhlNzYyLi4z
Yjg1NzU4OTEwMDYgMTAwNjQ0DQotLS0gYS9hcmNoL3NwYXJjL2tlcm5lbC9w
Y2kuYw0KKysrIGIvYXJjaC9zcGFyYy9rZXJuZWwvcGNpLmMNCkBAIC0xODEs
NiArMTgxLDI0IEBAIHN0YXRpYyBpbnQgX19pbml0IG9mcGNpX2RlYnVnKGNo
YXIgKnN0cikNCiANCiBfX3NldHVwKCJvZnBjaV9kZWJ1Zz0iLCBvZnBjaV9k
ZWJ1Zyk7DQogDQorc3RhdGljIHZvaWQgb2ZfZml4dXBfcGNpX3ByZWYoc3Ry
dWN0IHBjaV9kZXYgKmRldiwgaW50IGluZGV4LA0KKwkJCSAgICAgIHN0cnVj
dCByZXNvdXJjZSAqcmVzKQ0KK3sNCisJaWYgKCEocmVzLT5mbGFncyAmIElP
UkVTT1VSQ0VfTUVNXzY0KSkNCisJCXJldHVybjsNCisNCisJaWYgKCFyZXNv
dXJjZV9zaXplKHJlcykpDQorCQlyZXR1cm47DQorCWlmIChyZXMtPmVuZCA8
PSB+KCh1MzIpMCkpDQorCQlyZXR1cm47DQorDQorCWlmICghKHJlcy0+Zmxh
Z3MgJiBJT1JFU09VUkNFX1BSRUZFVENIKSkgew0KKwkJcmVzLT5mbGFncyB8
PSBJT1JFU09VUkNFX1BSRUZFVENIOw0KKwkJcGNpX2luZm8oZGV2LCAicmVn
IDB4JXg6IGZpeHVwOiBwcmVmIGFkZGVkIHRvIDY0LWJpdCByZXNvdXJjZVxu
IiwNCisJCQkgaW5kZXgpOw0KKwl9DQorfQ0KKw0KIHN0YXRpYyB1bnNpZ25l
ZCBsb25nIHBjaV9wYXJzZV9vZl9mbGFncyh1MzIgYWRkcjApDQogew0KIAl1
bnNpZ25lZCBsb25nIGZsYWdzID0gMDsNCkBAIC0yNDQsNiArMjYyLDcgQEAg
c3RhdGljIHZvaWQgcGNpX3BhcnNlX29mX2FkZHJzKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKm9wLA0KIAkJcmVzLT5lbmQgPSBvcF9yZXMtPmVuZDsNCiAJ
CXJlcy0+ZmxhZ3MgPSBmbGFnczsNCiAJCXJlcy0+bmFtZSA9IHBjaV9uYW1l
KGRldik7DQorCQlvZl9maXh1cF9wY2lfcHJlZihkZXYsIGksIHJlcyk7DQog
DQogCQlwY2lfaW5mbyhkZXYsICJyZWcgMHgleDogJXBSXG4iLCBpLCByZXMp
Ow0KIAl9DQoNCi0tIA0KdGc6ICgzYTg2NjA4Nzg4MzkuLikgc3BhcmMvZHQt
Zml4dXAtcHJlZiAoZGVwZW5kcyBvbjogbWFpbikNCg==

--8323328-135835264-1763049376=:1464--

