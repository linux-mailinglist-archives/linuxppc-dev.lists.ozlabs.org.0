Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5F06C7641
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 04:33:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjSV65jsxz3fH5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 14:33:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q33hzY5m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q33hzY5m;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjSTC09Ffz3cjR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 14:32:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 21254B822BE;
	Fri, 24 Mar 2023 03:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B290EC433D2;
	Fri, 24 Mar 2023 03:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679628760;
	bh=OWNJZwWiFmA/faeysy2IdxPG176Z+OxV6VgwG074rvg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Q33hzY5m+3GuSibvZmQMaCIZwwYtDzluvrxoeOOmhNXKJwqqhOLD/DuvR+81TgpET
	 /8iCipv7zn0/Nj9nB1sMQzynaEcjqTQ1ape/F+gSFEQRSEANqqQB/cnvybBs1Kp/AR
	 Ynkfo5VzHw9O0bWcIzoK0Y7C3CJJLWqe71V0p00JV1xo8g8MR/lDQ6DQs5SpWWJmmG
	 Vtw13t61n2W60NJHyKHagXDSeRWJTqOwfSNv4VlsLEsYeo/srrBBP+jWXdhctgob81
	 X2XUw2lxo6v710sRKom16BQQGt0ykawwI83iyZ2Yf2BOZX7w4847hYZ/AY9l5Lf9qg
	 3AUIbRng0LLpw==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
	id 673B81540379; Thu, 23 Mar 2023 20:32:40 -0700 (PDT)
Date: Thu, 23 Mar 2023 20:32:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [next-20230322] Kernel WARN at kernel/workqueue.c:3182
 (rcutorture)
Message-ID: <bed6b499-76cc-4412-8a4d-c71f03276726@paulmck-laptop>
References: <139BEB3F-BC1C-4ABA-8928-9A8EF3FB5EDD@linux.ibm.com>
 <fbb628c1-08bd-44ff-a613-794b134f6d46@paulmck-laptop>
 <233B28DA-70DD-4AD8-9C72-1FFCA6EFE56D@linux.ibm.com>
 <ae015179-03b5-4e4b-86dd-cbab75230c7f@paulmck-laptop>
 <23F7ADE0-0B96-4257-8910-6B678E0F0C7A@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23F7ADE0-0B96-4257-8910-6B678E0F0C7A@linux.ibm.com>
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

On Fri, Mar 24, 2023 at 08:47:38AM +0530, Sachin Sant wrote:
> 
> >>> Hello, Sachin, and it looks like you hit something that Zqiang and I
> >>> have been tracking down.  I am guessing that you were using modprobe
> >>> and rmmod to make this happen, and that this happened at rmmod time.
> >>> 
> >> Yes, the LTP test script rcu_torture.sh relies on modprobe to load/unload
> >> the rcutorture module.
> >> 
> >>> Whatever the reproducer, does the following patch help?
> >> 
> >> Thank you for the patch. Yes, with this patch applied, the test completes
> >> successfully without the reported warning.
> > 
> > Very good, thank you!  May we have your Tested-by?
> 
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>


Thank you, and I will apply on the next rebase.

							Thanx, Paul
