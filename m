Return-Path: <linuxppc-dev+bounces-13752-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FFEC32679
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 18:41:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1G3B6qLDz3bf8;
	Wed,  5 Nov 2025 04:41:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762278086;
	cv=none; b=IRKgZn0ck1uHo2m4hNNuH0xXLSdjXGqcz0Yh8PFx82YQmmF+qJ63eH68ee6rbW+/ItYplPkJmA/s+zyUvvasXxKjoM8QO4sbt/pt2PFmPDaZQgp8+F+phjPik57q122cDIPbZranDENzU904PeV2tJDOoCwmQlfVWSp5N9q/vwuADRAiRPM9pcHTRfzh/xcTXZt7HrWI+XUeERp7qAouKRZISQdooDYAVgY8z2J/QrgD5izmBBJI20cRPLu8nxmLiSymOcppxTdXd4Ysz2s32CRbedgB1BYKnE7DvyyCqcW9L14Aj6OLJW+vKHykTmRNwtQAY5T1+MN7OHwwnq98JA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762278086; c=relaxed/relaxed;
	bh=CexO/OVQDyeFXgh1oOwUbz1dx+z2EyieE0VkCVn42l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lDy+Qs2+/Yr0o5o9YsJw/hWTAAndhuPmALnSuSENmoUKLrYO6Vnl3vAoAmRUXkB/GMzgh1X1W2X7eYcxoRM6dXuDJZyvC7PZrVXSmXaLY3qTIfH+y+Z+ifkyjKADz6aMyTffBGuJgT+CjMjXM2IQ7nVlVOjMjFpSHN9/LjRQxCzBmFOvEc89w5nYOue++zThCAsWdsCoUaExVJ41sJIy5zvCps710ftYXCkJyMNPY1e6CU6PS6Wt+eXT5sv8JEaIMlZxHqzWuHzcIRttkIbaJ9kMXULnl6Hh+sxd2cDjIIZ1s4x0MEJvxsUO3qT+h/skQpVwzF4sZZMF+Xz70keVWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nSyHKeKx; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nSyHKeKx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1G374rFSz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 04:41:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762278084; x=1793814084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=umIjh2hxElKZEt0hMfWdEeuXiD8zOf8YcvUahdfvxcI=;
  b=nSyHKeKx0Kt51Qi7hXm6O8zmexZVcPBSnx9TPcXWYY44/rVFUD6qYXi3
   kzP4HGVzudyCvit27RCXNw6b+q/xAEAirw3+aBjFM0ZoZjyvThbTZyTWZ
   cj6DQHDmjG1Ry6QkH7Da7PRKA9ofJL3oMk5T8WQN+7HcYwQixOad+Iwcx
   NZ6Z/jkzox6I450UzT0lnfqo31ovgdUTweKymbBlACpzVoKDlrsX0dc5h
   EdkThhMWFnwo5+XXrrM7bAWHNAep+NT/cSSJtC5eifmX73zoEwA7wyHX0
   rhdq3TQnmlT8VhDYeTgzvpLO4X0DEbv6dPt5YNZUvyxIo/MEi5T6jujI5
   Q==;
X-CSE-ConnectionGUID: RFb9GFJjSUObU+qWataSdA==
X-CSE-MsgGUID: XA9NHX5jQySfipfh1H7NaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75492251"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="75492251"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 09:41:19 -0800
X-CSE-ConnectionGUID: fxvhx8QBR6a2sC+c/6MBTA==
X-CSE-MsgGUID: UD5GfdqfRcGrhfQvZcmZFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="192384949"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.localnet) ([10.245.246.211])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 09:41:07 -0800
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
 Re: [PATCH 4/6 v6] acpi/ghes: Add helper for CXL protocol errors checks
