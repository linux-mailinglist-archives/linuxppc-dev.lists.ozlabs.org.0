Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFCE18ED87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 01:57:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lwvk07V8zDqkL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 11:57:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lws74VlwzDqQl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 11:55:07 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N0Xtfd093618; Sun, 22 Mar 2020 20:55:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywe7qp4n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Mar 2020 20:55:00 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02N0XuqS093703;
 Sun, 22 Mar 2020 20:54:59 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywe7qp4me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Mar 2020 20:54:59 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02N0nuRx013745;
 Mon, 23 Mar 2020 00:54:59 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 2ywaw1fpxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 00:54:59 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02N0swUm33489402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 00:54:58 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35850AC060;
 Mon, 23 Mar 2020 00:54:58 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B9C2AC05B;
 Mon, 23 Mar 2020 00:54:57 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Mar 2020 00:54:57 +0000 (GMT)
Subject: Re: [PATCH v3 9/9] Documentation/powerpc: VAS API
From: Haren Myneni <haren@linux.ibm.com>
To: Daniel Axtens <dja@axtens.net>
In-Reply-To: <87blorw6wc.fsf@dja-thinkpad.axtens.net>
References: <1583540877.9256.24.camel@hbabu-laptop>
 <1583541541.9256.50.camel@hbabu-laptop>
 <87blorw6wc.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 22 Mar 2020 17:54:28 -0700
