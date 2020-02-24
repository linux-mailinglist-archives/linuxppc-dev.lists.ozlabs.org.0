Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FD6169DD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 06:38:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QrTH3cjYzDqTP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 16:38:43 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48QrRP0x4VzDqFv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 16:37:04 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01O5YExA182148
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 00:37:02 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yb1c5tb98-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 00:37:02 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Mon, 24 Feb 2020 05:36:59 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 24 Feb 2020 05:36:52 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01O5ZtQ041026038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 05:35:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1EAE4C040;
 Mon, 24 Feb 2020 05:36:51 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3831A4C04E;
 Mon, 24 Feb 2020 05:36:51 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 Feb 2020 05:36:51 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8D3FDA00E5;
 Mon, 24 Feb 2020 16:36:46 +1100 (AEDT)
Subject: Re: [PATCH v3 06/27] ocxl: Tally up the LPC memory on a link &
 allow it to be mapped
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Date: Mon, 24 Feb 2020 16:36:49 +1100
In-Reply-To: <8a6eaedd-d806-9111-84ac-c4961227d69c@linux.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-7-alastair@au1.ibm.com>
 <8a6eaedd-d806-9111-84ac-c4961227d69c@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20022405-0016-0000-0000-000002E9A6ED
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022405-0017-0000-0000-0000334CCC78
Message-Id: <a682c49c96e49e20e78bb97d59b596e65d02b454.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-24_01:2020-02-21,
 2020-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 mlxlogscore=948 bulkscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240047
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
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-02-24 at 16:25 +1100, Andrew Donnellan wrote:
> On 21/2/20 2:26 pm, Alastair D'Silva wrote:
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > Tally up the LPC memory on an OpenCAPI link & allow it to be mapped
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> 
> This commit message is a bit short and could do with some further 
> explanation.
> 
> In particular - it's worth explaining why the tracking of available
> LPC 
> memory needs to be done at a link level, because a single OpenCAPI
> card 
> can have multiple PCI functions, each with multiple AFUs which define
> an 
> amount of LPC memory they have, even if the common case is expected
> to 
> be a single function with a single AFU and thus one LPC area per
> link.

Ok

> 
> Snowpatch has a few checkpatch issues to report:
> 
> https://openpower.xyz/job/snowpatch/job/snowpatch-linux-checkpatch/11800//artifact/linux/checkpatch.log
> 

Gah, I could have sworn I ran checkpatch against this :/

> The code generally looks okay to me.
> 
> > diff --git a/drivers/misc/ocxl/ocxl_internal.h
> > b/drivers/misc/ocxl/ocxl_internal.h
> > index 198e4e4bc51d..d0c8c4838f42 100644
> > --- a/drivers/misc/ocxl/ocxl_internal.h
> > +++ b/drivers/misc/ocxl/ocxl_internal.h
> > @@ -142,4 +142,37 @@ int ocxl_irq_offset_to_id(struct ocxl_context
> > *ctx, u64 offset);
> >   u64 ocxl_irq_id_to_offset(struct ocxl_context *ctx, int irq_id);
> >   void ocxl_afu_irq_free_all(struct ocxl_context *ctx);
> >   
> > +/**
> > + * ocxl_link_add_lpc_mem() - Increment the amount of memory
> > required by an OpenCAPI link
> > + *
> > + * @link_handle: The OpenCAPI link handle
> > + * @offset: The offset of the memory to add
> > + * @size: The amount of memory to increment by
> > + *
> > + * Returns 0 on success, negative on overflow
> > + */
> 
> I think "amount of memory required" isn't the best way to express
> this.
> 
> Might as well explicitly say -EINVAL on overflow.
> 

Ok

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

