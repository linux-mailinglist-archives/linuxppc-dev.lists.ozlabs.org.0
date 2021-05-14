Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC88E3808DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 13:48:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhRc45dGzz3bnS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 21:48:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RhZRKiZs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=RhZRKiZs; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhRbZ2Krbz2ym6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 21:47:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9+rh5toy6w7tSZKTYyXb9xGpei7fnwqJwkaQ76SHrhM=; b=RhZRKiZs8yRPgN+DkBxlK/W39E
 EDrXRZzdDv4sK9rr+ahPrxlAV+O+mOfCQmwpX30btZfKLkkMtmEb66RPvTy2aFcP/bzCXYi5nsIsE
 w4jZwGTiMbqPww8VUZ24dl81dUO2Ij8JPHS4SWrftGxqE6DHHzvWk6vQZcvpj7lA8MajQPM3rp8ct
 meAaSN+khRlZ4XBBwGOSKFYwL8nnffi+vJtZFR3r8tF7ae39CFt2qOhWF9LAz9hGsV4K+Ll5ru3oi
 yIJ+MIrrmIJXIj6RBIWTUxMkLwWq713CONMFpeLKEDzildtr4YQxa6vuoE/0WUDdC+bR8Gi8+WNAw
 DMHgGQzw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lhWHl-007xqp-1z; Fri, 14 May 2021 11:47:17 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E2F7A30001C;
 Fri, 14 May 2021 13:47:15 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5B67B20829F97; Fri, 14 May 2021 13:47:15 +0200 (CEST)
Date: Fri, 14 May 2021 13:47:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kajoljain <kjain@linux.ibm.com>
Subject: Re: [RFC 1/4] drivers/nvdimm: Add perf interface to expose nvdimm
 performance stats
Message-ID: <YJ5jQ1ixz7D0Ij2R@hirez.programming.kicks-ass.net>
References: <20210512163824.255370-1-kjain@linux.ibm.com>
 <20210512163824.255370-2-kjain@linux.ibm.com>
 <YJwP9ByvAcDPixVN@hirez.programming.kicks-ass.net>
 <37015d53-050a-acef-2958-b1ff5d02800b@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37015d53-050a-acef-2958-b1ff5d02800b@linux.ibm.com>
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

On Thu, May 13, 2021 at 05:56:14PM +0530, kajoljain wrote:

> But yes the current read/add/del functions are not adding value. We
> could  add an arch/platform specific function which could handle the
> capturing of the counter data and do the rest of the operation here,
> is this approach better?

Right; have your register_nvdimm_pmu() set pmu->{add,del,read} to
nd_pmu->{add,del,read} directly, don't bother with these intermediates.
Also you can WARN_ON_ONCE() if any of them are NULL and fail
registration at that point.
