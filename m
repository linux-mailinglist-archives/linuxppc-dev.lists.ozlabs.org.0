Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EE614B09B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 09:01:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486Jw95B2WzDqKs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 19:01:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p02-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5302::4;
 helo=mo6-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=XNjnUC/9; 
 dkim-atps=neutral
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486Jt46P5YzDqBj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 18:59:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1580198361;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=QV6nYKZBIO4WI3rfmuSOXDfWplBLhb0C0CHbzIiwZ5Q=;
 b=XNjnUC/9oezmdXTuM9CpY3RCc2GDzX717i2YtjICgMbOVQrUHBgKaDr8Ll881gMiSk
 zU26VYAHRMKtjZ3l9iPdvA93FUeMdtkmFyTS7mICtj8FtqKav6ZZX0tBZTBv/WhYMCBO
 +xtCZ4kZ5rQ9P+SORqAD1voOTZeFxB4EGoH86RctwMpQDw98hsZrQTVpgNxclQjUSEHL
 laTeNy401nR0Cr++HfV0YKO4MIsWGDncn6gojjNNX247drmjgWGnPIu/Dithg6ueANjb
 k7odfEvkCK4ylqdxHJ7qWa0co2pQWZfv6b5xGZqbYdNg8zmU5lVlr1l9r0FflGLxnZjr
 aRUQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhQIm3EseWh4IuTiRKK0dhKoJuKag=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:34b8:6e34:7a4d:c0db]
 by smtp.strato.de (RZmta 46.1.7 AUTH) with ESMTPSA id k0b198w0S7wULJ0
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 28 Jan 2020 08:58:30 +0100 (CET)
Subject: [PASEMI PA6T PPC] Onboard CF card device with new SanDisk High (>8G)
 CF cards
To: Michael Ellerman <mpe@ellerman.id.au>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Julian Margetson <runaway@candw.ms>, "contact@a-eon.com"
 <contact@a-eon.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Rob Herring <robh+dt@kernel.org>, Christoph Hellwig <hch@infradead.org>
References: <20200108093903.57620-1-hdegoede@redhat.com>
 <20200108093903.57620-2-hdegoede@redhat.com>
 <61bc9265-ece0-eeb6-d4a1-4631138ecf29@intel.com>
 <8d67882d-04a8-0607-be4e-c1430b7fda21@redhat.com>
 <84a32714-ba08-74a0-0c76-3c36db44dd68@intel.com>
 <93446e09-5f12-800a-62fa-bf3ecea7273d@redhat.com>
 <399ac7d5-2518-799a-595e-f6b6878cf4ab@intel.com>
 <a9ab8946-c599-5f83-7527-2387a9e82e8a@xenosoft.de>
 <CAPDyKFoydOuSE=Eaq168=2_Ycouo7hzyw+RZXhGq7q4D4Qe8TQ@mail.gmail.com>
 <8736c5hyhr.fsf@mpe.ellerman.id.au>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <688f1943-5b81-6200-d4d9-38d21b69e180@xenosoft.de>
Date: Tue, 28 Jan 2020 08:58:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8736c5hyhr.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Hi All,

Which mailing list is responsible for the pata_pcmcia driver? We are 
using new SanDisk High (>8G) CF cards with this driver [1] and we need 
the following line in the file "drivers/ata/pata_pcmcia.c".

+    PCMCIA_DEVICE_MANF_CARD(0x00f1, 0x0101),        /* SanDisk High 
(>8G) CFA */

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?f=35&t=4282
