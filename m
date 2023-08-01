Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A38976A85E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 07:32:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NEUe+kUp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFNym6vWnz3c1H
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 15:32:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NEUe+kUp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFNxt0rkPz2xwG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 15:31:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=YWQyeeI0dgsh9BoI95IqY8St3ayAwC7ynd//yjkbluY=; b=NEUe+kUpvAtG16P/9InHgKqGu0
	AUYOLe/g7IFU13jJhhKVjGx5N7NhOwLG0DKs+u3ElqFarhHQOlC3sDbxvHYCYgRljZDhd2/QRk86p
	C8d4VTR4hOlS737/1hktRsUUiruqWBNrIcObkr1rhZn4T0btVs3d/a90Lh/Wx13KLd6JRKlAVMP4W
	wngb5eo1UiZQ4qr51Ufjct0uZRG8QbfiHh0cySGybspscck6ssCqW/XaknVdbwVMrp/skdf8NFanF
	izTnWvKmTZEB+OsirvvUlZHj1gNnzxxmP92wCLGfjMhxElJjd8lfQDpKA572TAnFwgoe+00QSKgHX
	VLprpXJA==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qQhyF-000OHn-0y;
	Tue, 01 Aug 2023 05:30:59 +0000
Message-ID: <58f88e11-9292-5eca-a4d6-e72d4124078a@infradead.org>
Date: Mon, 31 Jul 2023 22:30:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Documentation: devices.txt: reconcile serial/ucc_uart
 minor numers
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230724063341.28198-1-rdunlap@infradead.org>
 <dc334e93-1487-8058-195d-e90db7bdb53f@csgroup.eu>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <dc334e93-1487-8058-195d-e90db7bdb53f@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Timur Tabi <timur@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Kumar Gala <galak@kernel.crashing.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 7/31/23 22:21, Christophe Leroy wrote:
> 
> 
> Le 24/07/2023 à 08:33, Randy Dunlap a écrit :
>> Reconcile devices.txt with serial/ucc_uart.c regarding device number
>> assignments. ucc_uart.c supports 4 ports and uses minor devnums
>> 46-49, so update devices.txt with that info.
>> Then update ucc_uart.c's reference to the location of the devices.txt
>> list in the kernel source tree.
> 
> Devices ttyCPM* belong to cpm_uart driver. As explained in the comment 
> you have modified in UCC uart driver, UCC uart borrows those devices and 
> shall not be considered as the reference. But the lines you modify in 
> device.txt doesn't mention QE UCC, it mentions CPM SCC and CPM SMC.
> 
> CPM uart driver supports up to 6 ports (4 SCC and 2 SMC).
> 

Thank you for replying.

Does this mean that the patch should be reverted?

> On one of my boards which has a powerpc mpc866 CPU, I have:
> 
> [    2.393872] ff000a80.serial: ttyCPM0 at MMIO 0xfff00a80 (irq = 19, 
> base_baud = 8250000) is a CPM UART
> [    2.411899] ff000a90.serial: ttyCPM1 at MMIO 0xfff00a90 (irq = 20, 
> base_baud = 8250000) is a CPM UART
> [    2.430352] ff000a00.serial: ttyCPM2 at MMIO 0xfff00a00 (irq = 30, 
> base_baud = 8250000) is a CPM UART
> [    2.448944] ff000a20.serial: ttyCPM3 at MMIO 0xfff00a20 (irq = 29, 
> base_baud = 8250000) is a CPM UART
> [    2.467435] ff000a40.serial: ttyCPM4 at MMIO 0xfff00a40 (irq = 28, 
> base_baud = 8250000) is a CPM UART
> [    2.485924] ff000a60.serial: ttyCPM5 at MMIO 0xfff00a60 (irq = 27, 
> base_baud = 8250000) is a CPM UART
> 
> # ll /dev/ttyCPM*
> crw-------    1 root     root      204,  46 Jan  1 01:01 /dev/ttyCPM0
> crw-------    1 root     root      204,  47 Jan  1 01:00 /dev/ttyCPM1
> crw-------    1 root     root      204,  48 Jan  1 01:00 /dev/ttyCPM2
> crw-------    1 root     root      204,  49 Jan  1 01:00 /dev/ttyCPM3
> crw-------    1 root     root      204,  50 Jan  1 01:00 /dev/ttyCPM4
> crw-------    1 root     root      204,  51 Jan  1 01:00 /dev/ttyCPM5

I don't see minors 50-51 allocated in devices.txt for use by this device/driver.
Am I overlooking that allocation somewhere?

Thanks for your help.

> 
> # cat /proc/tty/drivers
> /dev/tty             /dev/tty        5       0 system:/dev/tty
> /dev/console         /dev/console    5       1 system:console
> /dev/ptmx            /dev/ptmx       5       2 system
> ttyCPM               /dev/ttyCPM   204 46-51 serial
> pty_slave            /dev/pts      136 0-1048575 pty:slave
> pty_master           /dev/ptm      128 0-1048575 pty:master
> pty_slave            /dev/ttyp       3 0-4 pty:slave
> pty_master           /dev/pty        2 0-4 pty:master
> 
> Christophe
> 
> 
>>
>> Fixes: d7584ed2b994 ("[POWERPC] qe-uart: add support for Freescale QUICCEngine UART")
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Timur Tabi <timur@kernel.org>
>> Cc: Kumar Gala <galak@kernel.crashing.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Jiri Slaby <jirislaby@kernel.org>
>> Cc: linux-serial@vger.kernel.org
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: linux-doc@vger.kernel.org
>> ---
>>   Documentation/admin-guide/devices.txt |    2 +-
>>   drivers/tty/serial/ucc_uart.c         |    2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff -- a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
>> --- a/drivers/tty/serial/ucc_uart.c
>> +++ b/drivers/tty/serial/ucc_uart.c
>> @@ -59,7 +59,7 @@ static int firmware_loaded;
>>   /* #define LOOPBACK */
>>   
>>   /* The major and minor device numbers are defined in
>> - * http://www.lanana.org/docs/device-list/devices-2.6+.txt.  For the QE
>> + * Documentation/admin-guide/devices.txt.  For the QE
>>    * UART, we have major number 204 and minor numbers 46 - 49, which are the
>>    * same as for the CPM2.  This decision was made because no Freescale part
>>    * has both a CPM and a QE.
>> diff -- a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
>> --- a/Documentation/admin-guide/devices.txt
>> +++ b/Documentation/admin-guide/devices.txt
>> @@ -2691,7 +2691,7 @@
>>   		 45 = /dev/ttyMM1		Marvell MPSC - port 1 (obsolete unused)
>>   		 46 = /dev/ttyCPM0		PPC CPM (SCC or SMC) - port 0
>>   		    ...
>> -		 47 = /dev/ttyCPM5		PPC CPM (SCC or SMC) - port 5
>> +		 49 = /dev/ttyCPM5		PPC CPM (SCC or SMC) - port 3
>>   		 50 = /dev/ttyIOC0		Altix serial card
>>   		    ...
>>   		 81 = /dev/ttyIOC31		Altix serial card

-- 
~Randy
