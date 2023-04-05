Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A656D73DE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 07:46:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Prtsl6sn4z3chy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 15:46:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dH/JE0e1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Prtrv2hwkz3bhJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 15:45:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dH/JE0e1;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Prtrr2fm6z4wj7;
	Wed,  5 Apr 2023 15:45:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680673534;
	bh=o8KRvfJEQOA5IMWHvyjzUH2dPZvrppEiI3bXRqQG8sc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dH/JE0e1J9CE7RklFkHr/mIYaWDpF0hW99rd3HjTNjlmS9XkruLoDEMEXWuOzh8mm
	 tVq4lb/unuy8jNkTrg09C2vRDB8uhNm01irwvfSdFEfR1weSkI/Wxh7zCk/7djJ2ln
	 d0tKA5H08Hqz0g5T9f4w8jD4N3eGFCo8M3DMu+TCiselKpdGSKGP5/fvqH5JgXTvEc
	 M8RDfAYpKs2VS7g9ujNz+vG19P/QP2BDWNkC5N8l0Lfx9qjyrsBRO6vePZlXvDsxo4
	 Stmu7PlZEEKYQf01aVhwgl8XcvyCM0rWqfaKfeCHV/e1nhoN+L05dggmvW1IgRoE8h
	 ZUZ2HwjX7N4Ww==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: Probing nvme disks fails on Upstream kernels on powerpc Maxconfig
In-Reply-To: <906d4d0e-b487-00a5-9399-7d1edc5e20a4@leemhuis.info>
References: <20230323095333.GI1005120@linux.vnet.ibm.com>
 <906d4d0e-b487-00a5-9399-7d1edc5e20a4@leemhuis.info>
Date: Wed, 05 Apr 2023 15:45:31 +1000
Message-ID: <87bkk2khl0.fsf@mpe.ellerman.id.au>
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
Cc: sachinp@linux.vnet.ibm.com, Linux kernel regressions list <regressions@lists.linux.dev>, Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info> writes:
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> On 23.03.23 10:53, Srikar Dronamraju wrote:
>> 
>> I am unable to boot upstream kernels from v5.16 to the latest upstream
>> kernel on a maxconfig system. (Machine config details given below)
>> 
>> At boot, we see a series of messages like the below.
>> 
>> dracut-initqueue[13917]: Warning: dracut-initqueue: timeout, still waiting for following initqueue hooks:
>> dracut-initqueue[13917]: Warning: /lib/dracut/hooks/initqueue/finished/devexists-\x2fdev\x2fdisk\x2fby-uuid\x2f93dc0767-18aa-467f-afa7-5b4e9c13108a.sh: "if ! grep -q After=remote-fs-pre.target /run/systemd/generator/systemd-cryptsetup@*.service 2>/dev/null; then
>> dracut-initqueue[13917]:     [ -e "/dev/disk/by-uuid/93dc0767-18aa-467f-afa7-5b4e9c13108a" ]
>> dracut-initqueue[13917]: fi"
>
> Alexey, did you look into this? This is apparently caused by a commit of
> yours (see quoted part below) that Michael applied. Looks like it fell
> through the cracks from here, but maybe I'm missing something.

Unfortunately Alexey is not working at IBM any more, so he won't have
access to any hardware to debug/test this.

Srikar are you debugging this? If not we'll have to find someone else to
look at it.

cheers
