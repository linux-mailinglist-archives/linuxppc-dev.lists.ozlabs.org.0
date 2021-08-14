Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B263EC2AC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 14:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gn0W12l8Hz3cM6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 22:44:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qga7hx4U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Qga7hx4U; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gn0VH6zvZz2yR7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Aug 2021 22:44:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gn0VG43wDz9sX3;
 Sat, 14 Aug 2021 22:44:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1628945046;
 bh=BTEI22855V1ISRnzYjMKp2Rh6WOt8Yp+8E9gKeZmqX4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Qga7hx4USZ2eiuakEs4N6pT5+VNLWwmOT+/X9lhvgRgUUq69ujVxsIhzEY+3C258N
 T2qqlFDrMRQw+AbqqKkcwAk4zWphg4efoPnJziYIVANWkREt6zt4jx0OLabfPz9mI6
 snhMeu4mb6SysgZjXBFZn4ICwaNq7soO0Ks8XhRicY/wI38SK1o47/fWXoZ+bZ1i5V
 jBarcwaciw/YPUSYI+QlgGB2CcffEvNvfIyVy6rzoH+n5Jcq79lQEYNU9Q/NX6JyEs
 mbqoaPyeKpUzIP9/ytJdoeBp5GKzA3XWkjPuXmpg7FXUJX3bnrXJUdpzEp0Fh1xitZ
 D0leYuJoZZFYg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Kajol Jain
 <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] powerpc/perf: Return regs->nip as instruction
 pointer value when SIAR is 0
In-Reply-To: <c6110aa1-90e2-77aa-1ab5-355975037227@csgroup.eu>
References: <20210813082450.429320-1-kjain@linux.ibm.com>
 <20210813082450.429320-2-kjain@linux.ibm.com>
 <c6110aa1-90e2-77aa-1ab5-355975037227@csgroup.eu>
Date: Sat, 14 Aug 2021 22:44:05 +1000
Message-ID: <871r6wmc16.fsf@mpe.ellerman.id.au>
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 13/08/2021 =C3=A0 10:24, Kajol Jain a =C3=A9crit=C2=A0:
>> Incase of random sampling, there can be scenarios where SIAR is not
>> latching sample address and results in 0 value. Since current code
>> directly returning the siar value, we could see multiple instruction
>> pointer values as 0 in perf report.

Can you please give more detail on that? What scenarios? On what CPUs?

>> Patch resolves this issue by adding a ternary condition to return
>> regs->nip incase SIAR is 0.
>
> Your description seems rather similar to=20
> https://github.com/linuxppc/linux/commit/2ca13a4cc56c920a6c9fc8ee45d02bcc=
acd7f46c
>
> Does it mean that the problem occurs on more than the power10 DD1 ?
>
> In that case, can the solution be common instead of doing something for p=
ower10 DD1 and something=20
> for others ?

Agreed.

This change would seem to make that P10 DD1 logic superfluous.

Also we already have a fallback to regs->nip in the else case of the if,
so we should just use that rather than adding a ternary condition.

eg.

	if (use_siar && siar_valid(regs) && siar)
		return siar + perf_ip_adjust(regs);
	else if (use_siar)
		return 0;		// no valid instruction pointer
	else
		return regs->nip;


I'm also not sure why we have that return 0 case, I can't think of why
we'd ever want to do that rather than using nip. So maybe we should do
another patch to drop that case.

cheers
