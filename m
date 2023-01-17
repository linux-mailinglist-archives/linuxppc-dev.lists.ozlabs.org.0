Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D6766E12F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 15:47:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxBYw6D2rz3cFd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 01:47:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e+Enifcc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jikos@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e+Enifcc;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxBY22WNdz3c66
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 01:46:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id CC0FFCE1394;
	Tue, 17 Jan 2023 14:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A04C433EF;
	Tue, 17 Jan 2023 14:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673966783;
	bh=EwJ3yqGrp+xsLubFKZO2Ldpy6yzlycg6MAYr3/agyCU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e+EnifccDHf5NnhmDJ17AHblWwiJ1A6d/2hf+BtUaJO6BcIw0wVzPPr7Q2geNAm6G
	 i6Zjmw8yOJ10Hm9DNo1GxZsDHiV7qJe4NW4NhB/qPoTxX9D0wrBGGgn/b3daBjlfbl
	 zjAIJTYjGn4b30JMV8P9IHvPQ/axHDqND+ZHIgUVhE9HmfktG9t0eoctv46bWoaCoV
	 AhwrbqZfB3EWuJ5nvp5xMTtO6/Fj9ujwE/CmNMUu8YR39tu8GtqB3ml2ndB3+64rXy
	 ik+jA2sTmUsr8EUieyXys3SMccnjQ8izLywZr6k5uJS6DXqq35oc7k5bfxAKif/e9U
	 3ucfxLlNMu8Vw==
Date: Tue, 17 Jan 2023 15:46:23 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [PASEMI] Nemo board doesn't reboot anymore after the commit
 "HID: usbhid: Add ALWAYS_POLL quirk for some mice"
In-Reply-To: <aafbda4b-3a1a-cf7d-0a29-ba0b8b4adc4e@xenosoft.de>
Message-ID: <nycvar.YFH.7.76.2301171545590.1734@cbobk.fhfr.pm>
References: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de> <75f18191-c311-18f2-bfdb-ac82fb166e1b@xenosoft.de> <nycvar.YFH.7.76.2301061540530.1734@cbobk.fhfr.pm> <aafbda4b-3a1a-cf7d-0a29-ba0b8b4adc4e@xenosoft.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, linux-input@vger.kernel.org, Christian Zigotzky <info@xenosoft.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, anpatel@nvidia.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 17 Jan 2023, Christian Zigotzky wrote:

> >> The reboot issue is still present in the RC2 of kernel 6.2. We still need
> >> the
> >> usbhid.patch. [1]
> >>
> >> Please check the bad commit. [2]
> > Ankit,
> >
> > have you tested with all the devices that you added the quirk for in your
> > original patch?
> >
> > Unless I hear otherwise, I will just drop
> > the quirk for USB_DEVICE_ID_CHERRY_MOUSE_000C before this gets clarified.
> >
> > Thanks,
> >
> The issue also affects the RC4.

Given the lack of input from Ankit, I have just queued the patch below in 
for-6.2/upstream-fixes.


From: Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH] HID: revert CHERRY_MOUSE_000C quirk

This partially reverts commit f6d910a89a2391 ("HID: usbhid: Add ALWAYS_POLL quirk
for some mice"), as it turns out to break reboot on some platforms for reason
yet to be understood.

Fixes: f6d910a89a2391 ("HID: usbhid: Add ALWAYS_POLL quirk for some mice")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---
 drivers/hid/hid-ids.h    | 1 -
 drivers/hid/hid-quirks.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 82713ef3aaa6..c3735848ed5d 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -274,7 +274,6 @@
 #define USB_DEVICE_ID_CH_AXIS_295	0x001c
 
 #define USB_VENDOR_ID_CHERRY		0x046a
-#define USB_DEVICE_ID_CHERRY_MOUSE_000C	0x000c
 #define USB_DEVICE_ID_CHERRY_CYMOTION	0x0023
 #define USB_DEVICE_ID_CHERRY_CYMOTION_SOLAR	0x0027
 
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 0e9702c7f7d6..be3ad02573de 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -54,7 +54,6 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_FLIGHT_SIM_YOKE), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_PRO_PEDALS), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_PRO_THROTTLE), HID_QUIRK_NOGET },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_CHERRY, USB_DEVICE_ID_CHERRY_MOUSE_000C), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K65RGB), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K65RGB_RAPIDFIRE), HID_QUIRK_NO_INIT_REPORTS | HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K70RGB), HID_QUIRK_NO_INIT_REPORTS },

-- 
Jiri Kosina
SUSE Labs

