Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F586887CBD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 13:28:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=ILTODdiI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V2b2S1Blmz3dV4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 23:28:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=ILTODdiI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2607:5300:203:b2ee::31e5; helo=smtpout.efficios.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 447 seconds by postgrey-1.37 at boromir; Sun, 24 Mar 2024 23:27:53 AEDT
Received: from smtpout.efficios.com (smtpout.efficios.com [IPv6:2607:5300:203:b2ee::31e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V2b1j3lQcz30PD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Mar 2024 23:27:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1711282807;
	bh=1rWZrcnRk5MmjMJtp4pl8QDLmZ4mQWqpBpMwhDvzDvw=;
	h=Date:From:To:Cc:Subject:From;
	b=ILTODdiIp2nJbQdnnfFDZVc1aW9Ps7KnCaRhhDuXwQXK6/F/NK+IDvOgzWo4OCWC8
	 +mY1YTdb87lPSxscqY6mG9Vz3HE9h1FOSCyTpmAfUcVi0LpGHjIHv6gvu1DdanqIRP
	 88Tz4qBDFzz3BYXZbiiNkhZOejSrGRWkXPqIUep/MJgvLRBbTXW912FgD2WAo+SkXC
	 xrBzLjjLXcgp0LLGlpEf0B+4XoQGl7epeeBFosGlKWeOdTm/reznzuEfpfDZk2HSjC
	 2jlqKspuljOoc56F3blkFGC+E4Oqy6gWoMlhtUL26fwGkBZxI1Q+XT5mK84AYzKeHm
	 Ec8PjqZoj2+LQ==
Received: from [IPV6:2606:6d00:100:4000:cacb:9855:de1f:ded2] (unknown [IPv6:2606:6d00:100:4000:cacb:9855:de1f:ded2])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4V2Zrl4GyVzmMf;
	Sun, 24 Mar 2024 08:20:07 -0400 (EDT)
Message-ID: <19c3ea76-9e05-4552-8b93-6c42df105747@efficios.com>
Date: Sun, 24 Mar 2024 08:20:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: paulmck <paulmck@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Appropriate liburcu cache line size for Power
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

In the powerpc architecture support within the liburcu project [1]
we have a cache line size defined as 256 bytes with the following
comment:

/* Include size of POWER5+ L3 cache lines: 256 bytes */
#define CAA_CACHE_LINE_SIZE     256

I recently received a pull request on github [2] asking to
change this to 128 bytes. All the material provided supports
that the cache line sizes on powerpc are 128 bytes or less (even
L3 on POWER7, POWER8, and POWER9) [3].

I wonder where the 256 bytes L3 cache line size for POWER5+
we have in liburcu comes from, and I wonder if it's the right choice
for a cache line size on all powerpc, considering that the Linux
kernel cache line size appear to use 128 bytes on recent Power
architectures. I recall some benchmark experiments Paul and I did
on a 64-core 1.9GHz POWER5+ machine that benefited from a 256 bytes
cache line size, and I suppose this is why we came up with this
value, but I don't have the detailed specs of that machine.

Any feedback on this matter would be appreciated.

Thanks!

Mathieu

[1] https://liburcu.org
[2] https://github.com/urcu/userspace-rcu/pull/22
[3] https://www.7-cpu.com/


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
