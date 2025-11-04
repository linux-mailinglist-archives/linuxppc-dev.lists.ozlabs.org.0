Return-Path: <linuxppc-dev+bounces-13750-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CECB1C3225A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 17:53:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1F013GQfz3bfN;
	Wed,  5 Nov 2025 03:53:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762275217;
	cv=none; b=VLf767cgDo9744iBn/qCeQN2PFPw60SVm5hDWAqGrFtYnL942QMkBVSg4cW999yeB7oHzwc00gkMLdZl0a+sXT62TJ/VfsQisfT5ZVTbCdVvFBFyyaMP8PVwQJnSMzVelKLVFOp6Zawh8GXgPGhngEpc/fSPEjgkT+zOjX6+WaFT5N1FbGHFFKQk8COg4SWV3cRV28nyXX60ODdvWyaWOiDXBQmHaqLF7ML7vGZjqunTVkxsMy3skqdyh2lxZqIVMzHc4DyFAbcw5OvribLYx8MnxZDO5Gh+YAedVo11joj6XBFNPeYMhFiAiS8t15nf1LBS0L/uIWYL8OfQas3xJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762275217; c=relaxed/relaxed;
	bh=K27NOgtb5k1iecQxNTWvLkZwmXT8q9mNmJD7bsk212A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohDes+yXUF5UnaE6FTZxrk4zm2qMp3/SNnFbt+voGEmJaqPhcLJplO3irl0BRzZbpeqsdrNS9eJR05uOpsshfMsFkynvJOwdzeB+mo4hnKxYs6irdww9UD4KL3pytQyO5rB6IdTOeQ0QcyWJb9W4HJYbGseK8Nq3DSHmRwwJIo3Gxv7fxMeMUQ/1Dn7CPHJBxc/8MwEFl0NafmYIiQLUZmen/tmQorJaIRMf6EVvt5MESLjJCbhi245v2JzvGu1XyDICvIVvxH1zwEdQaPmZ1aVU40C8VGrayOKMrAGRXJowZnKBYWnUpGCqA21cFIhEhlr30Po3d20Ds6h2T3WbVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aIgyqREG; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aIgyqREG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1Dzy2Mpsz3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 03:53:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762275215; x=1793811215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0Vi8CmVpksI68INMwO9Cwr5Wqs6m/qtWAkyblVIpvsA=;
  b=aIgyqREG+yn5jInPozYh9vLBKe52xZaWgoSPklsX0zpAW85PQdhDnLjS
   J/SjvlaxZbCAu9/HO49HZSeNbq3MLk5LDavuXfNJ4afJ2dxVoY+spnmwO
   9qFAOs7hT0J0Wm5lXjmFFzhTSQ97ineRWGD68wsqPLyKdneHd83cZo5UK
   9ujqV39hHb3eHa0Vc9vG4Jf+R/Ng3ZgQehT0AujZvwY1LrF3ZpjpaIyeQ
   Zu0AZXRKo9MR3U3zeZF9W7E91xG9jDEQrA/lw7V428/4cPnjsXtV16e1C
   yw8r5FwXf1ZvhYosnG31NRoN73oyFWHijbJWaeYotlIX5jQdlu9RGmkP0
   A==;
X-CSE-ConnectionGUID: 8H987ak5RZ6A9MVnohp1aQ==
X-CSE-MsgGUID: YmrT2+VKQImTY9yNOX+0UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64407548"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="64407548"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 08:53:30 -0800
X-CSE-ConnectionGUID: MacTnz2bToWrXxp7w5uRHw==
X-CSE-MsgGUID: SWyiQwSoSH2xTfhg7s/xyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="187057481"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.localnet) ([10.245.246.211])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 08:53:20 -0800
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-cxl@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shuai Xue <xueshuai@linux.alibaba.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Xiaofei Tan <tanxiaofei@huawei.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Guo Weikang <guoweikang.kernel@gmail.com>,
 Xin Li <xin@zytor.com>, Will Deacon <will@kernel.org>,
 Huang Yiwei <quic_hyiwei@quicinc.com>, Gavin Shan <gshan@redhat.com>,
 Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Li Ming <ming.li@zohomail.com>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 Jon Pan-Doh <pandoh@google.com>, Lukas Wunner <lukas@wunner.de>,
 Shiju Jose <shiju.jose@huawei.com>, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org
