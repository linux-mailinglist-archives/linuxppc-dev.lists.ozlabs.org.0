Return-Path: <linuxppc-dev+bounces-3441-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA8E9D30D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2024 00:11:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtKxp5q1Lz2yDl;
	Wed, 20 Nov 2024 10:11:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732057902;
	cv=none; b=e15V8TKaJc3GuVoSR1x+aVxS0Bg9AjP0n1sg3PhOKutuiFi9cva0w3SCFB50u4C5wc5rXZbYNoDp0TUaK2g8GwhrIrhdHq8Db5/cQ2796SGZbFTF82VrL3/3rlctOJ6FVJwwXTrtw8+OPsmKwfbPHn93JBJQQcNL+NlyQPpMI/aERiwmgFgz5vQoCMJjgeXRoI8JAmUq3Nq3ce4XUeMER/OqZCpwTJezgbON44hGMs2wBqEt5bIJOFJ0BJZDEzJv5tWyykk95ai946E+c9eJ6hf/OGKLfWSnIaDwHd/ZXJcOF2VBkbMXDDfDzEUDKRxNL32f9j4yz2GAf5LOofptZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732057902; c=relaxed/relaxed;
	bh=zjJV71WkzGL/bOhiEY3AE6fRz5GkyYrLQMtV98PgjZQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Mkr2R7kzFkdoQ8FxZCdCgL+KAyGUMYkRnI/kGS8kOEAj1AukbsrdskrENUV/LDfz6gZkZtL62PIZT5C/L6EvgBOW94yWusdO1vw6z4GHRHywoDItjF2647gZu4h5AQ2J+jSWzyHQhJDBilpQxSJq/uuE6uBQbg2+1p0HM+OYubHjQimnTEZ4ctBJjXHcHrUMuPHxhSePGYEL6Kc6icW1SvgEo5ezCBY+ltLwQP9oTbV9wWo60PUFescnlBf8kxN+ui/uRhOBeqKZAXRvFuGFUPmCAloAozlHjE4AuShb/PSwi9fbcMrvZVLBw9ep8RhXQZrWEhW/0EA8CrrJeM8UOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gR3R1FjX; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gR3R1FjX;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtKxm5C3jz2y72
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2024 10:11:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732057896;
	bh=zjJV71WkzGL/bOhiEY3AE6fRz5GkyYrLQMtV98PgjZQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gR3R1FjXUX2v+ysac7N2oTEbccebCURUjTU/DDFXrURMssYftDedF0C3tODDXpYH9
	 k5kgGaQUUIDI1B0nNBV7TkXbCO8svc2bqGGWnkc/pccHI/owxIUBA5WLQTyeSXb6JC
	 wy5NX8TpHc8JQ+WMa83V8KhLkn9/WI2JodrzGkLsdD2y5c+G5JefeRfM4CtxpaGIVk
	 hjnXIZaAViHQgzuCa+1aSTxRiBg+oZKiVqJFWaLXX0TEcavlar4dYff/MruNMt3UXo
	 We6ULeFkiRejaCkmYMGQZTrbX/yuHvH/NvIF6r4dKb9yPNnYz/1BnVxzSt0eSjqW2q
	 i/w3YlDSCLY7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XtKxh1dVVz4xqb;
	Wed, 20 Nov 2024 10:11:35 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: Re: [RFC PATCH 09/10] i2c: Remove I2C_HYDRA
In-Reply-To: <CAMuHMdWtqNsmO=t=OF-2R-gA+khuKiGQOrBXRigE62bNjnUxPg@mail.gmail.com>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
 <20241114131114.602234-9-mpe@ellerman.id.au>
 <CAMuHMdWtqNsmO=t=OF-2R-gA+khuKiGQOrBXRigE62bNjnUxPg@mail.gmail.com>
Date: Wed, 20 Nov 2024 10:11:37 +1100
Message-ID: <87y11ehl92.fsf@mpe.ellerman.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:
> Hi Michael,
>
> On Thu, Nov 14, 2024 at 2:11=E2=80=AFPM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>> The i2c-hydra driver depends on PPC_CHRP which has now been removed,
>> remove the driver also.
>>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Thanks for your patch!
>
>> --- a/drivers/i2c/busses/i2c-hydra.c
>> +++ /dev/null
>
>> -#include <asm/hydra.h>
>
> Looks like this was the last real user of arch/powerpc/include/asm/hydra.=
h.
> drivers/scsi/mesh.c still includes it, but I don't see why it was ever
> needed in upstream.

Thanks, I'll remove it in v2.

cheers

