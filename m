Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C27D766022C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 15:31:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpQkJ4Kk9z3cLb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 01:31:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=bHnQfySX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=bHnQfySX;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpQhM0P1Mz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 01:29:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1673015346;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Cc:References:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=D5q7Av8PI/yow+od4ses6EOAcMhbz5eCt7aseWcHWEg=;
    b=bHnQfySX4BHxaw/68wyNM4b7SxOnz1NLt5pWCro9V1AoNa07LVe7eOIAVa7Sl6kGr7
    K3LXJlJ8gFW58WDcCRgZrswPoZ4gyJiCCnYUZttSnZ2mblrRi/8d8ZXLQaJ69dNA5XOy
    klRV6nRTgYoN/aG5oZ4MPGHwSurdTnFGqJLtcfpjVSvF9YzG8Xh37w1oVAfM6/YDKVoz
    bV1mySauHapS8KhE8lweXhrypc6XhBsaW2eWBNle3XhntFe2zql2Xcl4jsoYj7jduSpr
    MgFnqp51GdI1Lm+TruVfxJAu5Rz6r9iwSmX/nPVxjyjSILbjkr3NqNBf/vvi82Z3rkWk
    KkWQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiD6ZxUZL738U2gX7JjvUZgWUP2Fw=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:f0be:1eb9:476d:2a34]
    by smtp.strato.de (RZmta 48.2.1 AUTH)
    with ESMTPSA id e28afdz06ET5USa
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 6 Jan 2023 15:29:05 +0100 (CET)
Message-ID: <75f18191-c311-18f2-bfdb-ac82fb166e1b@xenosoft.de>
Date: Fri, 6 Jan 2023 15:29:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: [PASEMI] Nemo board doesn't reboot anymore after the commit "HID:
 usbhid: Add ALWAYS_POLL quirk for some mice"
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: anpatel@nvidia.com, jkosina@suse.cz, linux-input@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linux-input@vger.kernel.org, mad skateman <madskateman@gmail.com>
References: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de>
In-Reply-To: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

The reboot issue is still present in the RC2 of kernel 6.2. We still 
need the usbhid.patch. [1]

Please check the bad commit. [2]

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=56303#p56303
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.1&id=f6d910a89a2391e5ce1f275d205023880a33d3f8 



