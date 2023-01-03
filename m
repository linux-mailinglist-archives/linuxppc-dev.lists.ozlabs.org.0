Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE2365C72B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 20:15:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nmj9X5fZ0z3c7K
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 06:15:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dngi/WyC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dngi/WyC;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nmj8Z6ntVz2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 06:14:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65B9F614E2;
	Tue,  3 Jan 2023 19:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7F3C433EF;
	Tue,  3 Jan 2023 19:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672773259;
	bh=N7ivNyN5VHZFUOKbQyORtcjA8BMgy+b684iiJd7PPSs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Dngi/WyCrOY2KGRTUf8TvHZdV0rakljdaE//Cillu5tPz2ToFWupNzRFMO4yo6u46
	 8j8pIeiGmcQoP+w+LtfwW1jdN6gl4vPp7ITE7J+ddxCFjkTBh5dVWlDB94cxD2J8fM
	 9hJbwkKlT9DPwlC7vkD4n8WHF3hIE+ST0G05gfnVnPZiRyVRoIw5FgVtv+JD+uJgaH
	 M8DodmOHRajphU+quYr09cfTNb6VAphaMKmfXZ789dF72V5T6lZvXiVQqgwkb33uy3
	 qMO3m3yyV4i9ZvhR7AEFBvaxoS0EXdFcO/dI8Up3djZ4OkbmkkwH5WqAfgXrhlaWkz
	 pIx7HX82+Y+/A==
Date: Tue, 3 Jan 2023 13:14:18 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
Subject: Re: [PATCH] PCI/AER: Rate limit the reporting of the correctable
 errors
Message-ID: <20230103191418.GA1011392@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103165548.570377-1-rajat.khandelwal@linux.intel.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, "Neftin, Sasha" <sasha.neftin@intel.com>, Leon Romanovsky <leon@kernel.org>, linux-pci@vger.kernel.org, Frederick Zhang <frederick888@tsundere.moe>, rajat.khandelwal@intel.com, linux-kernel@vger.kernel.org, oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc Paul, Sasha, Leon, Frederick]

(Please cc folks who have commented on previous versions of your
patch.)

On Tue, Jan 03, 2023 at 10:25:48PM +0530, Rajat Khandelwal wrote:
> There are many instances where correctable errors tend to inundate
> the message buffer. We observe such instances during thunderbolt PCIe
> tunneling.
> 
> It's true that they are mitigated by the hardware and are non-fatal
> but we shouldn't be spamming the logs with such correctable errors as it
> confuses other kernel developers less familiar with PCI errors, support
> staff, and users who happen to look at the logs, hence rate limit them.

I want a better understanding of why we have so many errors before
rate-limiting everybody.

> A typical example log inside an HP TBT4 dock:
> [54912.661142] pcieport 0000:00:07.0: AER: Multiple Corrected error received: 0000:2b:00.0
> [54912.661194] igc 0000:2b:00.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Transmitter ID)
> [54912.661203] igc 0000:2b:00.0:   device [8086:5502] error status/mask=00001100/00002000
> [54912.661211] igc 0000:2b:00.0:    [ 8] Rollover
> [54912.661219] igc 0000:2b:00.0:    [12] Timeout
> [54982.838760] pcieport 0000:00:07.0: AER: Corrected error received: 0000:2b:00.0
> [54982.838798] igc 0000:2b:00.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Transmitter ID)
> [54982.838808] igc 0000:2b:00.0:   device [8086:5502] error status/mask=00001000/00002000
> [54982.838817] igc 0000:2b:00.0:    [12] Timeout

Please remove the timestamps; they don't contribute to understanding
the problem.

> This gets repeated continuously, thus inundating the buffer.

Did you verify that we actually clear the Correctable Error Status
register?

https://bugzilla.kernel.org/show_bug.cgi?id=216863 looks like a
similar issue.  The issue Frederick is seeing happens when resuming
from sleep.  Is there some event that triggers the correctable errors
you see?

Bjorn
