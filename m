Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 573D66E3E4C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 05:39:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0CV123K8z3cgq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 13:39:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eX4IEUF9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0CT76LqZz3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 13:38:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eX4IEUF9;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q0CT60p4Hz4wgq;
	Mon, 17 Apr 2023 13:38:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681702730;
	bh=bWn3T2YxDv1MetYNs4zldHgxq+SIZP18HSDdqkZAbf4=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=eX4IEUF9V5JL+x8S+X15mUBp6eF9XyKkQEeCdb0gACfNVFBHCZq9TmnHxniWg2Jzw
	 rk5aaBFy1V0DdIGmeWlIREhI++p0Q7oKjKQR7rpRbbQIvtX++MQdZkShzT194Wypoa
	 8KqZt1uQEgk1R25YBhO6jeo+rCH50HQFISECMB+K485hMx7JCogckggeOCeIOETINe
	 yVjItEnxS5TzC8f4oCZLNSw13+ArT161ezXpqHZ24oJIDAQ24nOHMVIBe+jqRAdiiT
	 ruwPoAo2dtvuVj7QGNWehSlA3VS5dIH1gQD1Ijkbytbkx17x//v3Q6PP3G56oXo7JU
	 87eWAfo8KRPug==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 06/32] powerpc/configs/64s: Add secure boot options to
 defconfig
In-Reply-To: <00e463e1c414efb813e80c43bbe65db04cca4e2d.camel@linux.ibm.com>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
 <20230414132415.821564-6-mpe@ellerman.id.au>
 <00e463e1c414efb813e80c43bbe65db04cca4e2d.camel@linux.ibm.com>
Date: Mon, 17 Apr 2023 13:38:49 +1000
Message-ID: <87o7nni3ee.fsf@mpe.ellerman.id.au>
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

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On Fri, 2023-04-14 at 23:23 +1000, Michael Ellerman wrote:
>> Add the numerous options required to get secure boot enabled.
>>=20
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>> =C2=A0arch/powerpc/configs/ppc64_defconfig | 17 ++++++++++++++++-
>> =C2=A01 file changed, 16 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/configs/ppc64_defconfig
>> b/arch/powerpc/configs/ppc64_defconfig
>> index d98fe52a5892..f185adc128db 100644
>> --- a/arch/powerpc/configs/ppc64_defconfig
>> +++ b/arch/powerpc/configs/ppc64_defconfig
>> @@ -54,6 +54,7 @@ CONFIG_CRASH_DUMP=3Dy
>> =C2=A0CONFIG_FA_DUMP=3Dy
>> =C2=A0CONFIG_IRQ_ALL_CPUS=3Dy
>> =C2=A0CONFIG_SCHED_SMT=3Dy
>> +CONFIG_PPC_SECURE_BOOT=3Dy
>
> Can we add CONFIG_PPC_SECVAR_SYSFS=3Dy as well?

We can.

But would it make more sense to just make PPC_SECVAR_SYSFS a hidden
symbol? Is there really any reason someone would want to turn it off?

cheers
