Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C65EA14BC58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 15:53:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486V3T57LbzDqFG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 01:53:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p02-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5302::1;
 helo=mo6-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=QMPkOAnm; 
 dkim-atps=neutral
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486Tyl5qzqzDqDP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 01:49:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1580222939;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Yd8278IdffBOus6O3P2vy23ykNevCPa9Nig0acvB1Ps=;
 b=QMPkOAnmxXokcLX71Dm+Wi8hoWn4zbmbABGXEqVHW0F9wwhuqeOU2iDhwoBnB+5PDG
 8G+VXyanVjxfCPjMp5KjkhCdaG2teUyosQ+4aWXnqdcX/cpzevyi9XKl2gPVwRPSg8Yf
 hCgrDsHNXr7DEwsS2gy87lqtGjFtAfeplTUOQ7IQFq7VpyboWf3RiBb5eJ4OMPzy5/i+
 598RcC1R3RDGMnggWPnYnrvBJcfMPOd92fT4z616CVRUgt5AYulTs7obZrLeWILx0jBY
 eoZjsja7cfTKenLUcjhdILOE1WOcZwhgic6BAMUsjyob1iu2fvRhjACEM78A2Z6kV/M4
 zBSg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgHL/0viBvFGid1vGKl+pRiZ7f+cg=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:d904:eb1c:cd43:d772]
 by smtp.strato.de (RZmta 46.1.7 AUTH) with ESMTPSA id k0b198w0SEm6OUY
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 28 Jan 2020 15:48:06 +0100 (CET)
Subject: Re: [PASEMI PA6T PPC] Onboard CF card device with new SanDisk High
 (>8G) CF cards
To: Rob Herring <robh+dt@kernel.org>
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
 <688f1943-5b81-6200-d4d9-38d21b69e180@xenosoft.de>
 <CAL_Jsq+r9a0BhvO4-VK59+Fh=9Ean=JgKwwxS+bqVz7=OWD5_w@mail.gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <516d9b3f-426e-3f19-67c8-fa20368901ef@xenosoft.de>
Date: Tue, 28 Jan 2020 15:48:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+r9a0BhvO4-VK59+Fh=9Ean=JgKwwxS+bqVz7=OWD5_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Julian Margetson <runaway@candw.ms>, Christoph Hellwig <hch@infradead.org>,
 "contact@a-eon.com" <contact@a-eon.com>, mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28 January 2020 at 3:16 pm, Rob Herring wrote:
> On Tue, Jan 28, 2020 at 2:01 AM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>> Hi All,
>>
>> Which mailing list is responsible for the pata_pcmcia driver? We are
>> using new SanDisk High (>8G) CF cards with this driver [1] and we need
>> the following line in the file "drivers/ata/pata_pcmcia.c".
>>
>> +    PCMCIA_DEVICE_MANF_CARD(0x00f1, 0x0101),        /* SanDisk High
>> (>8G) CFA */
> Run get_maintainers.pl and it will answer that for you:
>
> $ scripts/get_maintainer.pl -f drivers/ata/pata_pcmcia.c
> Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> (maintainer:LIBATA PATA DRIVERS)
> Jens Axboe <axboe@kernel.dk> (maintainer:LIBATA PATA DRIVERS)
> linux-ide@vger.kernel.org (open list:LIBATA PATA DRIVERS)
> linux-kernel@vger.kernel.org (open list)
Thank you!
