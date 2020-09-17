Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F9026DC3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:59:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BscVB1lnrzDqQf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:58:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsbr43ZZZzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 22:29:24 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67382ACBF;
 Thu, 17 Sep 2020 12:29:55 +0000 (UTC)
Date: Thu, 17 Sep 2020 14:29:20 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
Subject: Re: [PATCH 0/3] powerpc/mce: Fix mce handler and add selftest
Message-ID: <20200917122920.GR29778@kitsune.suse.cz>
References: <20200916172228.83271-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916172228.83271-1-ganeshgr@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, Sep 16, 2020 at 10:52:25PM +0530, Ganesh Goudar wrote:
> This patch series fixes mce handling for pseries, provides debugfs
> interface for mce injection and adds selftest to test mce handling
> on pseries/powernv machines running in hash mmu mode.
> debugfs interface and sleftest are added only for slb multihit
> injection, We can add other tests in future if possible.
> 
> Ganesh Goudar (3):
>   powerpc/mce: remove nmi_enter/exit from real mode handler
>   powerpc/mce: Add debugfs interface to inject MCE
>   selftest/powerpc: Add slb multihit selftest

Is the below logic sound? It does not agree with what is added here:

void machine_check_exception(struct pt_regs *regs)
{
	int recover = 0;

	/*
	 * BOOK3S_64 does not call this handler as a non-maskable interrupt
	 * (it uses its own early real-mode handler to handle the MCE proper
	 * and then raises irq_work to call this handler when interrupts are
	 * enabled).
	 *
	 * This is silly. The BOOK3S_64 should just call a different function
	 * rather than expecting semantics to magically change. Something
	 * like 'non_nmi_machine_check_exception()', perhaps?
	 */
	const bool nmi = !IS_ENABLED(CONFIG_PPC_BOOK3S_64);

	if (nmi) nmi_enter();

Thanks

Michal
