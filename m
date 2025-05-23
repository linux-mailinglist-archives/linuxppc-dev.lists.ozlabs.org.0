Return-Path: <linuxppc-dev+bounces-8922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763F1AC2779
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 18:21:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3r4r0ZHbz305D;
	Sat, 24 May 2025 02:21:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748017275;
	cv=none; b=RaR9z8EuTP3gx5yn1rsKc1RN5NihjBEfkF+4u8siz4s/dYxzBdp6YAELW7E7GplA5GN8wCFHaR/IPScU0T4o07ILXveXnw0jHk88N8Lh4a9Pg86N3Y+R1q7l4knrFYjz5YuxLaV/8OojsGN/ZF3UMaPbD0LJF/Hfg9VeJJEy4T3pRO/1DyibLl44f5RjvBBAZ5qnbGq0XVgxk4Tnc/jgl5bukaaPsB7cu9GxQnrcqbyhPyk4mD9ADCaysQr4lslq1MtGjWZK5aEMyBOgQzu3ndGOfG04JWDWD/gebaSiPGf+DHy7Y5UawzYJwg/vVfKn/O2Z8J4RjrkRgyTnAyOb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748017275; c=relaxed/relaxed;
	bh=fyt0hHcrzWWZRxzxUe6FXfaL3Or6Bms/+5KpCSDnI+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KNPpxxdIrDFdUVpFqmyugbGDtqP25dpTGrujqqtsk9OQ4uiPJnVpy27xwjJqf/PIVcAm8sXpsibIbdt7I51kZvBe8tIsymmiv5kxF9aGE6W2Pjaeaq5trTKTMrRTdEFp4G5W9EjjK8evtO8CsTtCjOhRj0QLNMDoFIRNreFC5y+9gj5lb9/+SEi6MjpasvqNc5lsxyXw8ROkE/Y2/Hlvx60BEJtxVaxkWfM9BjDve1fKiEtbGxecr4kRcqIYT06gq+LBbGEUqwiH1jRCUsGo1Vu7QSjVs2grrhJmBGdWbMwLmp/vKlR+FlMdpGsYoS1wcFU/V5WDkYDK6uYBVfrMsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vCTfUJ9E; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vCTfUJ9E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3r4p50tnz303B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 May 2025 02:21:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55DC55C5973;
	Fri, 23 May 2025 16:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0D1C4CEE9;
	Fri, 23 May 2025 16:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748017272;
	bh=U1rnFeuHNXmMUPL2c4Kh+01IGZxLTvvedTjINTssiRY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=vCTfUJ9ECN/W17Uu0ZpD7GqKVXpqr20/H4HOpBIGVI84ziT0ZnQDh0eKfHf3vqWbQ
	 7iKj3ssD7Dhds3bVCLmFmZsDgKJgJa8J3HYFu3BbbPlb3d5hwrmNw9VBEHvPEZXir0
	 phsJY/fNDabkHR/x5f/vzQL5P3GEX99rHkxSAdtBzQh3z0+9PSwKWbmUln37QquOi5
	 8Ruc2aQUsipkL2bPOica7NzT5Bg8GM0wwR5K5HgWViIlhNEBfj5YA4brYIkRou3NgC
	 9JtQgUXjBwppNdRJm6+p9EJDYsTDi5XUarLx0uPVPuGfFvat0EwY7Zb56cXaMW4oFP
	 Ve/djPTJY1lrA==
