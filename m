Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDA016F421
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 01:16:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RxCx5SlnzDqWq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 11:15:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=alastair@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Rx9x3ffPzDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 11:14:12 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01Q0CGOu125229
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 19:14:10 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydcq61wf7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 19:14:10 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Wed, 26 Feb 2020 00:14:07 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Feb 2020 00:14:00 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01Q0DxbS60096534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 00:13:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5FD611C052;
 Wed, 26 Feb 2020 00:13:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FC3111C04C;
 Wed, 26 Feb 2020 00:13:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 00:13:59 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 588FAA00F1;
 Wed, 26 Feb 2020 11:13:54 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 26 Feb 2020 11:13:57 +1100
In-Reply-To: <CAOSf1CHYEJf02EV0kYMk+D9s=4PiTXSM1eFcRGYe7XJrHvtAtA@mail.gmail.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <CAPcyv4j2hut1YDrotC=QkcM+S0SZwpd9_4hD2aChn+cKD+62oA@mail.gmail.com>
 <240fbefc6275ac0a6f2aa68715b3b73b0e7a8310.camel@au1.ibm.com>
 <20200224043750.GM24185@bombadil.infradead.org>
 <83034494d5c3da1fa63b172e844f85d0fec7910a.camel@au1.ibm.com>
 <CAOSf1CHYEJf02EV0kYMk+D9s=4PiTXSM1eFcRGYe7XJrHvtAtA@mail.gmail.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20022600-0012-0000-0000-0000038A4428
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022600-0013-0000-0000-000021C6E82A
Message-Id: <b981f4e6cc308a617e7944e3ce23009e804cfdbf.camel@au1.ibm.com>
Subject: RE: [PATCH v3 00/27] Add support for OpenCAPI Persistent Memory
 devices
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-25_09:2020-02-25,
 2020-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=939 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002250170
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
 Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Matthew Wilcox <willy@infradead.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-02-24 at 17:51 +1100, Oliver O'Halloran wrote:
> On Mon, Feb 24, 2020 at 3:43 PM Alastair D'Silva <
> alastair@au1.ibm.com> wrote:
> > On Sun, 2020-02-23 at 20:37 -0800, Matthew Wilcox wrote:
> > > On Mon, Feb 24, 2020 at 03:34:07PM +1100, Alastair D'Silva wrote:
> > > > V3:
> > > >   - Rebase against next/next-20200220
> > > >   - Move driver to arch/powerpc/platforms/powernv, we now
> > > > expect
> > > > this
> > > >     driver to go upstream via the powerpc tree
> > > 
> > > That's rather the opposite direction of normal; mostly drivers
> > > live
> > > under
> > > drivers/ and not in arch/.  It's easier for drivers to get
> > > overlooked
> > > when doing tree-wide changes if they're hiding.
> > 
> > This is true, however, given that it was not all that desirable to
> > have
> > it under drivers/nvdimm, it's sister driver (for the same hardware)
> > is
> > also under arch, and that we don't expect this driver to be used on
> > any
> > platform other than powernv, we think this was the most reasonable
> > place to put it.
> 
> Historically powernv specific platform drivers go in their respective
> subsystem trees rather than in arch/ and I'd prefer we kept it that
> way. When I added the papr_scm driver I put it in the pseries
> platform
> directory because most of the pseries paravirt code lives there for
> some reason; I don't know why. Luckily for me that followed the same
> model that Dan used when he put the NFIT driver in drivers/acpi/ and
> the libnvdimm core in drivers/nvdimm/ so we didn't have anything to
> argue about. However, as Matthew pointed out, it is at odds with how
> most subsystems operate. Is there any particular reason we're doing
> things this way or should we think about moving libnvdimm users to
> drivers/nvdimm/?
> 
> Oliver


I'm not too fussed where it ends up, as long as it ends up somewhere :)

From what I can tell, the issue is that we have both "infrastructure"
drivers, and end-device drivers. To me, it feels like drivers/nvdimm
should contain both, and I think this feels like the right approach.

I could move it back to drivers/nvdimm/ocxl, but I felt that it was
only tolerated there, not desired. This could be cleared up with a
response from Dan Williams, and if it is indeed dersired, this is my
preferred location.

I think a case could also be made for drivers/ocxl, simply because we
don't expect more than a handful of drivers to ever live there (I
expect most users will drive their devices from userspace via libocxl).

In defence of keeping it in arch/powerpc/powernv, I highly doubt this
driver will end up being used on any platform other than this. Even
though OpenCAPI was engineered as an open standard, there is some
competition from industry giants with a competing standard on a much
more popular platform.

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

