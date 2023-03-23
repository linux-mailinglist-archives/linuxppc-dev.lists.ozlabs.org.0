Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F097B6C7052
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 19:35:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjDXz5nBvz3fCk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 05:35:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dsesqpn+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dsesqpn+;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjDX25dBlz3f51
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 05:34:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4EE1262848;
	Thu, 23 Mar 2023 18:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AF6C433EF;
	Thu, 23 Mar 2023 18:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679596463;
	bh=cbM4eh9+G5u44urX8yb80DsKZlsjHhpGtzb4F/RXZbE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Dsesqpn+JLClFeqe0E866tT+jCL1VcXlGmYUpmMMflVF/ozl14+UP2rthdfxylFA7
	 vHEbM3uSE+kVFVUR7oKf+/7gvb2Itn9BLFbeRLezNnQ1vRlhPr+K2IlpW2PWWjQToB
	 17URw7s+voHD8pMOKgOkdmyWzjfjY5tYRyTqcOvXNMMdIwL40FCi7Wf99j877NeeOg
	 5JJrHxHDHyPGr/6fbjQGpQsciSFsfbVH/aclta5RwwhTHaAKO+OFYwaiAHBwhcBb97
	 XGSDxrgDZC8oPnZruijpapexEN6KkEJZ3CCkuy92/6+odUC97gd9+tkhCtv+8dJH1S
	 buvShBL1GOoQA==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
	id 50BA01540398; Thu, 23 Mar 2023 11:34:23 -0700 (PDT)
Date: Thu, 23 Mar 2023 11:34:23 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [next-20230322] Kernel WARN at kernel/workqueue.c:3182
 (rcutorture)
Message-ID: <ae015179-03b5-4e4b-86dd-cbab75230c7f@paulmck-laptop>
References: <139BEB3F-BC1C-4ABA-8928-9A8EF3FB5EDD@linux.ibm.com>
 <fbb628c1-08bd-44ff-a613-794b134f6d46@paulmck-laptop>
 <233B28DA-70DD-4AD8-9C72-1FFCA6EFE56D@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <233B28DA-70DD-4AD8-9C72-1FFCA6EFE56D@linux.ibm.com>
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
Reply-To: paulmck@kernel.org
Cc: Zqiang <qiang1.zhang@intel.com>, linux-next@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 23, 2023 at 11:00:59PM +0530, Sachin Sant wrote:
> 
> >> [ 3629.243407] NIP [00007fff8cd39558] 0x7fff8cd39558
> >> [ 3629.243410] LR [000000010d800398] 0x10d800398
> >> [ 3629.243413] --- interrupt: c00
> >> [ 3629.243415] Code: 419dffa4 e93a0078 39400001 552907be 2f890000 7d20579e 0b090000 e95a0078 e91a0080 39200001 7fa85000 7d204f9e <0b090000> 7f23cb78 4bfffd65 0b030000 
> >> [ 3629.243430] ---[ end trace 0000000000000000 ]—
> >> 
> >> These warnings are repeated few times. The LTP test is marked as PASS.
> >> 
> >> Git bisect point to the following patch
> >> commit f46a5170e6e7d5f836f2199fe82cdb0b4363427f
> >>    srcu: Use static init for statically allocated in-module srcu_struct
> > 
> > Hello, Sachin, and it looks like you hit something that Zqiang and I
> > have been tracking down.  I am guessing that you were using modprobe
> > and rmmod to make this happen, and that this happened at rmmod time.
> > 
> Yes, the LTP test script rcu_torture.sh relies on modprobe to load/unload
> the rcutorture module.
> 
> > Whatever the reproducer, does the following patch help?
> 
> Thank you for the patch. Yes, with this patch applied, the test completes
> successfully without the reported warning.

Very good, thank you!  May we have your Tested-by?

							Thanx, Paul
