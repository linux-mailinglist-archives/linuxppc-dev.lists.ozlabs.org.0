Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C42E730D9D5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:33:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW1L74WpMzF34J
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 23:33:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW09c0GcczDwt7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:36 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09Z3R2Bz9vFp; Wed,  3 Feb 2021 22:40:33 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Kajol Jain <kjain@linux.ibm.com>,
 mpe@ellerman.id.au
In-Reply-To: <20201228085204.18026-1-kjain@linux.ibm.com>
References: <20201228085204.18026-1-kjain@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/perf/hv-24x7: Dont create sysfs event files
 for dummy events
Message-Id: <161235200024.1516112.6434992509698512056.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:33 +1100 (AEDT)
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
Cc: suka@us.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Dec 2020 14:22:04 +0530, Kajol Jain wrote:
> hv_24x7 performance monitoring unit creates list of supported events
> from the event catalog obtained via HCALL. hv_24x7 catalog could also
> contain invalid or dummy events with names like RESERVED*.
> These events does not have any hardware counters backing them.
> So patch adds a check to string compare the event names
> to filter out them.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf/hv-24x7: Dont create sysfs event files for dummy events
      https://git.kernel.org/powerpc/c/e5f9d8858612c192a4326f39ed16c91c3a9e0893

cheers
