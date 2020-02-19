Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EF4163BCF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 05:05:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Mkdg4rHYzDqjl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 15:05:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=alastair@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Mkbg4C3rzDqfK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 15:03:27 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01J3xVSV060558
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 23:03:25 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y8ue4392g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 23:03:24 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Wed, 19 Feb 2020 04:03:22 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Feb 2020 04:03:14 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01J42Hom50069946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Feb 2020 04:02:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 603AC11C04A;
 Wed, 19 Feb 2020 04:03:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B895011C054;
 Wed, 19 Feb 2020 04:03:12 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Feb 2020 04:03:12 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2BF59A00DF;
 Wed, 19 Feb 2020 15:03:08 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Date: Wed, 19 Feb 2020 15:03:11 +1100
In-Reply-To: <20200203125346.0000503f@Huawei.com>
References: <20191203034655.51561-1-alastair@au1.ibm.com>
 <20191203034655.51561-9-alastair@au1.ibm.com>
 <20200203125346.0000503f@Huawei.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20021904-0012-0000-0000-000003882478
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021904-0013-0000-0000-000021C4B6B6
Message-Id: <97c92496adec4c4b03ad634af030a0c1470ee099.camel@au1.ibm.com>
Subject: RE: [PATCH v2 08/27] ocxl: Save the device serial number in ocxl_fn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_08:2020-02-18,
 2020-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=573
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002190028
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-02-03 at 12:53 +0000, Jonathan Cameron wrote:
> On Tue, 3 Dec 2019 14:46:36 +1100
> Alastair D'Silva <alastair@au1.ibm.com> wrote:
> 
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > This patch retrieves the serial number of the card and makes it
> > available
> > to consumers of the ocxl driver via the ocxl_fn struct.
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
> > Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
> > ---
> >  drivers/misc/ocxl/config.c | 46
> > ++++++++++++++++++++++++++++++++++++++
> >  include/misc/ocxl.h        |  1 +
> >  2 files changed, 47 insertions(+)
> > 
> > diff --git a/drivers/misc/ocxl/config.c
> > b/drivers/misc/ocxl/config.c
> > index fb0c3b6f8312..a9203c309365 100644
> > --- a/drivers/misc/ocxl/config.c
> > +++ b/drivers/misc/ocxl/config.c
> > @@ -71,6 +71,51 @@ static int find_dvsec_afu_ctrl(struct pci_dev
> > *dev, u8 afu_idx)
> >  	return 0;
> >  }
> >  
> > +/**
> 
> Make sure anything you mark as kernel doc with /** is valid
> kernel-doc.
> 

Ok

> > + * Find a related PCI device (function 0)
> > + * @device: PCI device to match
> > + *
> > + * Returns a pointer to the related device, or null if not found
> > + */
> > +static struct pci_dev *get_function_0(struct pci_dev *dev)
> > +{
> > +	unsigned int devfn = PCI_DEVFN(PCI_SLOT(dev->devfn), 0); //
> > Look for function 0
> 
> Not sure the trailing comment adds much.
> 
> I'd personally not bother with this wrapper at all and just call
> the pci functions directly where needed.
> 

I'm not that familiar with the macros, so its not immediately obvious
to me what it's doing, so my preference is to leave it.
> > +
> > +	return pci_get_domain_bus_and_slot(pci_domain_nr(dev->bus),
> > +					dev->bus->number, devfn);
> > +}
> > +
> > +static void read_serial(struct pci_dev *dev, struct ocxl_fn_config
> > *fn)
> > +{
> > +	u32 low, high;
> > +	int pos;
> > +
> > +	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DSN);
> > +	if (pos) {
> > +		pci_read_config_dword(dev, pos + 0x04, &low);
> > +		pci_read_config_dword(dev, pos + 0x08, &high);
> > +
> > +		fn->serial = low | ((u64)high) << 32;
> > +
> > +		return;
> > +	}
> > +
> > +	if (PCI_FUNC(dev->devfn) != 0) {
> > +		struct pci_dev *related = get_function_0(dev);
> > +
> > +		if (!related) {
> > +			fn->serial = 0;
> > +			return;
> > +		}
> > +
> > +		read_serial(related, fn);
> > +		pci_dev_put(related);
> > +		return;
> > +	}
> > +
> > +	fn->serial = 0;
> > +}
> > +
> >  static void read_pasid(struct pci_dev *dev, struct ocxl_fn_config
> > *fn)
> >  {
> >  	u16 val;
> > @@ -208,6 +253,7 @@ int ocxl_config_read_function(struct pci_dev
> > *dev, struct ocxl_fn_config *fn)
> >  	int rc;
> >  
> >  	read_pasid(dev, fn);
> > +	read_serial(dev, fn);
> >  
> >  	rc = read_dvsec_tl(dev, fn);
> >  	if (rc) {
> > diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> > index 6f7c02f0d5e3..9843051c3c5b 100644
> > --- a/include/misc/ocxl.h
> > +++ b/include/misc/ocxl.h
> > @@ -46,6 +46,7 @@ struct ocxl_fn_config {
> >  	int dvsec_afu_info_pos; /* offset of the AFU information DVSEC
> > */
> >  	s8 max_pasid_log;
> >  	s8 max_afu_index;
> > +	u64 serial;
> >  };
> >  
> >  enum ocxl_endian {
-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

