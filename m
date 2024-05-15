Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E86B08C6C37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 20:33:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=NNcmssn5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vfhgv2vP8z3dHL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 04:33:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=NNcmssn5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 28234 seconds by postgrey-1.37 at boromir; Thu, 16 May 2024 04:33:08 AEST
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vfhg823SDz3ccS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 04:33:07 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C9CD440E0244;
	Wed, 15 May 2024 18:33:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9vDdpDFf5kxS; Wed, 15 May 2024 18:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1715797979; bh=Hm7EEfZwJI4EYLlWeG98fmfbg67gUcFmPW/+3Lw+0eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNcmssn5qPrIpNNCkSfiTnfWD2z1w21vdoZu1NS83caf/javSnvE1oJXT+ZlXNp5G
	 mylWM8TFisrlSNRpcQ3QQUneVDN3u8tAOR49ZzTVUC45U3ROdrBp7IfKMmX/7t1LqA
	 5TcLzqUsT5yLDImfC7YT5HmUsx+BdgFE+vTShmPP3x3kcB65tPo0V6qL707YzidMw7
	 lqQoTm3p7XuTNoOIFjBWfpD+q8N9zcRvPzA4BtKg5GQ1VkqCj87ANfFS9Q5UqpKPx3
	 4uDufH5nyuc3d4/fjwQMqimEshOgxSeDlKKTjlUyvGKaS6DiOkY/3HLz54XzekSFQQ
	 Vh36R3bGRbKxksUZUUCjvUqWKPQ7HPoOJ+HDku4E1Kz5adIF8dHVkUn0McK4LNFcyL
	 woIewpgBkUvFMn8rqC65+jq7h7VyTMAOUXHqd2FSUJj+iufewUmeYbXHDiM3/nYDV8
	 CAZpPHRcwxRmeAfb2RpMrWKW8lfvw9Yl/ezfkC3ZQAjJa7AMx8VAemzLBa/52ZMFCx
	 WsvtIubJzBZJKHvT8or3pk0cLynKdR4Sooc7+g1mbqRaNNBomRgiJX44xcazeGspJf
	 rcMtWXcZ8SZXHxXkzvfnw1JrUuF8C9FjvAW669dUA98YboAOpXNSlKba7sqXLBo2rD
	 7xvQMItMtRQAEQ24XsxQ/6ww=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EA18940E016A;
	Wed, 15 May 2024 18:32:30 +0000 (UTC)
Date: Wed, 15 May 2024 20:32:22 +0200
From: Borislav Petkov <bp@alien8.de>
To: Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker
 poison errors
Message-ID: <20240515183222.GCZkT_tvEffgYtah4T@fat_crate.local>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
 <20240515104142.GBZkSRZsa3cxJ3DKVy@fat_crate.local>
 <ZkSUaVx3uCIPkpkJ@localhost.localdomain>
 <CAJHvVchGGJkEX=qroW=+N-RJDMDGuxM4xoGe7iOtRu9YcfxEEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJHvVchGGJkEX=qroW=+N-RJDMDGuxM4xoGe7iOtRu9YcfxEEw@mail.gmail.com>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Oscar Salvador <osalvador@suse.de>, Liu Shixin <liushixin2@huawei.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2024 at 10:33:03AM -0700, Axel Rasmussen wrote:
> Right, the goal is to still have the process get a SIGBUS, but to
> avoid the "MCE error" log message. The basic issue is, unprivileged
> users can set these markers up, and thereby completely spam up the
> log.

What is the real attack scenario you want to protect against?

Or is this something hypothetical?

> That said, one thing I'm not sure about is whether or not
> VM_FAULT_SIGBUS is a viable alternative (returned for a new PTE marker
> type specific to simulated poison). The goal of the simulated poison
> feature is to "closely simulate" a real hardware poison event. If you
> live migrate a VM from a host with real poisoned memory, to a new
> host: you'd want to keep the same behavior if the guest accessed those
> addresses again, so as not to confuse the guest about why it suddenly
> became "un-poisoned".

Well, the recovery action is to poison the page and the process should
be resilient enough and allocate a new, clean page which doesn't trigger
hw poison hopefully, if possible.

It doesn't make a whole lotta sense if poison "remains". Hardware poison
you don't want to touch a second time either - otherwise you might
consume that poison and die.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
