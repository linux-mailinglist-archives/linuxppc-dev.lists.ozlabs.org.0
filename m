Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1381B7EAB4D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 09:04:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=YQohFzl7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STzNG6w2Cz3cWq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 19:04:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=YQohFzl7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 194 seconds by postgrey-1.37 at boromir; Tue, 14 Nov 2023 19:03:45 AEDT
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STzMP05glz3bvB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 19:03:44 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 256F7828535A;
	Tue, 14 Nov 2023 02:03:42 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id oPnla1OtGyZY; Tue, 14 Nov 2023 02:03:41 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0E07682856C5;
	Tue, 14 Nov 2023 02:03:41 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0E07682856C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699949021; bh=GnC7zdyJZxNd3SbpUV4gzDUlUb/G8sXLYymPm+EeDvg=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=YQohFzl7Pfpo2RIcWleCSikbDv+nX+/ShZWc0DNIC9xW8X6DuKZ1gNF1my3AZmqmw
	 I/ToTymzRXQczquAeCMXuzuZBe1ZRMWuy9AxmwPA5yv1HeWy7EV9C1W824LfZWN9tz
	 KRXI0Edy5Ce6qQORrqQLMUHDmz4cyIr1TSaopn1c=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UJhkqgCPTcJz; Tue, 14 Nov 2023 02:03:40 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D2CDB828535A;
	Tue, 14 Nov 2023 02:03:40 -0600 (CST)
Date: Tue, 14 Nov 2023 02:03:40 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Salvatore Bonaccorso <carnil@debian.org>
Message-ID: <1289669795.47202741.1699949020621.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <ZVMo0vOZAxuxT8la@eldamar.lan>
References: <19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com> <ZVMo0vOZAxuxT8la@eldamar.lan>
Subject: Re: [PATCH] powerpc: Fix data corruption on IPI
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Fix data corruption on IPI
Thread-Index: kJBWQeL92jH/nokdFfVv3+nZlpCT6Q==
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
Cc: Jens Axboe <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>, npiggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Salvatore Bonaccorso" <carnil@debian.org>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "Linuxppc-dev" <linuxppc-dev-bounces+tpearson=raptorengineering.com@lists.ozlabs.org>, "Jens Axboe"
> <axboe@kernel.dk>, "regressions" <regressions@lists.linux.dev>, "Michael Ellerman" <mpe@ellerman.id.au>, "npiggin"
> <npiggin@gmail.com>, "christophe leroy" <christophe.leroy@csgroup.eu>
> Sent: Tuesday, November 14, 2023 1:59:14 AM
> Subject: Re: [PATCH] powerpc: Fix data corruption on IPI

> On Mon, Nov 13, 2023 at 10:56:09PM -0600, Timothy Pearson wrote:
>> >From 0b2678b7cdada1a3d9aec8626f31a988d81373fa Mon Sep 17 00:00:00 2001
>> From: Timothy Pearson <tpearson@raptorengineering.com>
>> Date: Mon, 13 Nov 2023 22:42:58 -0600
>> Subject: [PATCH] powerpc: Fix data corruption on IPI
>> 
>> On multithreaded SMP workloads such as those using io_uring, it is possible for
>> multiple threads to hold an inconsistent view of system memory when an IPI is
>> issued.  This in turn leads to userspace memory corruption with varying degrees
>> of probability based on workload and inter-thread timing.
>> 
>> io_uring provokes this bug by its use of TWA_SIGNAL during thread creation,
>> which is especially noticeable as significant userspace data corruption with
>> certain workloads such as MariaDB (bug MDEV-30728).  While using
>> TWA_SIGNAL_NO_IPI works around the corruption, no other architecture requires
>> this workaround.
>> 
>> Issue an lwsync barrier instruction prior to sending the IPI.  This ensures
>> the receiving CPU has a consistent view of system memory, in line with other
>> architectures.
>> 
>> Tested under QEMU in kvm mode, running on a Talos II workstation with dual
>> POWER9 DD2.2 CPUs.
>> 
>> Tested-by: Timothy Pearson <tpearson@raptorengineering.com>
>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>> ---
>>  arch/powerpc/kernel/smp.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
>> index ab691c89d787..ba42238de518 100644
>> --- a/arch/powerpc/kernel/smp.c
>> +++ b/arch/powerpc/kernel/smp.c
>> @@ -369,8 +369,10 @@ static inline void do_message_pass(int cpu, int msg)
>>  
>>  void arch_smp_send_reschedule(int cpu)
>>  {
>> -	if (likely(smp_ops))
>> +	if (likely(smp_ops)) {
>> +		__smp_lwsync();
>>  		do_message_pass(cpu, PPC_MSG_RESCHEDULE);
>> +	}
>>  }
>>  EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
> 
> Once this is accepted in mainline, can you ensure that it get
> backported to the needed relevant stable series? (Should it be CC'ed
> as well for stable@?).

Absolutely!  We've been blocked on kernel upgrades for production database systems for a while due to this particular bug.

> For context, and maybe worth adding a Link: reference as well this is
> hit in Debian in https://bugs.debian.org/1032104

Sounds good.  If anyone here needs a v2 with that line added just let me know.

Thanks!
