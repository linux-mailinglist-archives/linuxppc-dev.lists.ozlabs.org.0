Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7E5171014
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 06:18:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SgtF0K5RzDqbs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 16:18:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=alastair@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SgrH0RXNzDqLW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 16:16:30 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01R5DkAP080790
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 00:16:28 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydcp5h4mv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 00:16:27 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 27 Feb 2020 05:16:25 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Feb 2020 05:16:17 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01R5GHo053215344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 05:16:17 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE2ACA4062;
 Thu, 27 Feb 2020 05:16:16 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43AC8A405F;
 Thu, 27 Feb 2020 05:16:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 05:16:16 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 84109A01C0;
 Thu, 27 Feb 2020 16:16:11 +1100 (AEDT)
Subject: Re: [PATCH v3 12/27] powerpc/powernv/pmem: Add register addresses &
 status values to the header
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Date: Thu, 27 Feb 2020 16:16:14 +1100
In-Reply-To: <e335ed2d-7381-e95c-a6b5-0efe60746cf4@linux.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-13-alastair@au1.ibm.com>
 <e335ed2d-7381-e95c-a6b5-0efe60746cf4@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20022705-4275-0000-0000-000003A5DB49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022705-4276-0000-0000-000038BA0FCC
Message-Id: <4ebbea9273ab5c44ad653690ae4c49e4d431ae05.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_09:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002270039
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

On Thu, 2020-02-27 at 16:08 +1100, Andrew Donnellan wrote:
> On 21/2/20 2:27 pm, Alastair D'Silva wrote:
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > These values have been taken from the device specifications.
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> 
> I've compared these values against the internal version of the
> device 
> specifications that I have access to, and they appear to match.
> 
> A few minor comments below, otherwise:
> 
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
> 
> > +#define GLOBAL_MMIO_HCI_ACRW				BIT_ULL
> > (0)
> > +#define GLOBAL_MMIO_HCI_NSCRW				BIT_ULL
> > (1)
> > +#define GLOBAL_MMIO_HCI_AFU_RESET			BIT_ULL(2)
> > +#define GLOBAL_MMIO_HCI_FW_DEBUG			BIT_ULL(3)
> > +#define GLOBAL_MMIO_HCI_CONTROLLER_DUMP			BIT_ULL
> > (4)
> > +#define GLOBAL_MMIO_HCI_CONTROLLER_DUMP_COLLECTED	BIT_ULL(5)
> > +#define GLOBAL_MMIO_HCI_REQ_HEALTH_PERF			BIT_ULL
> > (6)
> 
> The labelling of some of these bits deviates from the standard 
> abbreviations in the spec, which is fine I guess as these names are
> more 
> descriptive, but maybe add a brief comment with the original
> abbreviation?
> 

Ok

> > +
> > +#define ADMIN_COMMAND_HEARTBEAT		0x00u
> > +#define ADMIN_COMMAND_SHUTDOWN		0x01u
> > +#define ADMIN_COMMAND_FW_UPDATE		0x02u
> > +#define ADMIN_COMMAND_FW_DEBUG		0x03u
> > +#define ADMIN_COMMAND_ERRLOG		0x04u
> > +#define ADMIN_COMMAND_SMART		0x05u
> > +#define ADMIN_COMMAND_CONTROLLER_STATS	0x06u
> > +#define ADMIN_COMMAND_CONTROLLER_DUMP	0x07u
> > +#define ADMIN_COMMAND_CMD_CAPS		0x08u
> > +#define ADMIN_COMMAND_MAX		0x08u
> > +
> > +#define STATUS_SUCCESS		0x00
> > +#define STATUS_MEM_UNAVAILABLE	0x20
> 
> There's also a "blocked on account of background task" code, 0x21.
> 

Ok

> > +#define STATUS_BAD_OPCODE	0x50
> > +#define STATUS_BAD_REQUEST_PARM	0x51
> > +#define STATUS_BAD_DATA_PARM	0x52
> > +#define STATUS_DEBUG_BLOCKED	0x70
> > +#define STATUS_FAIL		0xFF
> > +
> > +#define STATUS_FW_UPDATE_BLOCKED 0x21
> > +#define STATUS_FW_ARG_INVALID	0x51
> > +#define STATUS_FW_INVALID	0x52
> 
> These status codes seem, from the specification, to correspond to
> the 
> generic error codes above, so perhaps they're not needed.
> 

These will be used in warn_status_fw_update() later, but I'll alias
them to make it clear that they are shadowing values

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

