Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E768AC3D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 07:41:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RNZDWWta;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNDdR3sf5z3cWD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 15:41:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RNZDWWta;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNDcj1mDsz30gp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 15:40:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713764453;
	bh=NM1Peqighzw+mkU1E+YWLEHUm6IlXuwVHyv+E0ShMrU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RNZDWWtavnukBViwUxvNovHBccke2CAWpYEW4SwuD7WNEOt7+3Ar93bayigXPAoPa
	 v/Tn+oyK4qYA9uXQBQtZ7JmRRirAPnNpiKFlb0tltWiWN/re3DLuUAkEn8839hK2Bb
	 AiwmD4lUgy20XanJvOLuk1Ew3gDqniTzP4EUU5wsmT/iwiSJyWKKLAcVgGHKSjN205
	 /7FsE0wP9Sjr/M9z6esmhg85+b9HneYrvrHnKiyv1QkKlSPhIBJ3f4k/UAAPIEmLW7
	 45WNdrwOLB2Ix4/s9cw2ff1qoZ2Q2HRPnpHyX9AhDErdhyCHSwVAMOh/paj4gZhsmm
	 ikH42+1brWEWw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNDch6Yggz4x10;
	Mon, 22 Apr 2024 15:40:52 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] powerpc/pseries/iommu: LPAR panics when rebooted with a
 frozen PE
In-Reply-To: <20240419111127.GZ20665@kitsune.suse.cz>
References: <20240416205810.28754-1-gbatra@linux.ibm.com>
 <87ttjxanj5.fsf@mail.lhotse> <20240419111127.GZ20665@kitsune.suse.cz>
Date: Mon, 22 Apr 2024 15:40:52 +1000
Message-ID: <87wmoqj6or.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> Hello,
>
> On Fri, Apr 19, 2024 at 04:12:46PM +1000, Michael Ellerman wrote:
>> Gaurav Batra <gbatra@linux.ibm.com> writes:
>> > At the time of LPAR reboot, partition firmware provides Open Firmware
>> > property ibm,dma-window for the PE. This property is provided on the P=
CI
>> > bus the PE is attached to.
>>=20
>> AFAICS you're actually describing a bug that happens during boot *up*?
>>=20
>> Describing it as "reboot" makes me think you're talking about the
>> shutdown path. I think that will confuse people, me at least :)
>
> there is probably an assumption that it must have been running
> previously for the errors to happen in the first place but given the
> error state persists for a day it may be a very long 'reboot'.

Yeah. Which is good detail, but the actual change is to the boot up path
so I think it's better described that way.

cheers
