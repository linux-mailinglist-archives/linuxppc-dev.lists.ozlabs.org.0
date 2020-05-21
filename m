Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CF01DC72D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 08:49:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SKxD27q8zDqjd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 16:49:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SKvY35ZJzDqjM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 16:48:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TD2fDeKC; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49SKvV6hDcz9sT9;
 Thu, 21 May 2020 16:48:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590043704;
 bh=mylN82RMn5av9mlUtP03Bq7JN7H0txBfw8gjg+ZMQ7s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TD2fDeKCARBDrWHY+VsGAe2iNnjSqQg60E3P1g7BHV/e9JoUek2xU6OXtkwdaFBlG
 aGsN7rfCMbH628gOSdZXEoRypdxmeNdDtrpbG4z8i41l8g31J3EgJqZna48GJKwC2D
 5bRYia+7Z03muiVkvkWqj3ePOGlgXK0kW3acfngvbgMdQClEMJRRQ5Z8x3nV+qRPyX
 EraBdtFn9TliOy7sS163c8RGPhBZnu6NStAC3CIu4NHNsMKW+KtIsGQQxbHCcvH6dx
 4yVgcFUs0HZ2rGH7IcJSH/rK0vExeIUOkgCbyQhjDX2DlL14cZeT9FW4/IsS3D9Hip
 vvOPM4L7nSzmA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ira Weiny <ira.weiny@intel.com>, Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [RESEND PATCH v7 4/5] ndctl/papr_scm,
 uapi: Add support for PAPR nvdimm specific methods
In-Reply-To: <20200520153209.GC3660833@iweiny-DESK2.sc.intel.com>
References: <20200519190058.257981-1-vaibhav@linux.ibm.com>
 <20200519190058.257981-5-vaibhav@linux.ibm.com>
 <20200520153209.GC3660833@iweiny-DESK2.sc.intel.com>
Date: Thu, 21 May 2020 16:48:40 +1000
Message-ID: <87367t941j.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ira Weiny <ira.weiny@intel.com> writes:
> On Wed, May 20, 2020 at 12:30:57AM +0530, Vaibhav Jain wrote:
>> Introduce support for Papr nvDimm Specific Methods (PDSM) in papr_scm
>> modules and add the command family to the white list of NVDIMM command
>> sets. Also advertise support for ND_CMD_CALL for the dimm
>> command mask and implement necessary scaffolding in the module to
>> handle ND_CMD_CALL ioctl and PDSM requests that we receive.
...
>> + *
>> + * Payload Version:
>> + *
>> + * A 'payload_version' field is present in PDSM header that indicates a specific
>> + * version of the structure present in PDSM Payload for a given PDSM command.
>> + * This provides backward compatibility in case the PDSM Payload structure
>> + * evolves and different structures are supported by 'papr_scm' and 'libndctl'.
>> + *
>> + * When sending a PDSM Payload to 'papr_scm', 'libndctl' should send the version
>> + * of the payload struct it supports via 'payload_version' field. The 'papr_scm'
>> + * module when servicing the PDSM envelope checks the 'payload_version' and then
>> + * uses 'payload struct version' == MIN('payload_version field',
>> + * 'max payload-struct-version supported by papr_scm') to service the PDSM.
>> + * After servicing the PDSM, 'papr_scm' put the negotiated version of payload
>> + * struct in returned 'payload_version' field.
>
> FWIW many people believe using a size rather than version is more sustainable.
> It is expected that new payload structures are larger (more features) than the
> previous payload structure.
>
> I can't find references at the moment through.

I think clone_args is a good modern example:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/sched.h#n88

cheers
