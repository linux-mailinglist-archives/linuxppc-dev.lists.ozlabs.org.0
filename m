Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F5F17F5BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 12:09:09 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cC5Z3pWrzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 22:09:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cC164DHTzDqMx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 22:05:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Ph5xDCVP; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48cC136dCfz9sRY;
 Tue, 10 Mar 2020 22:05:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583838312;
 bh=ZJ7IV/uz2A9fmpd77KEpSm4KBcaZsOEeo3TwkHBjkGk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Ph5xDCVPgFixmglhr7cuEaZr+MT0cIgvDwV5ros2gtValez+wIrPmAzmwLe57qRoJ
 86EmGAmB/zyhTo2tLn5ekJ2K/sFwmHGjpioatMhggYs6N3IDtIkWjjYPe5aIXp4huj
 yeAQ1B6agFBDhW7XUiYEbEKn7VfZKDQjZ6InQktoHx4MuQA/14Rb7wfQsvz+/UaGiJ
 MMmH/0nGy/nTafG5/Iqm541XDAL/r47GV0mPOVGSbmSY4CKVknh6CuIztGK5cRxhUm
 mKznpuvziE4C9eBUMAYFmX2dw8Rmfml/NzGRM9yCyLuw0HvVJl3QHpIU+S0dvvxGyG
 CklZzhEQouoSA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Wolfram Sang <wsa@the-dreams.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] macintosh: windfarm: fix MODINFO regression
In-Reply-To: <20200310091155.GA1987@ninjato>
References: <20200303125046.5157-1-wsa@the-dreams.de>
 <20200310091155.GA1987@ninjato>
Date: Tue, 10 Mar 2020 22:05:09 +1100
Message-ID: <87wo7sii6y.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Mathieu Malaterre <malat@debian.org>, Erhard Furtner <erhard_f@mailbox.org>,
 debian-powerpc@lists.debian.org, linux-i2c@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wolfram Sang <wsa@the-dreams.de> writes:
> On Tue, Mar 03, 2020 at 01:50:46PM +0100, Wolfram Sang wrote:
>> Commit af503716ac14 made sure OF devices get an OF style modalias with
>> I2C events. It assumed all in-tree users were converted, yet it missed
>> some Macintosh drivers.
>> 
>> Add an OF module device table for all windfarm drivers to make them
>> automatically load again.
>> 
>> Fixes: af503716ac14 ("i2c: core: report OF style module alias for devices registered via OF")
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=199471
>> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
>> Tested-by: Erhard Furtner <erhard_f@mailbox.org>
>> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
>
> Michael, I can take this via I2C again, if you ack it.

Thanks, done.

cheers