Subject:
 Re: [PATCH 6/6 v6] ACPI: extlog: Trace CPER CXL Protocol Error Section
Date: Tue, 04 Nov 2025 17:53:18 +0100
Message-ID: <4532273.UPlyArG6xL@fdefranc-mobl3>
In-Reply-To: <20251028150609.000023bf@huawei.com>
References:
 <20251023122612.1326748-1-fabio.m.de.francesco@linux.intel.com>
 <20251023122612.1326748-7-fabio.m.de.francesco@linux.intel.com>
 <20251028150609.000023bf@huawei.com>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tuesday, October 28, 2025 4:06:09=E2=80=AFPM Central European Standard T=
ime Jonathan Cameron wrote:
> On Thu, 23 Oct 2025 14:25:41 +0200
> "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com> wrote:
>=20
> > When Firmware First is enabled, BIOS handles errors first and then it m=
akes
> > them available to the kernel via the Common Platform Error Record (CPER)
> > sections (UEFI 2.10 Appendix N). Linux parses the CPER sections via one=
 of
> > two similar paths, either ELOG or GHES. The errors managed by ELOG are
> > signaled to the BIOS by the I/O Machine Check Architecture (I/O MCA).
> >=20
> > Currently, ELOG and GHES show some inconsistencies in how they report to
> > userspace via trace events.
> >=20
> > Therefore, make the two mentioned paths act similarly by tracing the CP=
ER
> > CXL Protocol Error Section (UEFI v2.10, Appendix N.2.13).
> >=20
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@lin=
ux.intel.com>
> > Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.=
com>
>=20
> Just one small question.   With that addressed,=20
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>=20
> > diff --git a/drivers/cxl/core/ras.c b/drivers/cxl/core/ras.c
> > index 2731ba3a0799..3f527b0c6509 100644
> > --- a/drivers/cxl/core/ras.c
> > +++ b/drivers/cxl/core/ras.c
> > @@ -105,6 +105,12 @@ static void cxl_cper_handle_prot_err(struct cxl_cp=
er_prot_err_work_data *data)
> >  		cxl_cper_trace_uncorr_prot_err(cxlmd, data->ras_cap);
> >  }
> > =20
> > +void cxl_cper_ras_handle_prot_err(struct cxl_cper_prot_err_work_data *=
wd)
>=20
> Why do we need this wrapper?  The name is a bit more general, so if you
> do need it, then why not instead just rename cxl_cper_handle_prot_err()
>=20
Actually, on a second thought I believe that we don't need either this
wrapper or renaming cxl_cper_handle_prot_err(). I'll export the latter
as it is.

=46abio
> > +{
> > +	cxl_cper_handle_prot_err(wd);
> > +}
> > +EXPORT_SYMBOL_GPL(cxl_cper_ras_handle_prot_err);
> > +
> >  static void cxl_cper_prot_err_work_fn(struct work_struct *work)
> >  {
> >  	struct cxl_cper_prot_err_work_data wd;
> > diff --git a/include/cxl/event.h b/include/cxl/event.h
> > index 94081aec597a..a37eef112411 100644
> > --- a/include/cxl/event.h
> > +++ b/include/cxl/event.h
> > @@ -340,4 +340,6 @@ cxl_cper_setup_prot_err_work_data(struct cxl_cper_p=
rot_err_work_data *wd,
> >  }
> >  #endif
> > =20
> > +void cxl_cper_ras_handle_prot_err(struct cxl_cper_prot_err_work_data *=
wd);
> > +
> >  #endif /* _LINUX_CXL_EVENT_H */
>=20
>=20





