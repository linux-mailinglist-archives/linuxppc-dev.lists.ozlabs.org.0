Return-Path: <linuxppc-dev+bounces-7044-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D4FA60B32
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 09:22:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDcmw6rgdz3cY1;
	Fri, 14 Mar 2025 19:22:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741940560;
	cv=none; b=mLAcb54F1Fo6265TwWSKPEb++Oe6NLNrTeEh9bu/9gyhJOXQ0d/9AJLGNR1rtJKuO7seY8v8Wzed+Xwfq50SOcMLVSc2UZEskwpuvREHTvq1SNPzZ4NxsfhSGRVT//ghkHMBQa5nkJBldxd/TPF0S3lAim14j4+MjCkCfAMkWqcLZHf6bMbN+rH8ITxuZ3T/KxJ/jreHRYZHIMEj7nA69opIeHL7Fk5G0etjBlOePT37w6S2QvN+03U7l73M0Bn2eY/y7jPQTWP1NrH2DF1DtmMhjHq1Mnnwg7GHKTWrs9DbbpvI9LcmNi0q8QuKsRh5nH1j0zyjIq4Wm5oVr+DYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741940560; c=relaxed/relaxed;
	bh=ulB7sU4TrDWZ83X7O9VxHR74B0B3mMQ+ktSlUJadwxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGOGfL0DySjysrGPtFs/d9wJ6EGr8BXYIJ8W16T7zUp9AA+64iUQ8aJikIBqOO4wgefNqf8tYFGUqr6If3GGwi7RnIidd7KQNLyz6sO9/LJwQUxDeg5qBZdQTUP0FaiPf6a82a7sUqN6b+wS1I42j38PYMKglSukfs3oErMmGbvwdfgOCNfwkGFSBA3ca4QDlzGdWCE5l96za0vixOX9Mg0/rdubLmXV1iA7i/2BYTH8jY/n7e6ihR5gCk63FLPCyHfP29DhB6dGCNMgCsGr0f+HgYr5hpyWCrzSJbJfwKDJREXt1ZVqWK8w1dAmYLWVpIl3RVkdt5ANvsjxSiveOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bDVTCoWM; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bDVTCoWM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDcmq26yjz3cXB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 19:22:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ulB7sU4TrDWZ83X7O9VxHR74B0B3mMQ+ktSlUJadwxk=; b=bDVTCoWMTivCC6oZVyAvQ1D2FP
	SpZWZEZdK5KtY6u0anf13eYS8NU2lgnOw6au2ujPz3Io1y1MFdQq1aDiYKX4xdQxQ66oYN6DP0ste
	nDnCxuyY8vWvmT6UB2oZb/Rwli3tZuAjAbwYi4FIzJPKTT6gIdGYkg2JYYWc1p32PndKQaQHU20fL
	UP5yaamQIjiTttNt+fFpwG6OT/GxJuFz5vjx5xcToiPZCfih52/qxk/WtTtUQGt7lzSEzGk3up8DA
	QKoCQBttKWQ+hvJjIjkxv+g8DZa7SsFT770kYRDBQiZb4GwbPM/cW+L4eUEJ+50cwTFjKQyBj5OQA
	Uq5ywXZQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0JF-00000002rPI-1dcq;
	Fri, 14 Mar 2025 08:22:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B01E03006C0; Fri, 14 Mar 2025 09:22:23 +0100 (CET)
Date: Fri, 14 Mar 2025 09:22:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
	fbarrat@linux.ibm.com, ajd@linux.ibm.com, mahesh@linux.ibm.com,
	oohall@gmail.com, hbathini@linux.ibm.com, dhowells@redhat.com,
	haren@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] powerpc: fadump: use lock guard for mutex
Message-ID: <20250314082223.GT5880@noisy.programming.kicks-ass.net>
References: <20250314054544.1998928-1-sshegde@linux.ibm.com>
 <20250314054544.1998928-4-sshegde@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314054544.1998928-4-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Mar 14, 2025 at 11:15:41AM +0530, Shrikanth Hegde wrote:
> use guard(mutex) for scope based resource management of mutex.
> This would make the code simpler and easier to maintain.
> 
> More details on lock guards can be found at
> https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/kernel/fadump.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4b371c738213..5fd2c546fd8c 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1374,15 +1374,13 @@ static void fadump_free_elfcorehdr_buf(void)
>  
>  static void fadump_invalidate_release_mem(void)
>  {
> -	mutex_lock(&fadump_mutex);
> +	guard(mutex)(&fadump_mutex);
> +
>  	if (!fw_dump.dump_active) {
> -		mutex_unlock(&fadump_mutex);
>  		return;
>  	}
>  
>  	fadump_cleanup();
> -	mutex_unlock(&fadump_mutex);
> -

This will result in running the below functions with the mutex held.

>  	fadump_free_elfcorehdr_buf();
>  	fadump_release_memory(fw_dump.boot_mem_top, memblock_end_of_DRAM());
>  	fadump_free_cpu_notes_buf();


The equivalent transformation for the above code would look like:

static void fadump_invalidate_release_mem(void)
{
	scoped_guard (mutex, &fadump_mutex) {
		if (!fw_dump.dump_active)
			return;

		fadump_cleanup();
	}

	fadump_free_elfcorehdr_buf();
	...

