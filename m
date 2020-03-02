Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73D17536F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 06:50:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W8PD0Y2xzDqLl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:50:08 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W88L4KJDzDqlQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 16:38:58 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0225ZJxt128881
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 00:38:56 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yfjf3d2c2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 00:38:55 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Mon, 2 Mar 2020 05:38:53 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 05:38:47 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0225ckRE46792760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 05:38:46 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA8A84C04A;
 Mon,  2 Mar 2020 05:38:46 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64DC94C04E;
 Mon,  2 Mar 2020 05:38:46 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  2 Mar 2020 05:38:46 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 921D2A00BE;
 Mon,  2 Mar 2020 16:38:41 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Donnellan
 <ajd@linux.ibm.com>
Date: Mon, 02 Mar 2020 16:38:45 +1100
In-Reply-To: <4075f48568fee61123579d4edea0e7939b4b2e6c.camel@au1.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-26-alastair@au1.ibm.com>
 <96687fbf-38ab-13ff-ca19-ccb67bbc4405@linux.ibm.com>
 <20200228071520.GA2897773@kroah.com>
 <4075f48568fee61123579d4edea0e7939b4b2e6c.camel@au1.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20030205-0008-0000-0000-00000358374F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030205-0009-0000-0000-00004A79617D
Message-Id: <2a97d381365f14d9ad9d3c1487e25b0b66373713.camel@au1.ibm.com>
Subject: RE: [PATCH v3 25/27] powerpc/powernv/pmem: Expose the serial number in
 sysfs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_01:2020-02-28,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 mlxlogscore=801 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020041
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
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-03-02 at 10:42 +1100, Alastair D'Silva wrote:
> On Fri, 2020-02-28 at 08:15 +0100, Greg Kroah-Hartman wrote:
> > On Fri, Feb 28, 2020 at 05:25:31PM +1100, Andrew Donnellan wrote:
> > > On 21/2/20 2:27 pm, Alastair D'Silva wrote:
> > > > +int ocxlpmem_sysfs_add(struct ocxlpmem *ocxlpmem)
> > > > +{
> > > > +	int i, rc;
> > > > +
> > > > +	for (i = 0; i < ARRAY_SIZE(attrs); i++) {
> > > > +		rc = device_create_file(&ocxlpmem->dev,
> > > > &attrs[i]);
> > > > +		if (rc) {
> > > > +			for (; --i >= 0;)
> > > > +				device_remove_file(&ocxlpmem-
> > > > >dev,
> > > > &attrs[i]);
> > > 
> > > I'd rather avoid weird for loop constructs if possible.
> > > 
> > > Is it actually dangerous to call device_remove_file() on an attr
> > > that hasn't
> > > been added? If not then I'd rather define an err: label and loop
> > > over the
> > > whole array there.
> > 
> > None of this should be used at all, just use attribute groups
> > properly
> > and the driver core will handle this all for you.
> > 
> > device_create/remove_file should never be called by anyone anymore
> > if
> > at all
> > possible.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Thanks, I'll rework it to use the .groups member of struct
> pci_driver.
> 

I ended up making these available as DIMM attributes instead.

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

