Return-Path: <linuxppc-dev+bounces-8142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9622CAA0BF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 14:46:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn0Rb14JYz2yGZ;
	Tue, 29 Apr 2025 22:46:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.178
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745930763;
	cv=none; b=PnUl8nlgCV7kT21S324bV+lnzTe19R0s7YPN9d8IYMQHp0b+EYYVwXceL1pFIIModPeSAMEXKf9o00GP4btymNKxTN7mLKBuUrDbU44boL0RTbiwtReXvt1V8i2SRVumZdt2NS+oMyQqDvtbzWREL29kVMPcqrytue8izUAJRUboT5Zi78eTWttetZJbyfCeAvZVL8I5X98b3bvqmW6QvYIfGJ7QTK60vrDYYi12yHe1e0sRUatJbLSx7WFm6Ot5zO8d7wegfE+ra77gRempClOvog2L8uIORuusr+MXbcaLI83bt8q8w7WijnbFChsNFr9qRq6G9bRXesAJqmmAgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745930763; c=relaxed/relaxed;
	bh=PpAMnzI0kNBjQbY2TRjuBdxKU7zvRVYeg0EDLdXpYhE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=oESpsHrPjL8F3Qd+SeHDPxvediEvveI1tMyfNGYqZ+efXd1FMNqcppeDuemrSQLlynW+YgXGHA40ohyYdMNVlzCf0CddXcrtK1mL48AEkEnFE6NFVW4Qu1QfnPLtG/7Bs9uAgGw33tBpRClX93BhDNIv3GK8RSUfPQB18/9yi539w0ZVFYmHzcFM0jiuTLBpTLnpHMjuX8mZIzlPS7qoo5K7KPVfhlJmjCaP222rqJQ+ohoXEgzoIkq1UQHEw3FpglId0nT3rfSEu/HO9Axi1DDlIwfuMeO/B9S7Q8wDGefUzVkpnwMGP7rfNvJH72+Y/TxGVgZZ1WOaMJda+XSxkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sRqmWhw4; dkim-atps=neutral; spf=pass (client-ip=91.218.175.178; helo=out-178.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sRqmWhw4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.178; helo=out-178.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn0RW6yHkz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 22:45:59 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745930733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PpAMnzI0kNBjQbY2TRjuBdxKU7zvRVYeg0EDLdXpYhE=;
	b=sRqmWhw44OjJbRzJ9q8wv20RxoXTswli5MCApnQXx57ToQrdqG4mmujAPwy/MutiGxouUf
	3XE2EmfyJDkI3rqTIgO9yci7CvAdonCq8EFeJ4AFLy1LJt0KNSoPU1tPgkkSL44fWle9Fp
	FoDiVVBfiHiqTZ6qh+THYjHJ20naxQ8=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [RESEND PATCH] bus: fsl-mc: Use strscpy() instead of
 strscpy_pad()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <17c35382-36c2-44e6-b553-e66a32a8c47e@csgroup.eu>
Date: Tue, 29 Apr 2025 14:45:21 +0200
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9DDEEADA-BD78-4F4D-97AA-DCC683B2C7D0@linux.dev>
References: <20250429104149.66334-1-thorsten.blum@linux.dev>
 <kko4akbacnugkdughit5ty6vpzg4wjiif3rh4w75hd67v34nre@ngpqhwjb5l4p>
 <17c35382-36c2-44e6-b553-e66a32a8c47e@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,

On 29. Apr 2025, at 13:58, Christophe Leroy wrote:
> Le 29/04/2025 =C3=A0 13:47, Ioana Ciornei a =C3=A9crit:
>> On Tue, Apr 29, 2025 at 12:41:48PM +0200, Thorsten Blum wrote:
>>> Both destination buffers are already zero-initialized, making =
strscpy()
>>> sufficient for safely copying 'obj_type'. The additional NUL-padding
>>> performed by strscpy_pad() is unnecessary.
>>>=20
>>> If the destination buffer has a fixed length, strscpy() =
automatically
>>> determines its size using sizeof() when the argument is omitted. =
This
>>> makes the explicit size arguments unnecessary.
>>>=20
>>> No functional changes intended.
>>>=20
>>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
>> Christophe, could you also pick-up this patch when you have a chance?
>=20
> Sure I will take it when time comes, but again I'd expect an =
explanation inside the patch (below the ---) for the resend. I now have =
this patch twice in the list and don't know why, see =
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D&submitte=
r=3D&state=3D&q=3D&archive=3D&delegate=3D61610

A "resend" is meant as a "ping" and the patch is always unmodified, at
least that's my understanding of it. So there's no particular reason
other than: "Did you see my patch? Let me send it again just to be sure
you didn't miss it."

=46rom [1]: "Don=E2=80=99t add =E2=80=9CRESEND=E2=80=9D when you are =
submitting a modified version
of your patch or patch series - =E2=80=9CRESEND=E2=80=9D only applies to =
resubmission of
a patch or patch series which have not been modified in any way from the
previous submission."

The patches are identical - just pick one.

Thanks,
Thorsten

[1] =
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#don=
-t-get-discouraged-or-impatient


