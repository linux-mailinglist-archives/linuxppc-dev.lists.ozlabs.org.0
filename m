Return-Path: <linuxppc-dev+bounces-14461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C65DC81CA0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 18:05:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFXJ62Jysz30B4;
	Tue, 25 Nov 2025 04:05:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764003910;
	cv=none; b=hLaKsmCoRmfduD78PFI7ktjTC65gw3Kf7uD2tQK+iT5A7J5G9/xNiBJqeZBwWtVp4KGFIglcEt+27h2vD9zy5jXns81SGyRFbOBPgZ7TKMsT0gZ0Ncv5QZSydKK3NSDL/+jJuK6pSc2AmY9zp+8NYfa+yOuPr0RUx0gY65wpaM8VJBt2Lh3+YcAlwP45M0IbZaX3RA488w4Axh8LMDa9xefwsRjXBK9Wl6oAn+BjHCYA1W4AVJRnhWjTLRjhRY0YDxBUd8sF3CSDCWftNqrqc+Wxjv00VGny+Y9ov6EgYo65ITb8a0DHYEgkmq4bD1vCTnJBnK/TC9aAfOV9YGHOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764003910; c=relaxed/relaxed;
	bh=6d1Eh1ili1NP0ctEBSfz61thfSkOLbKMxnLdKQNCoPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKKT3JDePjdeJ2lSUD/0J3pvFBKBD1VPp0G6BDBy2bLvbv0aj1qbkLaGsEYe2EWGkWGpr+uwKUoiDZIPFQEuvL5mrXam6dI+0ftgkEbgkMY23uDu+d5zc5UguQea0G99cXEmjLCkC8l4N1qp4nGhtlhDv4FpXGXztTSrjAgsHvsD2YGoCzUFC7nnQAHGkRQJ3TOa+m4Pmm3nc0/hfM/cym5HuE632/pM94ER/xhyxaTlRfRMnDcRDn+HGO0RGwXgZpMKGD3+ZrF+Q1PjzRbd2mwldr2gDoMFSRg0EUnG6dLdPAgpHQWZUT61myJ0upb+G/kUPvAnV20shVGh6SPBmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=K+421HU7; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=K+421HU7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFXJ54rDYz305M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 04:05:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 183AB60173;
	Mon, 24 Nov 2025 17:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DE1C4CEF1;
	Mon, 24 Nov 2025 17:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764003906;
	bh=D3KrTWBY6jm2x9Hlo2t7wMeEpeX0KvUBsFsMbqIhc2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+421HU7jXKTq/rssClIwxW2gbgjEygTlAxVGxzWNzfE3uBv2/vh8nYpCKJqPhUif
	 h+k5xJaRSeYq0Y4yt0OaMMTDiCTzySK7AC21uyjvR76Ts4TRrDiam7ViR0Uwuwop/o
	 1mlMGnNYVUN1lu29pzRqmRmjIhLbxBGvuWI8legg=
Date: Mon, 24 Nov 2025 18:05:04 +0100
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
Subject: Re: [PATCH 00/17] Paravirt CPUs and push task for less vCPU
 preemption
Message-ID: <2025112454-phonics-crept-5b98@gregkh>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
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
In-Reply-To: <20251119124449.1149616-1-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 19, 2025 at 06:14:32PM +0530, Shrikanth Hegde wrote:
> Detailed problem statement and some of the implementation choices were 
> discussed earlier[1].
> 
> [1]: https://lore.kernel.org/all/20250910174210.1969750-1-sshegde@linux.ibm.com/
> 
> This is likely the version which would be used for LPC2025 discussion on
> this topic. Feel free to provide your suggestion and hoping for a solution
> that works for different architectures and it's use cases.
> 
> All the existing alternatives such as cpu hotplug, creating isolated
> partitions etc break the user affinity. Since number of CPUs to use change
> depending on the steal time, it is not driven by User. Hence it would be
> wrong to break the affinity. This series allows if the task is pinned
> only paravirt CPUs, it will continue running there.
> 
> Changes compared v3[1]:

There is no "v" for this series :(


