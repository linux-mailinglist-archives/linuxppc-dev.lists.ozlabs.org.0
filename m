Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB98D34F08C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 20:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8yDf5F0Cz3c6G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 05:10:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=mbDZevjF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=81.169.146.168;
 helo=mo4-p02-ob.smtp.rzone.de; envelope-from=hns@goldelico.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=goldelico.com header.i=@goldelico.com
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=mbDZevjF; 
 dkim-atps=neutral
X-Greylist: delayed 147 seconds by postgrey-1.36 at boromir;
 Wed, 31 Mar 2021 05:10:35 AEDT
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.168])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8yDC2cXyz2yyt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 05:10:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617127652; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=Eyq7UqYoQqaEh0TMUnq5UzdsBNGHStBafdmSxV9W2kisa22bG7lmyAywbGT1XJNba7
 eioohjWH90m+ApCCaLfIJxxrR0fQOvTVZ+fpgqmhqIMk/mcG5vvv755Km5wHzjfz85eD
 AIodf4KHXJpzky4K9Aqs3tShThestACt/nWf04t592qQQCRQl6j3BZfA4sQbOP2xon7H
 CO2OSrUFpfKhmJRWkNPpKptwmAM6sMygUV0eEVrdYDzhUtLa+wHtAn+mOZEsc3EVuVuK
 I1WEqmTMsSz6bLFh8xF0oI/lJJm26GPzvsu8uvlw+eAR9YXciV1S+X5IXCmUg1qJUIug
 fnig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1617127652;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=TBtxdLUkTjgMvDEB4mRh0JBbXrVFmzYUj0lLVMFFsdA=;
 b=iDxuBxBtN4zGXwH2FsNDucbzs44++UuByW9OubNfPa+SgIUVYehN+9wajhoPfWf8ne
 AJBeDpLzfO9gvPi1AhT0jxBhUc3mkrU3McdEHDV+b0zDo5wFvykL3ipqabsAzZU6O7uz
 is7TqCigWd9ZbgrEsfGbT107MDunzyDPutsq+PzsCSPNZocW9LxvOzLbkyCPLhoBlc7/
 oipum/qvWNjCcVAwprWos80uz+EPG1wDUnbl2HlPeD0LPZubEv85OlwKgkt04b/wC3ze
 Q/YiSR5IF99tHUC2aAp+hTj0JNzGcOYR8WbAB/c0XCz3bibgnOfYzQ2C5UX/ZGASRCMW
 /9Eg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1617127652;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=TBtxdLUkTjgMvDEB4mRh0JBbXrVFmzYUj0lLVMFFsdA=;
 b=mbDZevjFp2b5R5VUle8FDC8MwkfYJzBYGCwkaBTe2ybLg6GWxZEJsH5woKenUz96DZ
 HLCOwfabBd5h1GPxw3d1/qdKw063SU3JfrMvJjSZc4etXqVgZ2OuBchcRp0XGZjLqw0Q
 XI9sVLA8HjveKwrt594YK3I6FiUVUxeNeTlYhNwAe6WYcF1jzcOR6pVtqoJP9uP/xZ/D
 Syv6uzaw6Ma5RlMrYSJzO01MZ2ln4j1+WzqLWaT+SnK0MZvUpV72FVIyBP3MJRqqvVES
 dGUeryXh/+ZW1PiQ4IEXCAuRPM4Xx3PnN8Xk5C5+DltqN18M43BTURpT9dF2flHnmD8l
 liYA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAjw47t884="
X-RZG-CLASS-ID: mo00
Received: from [192.168.178.35] by smtp.strato.de (RZmta 47.23.1 DYNA|AUTH)
 with ESMTPSA id h03350x2UI7VJS3
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 30 Mar 2021 20:07:31 +0200 (CEST)
Subject: Re: [PATCH v3 01/17] cmdline: Add generic function to build command
 line.
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210330172714.GR109100@zorba>
Date: Tue, 30 Mar 2021 20:07:30 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <D8C1FBF6-E5C0-4233-BCB8-694274EA28F9@goldelico.com>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
 <20210330172714.GR109100@zorba>
To: Daniel Walker <danielwa@cisco.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3124)
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
Cc: linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>,
 microblaze <monstr@monstr.eu>, daniel@gimpelevich.san-francisco.ca.us,
 devicetree <devicetree@vger.kernel.org>, linux-sh@vger.kernel.org,
 will@kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, linux-mips <linux-mips@vger.kernel.org>,
 openrisc@lists.librecores.org, linux-hexagon@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> Am 30.03.2021 um 19:27 schrieb Daniel Walker <danielwa@cisco.com>:
>=20
> On Fri, Mar 26, 2021 at 01:44:48PM +0000, Christophe Leroy wrote:
>> This code provides architectures with a way to build command line
>> based on what is built in the kernel and what is handed over by the
>> bootloader, based on selected compile-time options.
>>=20
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v3:
>> - Addressed comments from Will
>> - Added capability to have src =3D=3D dst
>> ---
>> include/linux/cmdline.h | 57 =
+++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 57 insertions(+)
>> create mode 100644 include/linux/cmdline.h
>>=20
>> diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
>> new file mode 100644
>> index 000000000000..dea87edd41be
>> --- /dev/null
>> +++ b/include/linux/cmdline.h
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _LINUX_CMDLINE_H
>> +#define _LINUX_CMDLINE_H
>> +
>> +#include <linux/string.h>
>> +
>> +/* Allow architectures to override strlcat, powerpc can't use =
strings so early */
>> +#ifndef cmdline_strlcat
>> +#define cmdline_strlcat strlcat
>> +#endif
>> +
>> +/*
>> + * This function will append or prepend a builtin command line to =
the command
>> + * line provided by the bootloader. Kconfig options can be used to =
alter
>> + * the behavior of this builtin command line.
>> + * @dst: The destination of the final appended/prepended string.
>> + * @src: The starting string or NULL if there isn't one.
>> + * @len: the length of dest buffer.
>> + */
>=20
> Append or prepend ? Cisco requires both at the same time. This is why =
my
> implementation provides both. I can't use this with both at once.

Just an idea: what about defining CMDLINE as a pattern where e.g. "$$" =
or "%%"
is replaced by the boot loader command line?

Then you can formulate replace, prepend, append, prepend+append with a =
single
CONFIG setting.

It may be a little more complex in code (scanning for the pattern and =
replacing
it and take care to temporary memory) but IMHO it could be worth to =
consider.

BR,
Nikolaus Schaller

