Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76252660263
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 15:42:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpQzx1vWqz3c83
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 01:42:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o9g+mwDF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jikos@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o9g+mwDF;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpQyy6ZH9z2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 01:42:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 60CC4B81CD0;
	Fri,  6 Jan 2023 14:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084F1C433D2;
	Fri,  6 Jan 2023 14:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673016117;
	bh=8EsxnIBfDu3hX7I4HWdnma591isFDpzGurRz4gzs2kY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o9g+mwDFquqmPxFUFq9UMGp5UDAR8JuWhDSyajBNkn4vwwvK7SViQjcfPszzCy3qS
	 jDcY/KkA9SrhmsqjuwJXnc/3GAcZEaZwsgkElORhwFktIB9Dnnrz2vTxrLfKkbcxlt
	 5M0yTuUvIXwveahYCUb6ufZSriYeuyvo2FGd3bqevFrOwn/ZfK1fwguGaTNYwM/ozg
	 trOqRydyA8B5Z98G2vAaawj1MV6X69TWEEfL+I5PxbMz1P67Q/ZMGNeUhZ0rc0N9tY
	 7y/B5ud3pUmKVSfcM7qj6CtOGY51Sjmt+g5FCM7+J4kcOjjtlYljuLpkSJomNYL/2Y
	 0ReMonhgqU/oQ==
Date: Fri, 6 Jan 2023 15:41:56 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [PASEMI] Nemo board doesn't reboot anymore after the commit
 "HID: usbhid: Add ALWAYS_POLL quirk for some mice"
In-Reply-To: <75f18191-c311-18f2-bfdb-ac82fb166e1b@xenosoft.de>
Message-ID: <nycvar.YFH.7.76.2301061540530.1734@cbobk.fhfr.pm>
References: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de> <75f18191-c311-18f2-bfdb-ac82fb166e1b@xenosoft.de>
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

On Fri, 6 Jan 2023, Christian Zigotzky wrote:

> Hello,
> 
> The reboot issue is still present in the RC2 of kernel 6.2. We still need the
> usbhid.patch. [1]
> 
> Please check the bad commit. [2]

Ankit,

have you tested with all the devices that you added the quirk for in your 
original patch?

Unless I hear otherwise, I will just drop 
the quirk for USB_DEVICE_ID_CHERRY_MOUSE_000C before this gets clarified.

Thanks,

-- 
Jiri Kosina
SUSE Labs

