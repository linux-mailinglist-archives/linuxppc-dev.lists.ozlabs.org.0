Return-Path: <linuxppc-dev+bounces-14460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8837C81C97
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 18:04:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFXHr3dkTz2yvB;
	Tue, 25 Nov 2025 04:04:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764003896;
	cv=none; b=Zr6aMwTDo8ALMSKyqQJzoFeCSAyWkPAnnD2QLzbI/bE06+WJeeXjLRZt9q2kCfODtBCXbzcBoptxnkF5mQ5SrG+bfOXKiiwaq7fKsNMmqwoMHP4GEF33GPoYCF3vUxDWYQgR8nvb5BSYN+gNqJLyXzxb/X21ZM6Pdkj9Gezigl0hcKssOqdMhNS2FvwG9WOZUwJoaFt2QoHzY6uCpnTbaS6zfJv3b6kvU8rrDvbk5qqsckHRZwIpLUTEEZkoxP3iyOLJ+1QV34+bZleCrKfrSbkRjDcp39XKcQRL/b8j5e4LigAU0yny6NGfE81niMPqh/c40bI8dTMvYdqnTQbdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764003896; c=relaxed/relaxed;
	bh=KIxkg5GWPssfZKNP4pnfMxab+vwHZ3NIaAOB9PJkGRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UoZZOZu3/HPVKEvyhOkdDhEFUi3sp4+/aggLzdkucxcAe7MNSC5bcs141Zm1Sbos6Ujhm4bnZHTt6I6ZguLDl/GNUx8QOr/QBhQBKLlUbapjQ8PiHVM4iC+M1S5iiHgmkXRzk5m+2ZYxTD7YYtNviwMJRGupP8IVtUkdRcfYq4bE+6JFpKxMmNrkLk6ys2/VYgWGksIu9MEPs1Ass3bEQ1H/5K4XBenqQK0GydwaPyxI2428HlbOFsGzDIoOkIwZmzkeXpZGPQtZZ3i3xTvQfZVydDX6xzDSma3PW6BSxW8K0lxUwdYkW1/J/jHQsTGgsF3hhcmN3IgX3n2JzvmEKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ozLhTwis; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ozLhTwis;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFXHq0ZTLz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 04:04:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 558E0441F1;
	Mon, 24 Nov 2025 17:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4B8C4CEF1;
	Mon, 24 Nov 2025 17:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764003891;
	bh=S8Qrg4iC2yFDCaP1xktH5LChT86VwXzFCdOf6j/SW90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozLhTwisGPVHdVMpnBmWnfSEk1gY7IbGb+GqIiObQDXU+pzI+npScjcyDVTnzlycS
	 +na6JWOBGQBDkjXx31M2mCjS4xtDIsNTf5arVXUzgs41Dm6VoKrSsAeTMyg8OVGLJ8
	 Xbw+aj+Kfz49W4fztQ9xGzfoPzmHVcZ7L64kwJZk=
Date: Mon, 24 Nov 2025 18:04:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de,
	yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
	pbonzini@redhat.com, seanjc@google.com, kprateek.nayak@amd.com,
	vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
	rostedt@goodmis.org, dietmar.eggemann@arm.com,
	christophe.leroy@csgroup.eu
Subject: Re: [PATCH 16/17] sysfs: Provide write method for paravirt
Message-ID: <2025112409-rockstar-shortcake-1892@gregkh>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
 <20251119124449.1149616-17-sshegde@linux.ibm.com>
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
In-Reply-To: <20251119124449.1149616-17-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 19, 2025 at 06:14:48PM +0530, Shrikanth Hegde wrote:
> This is a debug patch which could be used to set the range of CPUs as
> paravirt. 
> 
> One could make use of this for quick testing of this infra instead of writing
> arch specific code. This allows checking some corner cases by providing custom
> cpumasks which isn't possible with arch method.
> 
> echo 100-200,600-700 >  /sys/devices/system/cpu/paravirt
> cat /sys/devices/system/cpu/paravirt
> 100-200,600-700
> 
> echo > /sys/devices/system/cpu/paravirt
> cat /sys/devices/system/cpu/paravirt
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> This is currently not meant be merged, since paravirt sysfs file is meant
> to be Read-Only. Hence the documentation hasn't changed. If this method is
> really helpful, then can consider including it depending on the
> discussion.

As you added this to this series, if it is picked up, it WILL be merged
:(

Please try a "Nacked-by:" or something else to keep patches from being
applied.  Or better yet, send them as a totally separate series.

thanks,

greg k-h

