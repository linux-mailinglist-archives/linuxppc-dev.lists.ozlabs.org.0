Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C09A2538E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 17:11:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457fPF0cc5zDqLh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 01:11:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=linuxram@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457fM80XKlzDq83
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 01:09:52 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4LEvVYA127538
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 11:09:49 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2smjn3b8f0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 11:09:49 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Tue, 21 May 2019 16:09:47 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 May 2019 16:09:42 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4LF9fb857606362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2019 15:09:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A194A52051;
 Tue, 21 May 2019 15:09:40 +0000 (GMT)
Received: from ram.ibm.com (unknown [9.85.154.252])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 9D4715204F;
 Tue, 21 May 2019 15:09:37 +0000 (GMT)
Date: Tue, 21 May 2019 08:09:35 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Christoph Hellwig <hch@lst.de>
References: <20190521044912.1375-1-bauerman@linux.ibm.com>
 <20190521044912.1375-3-bauerman@linux.ibm.com>
 <20190521051326.GC29120@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521051326.GC29120@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19052115-0016-0000-0000-0000027E06E9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052115-0017-0000-0000-000032DAF3D4
Message-Id: <20190521150935.GB8402@ram.ibm.com>
Subject: Re: Re: [RFC PATCH 02/12] powerpc: Add support for adding an ESM blob
 to the zImage wrapper
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905210094
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2019 at 07:13:26AM +0200, Christoph Hellwig wrote:
> On Tue, May 21, 2019 at 01:49:02AM -0300, Thiago Jung Bauermann wrote:
> > From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > 
> > For secure VMs, the signing tool will create a ticket called the "ESM blob"
> > for the Enter Secure Mode ultravisor call with the signatures of the kernel
> > and initrd among other things.
> > 
> > This adds support to the wrapper script for adding that blob via the "-e"
> > option to the zImage.pseries.
> > 
> > It also adds code to the zImage wrapper itself to retrieve and if necessary
> > relocate the blob, and pass its address to Linux via the device-tree, to be
> > later consumed by prom_init.
> 
> Where does the "BLOB" come from?  How is it licensed and how can we
> satisfy the GPL with it?

The "BLOB" is not a piece of code. Its just a piece of data that gets
generated by our build tools. This data contains the
signed hash of the kernel, initrd, and kernel command line parameters.
Also it contains any information that the creator the the BLOB wants to
be made available to anyone needing it, inside the
secure-virtual-machine. All of this is integrity-protected and encrypted
to safegaurd it when at rest and at runtime.
 
Bottomline -- Blob is data, and hence no licensing implication. And due
to some reason, even data needs to have licensing statement, we can
make it available to have no conflicts with GPL.


-- 
Ram Pai

