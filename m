Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5674776CC36
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 14:01:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iLT8cxgO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RG9Yy17STz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 22:01:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iLT8cxgO;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RG9Y20vfDz2yVp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 22:00:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1690977653;
	bh=srbZojdru0tsVgAsnUb95vBNV7rieqJ2AhYM1AFAUrM=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=iLT8cxgOXWCuEWhGbMgv3A/ss6AewaDUdMGvdgf4waMQk/3e+8qxlXxi9V8Q9iS7Q
	 +LYNkopSdouJbo3pepb7yYtv1z0baIGVkkol8gtRMll50x7dHucGe4G6UdSwVummIt
	 tvlpZLuZWWYELKQQloZmRwSPOzPpkdry4NY5ATbFBeewzUKCqd8EaAPXd2Kp5MkG+d
	 3L5J1pRsehy/X7H+I5/N3+MLO6+yX5cmG9I3xue5yG41E1Wx1G1PYtWimcxCVxQ4oU
	 GyqMyB0Ixr4Ax/qPlxxJUqUSM+8sAjOHWipSNMOfVMnb5uJ1ypxCOfBMkTiY7alAmg
	 KWL1tLAPBkVoA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RG9Y15Kv6z4xJW;
	Wed,  2 Aug 2023 22:00:53 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Gray
 <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 0/7] Rework perf and ptrace watchpoint tracking
In-Reply-To: <4a0d1740-bf19-0a96-1668-23d6188657cb@csgroup.eu>
References: <20230801011744.153973-1-bgray@linux.ibm.com>
 <4a0d1740-bf19-0a96-1668-23d6188657cb@csgroup.eu>
Date: Wed, 02 Aug 2023 22:00:47 +1000
Message-ID: <874jlh1wnk.fsf@mail.lhotse>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 01/08/2023 =C3=A0 03:17, Benjamin Gray a =C3=A9crit=C2=A0:
>> Syzkaller triggered a null pointer dereference in the
>> arch_unregister_hw_breakpoint() hook. This is due to accessing
>> the bp->ctx->task field changing to -1 while we iterate the breakpoints.
>>=20
>> This series refactors the breakpoint tracking logic to remove the
>> dependency on bp->ctx entirely. It also simplifies handling of ptrace and
>> perf breakpoints, making insertion less restrictive.
>
> Is there any link between this series and the following issue:=20
> https://github.com/linuxppc/issues/issues/38

AFAIK no, Ben started looking at the breakpoint code due to a syzkaller
report of an oops.

But this series would resolve that issue AFAICS, so I guess they are
linked in that sense.

cheers
