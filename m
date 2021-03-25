Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E44AC348639
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 02:10:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5Rqq6bslz3btw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 12:10:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZaAExu5G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZaAExu5G; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5RqQ1CvSz301y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 12:10:25 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F5RqF5LH1z9sWX;
 Thu, 25 Mar 2021 12:10:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616634618;
 bh=ZW+d7kU0Risnr9sA0Xrow6G2y6serwV4IO6IYGM/EHQ=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=ZaAExu5G5EHRvfCFWIlGfPIGJXs7Zus8026qfM8tQ0XazFMVwrAL3KgxCye2W5i4N
 etEWZ7Oqv9u8UWwPMG+ZyjZr+LGwZoohZQGnyNQm4T/ZHBIQs3Ta081CFtBYmVXY9T
 ao/N1sK/2aQ2xtBhpSWIG/jqGPQvn9CTkVrCX+MJV6h1C9BIuYXDQdZiyHMQ6QfGxb
 c4EbvWbapRIDhnoXQBgXXt+jXDCU3DSS4pM3wcG93GZmHNJv4YjpaUQ3mJsiU9IFsi
 2EXUsPRpd2CrsqfjptLJiDaQuEq0g4a+oIOUdOmaMnsrFipNTB0UP6ao/umAJUYBOy
 kGKpbzjJSY0VA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RESEND 1/1] powerpc: asm: hvconsole: Move
 'hvc_vio_init_early's prototype to shared location
In-Reply-To: <20210324103854.GK2916463@dell>
References: <20210303124603.3150175-1-lee.jones@linaro.org>
 <20210324103854.GK2916463@dell>
Date: Thu, 25 Mar 2021 12:10:13 +1100
Message-ID: <87h7l0ghsa.fsf@mpe.ellerman.id.au>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lee Jones <lee.jones@linaro.org> writes:
> On Wed, 03 Mar 2021, Lee Jones wrote:
>
>> Fixes the following W=3D1 kernel build warning(s):
>>=20
>>  drivers/tty/hvc/hvc_vio.c:385:13: warning: no previous prototype for =
=E2=80=98hvc_vio_init_early=E2=80=99 [-Wmissing-prototypes]
>>  385 | void __init hvc_vio_init_early(void)
>>  | ^~~~~~~~~~~~~~~~~~
>>=20
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
>> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  arch/powerpc/include/asm/hvconsole.h     | 3 +++
>>  arch/powerpc/platforms/pseries/pseries.h | 3 ---
>>  arch/powerpc/platforms/pseries/setup.c   | 1 +
>>  3 files changed, 4 insertions(+), 3 deletions(-)
>
> Any idea who might pick this up please?

I will. I have it in my next-test branch.=20

cheers
