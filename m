Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B186A3A58
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 06:26:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQ8BR62lPz3cLF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 16:26:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KVFEitcL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQ89T5nPsz3bgW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 16:26:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KVFEitcL;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PQ89S1gvyz4x4r;
	Mon, 27 Feb 2023 16:26:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677475564;
	bh=T6QIytn9L33Q7Aw+6A+7icMEI0DxJnhlJO8jCmkh/j8=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=KVFEitcLJPxiyFCpSP6KfUPWvu9FUwNV/+hoYvvH1l2j1vvswhMgzA4Fqa/YfLTu2
	 Ofo9OjPay9EK8L/di6xhIHfBhIxu+h0rprf7TfkFD57UP+ZJ3V86Zdast9cO2SswEE
	 AQJlSBZGI8R3iRBn7/A3aqpaWzP9FN9z5tFdibRmszJGAEOuftArf2n08X0z9MBQXH
	 Ql7h2eDNEttzDilSjOkRpgj1jT1/rQxwNYBsdcIFiDBoOfqOMB31dphjVVGn9IV6Le
	 RdtvpmZVPedj75L9CXYrnP+gqR+7u3fEu+OmYwTFmVL9nKwKp7N/yWt9AXSasBqCGJ
	 kcUPNThXs1dyg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Binderman <dcb314@hotmail.com>, "npiggin@gmail.com"
 <npiggin@gmail.com>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "shuah@kernel.org" <shuah@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Possible bug in
 linux-6.2/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c
In-Reply-To: <DB6P189MB0568CF002762C6C43AF6DF169CA89@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
References: <DB6P189MB0568CF002762C6C43AF6DF169CA89@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
Date: Mon, 27 Feb 2023 16:26:01 +1100
Message-ID: <87ttz7vfva.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Binderman <dcb314@hotmail.com> writes:
> Hello there,
>
> I ran the static analyser cppcheck over the linux-6.2 source code and got this:
>
> linux-6.2/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c:68:10: style: Same expression '0x3' found multiple times in chain of '&' operators. [duplicateExpression]

Thanks.

> Source code is
>
>     FAIL_IF(EV_CODE_EXTRACT(event.attr.config, sample & 0x3) !=
>             get_mmcra_sample_mode(get_reg_value(intr_regs, "MMCRA"), 4));
>
> but
>
> #define EV_CODE_EXTRACT(x, y)   \
>     ((x >> ev_shift_##y) & ev_mask_##y)
>
>
> Given the token pasting, I very much doubt an expression like "sample & 0x3"
> will work correctly. Same thing on the line above 
>
>     FAIL_IF(EV_CODE_EXTRACT(event.attr.config, sample >> 2) !=
>             get_mmcra_rand_samp_elig(get_reg_value(intr_regs, "MMCRA"), 4));
>
> "sample >> 2" doesn't look like a valid token to me.

It expands to:

 if ((((event.attr.config >> ev_shift_sample >> 2) & ev_mask_sample >> 2) != get_mmcra_rand_samp_elig(get_reg_value(intr_regs, "MMCRA"), 4))) 

Which AFAICS is valid, and does compile.

Whether it's what the author actually intended is less clear.

And the other example with & 0x3 seems obviously wrong, it expands to:

  if ((((event.attr.config >> ev_shift_sample & 0x3) & ev_mask_sample & 0x3) != get_mmcra_sample_mode(get_reg_value(intr_regs, "MMCRA"), 4)))

The shift is 24, so bitwise anding it with 0x3 gets 0 which doesn't seem
likely to be what was intended.

cheers