On 22 December 2022 at 11:42 am, Christian Zigotzky wrote:
> Hello,
>
> The Nemo board [1] doesn't reboot anymore since the final kernel 6.1. 
> The reboot works with the RC8 of kernel 6.1.
> Actually, a reboot works but the CFE firmware is not loaded. Maybe 
> there is still something in the memory after the reboot.
>
> I bisected today. [2]
>
> The commit "HID: usbhid: Add ALWAYS_POLL quirk for some mice". [3] is 
> the problem.
>
> I was able to revert this commit and the reboot works without any 
> problems again.
>
> I created a patch for reverting the bad commit. [4]
>
> Then I compiled the kernel with this patch. After that, the X1000 
> reboots without any problems.
>
> I use a Cherry USB mouse. [5]
>
> Please check the bad commit.
>
> Thanks,
> Christian
>
>
> [1] https://en.wikipedia.org/wiki/AmigaOne_X1000
> [2] https://forum.hyperion-entertainment.com/viewtopic.php?p=56303#p56303
> [3] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.1&id=f6d910a89a2391e5ce1f275d205023880a33d3f8
> [4] usbhid.patch:
>
> diff -rupN a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> --- a/drivers/hid/hid-ids.h    2022-12-22 10:24:06.842881276 +0100
> +++ b/drivers/hid/hid-ids.h    2022-12-22 10:23:35.903328869 +0100
> @@ -274,7 +274,6 @@
>  #define USB_DEVICE_ID_CH_AXIS_295    0x001c
>
>  #define USB_VENDOR_ID_CHERRY        0x046a
> -#define USB_DEVICE_ID_CHERRY_MOUSE_000C    0x000c
>  #define USB_DEVICE_ID_CHERRY_CYMOTION    0x0023
>  #define USB_DEVICE_ID_CHERRY_CYMOTION_SOLAR    0x0027
>
> @@ -919,7 +918,6 @@
>  #define USB_DEVICE_ID_MS_XBOX_ONE_S_CONTROLLER    0x02fd
>  #define USB_DEVICE_ID_MS_PIXART_MOUSE    0x00cb
>  #define USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS      0x02e0
> -#define USB_DEVICE_ID_MS_MOUSE_0783      0x0783
>
>  #define USB_VENDOR_ID_MOJO        0x8282
>  #define USB_DEVICE_ID_RETRO_ADAPTER    0x3201
> @@ -1388,7 +1386,6 @@
>
>  #define USB_VENDOR_ID_PRIMAX    0x0461
>  #define USB_DEVICE_ID_PRIMAX_MOUSE_4D22    0x4d22
> -#define USB_DEVICE_ID_PRIMAX_MOUSE_4E2A    0x4e2a
>  #define USB_DEVICE_ID_PRIMAX_KEYBOARD    0x4e05
>  #define USB_DEVICE_ID_PRIMAX_REZEL    0x4e72
>  #define USB_DEVICE_ID_PRIMAX_PIXART_MOUSE_4D0F    0x4d0f
> diff -rupN a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> --- a/drivers/hid/hid-quirks.c    2022-12-22 10:24:06.844881247 +0100
> +++ b/drivers/hid/hid-quirks.c    2022-12-22 10:23:35.904328855 +0100
> @@ -54,7 +54,6 @@ static const struct hid_device_id hid_qu
>      { HID_USB_DEVICE(USB_VENDOR_ID_CH, 
> USB_DEVICE_ID_CH_FLIGHT_SIM_YOKE), HID_QUIRK_NOGET },
>      { HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_PRO_PEDALS), 
> HID_QUIRK_NOGET },
>      { HID_USB_DEVICE(USB_VENDOR_ID_CH, 
> USB_DEVICE_ID_CH_PRO_THROTTLE), HID_QUIRK_NOGET },
> -    { HID_USB_DEVICE(USB_VENDOR_ID_CHERRY, 
> USB_DEVICE_ID_CHERRY_MOUSE_000C), HID_QUIRK_ALWAYS_POLL },
>      { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 
> USB_DEVICE_ID_CORSAIR_K65RGB), HID_QUIRK_NO_INIT_REPORTS },
>      { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 
> USB_DEVICE_ID_CORSAIR_K65RGB_RAPIDFIRE), HID_QUIRK_NO_INIT_REPORTS | 
> HID_QUIRK_ALWAYS_POLL },
>      { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 
> USB_DEVICE_ID_CORSAIR_K70RGB), HID_QUIRK_NO_INIT_REPORTS },
> @@ -123,7 +122,6 @@ static const struct hid_device_id hid_qu
>      { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 
> USB_DEVICE_ID_LOGITECH_MOUSE_C05A), HID_QUIRK_ALWAYS_POLL },
>      { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 
> USB_DEVICE_ID_LOGITECH_MOUSE_C06A), HID_QUIRK_ALWAYS_POLL },
>      { HID_USB_DEVICE(USB_VENDOR_ID_MCS, 
> USB_DEVICE_ID_MCS_GAMEPADBLOCK), HID_QUIRK_MULTI_INPUT },
> -    { HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, 
> USB_DEVICE_ID_MS_MOUSE_0783), HID_QUIRK_ALWAYS_POLL },
>      { HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, 
> USB_DEVICE_ID_MS_PIXART_MOUSE), HID_QUIRK_ALWAYS_POLL },
>      { HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, 
> USB_DEVICE_ID_MS_POWER_COVER), HID_QUIRK_NO_INIT_REPORTS },
>      { HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, 
> USB_DEVICE_ID_MS_SURFACE3_COVER), HID_QUIRK_NO_INIT_REPORTS },
> @@ -148,7 +146,6 @@ static const struct hid_device_id hid_qu
>      { HID_USB_DEVICE(USB_VENDOR_ID_PIXART, 
> USB_DEVICE_ID_PIXART_OPTICAL_TOUCH_SCREEN), HID_QUIRK_NO_INIT_REPORTS },
>      { HID_USB_DEVICE(USB_VENDOR_ID_PIXART, 
> USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE), HID_QUIRK_ALWAYS_POLL },
>      { HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, 
> USB_DEVICE_ID_PRIMAX_MOUSE_4D22), HID_QUIRK_ALWAYS_POLL },
> -    { HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, 
> USB_DEVICE_ID_PRIMAX_MOUSE_4E2A), HID_QUIRK_ALWAYS_POLL },
>      { HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, 
> USB_DEVICE_ID_PRIMAX_PIXART_MOUSE_4D0F), HID_QUIRK_ALWAYS_POLL },
>      { HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, 
> USB_DEVICE_ID_PRIMAX_PIXART_MOUSE_4D65), HID_QUIRK_ALWAYS_POLL },
>      { HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, 
> USB_DEVICE_ID_PRIMAX_PIXART_MOUSE_4E22), HID_QUIRK_ALWAYS_POLL },
>
> [5]
>
> Bus 003 Device 002: ID 046a:000c Cherry GmbH
> Couldn't open device, some information will be missing
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               1.10
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0         8
>   idVendor           0x046a Cherry GmbH
>   idProduct          0x000c
>   bcdDevice            8.10
>   iManufacturer           0
>   iProduct                0
>   iSerial                 0
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0022
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0xa0
>       (Bus Powered)
>       Remote Wakeup
>     MaxPower              100mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass         3 Human Interface Device
>       bInterfaceSubClass      1 Boot Interface Subclass
>       bInterfaceProtocol      2 Mouse
>       iInterface              0
>         HID Device Descriptor:
>           bLength                 9
>           bDescriptorType        33
>           bcdHID               1.00
>           bCountryCode            0 Not supported
>           bNumDescriptors         1
>           bDescriptorType        34 Report
>           wDescriptorLength      52
>          Report Descriptors:
>            ** UNAVAILABLE **
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0004  1x 4 bytes
>         bInterval              10
>

