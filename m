Return-Path: <linuxppc-dev+bounces-13120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB4CBF7A16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 18:21:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crcwq1DSyz304H;
	Wed, 22 Oct 2025 03:20:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761063659;
	cv=none; b=ZqJ41zl5ov2+CmEwdktYmMX+QgwitT2rTGcStBpwEm0v5gqLvevu1M0KmERvYhZFGSZvRpvPAOb+SylsHrjXrSJhtBjpxEuHsGmLzWbtTqtXr6cJPz8LrR1FGAFyjGeHfcbwc7UCM9WYZA/THBV1P1IrmM5/HYM6wzg7IfDZM+WS7bIs9fVi8nAhwieVEwk1R3bxAuyjypIg0o8MM1MQ13aAG9jU8b/bwCnyzimMGTCmjsDsqLIbGQigzE/ZraO9/DEl6DZf5PsIDdoVv4VOoehR7rOtZNeaKQIA5rY/liu7bDN2EHU3Ib844i8YtZYo3JgJSwkbkLCyqPFM/WUrPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761063659; c=relaxed/relaxed;
	bh=LMfLZkWdtEpyKcyACnVEnBnVXrKTKM4ysSqUWRujmdU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Z0gVOCYzOa0b1fyfK6eBJNK5/g8anjitgpDtnj62WS27vrl2Lq9oCTwLkAQc3DixFE9qbKVvhBnTQV2OJiozZlkp8EbFppeCKJCcbCNdVyGis1P1KcAAOdYquHCgifgQsK1JbwwpkVFrM0hMRj8wu5KUhSFW5fygV1wVgZeiZZMkTPW4iujD5gk1QGh8oYcGv8hWUmw1F0slnsezL80gAwL80gtkpYQlXzijQ6w/ozRD1dfgnqo0Uo5ytQAniy8caDi0k/grVGFcsIA1vpcyroeU/Fi64X6nJjLcpl+pUXknOokTSBYAssX2Zsf2LZwTlX5y80oRdMggh+y4qbTswQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GW5RMB/r; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GW5RMB/r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crcwm3R90z2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 03:20:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761063657; x=1792599657;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=UiYo337U/uvngXu64QBg7gPMlx6TfoMI6XWsfgsm50w=;
  b=GW5RMB/rlgxP4IDVB6CljIsA74DFj6NwYdAaGbEyceCOasUaB6zMZ3Ej
   dI9O1+48ngfd2SsJmFqPT4EqNjRXnIstnnXapfbW130BPTVhWO5LlU0eq
   JB2WmwL4nrX9JBy7s6bLqC50h2xROLtZRyAQ6+kdQLCLTYmjVwFtULTMc
   Zq+9PtgoZ3WP1tN3tTgHrYMtRPV25L+H0RD2v0e6k8ncpiXps1z4c5se9
   mPSB4Ul4+JB6ErXHfv80jfCBIJxR1NQg3cav2xRhUBcLiXZQIUV1KBB/x
   CPmOHvkTlIM6WvvQ5afB+6e9ISoTolvl9kWNyLuMQZ9wRtMYDd3HVX+Wk
   g==;
X-CSE-ConnectionGUID: A/bkjv1/QceyEIrZ3OCetA==
X-CSE-MsgGUID: OAmwK3EeS+uuwoSDhrEqiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80634068"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="80634068"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 09:20:52 -0700
X-CSE-ConnectionGUID: T1o8CFj+T/OBd3RU55mKfw==
X-CSE-MsgGUID: A81F09Z1TLG85mG5fYIOTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="183335077"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 09:20:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Oct 2025 19:20:44 +0300 (EEST)
To: Simon Richter <Simon.Richter@hogyros.de>
cc: Lucas De Marchi <lucas.demarchi@intel.com>, linuxppc-dev@lists.ozlabs.org, 
    linux-pci@vger.kernel.org
