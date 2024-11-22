Return-Path: <linuxppc-dev+bounces-3504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CAA9D643B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 19:35:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xw3gd0P6wz2y8p;
	Sat, 23 Nov 2024 05:35:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732300524;
	cv=none; b=bG1R1+AKrH3t1npG0oVFG8zMmkS3xvJa+WOEzCnzG9WXh8HBmHpyf8R2oW+9Qj6L4abd3bBwBMWgNEey1FfUv8KKj5LYAap3TAdGLr8AHtj2bfBVO+4qYg9v3cZFAz1LJzaoVbQG2LGV4OBP0cJxCUcChxE9V+IZhUMFvnfnlbHcLJI9H/5TXM61kfY4SVwPgHyDPDW5NKbK53+YG3TNuL1YL/XiGtgeMBqp370iHm8qnoEbkRljjgC3BrwxqGnMo5b04dNu1OT8xSRNlc/5hCGU0YCxauYqK9l5Dx9gpLekzstjSrfxnfR+RelyhzTngFW1kyIeU12eeWXgdU8H6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732300524; c=relaxed/relaxed;
	bh=FQTE6+Svr9YNuujl7Py0eKINh9Jb75cKZ33sVaiIPvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIdp4/8udcB5SGF73jE+Id20v0uvnaTgsoAzUKiumNMz4+GwI0GLgzsfRXyRJ30MBBvfP+iQfIRRGGcrgLClxs1dKZMjN48f2xxVaYO8xl+xV5aTYKKeTarRejg399K8i3Iud0auquu+txi1d1ZbrF92pACjI/X70pVvScigLheF8Qy7jjonIZUcGpvFxa48P5LtVEd0B0kZH3drelO0/BhYS6aFfWCXCp8F8Uem7XpTR6LVWUApRjgtayutYC4hm/4SaPRpSftkOngpyuTpFM1K0zYjcqsyXhIhuu/tzxr7hpUq3wrRejP0fJ/zZNazohD6MAknVarPNvVlS0RD9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xw3gZ3GPXz2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 05:35:21 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4AMIVs9W024111;
	Fri, 22 Nov 2024 12:31:54 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4AMIVqd3024109;
	Fri, 22 Nov 2024 12:31:52 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 22 Nov 2024 12:31:52 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: mpe@ellerman.id.au, arnd@arndb.de, geert@linux-m68k.org,
        gerhard_pircher@gmx.net, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
Message-ID: <20241122183152.GN29862@gate.crashing.org>
References: <87bjydoz18.fsf@mpe.ellerman.id.au> <20241121084136.3648581-1-glaubitz@physik.fu-berlin.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121084136.3648581-1-glaubitz@physik.fu-berlin.de>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 21, 2024 at 09:41:36AM +0100, John Paul Adrian Glaubitz wrote:
> >> Pegasos2 users still exist, but admittedly they mainly use MorphOS and
> >> AmigaOS4 on these machines.
> >
> > The Linux CHRP support is still present in v6.12, which will be an LTS
> > for the next 2 years at least, so if there's folks who occasionally boot
> > Linux they will still be able to do that for a while.
> 
> Is there any urgency that warrants the removal? I could understand when ia64
> support was removed because it put a burden on maintainers.
> 
> But CHRP support?

It puts a burden on maintainers the same way.  No one can really test
it, to start with.  It is essentially dead code.

Or do you know someone who regularly builds and tests this?


Segher

