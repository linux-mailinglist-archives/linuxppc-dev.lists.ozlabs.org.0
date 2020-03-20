Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D54A18CDDE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 13:27:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kNMY4kfczDrH8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 23:27:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=jigqQtCU; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kNJW3J4ZzDrH8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 23:24:59 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id b72so3133182pfb.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=7j/gZWCgTveqAxJksxzETYlHVAwTk7I1BKebV7lwMSI=;
 b=jigqQtCURtINYdEgrdVGDagbUr2GGY2M/usZCtgaCG+zM/OYR31CKlpjIQVuiSTNE1
 LlbX4vMGCjyJMoWfRFYy54AffjMd48Smq1zGjj2jk3ZVpm5YQNf03nN97S2BtToMo++d
 mX2hH7acmqfBm2J5VLd05U86jpoKV7HSrPDTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=7j/gZWCgTveqAxJksxzETYlHVAwTk7I1BKebV7lwMSI=;
 b=iBUaF1PVUDDIPv+bTXhmU0LBP1Mq/CHCJNpUU0E5Lnhio0OwbZznIbVG++B6d2Q0xQ
 pZjJCUq+EgECAcezTwo6bcpEsFJRr6qpM03Z5EropUH17IfD9Nyr8q/EOPc+m26VpTnk
 6g0aClhwpq1Yfp6SsjdPt6U7VbbUbwcoSkVM2OxWoSY9bFJq8ZiZB4U6MVoVVf50xTlE
 fSKjib18wVDpIg/Gbe1sMXz78wTH+IRCYDtHTuaPnVRal24Rq2A7/XmIkIxhUR6DJlo5
 Sc6oSb18xIKgQIXSyvMsP/+eTH/9idNTJMPfsFHLgNmdTHjJUOT+pz7D8SjIcMukAJ1Z
 Gxig==
X-Gm-Message-State: ANhLgQ1hPqDE5riKdmcLRZth86x62ZUSrDp9PT8rzUwy24TCn6P1yJgH
 Xix7gUM7s5ztobKhyqH1YDETxw==
X-Google-Smtp-Source: ADFU+vs3qE1kqu10ggDM9jEgALLlR+aaHI0fgOVM6cUzo/zZbCL0txsH777WrJ4nTUR/yH2t8ovp1w==
X-Received: by 2002:a63:fd0d:: with SMTP id d13mr7339958pgh.302.1584707095927; 
 Fri, 20 Mar 2020 05:24:55 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-5c35-14f7-8aa3-37c9.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:5c35:14f7:8aa3:37c9])
 by smtp.gmail.com with ESMTPSA id w138sm5737630pff.145.2020.03.20.05.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 05:24:55 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au
Subject: Re: [PATCH v3 9/9] Documentation/powerpc: VAS API
In-Reply-To: <1583541541.9256.50.camel@hbabu-laptop>
References: <1583540877.9256.24.camel@hbabu-laptop>
 <1583541541.9256.50.camel@hbabu-laptop>
Date: Fri, 20 Mar 2020 23:24:51 +1100
Message-ID: <87blorw6wc.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mikey@neuling.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Haren,

This is good documentation.

