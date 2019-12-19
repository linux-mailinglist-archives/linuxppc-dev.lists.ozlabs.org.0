Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3101125CFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 09:52:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dlxV1jNSzDqqJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 19:52:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dlv23RXszDqmT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 19:50:06 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBJ8mC7l011583; Thu, 19 Dec 2019 03:49:51 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2x04gybmnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2019 03:49:51 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBJ8mJF3012484;
 Thu, 19 Dec 2019 03:49:50 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2x04gybmna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2019 03:49:50 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBJ8mNLl007367;
 Thu, 19 Dec 2019 08:49:50 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 2wvqc6vvvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2019 08:49:50 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBJ8nn0734079220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Dec 2019 08:49:49 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08CC5136053;
 Thu, 19 Dec 2019 08:49:49 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AD44136051;
 Thu, 19 Dec 2019 08:49:48 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Dec 2019 08:49:48 +0000 (GMT)
Subject: Re: [PATCH 08/10] crypto/NX: Add NX GZIP user space API
From: Haren Myneni <haren@linux.ibm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
In-Reply-To: <20191217093334.ihvz3fzzfgjwse32@gondor.apana.org.au>
References: <1576414240.16318.4066.camel@hbabu-laptop>
 <1576415119.16318.4094.camel@hbabu-laptop>
 <20191217093334.ihvz3fzzfgjwse32@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 19 Dec 2019 00:49:44 -0800
Message-ID: <1576745384.12797.37.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_08:2019-12-17,2019-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912190075
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
Cc: mikey@neuling.org, npiggin@gmail.com, hch@infradead.org,
 linux-crypto@vger.kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-12-17 at 17:33 +0800, Herbert Xu wrote:
> On Sun, Dec 15, 2019 at 05:05:19AM -0800, Haren Myneni wrote:
> > 
> > On power9, userspace can send GZIP compression requests directly to NX
> > once kernel establishes NX channel / window. This patch provides GZIP
> > engine access to user space via /dev/crypto/nx-gzip device node with
> > open, VAS_TX_WIN_OPEN ioctl, mmap and close operations.
> > 
> > Each window corresponds to file descriptor and application can open
> > multiple windows. After the window is opened, mmap() system call to map
> > the hardware address of engine's request queue into the application's
> > virtual address space.
> > 
> > Then the application can then submit one or more requests to the the
> > engine by using the copy/paste instructions and pasting the CRBs to
> > the virtual address (aka paste_address) returned by mmap().
> > 
> > Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> > Signed-off-by: Haren Myneni <haren@us.ibm.com>
> > ---
> >  drivers/crypto/nx/Makefile            |   2 +-
> >  drivers/crypto/nx/nx-842-powernv.h    |   2 +
> >  drivers/crypto/nx/nx-commom-powernv.c |  21 ++-
> >  drivers/crypto/nx/nx-gzip-powernv.c   | 282 ++++++++++++++++++++++++++++++++++
> >  4 files changed, 304 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/crypto/nx/nx-gzip-powernv.c
> 
> We already have a kernel compress API which could be exposed
> to user-space through af_alg.  If every driver created their
> own user-space API it would be unmanageable.

Thanks. 

Virtual Accelerator Switchboard (VAS) can provide support different
accelerators, Right now only NX is used, but possible to extend to
others in future. Or different functionalities such as fast thread
wakeup (VAS feature) with VAS windows. 

So looking common VAS API for any its accelerators. Need open a window /
channel - open() and ioctl()) calls, and setup the communications with
mapping address to NX (mmap()) and close the window. Then user space
communicates to accelerator directly without kernel involvement.
Specific drivers should set window attributes such as how many requests
can be send at same time and etc. All other interfaces should be same
for any accelerator. 

Also, since user space sends requests directly, should restrict
malicious users to prevent overload NX (security issue). Allowing
sysadmin to restrict /dev/crypto/nx-gzip usage. 


As you suggested, SW crypto API (af_alg) can be used just for NX
compression like using API based on the accelerator functionalities. It
is socket based API with AF_ALG socket family. But is there a way for
sysadmin to restrict usage from user space? Need just few functions in
struct proto. 

static struct proto_ops {
	.family = PF_ALG,
	.ioctl = nxgzip_ioctl,
	.mmap = nxgzip_mmap,
	.release = nxgzip_release,
};

Thanks
Haren


> 
> Cheers,


