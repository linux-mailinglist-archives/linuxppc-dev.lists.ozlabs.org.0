Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC7D72EEF3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 00:14:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=jauu.net header.i=@jauu.net header.a=rsa-sha256 header.s=MBO0001 header.b=OyeK6ibm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgjWb5QVDz30XT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 08:14:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=jauu.net header.i=@jauu.net header.a=rsa-sha256 header.s=MBO0001 header.b=OyeK6ibm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=jauu.net (client-ip=2001:67c:2050:0:465::202; helo=mout-p-202.mailbox.org; envelope-from=hagen@jauu.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 597 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 06:53:23 AEST
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050:0:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QggkW4YcRz3003
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 06:53:23 +1000 (AEST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4QggVl2Hbcz9tFc;
	Tue, 13 Jun 2023 22:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jauu.net; s=MBO0001;
	t=1686688991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ge2zDH4C5WcYe3JrCtOQM7SlUHF5WPe+wiOXOV0zPo=;
	b=OyeK6ibmkrkMQ8OJEJONhckGjXAA0ePebIVRTwBjgmddRZMWPp581G+ebSJYlgOlZURkpF
	8kB0idlVaDqzOAAjcM+Mhf10Gnwbe7eN0tKF9k7SLEQW5uwhNWOES4HnyGNMUod20ahhco
	m8BNjdtxvqc4Ckq0ZQ6zXz7HDvjrvyVq+h4XAqax0bRBZA6rtwmpzbt3QgfuiA6vln7Ows
	6VmXOmKwPZ//fDTaowqutxxkRAijWYFrj0qVPn9Rc42W+OH/LTpmDQVhmgClof/TAqgiHB
	P6zQFUlKTf7Y6KDSiU9ByeWayZe2jKkNc1XsFyrej4MV2HOUep8/D8NI19gtVg==
Date: Tue, 13 Jun 2023 22:43:05 +0200
From: Hagen Paul Pfeifer <hagen@jauu.net>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH 16/17] perf tests task_analyzer: print command on failure
Message-ID: <20230613204305.uiv3g5r3cmzo2ucx@ic1101>
X-Key-Id: 98350C22
X-Key-Fingerprint: 490F 557B 6C48 6D7E 5706 2EA2 4A22 8D45 9835 0C22
X-GPG-Key: gpg --recv-keys --keyserver wwwkeys.eu.pgp.net 98350C22
X-Operating-System: Linux ic1101 6.2.0-hgn
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-17-atrajeev@linux.vnet.ibm.com>
 <ZIjMmKvo9QsPK+B/@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIjMmKvo9QsPK+B/@kernel.org>
X-Mailman-Approved-At: Wed, 14 Jun 2023 08:08:01 +1000
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
Cc: irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, john.g.garry@oracle.com, kjain@linux.ibm.com, ravi.bangoria@amd.com, linux-perf-users@vger.kernel.org, Petar Gligoric <petar.gligoric@rohde-schwarz.com>, maddy@linux.ibm.com, jolsa@kernel.org, Aditya Gupta <adityag@linux.ibm.com>, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Arnaldo Carvalho de Melo | 2023-06-13 17:07:52 [-0300]:

>> From: Aditya Gupta <adityag@linux.ibm.com>
>> 
>> Instead of printing "perf command failed" everytime, print the exact
>> command that run earlier
>
>Looks like a nice improvement, added the test authors to the CC list on
>this message,

Thank you Aditya and really great catch - thank you very much! Shell scripting
can be nasty. This is another example where you can see that with one stupid
typo the whole system can be undermined and you don't get a single hint.

Acked-by: Hagen Paul Pfeifer <hagen@jauu.net>