> Power9 introduced Virtual Accelerator Switchboard (VAS) which allows
> userspace to communicate with Nest Accelerator (NX) directly. But
> kernel has to establish channel to NX for userspace. This document
> describes user space API that application can use to establish
> communication channel.
>
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  Documentation/powerpc/index.rst   |   1 +
>  Documentation/powerpc/vas-api.rst | 246 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 247 insertions(+)
>  create mode 100644 Documentation/powerpc/vas-api.rst
>
> diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
> index 0d45f0f..afe2d5e 100644
> --- a/Documentation/powerpc/index.rst
> +++ b/Documentation/powerpc/index.rst
> @@ -30,6 +30,7 @@ powerpc
>      syscall64-abi
>      transactional_memory
>      ultravisor
> +    vas-api
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/powerpc/vas-api.rst b/Documentation/powerpc/vas-api.rst
> new file mode 100644
> index 0000000..13ce4e7
> --- /dev/null
> +++ b/Documentation/powerpc/vas-api.rst
> @@ -0,0 +1,246 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. _VAS-API:
> +
> +===================================================
> +Virtual Accelerator Switchboard (VAS) userspace API
> +===================================================
> +
> +Introduction
> +============
> +
> +Power9 processor introduced Virtual Accelerator Switchboard (VAS) which
> +allows both userspace and kernel communicate to co-processor
> +(hardware accelerator) referred to as the Nest Accelerator (NX). The NX
> +unit comprises of one or more hardware engines or co-processor types
> +such as 842 compression, GZIP compression and encryption. On power9,
> +userspace applications will have access to only GZIP Compression engine
> +which supports ZLIB and GZIP compression algorithms in the hardware.
> +
> +To communicate with NX, kernel has to establish a channel or window and
> +then requests can be submitted directly without kernel involvement.
> +Requests to the GZIP engine must be formatted as a co-processor Request
> +Block (CRB) and these CRBs must be submitted to the NX using COPY/PASTE
> +instructions to paste the CRB to hardware address that is associated with
> +the engine's request queue.
> +
> +The GZIP engine provides two priority levels of requests: Normal and
> +High. Only Normal requests are supported from userspace right now.
> +
> +This document explains userspace API that is used to interact with
> +kernel to setup channel / window which can be used to send compression
> +requests directly to NX accelerator.
> +
> +
> +Overview
> +========
> +
> +Application access to the GZIP engine is provided through
> +/dev/crypto/nx-gzip device node implemented by the VAS/NX device driver.
> +An application must open the /dev/crypto/nx-gzip device to obtain a file
> +descriptor (fd). Then should issue VAS_TX_WIN_OPEN ioctl with this fd to
> +establish connection to the engine. It means send window is opened on GZIP
> +engine for this process. Once a connection is established, the application
> +should use the mmap() system call to map the hardware address of engine's
> +request queue into the application's virtual address space.
> +
> +The application can then submit one or more requests to the the engine by
> +using copy/paste instructions and pasting the CRBs to the virtual address
> +(aka paste_address) returned by mmap(). User space can close the
> +established connection or send window by closing the file descriptior
> +(close(fd)) or upon the process exit.
> +
> +Note that applications can send several requests with the same window or
> +can establish multiple windows, but one window for each file descriptor.
> +
> +Following sections provide additional details and references about the
> +individual steps.
> +
> +NX-GZIP Device Node
> +===================
> +
> +There is one /dev/crypto/nx-gzip node in the system and it provides
> +access to all GZIP engines in the system. The only valid operations on
> +/dev/crypto/nx-gzip are:
> +
> +	* open() the device for read and write.
> +	* issue VAS_TX_WIN_OPEN ioctl
> +	* mmap() the engine's request queue into application's virtual
> +	  address space (i.e. get a paste_address for the co-processor
> +	  engine).
> +	* close the device node.
> +
> +Other file operations on this device node are undefined.
> +
> +Note that the copy and paste operations go directly to the hardware and
> +do not go through this device. Refer COPY/PASTE document for more
> +details.
> +
> +Although a system may have several instances of the NX co-processor
> +engines (typically, one per P9 chip) there is just one
> +/dev/crypto/nx-gzip device node in the system. When the nx-gzip device
> +node is opened, Kernel opens send window on a suitable instance of NX
> +accelerator. It finds CPU on which the user process is executing and
> +determine the NX instance for the corresponding chip on which this CPU
> +belongs.
> +
> +Applications may chose a specific instance of the NX co-processor using
> +the vas_id field in the VAS_TX_WIN_OPEN ioctl as detailed below.
> +
> +A userspace library libnxz is available here but still in development:
> +	 https://github.com/abalib/power-gzip
> +
> +Applications that use inflate / deflate calls can link with libnxz
> +instead of libz and use NX GZIP compression without any modification.
> +
> +Open /dev/crypto/nx-gzip
> +========================
> +
> +The nx-gzip device should be opened for read and write. No special
> +privileges are needed to open the device. Each window coreesponds to one

s/coreesponds/corresponds/

> +file descriptor. So if the userspace process needs multiple windows,
> +several open calls have to be issued.
> +
> +See open(2) system call man pages for other details such as return values,
> +error codes and restrictions.
> +codes and restrictions.

You have 'codes and restrictions' twice here.

