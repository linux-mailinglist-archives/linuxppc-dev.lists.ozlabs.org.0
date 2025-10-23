Return-Path: <linuxppc-dev+bounces-13218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1615FC02C63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 19:43:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cstfk1Mdwz3bfF;
	Fri, 24 Oct 2025 04:43:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761241390;
	cv=none; b=hBU++wsehAalJO5dJpDHgdN56IybJKsx11drK4eORvICt9rDs2b/0aNL6hobSAfaCpTYSfn1nHXJT6URyjMD76N4iwvo8qKHccAYwuQJaBFve8TAWHmd4+ibh8I1sOz0z1PuB/CgXkniqsLgw/jkwgehrVO1PIw1E/GYYVcDCncA6kfT+XQc8lsPVsvRGQ2PEEPWpvyb9uTs/h/neU3hl4TDSjXklNK0X+nTK4uGoYsTBtBV0i9yVHubDCYudcYkyN9K6cPDSziVVi07N2hHqhdoi094+P4EpgFBLRK93szOSy6QZ/IRs/Zeuy9m2qKidnsctvN+/PQCrvD1uxqUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761241390; c=relaxed/relaxed;
	bh=KHzMAOwPgSlBKaIP9Aq4oBQ1XjBzvOHOxgqqLEV/1YU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FU+YBSP7cY6BMpg9q3wuJwE5kwr+FBP+pU+Tw0tyRfeEDLM2zr030O/KQcm0X4o/8lt0ix/P6zh8jCtDpBEpOuxNdgiTjw1vlqfKwdF5/YJxxId1KRnxOxANcin5WJj1NQ2k2DX+jfSnkX0kV8XLrSwHN56aUtlxfLwaNIt+o+/pA91T2G3AqBy39eoIh0O0egfvRhW2YXjUgkHBEY+cnJP6hkL/E6Xx9cXLwsijMK4hxdElhKdxRmuA+jW9FPq6g5dGuaqaSokBeblpm/xm8VLaRPCKWz1UEvyt6zFcWiTkCHJjqup2W/vn4IDhQrcvhYadSxB+rW6wCIDahDdLyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XxGR5HJu; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XxGR5HJu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cstfg2NhMz3bd0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 04:43:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761241388; x=1792777388;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=lBogzcavFia1tq1/hy2llZwqk3cknuFx94ohvomXMBA=;
  b=XxGR5HJuEJQY787e/+OohhBunZtXFkS6ariRKQxG6cmIKVuknZINqNxA
   esLbInTO166j0e+ViqKiRb/CfC0xlYnjSYgy/VFthyw+7kQBVjILyg+3F
   BjRei+As0hanJYIQyTVAnW/A1IcnFTO6iyjO1K8YF2RWaCJE4f+cu3GIw
   Ar8dJSDE5gxYIUZKh61H/HQTT7M7YlcuUAJMcbiSH277fAdcNW2dgAsQh
   QPXvSVV7GEExYxL92RFSBdWvNm0eFnIWO5UyeeVqDsiXXPPvbFX1JLlJp
   zbvvh3jzmBmcJ8L4LrGJfgVIFjg9B8R1nMJj5DrzRTGjQUKVxyR8JLMm/
   Q==;
X-CSE-ConnectionGUID: ebfIkq1GQ8Kv4XYKolyK6g==
X-CSE-MsgGUID: Af10GpBUQX6W3F2FSFCi2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80855383"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="80855383"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 10:43:01 -0700
X-CSE-ConnectionGUID: KyhLV5dhTR+V6DJO+HlNKA==
X-CSE-MsgGUID: nkm4X9Q6SCOpy1ru1Fvulg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="188280889"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 10:43:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 23 Oct 2025 20:42:56 +0300 (EEST)
To: Simon Richter <Simon.Richter@hogyros.de>, 
    Lucas De Marchi <lucas.demarchi@intel.com>
cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
Subject: Re: BAR resizing broken in 6.18 (PPC only?)
In-Reply-To: <af2ed697-4856-4477-8da8-2838ceaf3179@hogyros.de>
Message-ID: <4fbe3ae1-0752-33f3-35c2-d81e21031f8a@linux.intel.com>
References: <f9a8c975-f5d3-4dd2-988e-4371a1433a60@hogyros.de> <a5e7a118-ba70-000e-bab4-8d56b3404325@linux.intel.com> <67840a16-99b4-4d8c-9b5c-4721ab0970a2@hogyros.de> <922b1f68-a6a2-269b-880c-d594f9ca6bde@linux.intel.com>
 <af2ed697-4856-4477-8da8-2838ceaf3179@hogyros.de>
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
Content-Type: multipart/mixed; BOUNDARY="8323328-303087025-1761221295=:1016"
Content-ID: <256de186-4697-84cb-cf91-ad575ccac02f@linux.intel.com>
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-303087025-1761221295=:1016
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <395cf5de-bb93-a13b-3583-453330015155@linux.intel.com>