Date: Fri, 23 May 2025 11:21:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v8 00/20] Rate limit AER logs
Message-ID: <20250523162110.GA1564297@bhelgaas>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522232339.1525671-1-helgaas@kernel.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 22, 2025 at 06:21:06PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> This work is mostly due to Jon Pan-Doh and Karolina Stolarek.  I rebased
> this to v6.15-rc1, factored out some of the trace and statistics updates,
> and added some minor cleanups.
> 
> I pushed this to pci/aer at
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=aer
> (head a524e63307cf ("PCI/AER: Add sysfs attributes for log ratelimits"))
> and appended the interdiff from v7 to v8 below.
> 
> Proposal
> ========
> 
> When using native AER, spammy devices can flood kernel logs with AER errors
> and slow/stall execution. Add per-device per-error-severity ratelimits for
> more robust error logging. Allow userspace to configure ratelimits via
> sysfs knobs.
> 
> Motivation
> ==========
> 
> Inconsistent PCIe error handling, exacerbated at datacenter scale (myriad
> of devices), affects repairabilitiy flows for fleet operators.
> 
> Exposing PCIe errors/debug info in-band for a userspace daemon (e.g.
> rasdaemon) to collect/pass on to repairability services will allow for more
> predictable repair flows and decrease machine downtime.
> 
> Background
> ==========
> 
> AER error spam has been observed many times, both publicly (e.g. [1], [2],
> [3]) and privately. While it usually occurs with correctable errors, it can
> happen with uncorrectable errors (e.g. during new HW bringup).
> 
> There have been previous attempts to add ratelimits to AER logs ([4], [5]).
> The most recent attempt[5] has many similarities with the proposed
> approach.
> 
> 
> v8:
> - Rename sysfs ratelimit burst files:
>     ratelimit_burst_cor_log -> correctable_ratelimit_burst (Sathy)
>     ratelimit_burst_uncor_log -> nonfatal_ratelimit_burst
> - Split sysfs ratelimit_log_enable for correctable and nonfatal and make it
>   an interval instead of a toggle:
>     ratelimit_log_enable -> correctable_ratelimit_interval_ms
>                          -> nonfatal_ratelimit_interval_ms
> - Rework aer_get_device_error_info() and aer_print_error() to take an index
>   instead of pci_dev pointer
> - Move trace_aer_event() out of pci_dev_aer_stats_incr() (Jonathan)
> - Move AER_FATAL checking to aer_ratelimit() to avoid calling
>   __ratelimit(nonfatal_ratelimit) when we know we don't want to ratelimit
>   fatal errors (Jonathan)
> - Move all Error Source ID string building into aer_print_source() instead
>   of putting part in caller (Jonathan)
> - Rename struct aer_err_info.ratelimit -> ratelimit_print[] (Jonathan)
> - Pass printk level into pcie_print_tlp_log() (Jonathan)
> - Rework Error Source ratelimiting vs detail ratelimiting (Jonathan)
> v7: https://lore.kernel.org/r/20250520215047.1350603-1-helgaas@kernel.org
> - Update sysfs doc target kernel version & date (Ilpo)
> - Fix sysfs doc "AER ratelimiting" typo (Ilpo)
> - Ratelimit Correctable and Non-Fatal but not Fatal errors (Sathy)
> - Rename "struct aer_report" to "aer_info" (Sathy)
> - Expand comments about combining ratelimit for multiple devices (Ilpo)
> - Rework Error Source logging ratelimiting (Sathy)
> - Factor out aer_isr_one_error_type() to reduce code duplication
> - Log DPC errors, which are all Fatal, at KERN_ERR (Sathy)
> - Improve dpc_process_error() structure (Ilpo)
> v6: https://lore.kernel.org/r/20250519213603.1257897-1-helgaas@kernel.org
> - Rebase to v6.15-rc1
> - Initialize struct aer_err_info completely before using it
> - Log DPC Error Source ID only when it's valid
> - Consolidate AER Error Source ID logging to one place
> - Tidy Error Source ID bus/dev/fn decoding using macros
> - Rename aer_print_port_info() to aer_print_source()
> - Consolidate trace events and statistic updates to one non-ratelimited place
> - Save log level in struct aer_err_info instead of passing as parameter
> v5: https://lore.kernel.org/r/20250321015806.954866-1-pandoh@google.com
> - Handle multi-error AER by evaluating ratelimits once and storing result
> - Reword/rename commit messages/functions/variable
> v4: https://lore.kernel.org/r/20250320082057.622983-1-pandoh@google.com
> - Fix bug where trace not emitted with malformed aer_err_info
> - Extend ratelimit to malformed aer_err_info
> - Update commit messages with patch motivation
> - Squash AER sysfs filename change (Patch 8)
> v3: https://lore.kernel.org/r/20250319084050.366718-1-pandoh@google.com
> - Ratelimit aer_print_port_info() (drop Patch 1)
> - Add ratelimit enable toggle
> - Move trace outside of ratelimit
> - Split log level (Patch 2) into two
> - More descriptive documentation/sysfs naming
> v2: https://lore.kernel.org/r/20250214023543.992372-1-pandoh@google.com
> - Rebased on top of pci/aer (6.14.rc-1)
> - Split series into log and IRQ ratelimits (defer patch 5)
> - Dropped patch 8 (Move AER sysfs)
> - Added log level cleanup patch[7] from Karolina's series
> - Fixed bug where dpc errors didn't increment counters
> - "X callbacks suppressed" message on ratelimit release -> immediately
> - Separate documentation into own patch
> v1: https://lore.kernel.org/r/20250115074301.3514927-1-pandoh@google.com
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=215027
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=201517
> [3] https://bugzilla.kernel.org/show_bug.cgi?id=196183
> [4] https://lore.kernel.org/linux-pci/20230606035442.2886343-2-grundler@chromium.org/
> [5] https://lore.kernel.org/linux-pci/cover.1736341506.git.karolina.stolarek@oracle.com/
> [6]
> https://lore.kernel.org/linux-pci/8bcb8c9a7b38ce3bdaca5a64fe76f08b0b337511.1742202797.git.k
> arolina.stolarek@oracle.com/
> [7]
> https://lore.kernel.org/linux-pci/edd77011aafad4c0654358a26b4e538d0c5a321d.1736341506.git.k
> arolina.stolarek@oracle.com/
> 
> 
> 
> Bjorn Helgaas (13):
>   PCI/DPC: Initialize aer_err_info before using it
>   PCI/DPC: Log Error Source ID only when valid
>   PCI/AER: Factor COR/UNCOR error handling out from aer_isr_one_error()
>   PCI/AER: Consolidate Error Source ID logging in
>     aer_isr_one_error_type()
>   PCI/AER: Extract bus/dev/fn in aer_print_port_info() with
>     PCI_BUS_NUM(), etc
>   PCI/AER: Move aer_print_source() earlier in file
>   PCI/AER: Initialize aer_err_info before using it
>   PCI/AER: Simplify pci_print_aer()
>   PCI/AER: Update statistics before ratelimiting
>   PCI/AER: Trace error event before ratelimiting
>   PCI/ERR: Add printk level to pcie_print_tlp_log()
>   PCI/AER: Convert aer_get_device_error_info(), aer_print_error() to
>     index
>   PCI/AER: Simplify add_error_device()
> 
> Jon Pan-Doh (4):
>   PCI/AER: Rename aer_print_port_info() to aer_print_source()
>   PCI/AER: Ratelimit correctable and non-fatal error logging
>   PCI/AER: Add ratelimits to PCI AER Documentation
>   PCI/AER: Add sysfs attributes for log ratelimits
> 
> Karolina Stolarek (3):
>   PCI/AER: Check log level once and remember it
>   PCI/AER: Reduce pci_print_aer() correctable error level to
>     KERN_WARNING
>   PCI/AER: Rename struct aer_stats to aer_info
> 
>  ...es-aer_stats => sysfs-bus-pci-devices-aer} |  44 ++
>  Documentation/PCI/pcieaer-howto.rst           |  17 +-
>  drivers/pci/pci-sysfs.c                       |   1 +
>  drivers/pci/pci.h                             |  13 +-
>  drivers/pci/pcie/aer.c                        | 441 +++++++++++++-----
>  drivers/pci/pcie/dpc.c                        |  73 +--
>  drivers/pci/pcie/tlp.c                        |   6 +-
>  include/linux/pci.h                           |   2 +-
>  8 files changed, 430 insertions(+), 167 deletions(-)
>  rename Documentation/ABI/testing/{sysfs-bus-pci-devices-aer_stats => sysfs-bus-pci-devices-aer} (72%)

