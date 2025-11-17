Return-Path: <linuxppc-dev+bounces-14223-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F93C6590F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 18:42:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9FSC4hHlz2yw7;
	Tue, 18 Nov 2025 04:42:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763401339;
	cv=none; b=S+Sl8V2M7l0zo8y8VI7qcnhleR3p1k7eT3ENdA9ywrgql+Y8bQaXXEAWdu/RN7aqsS1OXGszUiMe2tq+Hwj+oaTyNp1edHEZyH6BxLD1GwqkHoG7+CkVMb1wcDmcHZsV8rifkKqjCFOgVrIUn40swVz8uik5nqfCAh2mMZbHkQLUskpsQD/286wN4AJmSzdTT1llsrJ/n5ZeAxsb6fPl9SlQa0z4pkjbvvGQ5fbcjnC7OuSwIbIsIB/A0YwtY32a2NiHsifYEjY45WR9D/M20n+mZ/Uti5HKaf7mlTmNmpoi8c57VElzF6nzvaBe0jJr1IOKUSvFryDVIY5BIpb4gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763401339; c=relaxed/relaxed;
	bh=V09tqgio/5WQGP8FSY1WM0juAmErgLmMVoa8McDMUog=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UD5f11w4Cvz8CiSnOnoZiH33dWAOGj80bc45MUIKB2mqaxsY8jGDcEJOfxi4t+CQ8X0FXhd0dkplfzclz2oduP9pBwbkSDslbrLEmZtsDY9asNL5++kissw4+VEpgOpfFXjWW7z/1Be35w1VjUqX4/q50aJ6Txi7PFD+MaphkboU/71l96JtKKLfhxIdrldpRAtQB2gtboQBDDDTopg3MyHiesIJ1IG0fooUoA/XwQDYNGAuLxh6lY2YSO81aRryvlyrA9wxUe0KFhyf7qYvnx7YzjEd//Pt4agJjtrjeNav0RKN+myE9E0jp4ryt4I7dbcnYXZQVf+XS6oLFurIew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=DQoXvktm; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=DQoXvktm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9FSB38JKz2ynC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 04:42:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02D5F43994;
	Mon, 17 Nov 2025 17:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5508DC2BC86;
	Mon, 17 Nov 2025 17:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1763401334;
	bh=w0p1v++RTpuyBAjT0eUWhhxTf67ilWlrGRyoUiKT4a4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DQoXvktmxAfHjyepWEkf5wYROY3GpQZtVzvErgZ/AJQSG7rh1jsQznTG7YG2Q3RHC
	 bupEyUy+IQIVzIsm/v6tS8YHFuEDcXkb4xmOZZTGkw2MZIGsRhKxLj+Z4JzNHd4y8C
	 iuT1falMSc5bBEIunhrDSUIPbV14qD+H/leqNoa0=
Date: Mon, 17 Nov 2025 09:42:11 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, Aditya Gupta <adityag@linux.ibm.com>,
 Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, Hari Bathini
 <hbathini@linux.ibm.com>, Jiri Bohac <jbohac@suse.cz>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Pingfan
 Liu <piliu@redhat.com>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shivang Upadhyay <shivangu@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org
Subject: Re: [PATCH v5] crash: export crashkernel CMA reservation to
 userspace
Message-Id: <20251117094211.f8b4426ddda3bc0db5a62624@linux-foundation.org>
In-Reply-To: <20251117041905.1277801-1-sourabhjain@linux.ibm.com>
References: <20251117041905.1277801-1-sourabhjain@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 17 Nov 2025 09:49:05 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:

> Add a sysfs entry /sys/kernel/kexec/crash_cma_ranges to expose all
> CMA crashkernel ranges.
> 
> This allows userspace tools configuring kdump to determine how much
> memory is reserved for crashkernel. If CMA is used, tools can warn
> users when attempting to capture user pages with CMA reservation.
> 
> The new sysfs hold the CMA ranges in below format:
> 
> cat /sys/kernel/kexec/crash_cma_ranges
> 100000000-10c7fffff
> 
> There are already four kexec and kdump sysfs entries under /sys/kernel.
> Adding more entries there would clutter the directory. To avoid this,
> the new crash_cma_ranges sysfs entry is placed in a new kexec node under
> /sys/kernel/.

I suggest not creating /sys/kernel/kexec in this patch.

Moving everything into a new /sys/kernel/kexec is a separate patchset
and a separate concept and it might never be merged - it changes ABI!

So let's put crash_cma_ranges in /sys/kernel and move it to
/sys/kernel/kexec within the other patchset.



