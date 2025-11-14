Return-Path: <linuxppc-dev+bounces-14189-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CE4C5F931
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Nov 2025 00:25:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7YD45b7Tz2yvv;
	Sat, 15 Nov 2025 10:25:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763162756;
	cv=none; b=h7IjtC7087tqOUgeFBlhmxJIj3rRfTRWlg8mL5la21LIv939wIQRx3qxb10OEodN0hwkF1fgiWnZRAF3Mudc0QQJagzsWuAyfzRKH/D0kEaEYWyy4jh/wOy9XyU9BQkljjxvyz73Qx2rbS+SmMpxTEH2+PNvsdwr7d43JsZKQEPO39pD4gp00Cx4/HEJCuF7oW+By3M2PEpnuZeWb/eLsWTtDdgoIdpH+iad9YSJO4jdpfJNaEClpr3+Y7bCanWGKae4sOIenhNF0jIFHV3V0NuDj41etl+oH2U6+C2e973LYT+EgXX26dTF7hneu1y+Wh3GHrqoGsGx9E3VQFUFNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763162756; c=relaxed/relaxed;
	bh=BaIz4X/5I9tklFh7cNp7+RRcYCvDSJ7PDGNKJW0xrLQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fBf3c7zC9Uu0NWPt4tSfucm5dSnbmcq5M5nGeCzVOvYjY/0FEKC65Xd5ZPvaD5GH556vasPoZBm+JRsHBmWYQMp5mx7AR/6peXFqmugEYGJ373al23NIA3TREo5aJA9mz4hQVpIyQ2XR0nh60/WZ/lNsBvV5e+7g+vUXwvJ4BSjC7cULVQniZsWSs7qFU/fyWIomvoq6kp6eKtQIqN9jSI8k51QT2YklQhBipYQ6UHi+JJM9gI9VLc9E37e4Fy6BomNhbu3tCqLvwrm3eZWEs8EGx7vzFPC3mxxt97qLGIWV1Hsp7x6Xf7ctnoEa0+5ZGzQoMqeRpXviMmfR4UzeZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=1/R9MxMJ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=1/R9MxMJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7YD32pDPz2xqk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 10:25:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C60DA60180;
	Fri, 14 Nov 2025 23:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E886C116D0;
	Fri, 14 Nov 2025 23:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1763162751;
	bh=Ck5IkKtCvWM+M1Kp2duA/OeRrzLgopnF8GA+ov+y++s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=1/R9MxMJfU+i9uYcVVt5kq9wz3T2Nm4N9M3jU5sMGuvNfeB4RE8Bn7K4W8Yw4k+aj
	 O9E4t2TkpXz3+fNH8/hVvX22UdJO7v2ev7K2CJ0VvcTJxWqIcXj/wuQoVqyXFTTy4W
	 8IvMlRI+ccVcHeuqm2Yx961xfOqZ9llp6m3vPFY4=
Date: Fri, 14 Nov 2025 15:25:50 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, Aditya Gupta <adityag@linux.ibm.com>,
 Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, Hari Bathini
 <hbathini@linux.ibm.com>, Jiri Bohac <jbohac@suse.cz>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Pingfan
 Liu <piliu@redhat.com>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shivang Upadhyay <shivangu@linux.ibm.com>, Sourabh Jain
 <sourabhjains@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, kexec@lists.infradea
Subject: Re: [PATCH v4 0/5]  kexec: reorganize sysfs interface and add new
 kexec sysfs
Message-Id: <20251114152550.ac2dd5e23542f09c62defec7@linux-foundation.org>
In-Reply-To: <20251114051504.614937-1-sourabhjain@linux.ibm.com>
References: <20251114051504.614937-1-sourabhjain@linux.ibm.com>
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

On Fri, 14 Nov 2025 10:44:59 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:

> All existing kexec and kdump sysfs entries are moved to a new location,
> /sys/kernel/kexec, to keep /sys/kernel/ clean and better organized.
> Symlinks are created at the old locations for backward compatibility and
> can be removed in the future [02/05].
> 
> While doing this cleanup, missing ABI documentation for the old sysfs
> interfaces is added, and those entries are marked as deprecated
> [01/05 and 03/05]. New ABI documentation is also added for the
> reorganized interfaces. [04/05]
> 
> Along with this reorganization, a new sysfs file,
> /sys/kernel/kexec/crash_cma_ranges, is introduced to export crashkernel
> CMA reservation details to user space [05/05]. This helps tools
> determine the total crashkernel reserved memory and warn users that
> capturing user pages while CMA is reserved may cause incomplete or
> unreliable dumps.

Patchset does three unrelated things in remarkably random order.

1: Document existing stuff

	Great, thanks, in it goes.

2: export crashkernel CMA reservation to userspace

	Well, OK, probably reasonable, didn't look closely.

3: Alter longstanding userspace ABI with deprecation plan

	Whoa, tricky, needs careful consideration.


So can we please prepare and consider this material in three separate
patchsets?  In the above order, I suggest.

