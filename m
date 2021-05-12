Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC8337CF02
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 19:28:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgMFf4TS7z30BM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 03:28:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZCckaik/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=ZCckaik/; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgMF612hXz2yY0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 03:27:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=n2kSoXVjaG6r/aRDrddKurJtkE5bpmO12SFICV7/2rE=; b=ZCckaik/4Prk5oi4ppy8WJzuW4
 nMhmnAJ6FhRh+cGcStqFfzAxzUYoLKu7uWpd6N0+p+m6Ol9szTYKuoPRhBS3HHp4wbb2n45QYWavW
 NrBKSL15dNcdwdd8tEaK1m/BAa94fJ71hw4hCVLBIK6yxSUCqcII+5YPaGKv2YFN92QLBdgN6PbrN
 Y7m4ECNGxX2KjnGxg2eLznHogcNf5Vou9OW54nIPIoKVIMUr90N0Vda8SFRUB+sUtHvmcRfhYyPD1
 onFNWEGt73nEjCm0n4w8+HSa7kAE+YnicCAtpcoWNn37s+VRqe5qfB03G/J76CmNYIltOLAIHKwCd
 vCEBpQ3w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lgsdm-003RZC-JK; Wed, 12 May 2021 17:27:24 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8F7313001E1;
 Wed, 12 May 2021 19:27:16 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4BBF020B6C70F; Wed, 12 May 2021 19:27:16 +0200 (CEST)
Date: Wed, 12 May 2021 19:27:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [RFC 1/4] drivers/nvdimm: Add perf interface to expose nvdimm
 performance stats
Message-ID: <YJwP9ByvAcDPixVN@hirez.programming.kicks-ass.net>
References: <20210512163824.255370-1-kjain@linux.ibm.com>
 <20210512163824.255370-2-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512163824.255370-2-kjain@linux.ibm.com>
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
Cc: santosh@fossix.org, maddy@linux.vnet.ibm.com, ira.weiny@intel.com,
 linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org,
 atrajeev@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com, vaibhav@linux.ibm.com,
 dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 12, 2021 at 10:08:21PM +0530, Kajol Jain wrote:
> +static void nvdimm_pmu_read(struct perf_event *event)
> +{
> +	struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
> +
> +	/* jump to arch/platform specific callbacks if any */
> +	if (nd_pmu && nd_pmu->read)
> +		nd_pmu->read(event, nd_pmu->dev);
> +}
> +
> +static void nvdimm_pmu_del(struct perf_event *event, int flags)
> +{
> +	struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
> +
> +	/* jump to arch/platform specific callbacks if any */
> +	if (nd_pmu && nd_pmu->del)
> +		nd_pmu->del(event, flags, nd_pmu->dev);
> +}
> +
> +static int nvdimm_pmu_add(struct perf_event *event, int flags)
> +{
> +	struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
> +
> +	if (flags & PERF_EF_START)
> +		/* jump to arch/platform specific callbacks if any */
> +		if (nd_pmu && nd_pmu->add)
> +			return nd_pmu->add(event, flags, nd_pmu->dev);
> +	return 0;
> +}

What's the value add here? Why can't you directly set driver pointers? I
also don't really believe ->{add,del,read} can be optional and still
have a sane driver.
