Return-Path: <linuxppc-dev+bounces-11325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6BAB36159
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 15:08:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB7Jq5FlTz3dTJ;
	Tue, 26 Aug 2025 23:08:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756213723;
	cv=none; b=aId+KPclh97go30/QJGdYCKTx2SGmoI3rDdtccin1AGXjT02z9VjN/8f+9KTOjMU0ssYMQSynmXL/tXd/+YLncSzVObhsyloyyg8hdrudYB9M6HWhuFRq9ftSU6PXstDeHVjpTRu6cHliXYjzomO8bpD8+ANQlO9LejaJMnkzCQQuSrVq75XNbyBaFX8lPxwFutVYudWEcZulcztkNg76gy4Dg2/heTx5CzCI3SvhiNsxMvR3ozsC2CgJD2L4+912rZnnWAl4RAPIAkD8MofVfmDbXLErmvWEQKaeEco0+Zi+sV4Chdr4Tm1yBHwTrEoF5CqeP2icpI+6HdBtYCAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756213723; c=relaxed/relaxed;
	bh=JHZTLFlxAYI1wokhjuCEuruyUylGu43DM7IKjkNYSic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EL2merpS2HYp3GB8jriwhDbN3/DscNMKm3kluJlsrOe8TnW6HjIyKC9Qu5q0+bXkfD8m0HvNB2//ciXHZvdUFwkWm6Mmpqcwv23grRbU46xzfe5ELJLEyk19nSkNMqahs3X74r6fyis+E4Zt+kMFQj+SPlXwLh6seiD7A/LtSFqN9Gafol10j+kVoRrjUSdaHJhzqp1wmYNqrOqkySD8QxtRpIR6HWfedkCX80Abk+ltKZT6iE8V5tiBRzqAuyFS96vuVY15/Snaiemnf+WPX0llusGenxCNHd/JrTGCLmSJOc5n2vIh1UZRxEicO7v2xd/PrlyiZ5mnirMEX64pEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=etY5PLFf; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=etY5PLFf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB7Jm6yw3z3dTH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 23:08:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JHZTLFlxAYI1wokhjuCEuruyUylGu43DM7IKjkNYSic=; b=etY5PLFfHvVwRjOXszye/DGGB6
	EeDfwhUfPBBHElGIuEt4CBRy1AldhAFBccZnj543K6AV4Xvqq6pcdNIfqcf1J9sqxP9GTv1Rld421
	0AuJKLh2CRWDkm+Ul9/DFHMDYluLA3AIkv78pFeyA09fvuZwxu6ukwM8cR1N29k6qKImuFZmW3MMM
	qCVOi9ccAynQbDiNrFS78BcReEN5xdvzHPhO4NkOVApB1RYQ/p8auBap2lsOA66RFcIqiEM+p/Jrp
	EIJVtCqUjQE/N3Tepz7e+3E78hAlvb2elxzZDQC0yDBfD4BGP9yDnTXc67Vd2CW73P1jADDmWRbp0
	QXd2jvjA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtPb-00000002DYZ-2cEd;
	Tue, 26 Aug 2025 13:08:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A98B6300323; Tue, 26 Aug 2025 15:08:30 +0200 (CEST)
Date: Tue, 26 Aug 2025 15:08:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mingo@redhat.com, will@kernel.org, mark.rutland@arm.com,
	acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 17/19] perf: Retire PERF_PMU_CAP_NO_INTERRUPT
Message-ID: <20250826130830.GZ4067720@noisy.programming.kicks-ass.net>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <32bf39943eef7c7f516d814d749cdbe322eec204.1755096883.git.robin.murphy@arm.com>
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
In-Reply-To: <32bf39943eef7c7f516d814d749cdbe322eec204.1755096883.git.robin.murphy@arm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 13, 2025 at 06:01:09PM +0100, Robin Murphy wrote:
> Now that we have a well-defined cap for sampling support, clean up the
> remains of the mildly unintuitive and inconsistently-applied
> PERF_PMU_CAP_NO_INTERRUPT. Not to mention the obvious redundancy of
> some of these drivers still checking for sampling in event_init too.

Ah, clearly I should've read the next patch... n/m.

