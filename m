Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 670A35150BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 18:26:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqdCq11d1z3bpJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 02:26:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CVIs8Sdx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqdC73s5Gz2yHB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 02:25:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CVIs8Sdx; 
 dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KqdC51sk8z4xXk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 02:25:53 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KqdC51P8Jz4ySs; Sat, 30 Apr 2022 02:25:53 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CVIs8Sdx; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KqdC45qVzz4xXk
 for <linuxppc-dev@ozlabs.org>; Sat, 30 Apr 2022 02:25:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 805C962241;
 Fri, 29 Apr 2022 16:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F6CC385A4;
 Fri, 29 Apr 2022 16:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651249548;
 bh=BWS82VVFyGkq8byIrn9E10Tw1cwiTndaAE5gu1B1OmQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=CVIs8SdxCsEVj5dUFPoP75L/KJ26GD43iGVck/aZNGhK1aezz7ZZb06FSUfWiMU00
 TXb+1854FvHtiQPJaNkNykibUp1cgY1oD2iObIkRxs2MoTYcJb63woOZPMZR+SDGcU
 3HNVtaNPwoV85OfwP4/4RrLNA8cIYKZ8K7ZEC1wEKqUE7zEsAtpg+Sc7WIPoW36o3E
 l4BqKcJyvXW/5tH7ZOLJG6rEOYNvav4eMgUMApp2OOvJvYo/J+DJZ4ArXiMOT84Bha
 LcuibEvm3xCMlzVtrEPQulC95eJG+GMWrxVeoahXaCXso46F+NgWRtTC/XTK12qu/A
 mlhrBbOUrkG0g==
Date: Fri, 29 Apr 2022 11:25:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v6] PCI hotplug: rpaphp: Error out on busy status from
 get-sensor-state
Message-ID: <20220429162545.GA79541@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k0b8q1px.fsf@linux.ibm.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 linux-pci <linux-pci@vger.kernel.org>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 28, 2022 at 05:31:38PM -0500, Nathan Lynch wrote:
> Bjorn Helgaas <helgaas@kernel.org> writes:
> > On Tue, Apr 26, 2022 at 11:07:39PM +0530, Mahesh Salgaonkar wrote:
> >> +/*
> >> + * RTAS call get-sensor-state(DR_ENTITY_SENSE) return values as per PAPR:
> >> + *    -1: Hardware Error
> >> + *    -2: RTAS_BUSY
> >> + *    -3: Invalid sensor. RTAS Parameter Error.
> >> + * -9000: Need DR entity to be powered up and unisolated before RTAS call
> >> + * -9001: Need DR entity to be powered up, but not unisolated, before RTAS call
> >> + * -9002: DR entity unusable
> >> + *  990x: Extended delay - where x is a number in the range of 0-5
> >> + */
> >> +#define RTAS_HARDWARE_ERROR	(-1)
> >> +#define RTAS_INVALID_SENSOR	(-3)
> >> +#define SLOT_UNISOLATED		(-9000)
> >> +#define SLOT_NOT_UNISOLATED	(-9001)

> >> +static int rtas_to_errno(int rtas_rc)
> >> +{
> >> +	int rc;
> >> +
> >> +	switch (rtas_rc) {
> >> +	case RTAS_HARDWARE_ERROR:
> >> +		rc = -EIO;
> >> +		break;
> >> +	case RTAS_INVALID_SENSOR:
> >> +		rc = -EINVAL;
> >> +		break;
> >> +	case SLOT_UNISOLATED:
> >> +	case SLOT_NOT_UNISOLATED:
> >> +		rc = -EFAULT;
> >> +		break;
> >> +	case SLOT_NOT_USABLE:
> >> +		rc = -ENODEV;
> >> +		break;
> >> +	case RTAS_BUSY:
> >> +	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
> >> +		rc = -EBUSY;
> >> +		break;
> >> +	default:
> >> +		err("%s: unexpected RTAS error %d\n", __func__, rtas_rc);
> >> +		rc = -ERANGE;
> >> +		break;
> >> +	}
> >> +	return rc;
> >
> > This basically duplicates rtas_error_rc().  Why do we need two copies?
> 
> It treats RTAS_BUSY, RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX
> differently, which is part of the point of this change.

I think it would reduce confusion overall to:

  - add RTAS_HARDWARE_ERROR, RTAS_INVALID_SENSOR to rtas.h

  - rename and move SLOT_UNISOLATED, etc to rtas.h; they look
    analogous to function-specific things like RTAS_SUSPEND_ABORTED

  - change rtas_error_rc() to use the RTAS_HARDWARE_ERROR, etc
    constants

  - use the constants (SLOT_NOT_USABLE) instead of "9902" in the
    commit log and code comments

> Aside: rtas_error_rc() (from powerpc's rtas.c) is badly named. Its
> conversions make sense for only a handful of RTAS calls. RTAS error
> codes have function-specific interpretations.

Maybe there's a case for factoring out the generic error codes and
have rtas_to_errno() (which sounds like maybe it should be renamed as
well) handle the function-specific part and fall back to the generic
one otherwise:

  int rtas_to_errno(int rtas_rc)
  {
    switch (rtas_rc) {
    case SLOT_UNISOLATED:
    case SLOT_NOT_UNISOLATED:
      return -EINVAL;
    case SLOT_NOT_USABLE:
      return -ENODEV;
    ...
    default:
      return rtas_error_rc(rtas_rc);
    }
  }