Subject: Re: BAR resizing broken in 6.18 (PPC only?)
In-Reply-To: <67840a16-99b4-4d8c-9b5c-4721ab0970a2@hogyros.de>
Message-ID: <922b1f68-a6a2-269b-880c-d594f9ca6bde@linux.intel.com>
References: <f9a8c975-f5d3-4dd2-988e-4371a1433a60@hogyros.de> <a5e7a118-ba70-000e-bab4-8d56b3404325@linux.intel.com> <67840a16-99b4-4d8c-9b5c-4721ab0970a2@hogyros.de>
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
Content-Type: multipart/mixed; BOUNDARY="8323328-262779146-1760981164=:976"
Content-ID: <2f941369-6da1-fb98-c063-3e6389d9eb95@linux.intel.com>
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-262779146-1760981164=:976
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <ae7f8f78-eb6d-16ad-7790-4784d91d3308@linux.intel.com>

On Sun, 19 Oct 2025, Simon Richter wrote:
> On 10/17/25 00:45, Ilpo J=E4rvinen wrote:
>=20
> > Is this stock 6.18-rc1?
>=20
> This is drm-tip, plus a few extras that actually allow me to load the GPU
> driver, but no PCIe changes.

Okay, it explains the BAR0 release then.

> > Was this resize attempted automatically by the xe driver during boot, n=
ot
> > triggered manually through sysfs, right? (Inferring that's likely the c=
ase
> > given the proximity of the "enabling device" message.)
>=20
> Yes, that's the xe driver doing that.
>=20
> > I need to know PCI resource allocations of the parents too. Preferrably
> > dmesg and /proc/iomem from both working and broken cases so it's easier
> > to find the differences.
>=20
> I've attached those.
>=20
>  - dmesg.good/iomem.good: taken with 6.17 (drm-tip from last week)
>  - dmesg.bad/iomem.bad: taken with 6.18rc1 (drm-tip after update)
>  - dmesg.meh/iomem.meh: with the rebar patch 1/2 from Lucas. 2/2 is alrea=
dy
> merged. The GPU works at least, but has a 256MB aperture
>  - dmesg.rev/iomem.rev: with 85796d20a690 and 3ab10f83e277 reverted

Could you please test if the patch below helps.

> > I'd very much want to do this too but I've higher priority items on my
> > list, one of which attempts to resolve these resizable BARs using other
> > way, that is, size the bridge windows considering the maximum size of t=
he
> > BAR right from the start. That would remove the need to try to enlarge
> > BARs afterwards as there won't be more room for them anyway.
>=20
> The bridge windows are set up by firmware, but they should be large enoug=
h on
> POWER, given that each slot gets its own domain, and controllers are allo=
cated
> 256G each.
>
> I also dimly remember these are be configured so that the first 2G of add=
ress
> space are on the PCIe bus, and the first 2G of memory are addressed at a
> higher address and only accessible to 64 bit capable cards, so 32 bit car=
ds
> can still access 2 GB of PCIe memory for P2PDMA and 2 GB of RAM (so the r=
oot
> complex performs address translation).
>=20
> The result of this seems to be that smaller BARs end up in the 2 GB windo=
w, so
> only the VRAM aperture is inside the larger 64-bit-only window, so the wi=
ndow
> containing the bridge's BAR0 does not need to be changed.

There's indeed something messy and odd going on here with the resource and=
=20
window mappings, in the bad case there's also this line which doesn't make=
=20
much sense:

+pci 0030:01:00.0: bridge window [mem 0x6200000000000-0x6203fbff0ffff 64bit=
 pref]: can't claim; address conflict with 0030:01:00.0 [mem 0x620002000000=
0-0x62000207fffff 64bit pref]

=2E..but that conflicting resource was not assigned in between releasing=20
this bridge window and trying to claim it back so how did that=20
conflicting resource get there is totally mysterious to me. It doesn't=20
seem related directly to the the resize no longer working though.

