Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F4E8216ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 05:35:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Imn4NHmH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T40QY2B2Cz3bn8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 15:35:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Imn4NHmH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T40Pl1t67z2xQG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jan 2024 15:34:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0103BCE0B3A;
	Tue,  2 Jan 2024 04:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286D3C433C7;
	Tue,  2 Jan 2024 04:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704170088;
	bh=JZcgALy1yTy2guwrQqcrSDl+JYb10SnyOy5ifaFJCt4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Imn4NHmH7+iQMaCXAr4OQiHNzcC5VWaafvHFWbkJ6zVHu5rtKSEJr6f7LU2Q9QpHl
	 mkzPtVB/b4XCbHZDXZ4IMJb58BGGYJXIPcxILFdq7IooJMyCubPVXseTvZLTa/oPDq
	 HR7jl7abrbacQmWMsK+zB06000ViI7R31u8y/Ez/BJnB1Yk08KwJkPpuSzWLpHWjtM
	 2TfFjQwrX73YiJCmEMlx0bp0uaWIz9cY+GnReVPMGbiWEJ3DKyOHrjZ864/HgMlDvd
	 oPjA1CyHZJFoPmcltcO2y1CBsaFF1ZXGdVQW28/2Yr0eIAFi9ueg8hYmh109K/WMXS
	 7EexZXuYAqqGw==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH 4/5] powerpc/smp: Factor out assign_threads()
In-Reply-To: <20231229120107.2281153-4-mpe@ellerman.id.au>
References: <20231229120107.2281153-1-mpe@ellerman.id.au>
 <20231229120107.2281153-4-mpe@ellerman.id.au>
Date: Tue, 02 Jan 2024 10:04:42 +0530
Message-ID: <87frzgnyjh.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Pingfan Liu <kernelfans@gmail.com>, Pingfan Liu <piliu@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

....
  
> +static int assign_threads(unsigned cpu, unsigned int nthreads, bool avail,
>

May be rename 'avail' to 'present'

> +                          const __be32 *hw_ids)
> +{
> +	for (int i = 0; i < nthreads && cpu < nr_cpu_ids; i++) {
> +		__be32 hwid;
> +
> +		hwid = be32_to_cpu(hw_ids[i]);
> +
> +		DBG("    thread %d -> cpu %d (hard id %d)\n", i, cpu, hwid);
> +
> +		set_cpu_present(cpu, avail);
> +		set_cpu_possible(cpu, true);
> +		cpu_to_phys_id[cpu] = hwid;
> +		cpu++;
> +	}
> +

-aneesh
