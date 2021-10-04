Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A5C4208AF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 11:48:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNGBT3S60z2yp6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 20:48:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=fZNvt6nZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.84;
 helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=fZNvt6nZ; 
 dkim-atps=neutral
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNG9k2xb4z2xtr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Oct 2021 20:48:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633340878;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=FeHR43dQLLtrHkwR5FFcK3N3PxqoSGlaaCsoAV1our0=;
 b=fZNvt6nZIg6C5j381lGsn/vwnSGy4QIbsdMofBzeI8dDMaDZ3hoJ0Jrl6eaU38rGnn
 UpHUck8lGxVIHCwoYVKCZniYtIGZ4W5vMHjWyIObGFR1RlJuEnyUhPw9/tkKEAPDP1o7
 LvlyAuDTtPTMGm77Fp9Okl7BuO0wISpdsSpndfKkT3K7CZ4byB2c8wgsWc2vE++1Pivl
 Hw1QFLh8LjEf3aO+tk9mt9N7jHlR0QIfLDEHUE2f7D2wQGoseswwqfIFSPSEz+ubhusl
 wSmm0wOR8vDy+8m+EITszNrMR8109I1XeuDaplJVJfx9HnYX+uS0mwBTJg1srXvNghGS
 XGgg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2Z2iLowxnW5xYeu/ol3GhYINSxQY8iybSLQkkHm"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple by smtp.strato.de (RZmta 47.33.8 AUTH)
 with ESMTPSA id I00cdex949lwlK5
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 4 Oct 2021 11:47:58 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Add Apple M1 support to PASemi i2c driver
Date: Mon, 4 Oct 2021 11:47:57 +0200
Message-Id: <1B71F6A3-6467-46EF-858F-82E93D54365D@xenosoft.de>
References: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
In-Reply-To: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
To: Sven Peter <sven@svenpeter.dev>
X-Mailer: iPhone Mail (19A346)
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
Cc: Darren Stevens <darren@stevens-zone.net>, Arnd Bergmann <arnd@arndb.de>,
 Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Olof Johansson <olof@lixom.net>, mohamed.mediouni@caramail.com,
 Matthew Leaman <matthew@a-eon.biz>, Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd@a-eon.com>,
 linux-arm-kernel@lists.infradead.org, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sven,

Unfortunately Damien has found an issue. [1]

Output of i2cdetect -l with the default RC3 of kernel 5.15 without your modi=
fications:

2c-0	i2c       	Radeon i2c bit bus 0x90         	I2C adapter=

i2c-1	i2c       	Radeon i2c bit bus 0x91         	I2C adapter=

i2c-2	i2c       	Radeon i2c bit bus 0x92         	I2C adapter=

i2c-3	i2c       	Radeon i2c bit bus 0x93         	I2C adapter=

i2c-4	i2c       	Radeon i2c bit bus 0x94         	I2C adapter=

i2c-5	i2c       	Radeon i2c bit bus 0x95         	I2C adapter=

i2c-6	i2c       	Radeon i2c bit bus 0x96         	I2C adapter=

i2c-7	i2c       	Radeon i2c bit bus 0x97         	I2C adapter=

i2c-8	i2c       	PA Semi SMBus adapter at 0x800200	I2C adapter=

i2c-9	i2c       	PA Semi SMBus adapter at 0x800240	I2C adapter=

i2c-10	i2c       	PA Semi SMBus adapter at 0x800280	I2C adapter=


Output of i2cdetect -l with your modifications:

i2c-0	i2c       	Radeon i2c bit bus 0x90         	I2C adapter=

i2c-1	i2c       	Radeon i2c bit bus 0x91         	I2C adapter=

i2c-2	i2c       	Radeon i2c bit bus 0x92         	I2C adapter=

i2c-3	i2c       	Radeon i2c bit bus 0x93         	I2C adapter=

i2c-4	i2c       	Radeon i2c bit bus 0x94         	I2C adapter=

i2c-5	i2c       	Radeon i2c bit bus 0x95         	I2C adapter=

i2c-6	i2c       	Radeon i2c bit bus 0x96         	I2C adapter=

i2c-7	i2c       	Radeon i2c bit bus 0x97         	I2C adapter=

i2c-8	i2c       	PA Semi SMBus adapter at 0x(____ptrval____)	I2C=
 adapter
i2c-9	i2c       	PA Semi SMBus adapter at 0x(____ptrval____)	I2C=
 adapter
i2c-10	i2c       	PA Semi SMBus adapter at 0x(____ptrval____)	I2C=
 adapter

Please check the outputs.

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=3D54165#p54165=

