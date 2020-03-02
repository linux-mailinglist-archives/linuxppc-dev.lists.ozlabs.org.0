Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 248A2175818
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 11:15:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WGHV6Kr9zDqZj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 21:15:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=OCTQ5OmV; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WGFQ01GszDqYp
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 21:13:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KDtV+b9cFlndjXE+4IObWypoEmyIhd+qmjWv7G9GcpQ=; b=OCTQ5OmV9g5OyjoYsMsXUUPFMS
 j2bs106DUvw3yN8koJmXq/m76PhI+yikxhgNztcxl+hxV9SgpKEW3Cq5MEZQuacxXIRGBhcOxb1ml
 BLgt6WGGQYFyU4YZasM+vMwhqhF0fsnIE6Xr9pLpYAPh+YHO8iC8Q+Qx0SCxYuLrMof/Iu5vogENh
 ycQ00kz3TEtoOv0hzj34n7gk1eMMWgPIpb33YGMKR7kWfia8Mx5CRSFk4T50soYE8SHidg9LE2Bul
 4H1cv0l723IriduKQsQ6B8n104XtephHJwvbDEHHAtvuv7ZwOLyTW+F58ZfUbKTSqFliB+yObPl0r
 WtDbvnPg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8i4t-0001nQ-Ey; Mon, 02 Mar 2020 10:13:35 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B7E303012C3;
 Mon,  2 Mar 2020 11:11:34 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 45912202A4098; Mon,  2 Mar 2020 11:13:32 +0100 (CET)
Date: Mon, 2 Mar 2020 11:13:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [RFC 00/11] perf: Enhancing perf to export processor hazard
 information
Message-ID: <20200302101332.GS18400@hirez.programming.kicks-ass.net>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, ak@linux.intel.com, maddy@linux.ibm.com,
 alexander.shishkin@linux.intel.com, jolsa@redhat.com,
 linux-kernel@vger.kernel.org, eranian@google.com, adrian.hunter@intel.com,
 robert.richter@amd.com, yao.jin@linux.intel.com, mingo@redhat.com,
 paulus@samba.org, acme@kernel.org, namhyung@kernel.org, kim.phillips@amd.com,
 linuxppc-dev@lists.ozlabs.org, alexey.budankov@linux.intel.com,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 02, 2020 at 10:53:44AM +0530, Ravi Bangoria wrote:
> Modern processors export such hazard data in Performance
> Monitoring Unit (PMU) registers. Ex, 'Sampled Instruction Event
> Register' on IBM PowerPC[1][2] and 'Instruction-Based Sampling' on
> AMD[3] provides similar information.
> 
> Implementation detail:
> 
> A new sample_type called PERF_SAMPLE_PIPELINE_HAZ is introduced.
> If it's set, kernel converts arch specific hazard information
> into generic format:
> 
>   struct perf_pipeline_haz_data {
>          /* Instruction/Opcode type: Load, Store, Branch .... */
>          __u8    itype;
>          /* Instruction Cache source */
>          __u8    icache;
>          /* Instruction suffered hazard in pipeline stage */
>          __u8    hazard_stage;
>          /* Hazard reason */
>          __u8    hazard_reason;
>          /* Instruction suffered stall in pipeline stage */
>          __u8    stall_stage;
>          /* Stall reason */
>          __u8    stall_reason;
>          __u16   pad;
>   };

Kim, does this format indeed work for AMD IBS?