> > > Also, why do we change the BAR assignment while mem decoding is activ=
e?
>=20
> > pci_resize_resource() does check for
> > pci_resize_is_memory_decoding_enabled(), do you think that is not enoug=
h?
>=20
> It's a bit weird that there is a log message that says "enabling device",=
 then
> the BARs are reconfigured. I'd want the decoding logic to be inactive whi=
le
> addresses are assigned.

So no real issue here and only logging is not the way you'd want it?


--
From: =3D?UTF-8?q?Ilpo=3D20J=3DC3=3DA4rvinen?=3D <ilpo.jarvinen@linux.intel=
=2Ecom>
Date: Tue, 21 Oct 2025 19:13:31 +0300
Subject: [PATCH 1/1] PCI: Remove old_size limit from bridge window sizing
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

calculate_memsize() applies lower bound to the resource size before
aligning the resource size making it impossible to shrink bridge window
resources. I've not found any justification for this lower bound and
nothing indicated it was to work around some HW issue.

Prior to the commit 3baeae36039a ("PCI: Use pci_release_resource()
instead of release_resource()"), releasing a bridge window during BAR
resize resulted in clearing start and end address of the resource.
Clearing addresses destroys the resource size as a side-effect,
therefore nullifying the effect of the old size lower bound.

After the commit 3baeae36039a ("PCI: Use pci_release_resource() instead
of release_resource()"), BAR resize uses the aligned old size, which
results in exceeding what fits into the parent window in some cases:

xe 0030:03:00.0: [drm] Attempting to resize bar from 256MiB -> 16384MiB
xe 0030:03:00.0: BAR 0 [mem 0x620c000000000-0x620c000ffffff 64bit]: releasi=
ng
xe 0030:03:00.0: BAR 2 [mem 0x6200000000000-0x620000fffffff 64bit pref]: re=
leasing
pci 0030:02:01.0: bridge window [mem 0x6200000000000-0x620001fffffff 64bit =
pref]: releasing
pci 0030:01:00.0: bridge window [mem 0x6200000000000-0x6203fbff0ffff 64bit =
pref]: releasing
pci 0030:00:00.0: bridge window [mem 0x6200000000000-0x6203fbff0ffff 64bit =
pref]: was not released (still contains assigned resources)
pci 0030:00:00.0: Assigned bridge window [mem 0x6200000000000-0x6203fbff0ff=
ff 64bit pref] to [bus 01-04] free space at [mem 0x6200400000000-0x62007fff=
fffff 64bit pref]
pci 0030:00:00.0: Assigned bridge window [mem 0x6200000000000-0x6203fbff0ff=
ff 64bit pref] to [bus 01-04] cannot fit 0x4000000000 required for 0030:01:=
00.0 bridging to [bus 02-04]

The old size of 0x6200000000000-0x6203fbff0ffff resource was used as
the lower bound which results in 0x4000000000 size request due to
alignment. That exceed what can fit into the parent window.

Since the lower bound never even was enforced fully because the
resource addresses were cleared when the bridge window is released,
remove the old_size lower bound entirely and trust the calculated
bridge window size is enough.

This same problem may occur on io window side but seems less likely to
cause issues due to general difference in alignment. Removing the lower
bound may have other unforeseen consequences in case of io window so
it's better to do leave as -next material if no problem is reported
related to io window sizing (BAR resize shouldn't touch io windows
anyway).

Reported-by: Simon Richter <Simon.Richter@hogyros.de>
Fixes: 3baeae36039a ("PCI: Use pci_release_resource() instead of release_re=
source()")
Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 362ad108794d..e842feb85be0 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1066,16 +1066,13 @@ static resource_size_t calculate_memsize(resource_s=
ize_t size,
 =09=09=09=09=09 resource_size_t min_size,
 =09=09=09=09=09 resource_size_t add_size,
 =09=09=09=09=09 resource_size_t children_add_size,
-=09=09=09=09=09 resource_size_t old_size,
 =09=09=09=09=09 resource_size_t align)
 {
 =09if (size < min_size)
 =09=09size =3D min_size;
-=09if (old_size =3D=3D 1)
-=09=09old_size =3D 0;
=20
 =09size =3D max(size, add_size) + children_add_size;
-=09return ALIGN(max(size, old_size), align);
+=09return ALIGN(size, align);
 }
=20
 resource_size_t __weak pcibios_window_alignment(struct pci_bus *bus,
@@ -1317,7 +1314,6 @@ static void pbus_size_mem(struct pci_bus *bus, unsign=
ed long type,
 =09resource_size_t children_add_align =3D 0;
 =09resource_size_t add_align =3D 0;
 =09resource_size_t relaxed_align;
-=09resource_size_t old_size;
=20
 =09if (!b_res)
 =09=09return;
@@ -1388,11 +1384,10 @@ static void pbus_size_mem(struct pci_bus *bus, unsi=
gned long type,
 =09=09}
 =09}
=20
-=09old_size =3D resource_size(b_res);
 =09win_align =3D window_alignment(bus, b_res->flags);
 =09min_align =3D calculate_mem_align(aligns, max_order);
 =09min_align =3D max(min_align, win_align);
-=09size0 =3D calculate_memsize(size, min_size, 0, 0, old_size, min_align);
+=09size0 =3D calculate_memsize(size, min_size, 0, 0, min_align);
=20
 =09if (size0) {
 =09=09resource_set_range(b_res, min_align, size0);
@@ -1404,7 +1399,7 @@ static void pbus_size_mem(struct pci_bus *bus, unsign=
ed long type,
 =09=09relaxed_align =3D 1ULL << (max_order + __ffs(SZ_1M));
 =09=09relaxed_align =3D max(relaxed_align, win_align);
 =09=09min_align =3D min(min_align, relaxed_align);
-=09=09size0 =3D calculate_memsize(size, min_size, 0, 0, old_size, win_alig=
n);
+=09=09size0 =3D calculate_memsize(size, min_size, 0, 0, win_align);
 =09=09resource_set_range(b_res, min_align, size0);
 =09=09pci_info(bus->self, "bridge window %pR to %pR requires relaxed align=
ment rules\n",
 =09=09=09 b_res, &bus->busn_res);
@@ -1413,7 +1408,7 @@ static void pbus_size_mem(struct pci_bus *bus, unsign=
ed long type,
 =09if (realloc_head && (add_size > 0 || children_add_size > 0)) {
 =09=09add_align =3D max(min_align, add_align);
 =09=09size1 =3D calculate_memsize(size, min_size, add_size, children_add_s=
ize,
-=09=09=09=09=09  old_size, add_align);
+=09=09=09=09=09  add_align);
=20
 =09=09if (bus->self && size1 &&
 =09=09    !pbus_upstream_space_available(bus, b_res, size1, add_align)) {
@@ -1421,7 +1416,7 @@ static void pbus_size_mem(struct pci_bus *bus, unsign=
ed long type,
 =09=09=09relaxed_align =3D max(relaxed_align, win_align);
 =09=09=09min_align =3D min(min_align, relaxed_align);
 =09=09=09size1 =3D calculate_memsize(size, min_size, add_size, children_ad=
d_size,
-=09=09=09=09=09=09  old_size, win_align);
+=09=09=09=09=09=09  win_align);
 =09=09=09pci_info(bus->self,
 =09=09=09=09 "bridge window %pR to %pR requires relaxed alignment rules\n"=
,
 =09=09=09=09 b_res, &bus->busn_res);

base-commit: 2f2c7254931f41b5736e3ba12aaa9ac1bbeeeb92
--=20
2.39.5

--8323328-262779146-1760981164=:976--