Date: Tue, 04 Nov 2025 18:41:04 +0100
Message-ID: <2925654.DJkKcVGEfx@fdefranc-mobl3>
In-Reply-To: <20251028145415.000034bd@huawei.com>
References:
 <20251023122612.1326748-1-fabio.m.de.francesco@linux.intel.com>
 <20251023122612.1326748-5-fabio.m.de.francesco@linux.intel.com>
 <20251028145415.000034bd@huawei.com>
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

On Tuesday, October 28, 2025 3:54:15=E2=80=AFPM Central European Standard T=
ime Jonathan Cameron wrote:
> On Thu, 23 Oct 2025 14:25:39 +0200
> "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com> wrote:
>=20
> > Move the CPER CXL protocol errors validity out of
>=20
> validity check
>=20
> > cxl_cper_post_prot_err() to cxl_cper_sec_prot_err_valid() and limit the
>=20
> to new cxl_cper_sec_prot_err_valid()=20
>=20
> as otherwise it sounds like it already exists.
>=20
> > serial number check only to CXL agents that are CXL devices (UEFI v2.10,
> > Appendix N.2.13).
>=20
> Perhaps a little more here on why.  I assume because you are going to have
> a second user for it, but good to say that. Also serves to justify the
> export.
>=20
Hi Jonathan,

All the corrections you made will be applied to the next version.
> >=20
> > Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.=
com>
> > ---
> >  drivers/acpi/apei/ghes.c | 32 ++++++++++++++++++++++----------
> >  include/cxl/event.h      | 10 ++++++++++
> >  2 files changed, 32 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> > index d6fe5f020e96..e69ae864f43d 100644
> > --- a/drivers/acpi/apei/ghes.c
> > +++ b/drivers/acpi/apei/ghes.c
> > @@ -706,30 +706,42 @@ static DEFINE_KFIFO(cxl_cper_prot_err_fifo, struc=
t cxl_cper_prot_err_work_data,
> >  static DEFINE_SPINLOCK(cxl_cper_prot_err_work_lock);
> >  struct work_struct *cxl_cper_prot_err_work;
> > =20
> > -static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_=
err,
> > -				   int severity)
> > +int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
>=20
> Useful to return an error number?  Or would a bool be better given it is =
either
> valid or not?
>=20
I prefer to return more information when reasonable and leave the callers f=
ree
to use or ignore the specific error number.

=46abio
>
> Otherwise looks good to me,
>=20
> Jonathan
>=20
> >  {
> > -	struct cxl_cper_prot_err_work_data wd;
> > -	u8 *dvsec_start, *cap_start;
> > -
> >  	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
> >  		pr_err_ratelimited("CXL CPER invalid agent type\n");
> > -		return;
> > +		return -EINVAL;
> >  	}
> > =20
> >  	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
> >  		pr_err_ratelimited("CXL CPER invalid protocol error log\n");
> > -		return;
> > +		return -EINVAL;
> >  	}
> > =20
> >  	if (prot_err->err_len !=3D sizeof(struct cxl_ras_capability_regs)) {
> >  		pr_err_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
> >  				   prot_err->err_len);
> > -		return;
> > +		return -EINVAL;
> >  	}
> > =20
> > -	if (!(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
> > -		pr_warn(FW_WARN "CXL CPER no device serial number\n");
> > +	if ((prot_err->agent_type =3D=3D RCD || prot_err->agent_type =3D=3D D=
EVICE ||
> > +	     prot_err->agent_type =3D=3D LD || prot_err->agent_type =3D=3D FM=
LD) &&
> > +	    !(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
> > +		pr_warn_ratelimited(FW_WARN
> > +				    "CXL CPER no device serial number\n");
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_valid);
> > +
> > +static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_=
err,
> > +				   int severity)
> > +{
> > +	struct cxl_cper_prot_err_work_data wd;
> > +	u8 *dvsec_start, *cap_start;
> > +
> > +	if (cxl_cper_sec_prot_err_valid(prot_err))
> > +		return;
> > =20
> >  	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
> > =20
>=20
>=20
>=20





