Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 849E1927618
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 14:33:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eC9J/ndt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFGJb20b2z3fTn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 22:33:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eC9J/ndt;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFGHw3FkZz30W8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 22:32:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720096348;
	bh=Kg76KaOIbqnAt68SmtPouOnB34EHvYcOG9w3BrvhJDM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eC9J/ndtD3JZYC5bXcIUuL9baGS+FEO9OPeVGtvMcAfVWSbN1jia1Em79xmhsbey1
	 ix9jF1OFtfcOlZ/PsqE/Cvdjd8DLaWVIBdk7XuVWxnJoX2/CWaCi5AkFef0js7DppK
	 OC3c5wY7L7QYjUDAEc6m9bBbylPc/VqSre7llqaC2XyjUOi+CBaaUqaUmWFNRlOpUz
	 0ML8tWrrT5/3TQOqY0c4e9+cb8ag/vk/IqVx5siUeoR33KgCPUaRrvakLHSmPIRUQT
	 phQdAm+PVhNIF9AIn6IEESqQLrzgtxLQyggahFovqM4i3jtiA8bOPJTHCJeF4HNGcm
	 HfMLzR0cSNYhQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WFGHt5Rmjz4wbp;
	Thu,  4 Jul 2024 22:32:26 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, Scott Wood <oss@buserror.net>, Arnd
 Bergmann <arnd@arndb.de>, Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [PATCH] powerpc: add missing MODULE_DESCRIPTION() macros
In-Reply-To: <2509b43d-630c-4295-8330-5976677bf8bc@quicinc.com>
References: <20240615-md-powerpc-arch-powerpc-v1-1-ba4956bea47a@quicinc.com>
 <2509b43d-630c-4295-8330-5976677bf8bc@quicinc.com>
Date: Thu, 04 Jul 2024 22:32:26 +1000
Message-ID: <87y16hibhh.fsf@mail.lhotse>
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> On 6/15/2024 10:06 AM, Jeff Johnson wrote:
>> With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/kernel/rtas_flash.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/sysdev/rtc_cmos_setup.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/pseries/papr_scm.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/spufs/spufs.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/cbe_thermal.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/cpufreq_spudemand.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/cbe_powerbutton.o
>> 
>> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
>> files which have a MODULE_LICENSE().
>> 
>> This includes 85xx/t1042rdb_diu.c and chrp/nvram.c which, although
>> they did not produce a warning with the powerpc allmodconfig
>> configuration, may cause this warning with other configurations.
>> 
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>> Corrections to these descriptions are welcomed. I'm not an expert in
>> this code so in most cases I've taken these descriptions directly from
>> code comments, Kconfig descriptions, or git logs.  History has shown
>> that in some cases these are originally wrong due to cut-n-paste
>> errors, and in other cases the drivers have evolved such that the
>> original information is no longer accurate.
...
>
> Following up to see if anything else is needed from me. Hoping to see this in
> linux-next so I can remove it from my tracking spreadsheet :)

I have this in my test branch, it will appear in linux-next next week.

A spreadsheet seems like overkill ;)

cheers
