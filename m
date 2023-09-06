Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D76FE793845
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 11:31:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t1ywYpjT;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=y2ltyVw5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgcZk59M4z3c2K
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 19:31:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t1ywYpjT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=y2ltyVw5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgcYs3N0cz2xm6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Sep 2023 19:30:57 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 2B8C720292;
	Wed,  6 Sep 2023 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1693992654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XjnQopGq/uLFLC5cC5K58nxffVQJcRXw+uVRmEAntTc=;
	b=t1ywYpjTXP5YD617quxeXYS6qPb8fIP9CKa7m0ngnlx/f1XCgESkTM3H47JG7MS6cmS0Il
	+wuvIVKqAqxS2t8VNQbtpDXAFrupcLrY1wPMTFzunWB29N74swOrSCH86qZkaqu+FGpqsk
	ECOJ2OJZLmjGv0Ua+qgYXGmuZRPOawI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693992654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XjnQopGq/uLFLC5cC5K58nxffVQJcRXw+uVRmEAntTc=;
	b=y2ltyVw5f0oYhqxj6NloN3roDOsXZzXyFXlB/Ak160k0U3fX4QHwtWr4TZ1zprcOHPxGEh
	IsJE6jBNUJrDB0Aw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 10D8C2C143;
	Wed,  6 Sep 2023 09:30:54 +0000 (UTC)
Date: Wed, 6 Sep 2023 11:30:52 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: nathanl@linux.ibm.com
Subject: Re: [PATCH RFC 0/2] powerpc/pseries: new character devices for RTAS
 functions
Message-ID: <20230906093052.GY8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Tue, Aug 22, 2023 at 04:33:38PM -0500, Nathan Lynch via B4 Relay wrote:
> This is a proposal for adding chardev-based access to a select subset
> of RTAS functions on the pseries platform.
> 
> The problem: important platform features are enabled on Linux VMs
> through the powerpc-specific rtas() syscall in combination with
> writeable mappings of /dev/mem. In typical usage, this is encapsulated
> behind APIs provided by the librtas library. This paradigm is
> incompatible with lockdown, which prohibits /dev/mem access.
> 
> The solution I'm working on is to add a small pseries-specific
> "driver" for each functional area, exposing the relevant features to
> user space in ways that are compatible with lockdown. In most of these
> areas, I believe it's possible to change librtas to prefer the new
> chardev interfaces without disrupting existing users.

thanks for the driver.

> 
> I've broken down the affected functions into the following areas and
> priorities:
> 
> High priority:
> * VPD retrieval.
> * System parameters: retrieval and update.
> 
> Medium priority:
> * Platform dump retrieval.
> * Light path diagnostics (get/set-dynamic-indicator,
>   get-dynamic-sensor-state, get-indices).
> 
> Low priority (may never happen):
> * Error injection: would have to be carefully restricted.
> * Physical attestation: no known users.
> * LPAR perftools: no known users.
> 
> Out of scope:
> * DLPAR (configure-connector et al): involves device tree updates
>   which must be handled entirely in-kernel for lockdown. This is the
>   object of a separate effort.
> 
> See https://github.com/ibm-power-utilities/librtas/issues/29 for more
> details.
> 
> In this RFC, I've included a single driver for VPD retrieval. Clients
> use ioctl() to obtain a file descriptor-based handle for the VPD they
> want. I think this could be a good model for the other areas too, but
> I'd like to get opinions on it.

The call has parameters so it cannot be reasonably done with sysfs or
similar.

The paramater is string which is unweildy with ioctl, and netlink has
helpers for getting strings into and out of messages without garbage
pointers nad crashes. However, netlink does not have permissions, and
setting permissions for the different platform features available
through rtas is desirable.

Then this is as good as it gets with the kernel facilities Linux
provides.

Thanks

Michal
