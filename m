Return-Path: <linuxppc-dev+bounces-13202-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D43E7C0091E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 12:48:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csjSd2RW6z3bd0;
	Thu, 23 Oct 2025 21:48:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.78.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761216529;
	cv=none; b=WpBxVrjZGxCq3wCg1tayVP7pnsJ36PxjhbWIB0R6XJFjS8aPz4U443EYPePaJUudBCImgjPzzlqLOgpAudzwBNb3uh7POYUWjSiBZvsqwShjilLJoAltvjTZ+tU3eMGtLkzASvs1JrIK2fm/tB+H2PwARycM2kitZHAq2/pIdSA3Z5bcuVEdGDvzkAK2kRUkf8yFQi6tKTYVHpBGyjgx/NuEXaSZ64Mwv4BP6X41VROSOMnqdUIjpJeIoTRiG1v1VDJ2YJfdmtotZ/og1RT7oJNlaB+LqGrexSGhNMNhed3zt5i2YU90gvSEMHyayjNK1RKaLg+c6sG8Un3gZzxObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761216529; c=relaxed/relaxed;
	bh=XIqDQghZlZhA2j3vXrofXj4nyqm9LWXDw5cisRV0RGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBCXuiB/IzYEqLsaGfi/1jWsh6RTXRALJLyfhiApfWlFP/HJIrg2Y+IvM0UQzk3tICiTKZmaybSqtCg8AXuiBIF0LvXQuuWfdgqRoB0kUMtqr8rq7u/1gPxYRuIT1b8NH7INx8/f6z3RKhfMi+HD5CeOn2+a8fbianhl2Jj29Zz2mseyHep/Fx5CjFglX9yc0xwYzQrS56y9/Wm4LOO+AGyREP5RkdnYU4aqvkzYNG3gl7f7kBc28On1nYeAx5ZrDdTvNtEOjF6UJSzpcupGEGYQJXNPxbUzwDXsAlIujxc2mm+q6jecx5dED13LzOWWhDAerqmWK74rES9G8bVFpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csjSc0nDjz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 21:48:48 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id D164A200C2C2;
	Thu, 23 Oct 2025 12:48:45 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id C07944A12; Thu, 23 Oct 2025 12:48:45 +0200 (CEST)
Date: Thu, 23 Oct 2025 12:48:45 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
	kbusch@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
	mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v6 3/5] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
Message-ID: <aPoIDW_Yt90VgHL8@wunner.de>
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-4-xueshuai@linux.alibaba.com>
 <aPYKe1UKKkR7qrt1@wunner.de>
 <6d7143a3-196f-49f8-8e71-a5abc81ae84b@linux.alibaba.com>
 <aPY--DJnNam9ejpT@wunner.de>
 <43390d36-147f-482c-b31a-d02c2624061f@linux.alibaba.com>
 <aPZGNP79kJO74W4J@wunner.de>
 <30fe11dd-3f21-4a61-adb0-74e39087c84c@linux.alibaba.com>
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
In-Reply-To: <30fe11dd-3f21-4a61-adb0-74e39087c84c@linux.alibaba.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 20, 2025 at 11:20:58PM +0800, Shuai Xue wrote:
> 2025/10/20 22:24, Lukas Wunner:
> > On Mon, Oct 20, 2025 at 10:17:10PM +0800, Shuai Xue wrote:
> > > > >     .slot_reset()
> > > > >       => pci_restore_state()
> > > > >         => pci_aer_clear_status()
> > > > 
> > > > This was added in 2015 by b07461a8e45b.  The commit claims that
> > > > the errors are stale and can be ignored.  It turns out they cannot.
> > > > 
> > > > So maybe pci_restore_state() should print information about the
> > > > errors before clearing them?
> > > 
> > > While that could work, we would lose the error severity information at
> > 
> > Wait, we've got that saved in pci_cap_saved_state, so we could restore
> > the severity register, report leftover errors, then clear those errors?
> 
> You're right that the severity register is also sticky, so we could
> retrieve error severity directly from AER registers.
> 
> However, I have concerns about implementing this approach:
[...]
> 3. Architectural consistency: As you noted earlier, "pci_restore_state()
> is only supposed to restore state, as the name implies, and not clear
> errors." Adding error reporting to this function would further violate
> this principle - we'd be making it do even more than just restore state.
> 
> Would you prefer I implement this broader change, or shall we proceed
> with the targeted helper function approach for now? The helper function
> solves the immediate problem while keeping the changes focused on the
> AER recovery path.

My opinion is that b07461a8e45b was wrong and that reported errors
should not be silently ignored.  What I'd prefer is that if
pci_restore_state() discovers unreported errors, it asks the AER driver
to report them.

We've already got a helper to do that:  aer_recover_queue()
It queues up an entry in AER's kfifo and asks AER to report it.

So far the function is only used by GHES.  GHES allocates the
aer_regs argument from ghes_estatus_pool using gen_pool_alloc().
Consequently aer_recover_work_func() uses ghes_estatus_pool_region_free()
to free the allocation.  That prevents using aer_recover_queue()
for anything else than GHES.  It would first be necessary to
refactor aer_recover_queue() + aer_recover_work_func() such that
it can cope with arbitrary allocations (e.g. kmalloc()).

Thanks,

Lukas