Message-ID: <1584924868.9256.15307.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-22_08:2020-03-21,
 2020-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003220146
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 linux-crypto@vger.kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-20 at 23:24 +1100, Daniel Axtens wrote:
> Hi Haren,
> 
> This is good documentation.
> 
> > Power9 introduced Virtual Accelerator Switchboard (VAS) which allows
> > userspace to communicate with Nest Accelerator (NX) directly. But
> > kernel has to establish channel to NX for userspace. This document
> > describes user space API that application can use to establish
> > communication channel.
> >
> > Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  Documentation/powerpc/index.rst   |   1 +
> >  Documentation/powerpc/vas-api.rst | 246 ++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 247 insertions(+)
> >  create mode 100644 Documentation/powerpc/vas-api.rst
> >
> > diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
> > index 0d45f0f..afe2d5e 100644
> > --- a/Documentation/powerpc/index.rst
> > +++ b/Documentation/powerpc/index.rst
> > @@ -30,6 +30,7 @@ powerpc
> >      syscall64-abi
> >      transactional_memory
> >      ultravisor
> > +    vas-api
> >  
> >  .. only::  subproject and html
> >  
> > diff --git a/Documentation/powerpc/vas-api.rst b/Documentation/powerpc/vas-api.rst
> > new file mode 100644
> > index 0000000..13ce4e7
> > --- /dev/null
> > +++ b/Documentation/powerpc/vas-api.rst
> > @@ -0,0 +1,246 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +.. _VAS-API:
> > +
> > +===================================================
> > +Virtual Accelerator Switchboard (VAS) userspace API
> > +===================================================
> > +
> > +Introduction
> > +============
> > +
> > +Power9 processor introduced Virtual Accelerator Switchboard (VAS) which
> > +allows both userspace and kernel communicate to co-processor
> > +(hardware accelerator) referred to as the Nest Accelerator (NX). The NX
> > +unit comprises of one or more hardware engines or co-processor types
> > +such as 842 compression, GZIP compression and encryption. On power9,
> > +userspace applications will have access to only GZIP Compression engine
> > +which supports ZLIB and GZIP compression algorithms in the hardware.
> > +
> > +To communicate with NX, kernel has to establish a channel or window and
> > +then requests can be submitted directly without kernel involvement.
> > +Requests to the GZIP engine must be formatted as a co-processor Request
> > +Block (CRB) and these CRBs must be submitted to the NX using COPY/PASTE
> > +instructions to paste the CRB to hardware address that is associated with
> > +the engine's request queue.
> > +
> > +The GZIP engine provides two priority levels of requests: Normal and
> > +High. Only Normal requests are supported from userspace right now.
> > +
> > +This document explains userspace API that is used to interact with
> > +kernel to setup channel / window which can be used to send compression
> > +requests directly to NX accelerator.
> > +
> > +
> > +Overview
> > +========
> > +
> > +Application access to the GZIP engine is provided through
> > +/dev/crypto/nx-gzip device node implemented by the VAS/NX device driver.
> > +An application must open the /dev/crypto/nx-gzip device to obtain a file
> > +descriptor (fd). Then should issue VAS_TX_WIN_OPEN ioctl with this fd to
> > +establish connection to the engine. It means send window is opened on GZIP
> > +engine for this process. Once a connection is established, the application
> > +should use the mmap() system call to map the hardware address of engine's
> > +request queue into the application's virtual address space.
> > +
> > +The application can then submit one or more requests to the the engine by
> > +using copy/paste instructions and pasting the CRBs to the virtual address
> > +(aka paste_address) returned by mmap(). User space can close the
> > +established connection or send window by closing the file descriptior
> > +(close(fd)) or upon the process exit.
> > +
> > +Note that applications can send several requests with the same window or
> > +can establish multiple windows, but one window for each file descriptor.
> > +
> > +Following sections provide additional details and references about the
> > +individual steps.
> > +
> > +NX-GZIP Device Node
> > +===================
> > +
> > +There is one /dev/crypto/nx-gzip node in the system and it provides
> > +access to all GZIP engines in the system. The only valid operations on
> > +/dev/crypto/nx-gzip are:
> > +
> > +	* open() the device for read and write.
> > +	* issue VAS_TX_WIN_OPEN ioctl
> > +	* mmap() the engine's request queue into application's virtual
> > +	  address space (i.e. get a paste_address for the co-processor
> > +	  engine).
> > +	* close the device node.
> > +
> > +Other file operations on this device node are undefined.
> > +
> > +Note that the copy and paste operations go directly to the hardware and
> > +do not go through this device. Refer COPY/PASTE document for more
> > +details.
> > +
> > +Although a system may have several instances of the NX co-processor
> > +engines (typically, one per P9 chip) there is just one
> > +/dev/crypto/nx-gzip device node in the system. When the nx-gzip device
> > +node is opened, Kernel opens send window on a suitable instance of NX
> > +accelerator. It finds CPU on which the user process is executing and
> > +determine the NX instance for the corresponding chip on which this CPU
> > +belongs.
> > +
> > +Applications may chose a specific instance of the NX co-processor using
> > +the vas_id field in the VAS_TX_WIN_OPEN ioctl as detailed below.
> > +
> > +A userspace library libnxz is available here but still in development:
> > +	 https://github.com/abalib/power-gzip
> > +
> > +Applications that use inflate / deflate calls can link with libnxz
> > +instead of libz and use NX GZIP compression without any modification.
> > +
> > +Open /dev/crypto/nx-gzip
> > +========================
> > +
> > +The nx-gzip device should be opened for read and write. No special
> > +privileges are needed to open the device. Each window coreesponds to one
> 
> s/coreesponds/corresponds/
> 
> > +file descriptor. So if the userspace process needs multiple windows,
> > +several open calls have to be issued.
> > +
> > +See open(2) system call man pages for other details such as return values,
> > +error codes and restrictions.
> > +codes and restrictions.
> 
> You have 'codes and restrictions' twice here.
> 
> > +
> > +VAS_TX_WIN_OPEN ioctl
> > +=====================
> > +
> > +Applications should use the VAS_TX_WIN_OPEN ioctl as follows to establish
> > +a connection with NX co-processor engine:
> > +
> > +	::
> > +		struct vas_tx_win_open_attr {
> > +			__u32   version;
> > +			__s16   vas_id; /* specific instance of vas or -1
> > +						for default */
> > +			__u16   reserved1;
> > +			__u64   flags;	/* For future use */
> > +			__u64   reserved2[6];
> > +		};
> > +
> > +	version: The version field must be currently set to 1.
> > +	vas_id: If '-1' is passed, kernel will make a best-effort attempt
> > +		to assign an optimal instance of NX for the process. To
> > +		select the specific VAS instance, refer
> > +		"Discovery of available VAS engines" section below.
> > +
> > +	flags, reserved1 and reserved2[6] fields are for future extension
> > +	and must be set to 0.
> > +
> > +	The attributes attr for the VAS_TX_WIN_OPEN ioctl are defined as
> > +	follows:
> > +		#define VAS_MAGIC 'v'
> > +		#define VAS_TX_WIN_OPEN _IOW(VAS_MAGIC, 1,
> > +						struct vas_tx_win_open_attr)
> > +
> > +		struct vas_tx_win_open_attr attr;
> > +		rc = ioctl(fd, VAS_TX_WIN_OPEN, &attr);
> > +
> > +	The VAS_TX_WIN_OPEN ioctl returns 0 on success. On errors, it
> > +	returns -1 and sets the errno variable to indicate the error.
> > +
> > +	Error conditions:
> > +		EINVAL	fd does not refer to a valid VAS device.
> > +		EINVAL	Invalid vas ID
> > +		EINVAL	version is not set with proper value
> > +		EEXIST	Window is already opened for the given fd
> > +		ENOMEM	Memory is not available to allocate window
> > +		ENOSPC	System has too many active windows (connections)
> > +			opened
> > +		EINVAL	reserved fields are not set to 0.
> > +
> > +	See the ioctl(2) man page for more details, error codes and
> > +	restrictions.
> > +
> > +mmap() NX-GZIP device
> > +=====================
> > +
> > +The mmap() system call for a NX-GZIP device fd returns a paste_address
> > +that the application can use to copy/paste its CRB to the hardware engines.
> > +	::
> > +
> > +		paste_addr = mmap(addr, size, prot, flags, fd, offset);
> > +
> > +	Only restrictions on mmap for a NX-GZIP device fd are:
> > +		* size should be 4K page size
> 
> Patch 3 seems to allow a 64k page if the system is compiled for 64k
> pages... Should it restrict it to 4K?
Yes restricted to 4K for NX-GZIP



