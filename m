Return-Path: <linuxppc-dev+bounces-4114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 380169F1179
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 16:55:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8v6v3CPzz30fW;
	Sat, 14 Dec 2024 02:55:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734105303;
	cv=none; b=Fz+MhYv02lEbxUIwsz26pyeHy2dqbHgdGfFRCDnXAGudf3kPXLyH7jnlMp024/9KY0hzwwxBDXhY7B/o4KMUW/X2m/efI8+OSuBigCx3w0u10P/Pm56vxXsKYXhFR7k0XfcY0WuaRM51QTNtEqCkFtEt68X+22mhYu4Dzr5qUs/HOvtiTNDbHbs8sidAlgIM5toKjfdtsmj7FdhAfKfJ1nUVMm0am7QaszEhN3+SGsEm28x3GpPmxh8x2AbhqZblM9EpVzeDCzbif4ap43EbdD5dnqHfcU4Qa6LLq6qsqSnsp6oOsQcUABlzM42hWRfG7B8d0O+iYnKr1IVuxJN3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734105303; c=relaxed/relaxed;
	bh=w8n1yEu0XNcdLff2a5UZ1ZHwQpbV8WvCKPy8Xj3BqvY=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VBZ27a2bid44BixmGGPo6G+qxKYDyi8yR+WijwCeKxZtCewiGKPpTt3juUxFLbDddLLAaRCAueGOlvK5FgHOalV4slHpq/nsynFRVEAv7HrRDmiSLtcKWnrcU02Wb+RrwbTxwyOK9O4ZKPhxJvj7lOcp8WBS9eegj+Gd9sQCyo0/S5EyJfUTjZFNbk3ipLj2C7iuw78ygpA09k5aOF11UsrXvZz0gVqy/GHK59Ndu+H6QyNJL8xaN42wsgQSdp19E9i38vcHWz4pwwEmdbVoSyga5RQLGqGS55NkULPDqtuHpaH3RghLnyXCz3M2le+0jTCzfgIarCaflGyvah2cfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8v6s2bkbz30Wd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 02:54:57 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Y8v1D51bTz6J6HQ;
	Fri, 13 Dec 2024 23:50:08 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D290A140134;
	Fri, 13 Dec 2024 23:54:52 +0800 (CST)
Received: from localhost (10.47.76.147) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 13 Dec
 2024 16:54:52 +0100
Date: Fri, 13 Dec 2024 15:54:50 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Mahesh
 J Salgaonkar" <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>, LKML <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 6/8] PCI: Add TLP Prefix reading into
 pcie_read_tlp_log()
Message-ID: <20241213155450.00005b70@huawei.com>
In-Reply-To: <827acda7-26d8-f4f5-2251-befb932ebb8b@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
	<20240913143632.5277-7-ilpo.jarvinen@linux.intel.com>
	<20241211164904.00007a02@huawei.com>
	<e4f907ad-ab87-ac42-7428-93e16f070f74@linux.intel.com>
	<827acda7-26d8-f4f5-2251-befb932ebb8b@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.76.147]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 12 Dec 2024 20:48:38 +0200 (EET)
Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> On Thu, 12 Dec 2024, Ilpo J=E4rvinen wrote:
>=20
> > On Wed, 11 Dec 2024, Jonathan Cameron wrote:
> >  =20
> > > On Fri, 13 Sep 2024 17:36:30 +0300
> > > Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:
> > >  =20
> > > > pcie_read_tlp_log() handles only 4 Header Log DWORDs but TLP Prefix=
 Log
> > > > (PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.
> > > >=20
> > > > Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle al=
so
> > > > TLP Prefix Log. The relevant registers are formatted identically in=
 AER
> > > > and DPC Capability, but has these variations:
> > > >=20
> > > > a) The offsets of TLP Prefix Log registers vary.
> > > > b) DPC RP PIO TLP Prefix Log register can be < 4 DWORDs.
> > > >=20
> > > > Therefore callers must pass the offset of the TLP Prefix Log regist=
er
> > > > and the entire length to pcie_read_tlp_log() to be able to read the
> > > > correct number of TLP Prefix DWORDs from the correct offset.
> > > >=20
> > > > Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> =20
> > >=20
> > > Trivial comments below
> > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > >=20
> > > Would have been nice if they'd just made the formats have the
> > > same sized holes etc! =20
> >=20
> > That's not even the worst problem.
> >=20
> > They managed to copy-paste most of the stuff into DPC (copy-paste is=20
> > really obvious because the text still refers to AER in a DPC section :-=
))=20
> > but forgot to add a few capability fields into the DPC capability, most=
=20
> > importantly, the bit that indicates whether TLP was logged in Flit mode
> > or not And now we get to keep the pieces how to interpret the Log=20
> > Registers (relates to the follow up series). :-(
> >  =20
> > > > diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
> > > > index 65ac7b5d8a87..def9dd7b73e8 100644
> > > > --- a/drivers/pci/pcie/tlp.c
> > > > +++ b/drivers/pci/pcie/tlp.c
> > > > @@ -11,26 +11,65 @@ =20
> > >  =20
> > > >  /**
> > > >   * pcie_read_tlp_log - read TLP Header Log =20
> > > Maybe update this to read TLP Header and Prefix Logs =20
> > > >   * @dev: PCIe device
> > > >   * @where: PCI Config offset of TLP Header Log
> > > > + * @where2: PCI Config offset of TLP Prefix Log =20
> > >=20
> > > Is it worth giving it a more specific name than where2?
> > > Possibly renaming where as well! =20
> >=20
> > Sure, why not. =20
>=20
> Hi again,
>=20
> After doing this rename, I rebased the Flit mode series on top of it and
> realized there's one small problem with naming where2. It will be=20
> overloaded between TLP Prefix Log (Non-Flit mode) and extended TLP Header=
=20
> Log (DW5+) (Flit mode) so I'm not sure if there's really going to be a=20
> good name for it.
>=20
Ah. I should read that series ;)

Absolutely fine - sometime generic naming is the best we can do!

Jonathan



