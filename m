Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D858D1E424C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 14:29:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X9B04C4tzDqRN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 22:29:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.44.197; helo=3.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 3600 seconds by postgrey-1.36 at bilbo;
 Wed, 27 May 2020 22:24:32 AEST
Received: from 3.mo178.mail-out.ovh.net (3.mo178.mail-out.ovh.net
 [46.105.44.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X94c2RNgzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 22:24:31 +1000 (AEST)
Received: from player776.ha.ovh.net (unknown [10.108.54.108])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 23B3FA2819
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 13:05:49 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player776.ha.ovh.net (Postfix) with ESMTPSA id D5F5512CFFA2C;
 Wed, 27 May 2020 11:05:46 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005435134a8-35f6-4bb2-9e4a-53c55b7b4589,A19C442F5A36D79893466B97850BD964E95F9B50)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH 2/3] powerpc/pci: unmap legacy INTx interrupts of
 passthrough IO adapters
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20200429075122.1216388-1-clg@kaod.org>
 <20200429075122.1216388-3-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <44126659-0490-4466-7f08-1726a7f0ce6e@kaod.org>
Date: Wed, 27 May 2020 13:05:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200429075122.1216388-3-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5299892337237134134
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,

On 4/29/20 9:51 AM, Cédric Le Goater wrote:
> When a passthrough IO adapter is removed from a pseries machine using
> hash MMU and the XIVE interrupt mode, the POWER hypervisor, pHyp,
> expects the guest OS to have cleared all page table entries related to
> the adapter. If some are still present, the RTAS call which isolates
> the PCI slot returns error 9001 "valid outstanding translations" and
> the removal of the IO adapter fails.
> 
> INTx interrupt numbers need special care because Linux maps the
> interrupts automatically in the Linux interrupt number space if they
> are presented in the device tree node describing the IO adapter. These
> interrupts are not un-mapped automatically and in case of an hot-plug
> adapter, the PCI hot-plug layer needs to handle the cleanup to make
> sure that all the page table entries of the XIVE ESB pages are
> cleared.

It seems this patch needs more digging to make sure we are handling
the IRQ unmapping in the correct PCI handler. Could you please keep
it back for the moment ? 

Thanks,

C.
