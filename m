Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1FA5EED41
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 07:35:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdMX93s18z3cB7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 15:35:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LpOQdz9w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdMWb084Vz2xGn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 15:35:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LpOQdz9w;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdMWZ1LWcz4xGZ;
	Thu, 29 Sep 2022 15:35:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664429706;
	bh=pqR5rGmvmjiW6IzzBNyxyjMqjmig7ZQuTSD289XMXFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LpOQdz9wAXe1fDYnpau8SIx13ROPWVr2D8+wCyRYxtf7aM7qULbEY0jKseJAHiwL9
	 loWtnVHhZCHi1rDkbMmoZqmA2FjwKVIoRJ24Rx2j8qqQjnzG0WI4bj/5TmDvNkUisp
	 tR0aEholHVwMyRAWqBKoKO1WI90K/vYVaUfiYEfzbprcZCUOjFxKm9LkE3BYsNqDvV
	 9cncMXJusN+5f3TSKDeAGk8Bcxt4/zRpbpJ/DmtGJ+3Jga86XE4h0R4Ug4A8mD30lA
	 fvnXD0r/8epCfGpwa2OnRbO817cpkxsn+NEfxcxd7IbndZ+r6iJZnaA5L+MLjkoD/N
	 v3T8RGiYnvP9w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Athira Rajeev
 <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 2/3] tools/perf/tests: Fix branch stack sampling test
 to include sanity check for branch filter
In-Reply-To: <YzRaWCpWkEMV3HqS@kernel.org>
References: <20220921145255.20972-1-atrajeev@linux.vnet.ibm.com>
 <20220921145255.20972-2-atrajeev@linux.vnet.ibm.com>
 <YzRaWCpWkEMV3HqS@kernel.org>
Date: Thu, 29 Sep 2022 15:35:05 +1000
Message-ID: <878rm2g2uu.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnaldo Carvalho de Melo <acme@kernel.org> writes:
> Em Wed, Sep 21, 2022 at 08:22:54PM +0530, Athira Rajeev escreveu:
>> commit b55878c90ab9 ("perf test: Add test for branch stack sampling")
>> added test for branch stack sampling. There is a sanity check in the
>> beginning to skip the test if the hardware doesn't support branch stack
>> sampling.
>> 
>> Snippet
>> <<>>
>> skip the test if the hardware doesn't support branch stack sampling
>> perf record -b -o- -B true > /dev/null 2>&1 || exit 2
>> <<>>
>> 
>> But the testcase also uses branch sample types: save_type, any. if any
>> platform doesn't support the branch filters used in the test, the testcase
>> will fail. In powerpc, currently mutliple branch filters are not supported
>> and hence this test fails in powerpc. Fix the sanity check to look at
>> the support for branch filters used in this test before proceeding with
>>> the test.
>
> Applied the tools/perf/ part

Thanks, I have the other two queued.

cheers
