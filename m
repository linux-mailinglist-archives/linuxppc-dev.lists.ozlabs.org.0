Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B6E647026
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:55:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSYz21BLhz3fhb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:55:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYrw2TwKz3c6d
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:52 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYrw1KpKz4xvT;
	Thu,  8 Dec 2022 23:49:52 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20221130174513.87501-1-kjain@linux.ibm.com>
References: <20221130174513.87501-1-kjain@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/hv-gpci: Fix hv_gpci event list
Message-Id: <167050320468.1457988.5897072817386860580.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:40:04 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 30 Nov 2022 23:15:13 +0530, Kajol Jain wrote:
> Based on getPerfCountInfo v1.018 documentation, some of the
> hv_gpci events were deprecated for platform firmware that
> supports counter_info_version 0x8 or above.
> 
> Fix the hv_gpci event list by adding a new attribute group
> called "hv_gpci_event_attrs_v6" and a "ENABLE_EVENTS_COUNTERINFO_V6"
> macro to enable these events for platform firmware
> that supports counter_info_version 0x6 or below. And assigning
> the hv_gpci event list based on output counter info version
> of underlying plaform.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/hv-gpci: Fix hv_gpci event list
      https://git.kernel.org/powerpc/c/03f7c1d2a49acd30e38789cd809d3300721e9b0e

cheers