I applied this series to pci/aer for v6.16 with the updates below
suggested by Sathy and Ilpo.

My heartfelt thanks to the authors, Jon and Karolina, for seeing the
need for this and putting in the effort, and to all the reviewers who
put so much time and care into reading and polishing it on such a
tight schedule.


diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 6c331695af58..70ac66188367 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -786,17 +786,14 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
 
 static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
 {
-	struct ratelimit_state *ratelimit;
-
-	if (severity == AER_FATAL)
-		return 1;	/* AER_FATAL not ratelimited */
-
-	if (severity == AER_CORRECTABLE)
-		ratelimit = &dev->aer_info->correctable_ratelimit;
-	else
-		ratelimit = &dev->aer_info->nonfatal_ratelimit;
-
-	return __ratelimit(ratelimit);
+	switch (severity) {
+	case AER_NONFATAL:
+		return __ratelimit(&dev->aer_info->nonfatal_ratelimit);
+	case AER_CORRECTABLE:
+		return __ratelimit(&dev->aer_info->correctable_ratelimit);
+	default:
+		return 1;	/* Don't ratelimit fatal errors */
+	}
 }
 
 static void __aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
@@ -841,7 +838,7 @@ void aer_print_error(struct aer_err_info *info, int i)
 	int layer, agent, id;
 	const char *level = info->level;
 
-	if (i >= AER_MAX_MULTI_ERR_DEVICES)
+	if (WARN_ON_ONCE(i >= AER_MAX_MULTI_ERR_DEVICES))
 		return;
 
 	dev = info->dev[i];

