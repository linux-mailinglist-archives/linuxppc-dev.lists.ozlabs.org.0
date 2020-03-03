Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6E817751F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 12:11:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WvT35qlKzDqY5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 22:11:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WvQg1XlDzDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 22:08:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UypcrMBp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48WvQc1wlyz9sPR;
 Tue,  3 Mar 2020 22:08:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583233737;
 bh=k64NAu+e8vHywQUsmy2fGAqOQOwSxRoTHJg5kp4QCCQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UypcrMBp8z4HaDPrg6/sUKX90uFz55RsiEwy4YCz4HtwSBAOHDnc8kzhdwoNYREud
 cu1JyMV+ssNOyVlvixyo2/sxRrxy6SmWDHwjhYHMUZx68LXugkm5Eywy0WqibCrllE
 +V2jJ2lWVvo8cVWUlUGgB3q2eEegxr+EnGNrywoZGkm/5lyHdIbTrvlwTWlbpMmZ1q
 rxgPlXdymysKRtuFneCGX9QaIZDa3QdHnAs9nON4TIMOJTiRzNPo88crzoMT7KYIct
 QK6HOjqNxY+YyRpkrEylQUovQfTqguDlKuRVwvm4kWo1fsZEfOfwORevzcwFzgVgzg
 ROzxxIupN3Kqw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Wolfram Sang <wsa@the-dreams.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] macintosh: therm_windtunnel: fix regression when
 instantiating devices
In-Reply-To: <20200228170033.GB1130@ninjato>
References: <20200225141229.5424-1-wsa@the-dreams.de>
 <20200228170033.GB1130@ninjato>
Date: Tue, 03 Mar 2020 22:08:52 +1100
Message-ID: <87y2shr8zf.fsf@mpe.ellerman.id.au>
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
 debian-powerpc@lists.debian.org, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wolfram Sang <wsa@the-dreams.de> writes:
> On Tue, Feb 25, 2020 at 03:12:29PM +0100, Wolfram Sang wrote:
>> Removing attach_adapter from this driver caused a regression for at
>> least some machines. Those machines had the sensors described in their
>> DT, too, so they didn't need manual creation of the sensor devices. The
>> old code worked, though, because manual creation came first. Creation of
>> DT devices then failed later and caused error logs, but the sensors
>> worked nonetheless because of the manually created devices.
>> 
>> When removing attach_adaper, manual creation now comes later and loses
>> the race. The sensor devices were already registered via DT, yet with
>> another binding, so the driver could not be bound to it.
>> 
>> This fix refactors the code to remove the race and only manually creates
>> devices if there are no DT nodes present. Also, the DT binding is updated
>> to match both, the DT and manually created devices. Because we don't
>> know which device creation will be used at runtime, the code to start
>> the kthread is moved to do_probe() which will be called by both methods.
>> 
>> Fixes: 3e7bed52719d ("macintosh: therm_windtunnel: drop using attach_adapter")
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=201723
>> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
>> Tested-by: Erhard Furtner <erhard_f@mailbox.org>
>> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
>
> Applied to for-current, thanks!

Thanks.

cheers
