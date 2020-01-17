Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58932140EFA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 17:30:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zmky4YJmzDqyJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 03:30:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ak@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zmhq3PWkzDqk9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2020 03:28:39 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 08:28:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; d="scan'208";a="226395023"
Received: from tassilo.jf.intel.com (HELO tassilo.localdomain) ([10.7.201.21])
 by orsmga003.jf.intel.com with ESMTP; 17 Jan 2020 08:28:07 -0800
Received: by tassilo.localdomain (Postfix, from userid 1000)
 id B26C3300DE4; Fri, 17 Jan 2020 08:28:07 -0800 (PST)
Date: Fri, 17 Jan 2020 08:28:07 -0800
From: Andi Kleen <ak@linux.intel.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [RFC 5/6] perf/tools: Enhance JSON/metric infrastructure to
 handle "?"
Message-ID: <20200117162807.GL302770@tassilo.jf.intel.com>
References: <20200117124620.26094-1-kjain@linux.ibm.com>
 <20200117124620.26094-6-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200117124620.26094-6-kjain@linux.ibm.com>
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com, jmario@redhat.com,
 mpetlan@redhat.com, peterz@infradead.org, linux-kernel@vger.kernel.org,
 acme@kernel.org, linux-perf-users@vger.kernel.org,
 alexander.shishkin@linux.intel.com, yao.jin@linux.intel.com,
 anju@linux.vnet.ibm.com, jolsa@kernel.org, gregkh@linuxfoundation.org,
 namhyung@kernel.org, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 17, 2020 at 06:16:19PM +0530, Kajol Jain wrote:
> Patch enhances current metric infrastructure to handle "?" in the metric
> expression. The "?" can be use for parameters whose value not known while
> creating metric events and which can be replace later at runtime to
> the proper value. It also add flexibility to create multiple events out
> of single metric event added in json file.

Please add a proper specification how this ? thing is supposed to work,
what the exact semantics are, how it is different from the existing
# mechanism etc.

The standard way to do similar things before was to define an explicit
# name and let the expr code take care of it. 

-Andi 