> +
> +VAS_TX_WIN_OPEN ioctl
> +=====================
> +
> +Applications should use the VAS_TX_WIN_OPEN ioctl as follows to establish
> +a connection with NX co-processor engine:
> +
> +	::
> +		struct vas_tx_win_open_attr {
> +			__u32   version;
> +			__s16   vas_id; /* specific instance of vas or -1
> +						for default */
> +			__u16   reserved1;
> +			__u64   flags;	/* For future use */
> +			__u64   reserved2[6];
> +		};
> +
> +	version: The version field must be currently set to 1.
> +	vas_id: If '-1' is passed, kernel will make a best-effort attempt
> +		to assign an optimal instance of NX for the process. To
> +		select the specific VAS instance, refer
> +		"Discovery of available VAS engines" section below.
> +
> +	flags, reserved1 and reserved2[6] fields are for future extension
> +	and must be set to 0.
> +
> +	The attributes attr for the VAS_TX_WIN_OPEN ioctl are defined as
> +	follows:
> +		#define VAS_MAGIC 'v'
> +		#define VAS_TX_WIN_OPEN _IOW(VAS_MAGIC, 1,
> +						struct vas_tx_win_open_attr)
> +
> +		struct vas_tx_win_open_attr attr;
> +		rc = ioctl(fd, VAS_TX_WIN_OPEN, &attr);
> +
> +	The VAS_TX_WIN_OPEN ioctl returns 0 on success. On errors, it
> +	returns -1 and sets the errno variable to indicate the error.
> +
> +	Error conditions:
> +		EINVAL	fd does not refer to a valid VAS device.
> +		EINVAL	Invalid vas ID
> +		EINVAL	version is not set with proper value
> +		EEXIST	Window is already opened for the given fd
> +		ENOMEM	Memory is not available to allocate window
> +		ENOSPC	System has too many active windows (connections)
> +			opened
> +		EINVAL	reserved fields are not set to 0.
> +
> +	See the ioctl(2) man page for more details, error codes and
> +	restrictions.
> +
> +mmap() NX-GZIP device
> +=====================
> +
> +The mmap() system call for a NX-GZIP device fd returns a paste_address
> +that the application can use to copy/paste its CRB to the hardware engines.
> +	::
> +
> +		paste_addr = mmap(addr, size, prot, flags, fd, offset);
> +
> +	Only restrictions on mmap for a NX-GZIP device fd are:
> +		* size should be 4K page size

Patch 3 seems to allow a 64k page if the system is compiled for 64k
pages... Should it restrict it to 4K?

> +		* offset parameter should be 0ULL
> +
> +	Refer to mmap(2) man page for additional details/restrictions.
> +	In addition to the error conditions listed on the mmap(2) man
> +	page, can also fail with one of the following error codes:
> +
> +		EINVAL	fd is not associated with an open window
> +			(i.e mmap() does not follow a successful call
> +			to the VAS_TX_WIN_OPEN ioctl).
> +		EINVAL	offset field is not 0ULL.
> +
> +Discovery of available VAS engines
> +==================================
> +
> +Each available VAS instance in the system will have a device tree node
> +like /proc/device-tree/vas@* or /proc/device-tree/xscom@*/vas@*.
> +Determine the chip or VAS instance and use the corresponding ibm,vas-id
> +property value in this node to select specific VAS instance.
> +
> +Copy/Paste operations
> +=====================
> +
> +Applications should use the copy and paste instructions defined in the RFC
> +to copy/paste the CRB.

In which RFC?

> +
> +CRB Specification and use NX
> +============================
> +
> +Applications should format requests to the co-processor using the
> +co-processor Request Block (CRBs). Refer NX workbook for the format of
> +CRB and use NX from userspace such as sending requests and checking
> +request status.

Where would someone find the NX workbook?

Regards,
Daniel

> +
> +Simple example
> +==============
> +
> +	::
> +		int use_nx_gzip()
> +		{
> +			int rc, fd;
> +			void *addr;
> +			struct vas_setup_attr txattr;
> +
> +			fd = open("/dev/crypto/nx-gzip", O_RDWR);
> +			if (fd < 0) {
> +				fprintf(stderr, "open nx-gzip failed\n");
> +				return -1;
> +			}
> +			memset(&txattr, 0, sizeof(txattr));
> +			txattr.version = 1;
> +			txattr.vas_id = -1
> +			rc = ioctl(fd, VAS_TX_WIN_OPEN,
> +					(unsigned long)&txattr);
> +			if (rc < 0) {
> +				fprintf(stderr, "ioctl() n %d, error %d\n",
> +						rc, errno);
> +				return rc;
> +			}
> +			addr = mmap(NULL, 4096, PROT_READ|PROT_WRITE,
> +					MAP_SHARED, fd, 0ULL);
> +			if (addr == MAP_FAILED) {
> +				fprintf(stderr, "mmap() failed, errno %d\n",
> +						errno);
> +				return -errno;
> +			}
> +			do {
> +				//Format CRB request with compression or
> +				//uncompression
> +				// Refer tests for vas_copy/vas_paste
> +				vas_copy((&crb, 0, 1);
> +				vas_paste(addr, 0, 1);
> +				// Poll on csb.flags with timeout
> +				// csb address is listed in CRB
> +			} while (true)
> +			close(fd) or window can be closed upon process exit
> +		}
> +
> +	Refer https://github.com/abalib/power-gzip for tests or more
> +	use cases.
> -- 
> 1.8.3.1