On Wed, 22 Oct 2025, Simon Richter wrote:
> On 10/22/25 1:20 AM, Ilpo J=E4rvinen wrote:
>=20
> > Could you please test if the patch below helps.
>=20
> Yes, this looks better.
>=20
>  - "good" is the 6.17 reference
>  - "shrink" is with this patch and the BAR0 release from Lucas
>  - "bar0" is with this patch, with the bridge BAR0 still mapped (i.e. wit=
hout
> the patch from Lucas)
>=20
> If you compare "good" vs "bar0", the differences are now fairly minimal. =
The
> non-prefetchable window has shrunk, but assignments are otherwise the sam=
e.

If a window has extra size prior to any resource fitting operation, the=20
kernel will recalculate the size based on what it knows about the=20
downstream resource sizes, no more so extra size is removed.

I thought that old_size was to prevent such shrinkage, but it is=20
problematic as we've seen here (and also in a some other cases).

It would be possible to move the max for old_size outside of align so=20
something like this instead of the patch you tested:

-       return ALIGN(max(size, old_size), align);
+       return max(ALIGN(size, align), old_size);

That would not try to make the bridge window larger due to alignment than=
=20
what the old_size was, so it should still fit to its old range keeping=20
its old size.

> I've added "lspci -v" output as well, which shows the bridge configuratio=
n.
> I'm still not sure that the address mappings between PCI and system bus a=
re
> 1:1.
>=20
> So the BAR0 release patch from Lucas seems to be no longer required with =
this,
> although it does align the prefetchable area better, so in theory it woul=
d
> allow a 512G BAR to be mapped. In practice, there are no Intel dGPUs with=
 512G
> VRAM.
>
> > There's indeed something messy and odd going on here with the resource =
and
> > window mappings, in the bad case there's also this line which doesn't m=
ake
> > much sense:
> > +pci 0030:01:00.0: bridge window [mem 0x6200000000000-0x6203fbff0ffff 6=
4bit
> > pref]: can't claim; address conflict with 0030:01:00.0 [mem
> > 0x6200020000000-0x62000207fffff 64bit pref]
>=20
> > ...but that conflicting resource was not assigned in between releasing
> > this bridge window and trying to claim it back so how did that
> > conflicting resource get there is totally mysterious to me. It doesn't
> > seem related directly to the the resize no longer working though.
>=20
> That is the upstream bridge's BAR0 mapping, which is not a bridge window,=
 so
> presumably the window allocation algorithm is unaware of it.

Resource tree is independent of PCI's resource allocation algorithm. Now=20
that I look the numbers and logs again, this doesn't look valid resource=20
tree state (from iomem.good!):

6200000000000-6203fbfffffff : pciex@620c3c0000000
  6200000000000-6203fbff0ffff : PCI Bus 0030:01
    6200020000000-62000207fffff : 0030:01:00.0
    6200000000000-6203fbff0ffff : PCI Bus 0030:02
      6200400000000-62007ffffffff : PCI Bus 0030:03
        6200400000000-62007ffffffff : 0030:03:00.0

6200020000000-62000207fffff and 6200000000000-6203fbff0ffff appear as=20
siblings and those addresses conflict. It seems this "good" kernel is=20
"cheating" by double counting addresses... ;-D

I've now found the cause in part thanks to another reporter with=20
similar impossible resource conflicts (an old bug in the resizing=20
algorithm which is there since BAR resizing was introduced).

It will take me a few days to fix all this as fixing the claim issue=20
will make other domino bricks to fall so I'll have to refactor this=20
pci_resize_resource() interface now, unfortunately.

> > > It's a bit weird that there is a log message that says "enabling devi=
ce",
> > > then
> > > the BARs are reconfigured. I'd want the decoding logic to be inactive
> > > while
> > > addresses are assigned.
>=20
> > So no real issue here and only logging is not the way you'd want it?
>=20
> It works for the GPU, but I'm unsure about my FPGA designs now, for the m=
ost
> part, I would have expected that the "enable memory decoding" bit had to =
be 0
> while BAR registers are being written, and I would have expected the driv=
er to
> resize the BAR first, then enable the device.

Lucas did move resizing earlier but I guess it still occurs after enabling=
=20
the device. I don't know enough about xe driver to say how early BARs=20
could be resized.

--=20
 i.
--8323328-303087025-1761221295=:1016--

