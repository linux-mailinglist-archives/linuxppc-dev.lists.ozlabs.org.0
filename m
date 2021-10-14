Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D6642D948
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 14:27:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVTDh6gvvz3bjN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 23:27:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256 header.s=phobos-20191101 header.b=QJ3AvB+s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=denx.de
 (client-ip=85.214.62.61; helo=phobos.denx.de; envelope-from=agust@denx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=QJ3AvB+s; 
 dkim-atps=neutral
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVTD22khxz2xfJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 23:26:42 +1100 (AEDT)
Received: from crub (pd95f1d7c.dip0.t-ipconnect.de [217.95.29.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 486F283572;
 Thu, 14 Oct 2021 14:26:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634214398;
 bh=h3d+7/o10dgcD7pQSvUh5MYsQC2GB4YO4Pb5D5tQVj4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QJ3AvB+swCyUTTe+4Apkhltx3Vjvpwrg7wbW1tD+npZGf2SJNzHhS+UURxct9CVdi
 0HbSnlqIyuZe9aY1/Qa1X0PVNCJMwLAAZxbunFas5i7jjNvXdyM5Ed9lg6oLw+I3MR
 UU+4AUlaDZSf1UIW+BUdGhOI0tcwahiBEQ9EkMY3Ta7IiZS+aEdz3I2up5TFULRPEZ
 z7WwT7pPwV7ZtotWSHLrctaQqiznVRcSHqXTClaJNNAnjNA3ZaWDWOgZCHjvWRvvCd
 H0eyP5k641kEpNp/ig2v7agHaSwR4rKktl4K5bglZIBCFF80Wssi6/QDllKhXeSpcC
 0VdsamN+lQzcw==
Date: Thu, 14 Oct 2021 14:26:37 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH] powerpc: dts: Remove MPC5xxx platforms
Message-ID: <20211014142637.3fda421b@crub>
In-Reply-To: <20211013173808.7ab92035@canb.auug.org.au>
References: <20211012153456.2844193-1-robh@kernel.org>
 <20211013173808.7ab92035@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 13 Oct 2021 17:38:08 +1100
Stephen Rothwell sfr@canb.auug.org.au wrote:

>Hi Rob,
>
>On Tue, 12 Oct 2021 10:34:56 -0500 Rob Herring <robh@kernel.org> wrote:
>>
>> The mpc5xxx platforms have had dts warnings for some time which no one
>> seems to care to fix, so let's just remove the dts files.
>> 
>> According to Arnd:
>> "Specifically, MPC5200B has a 15 year lifetime, which ends in
>> 11 months from now. The original bplan/Genesi Efika 5K2 was
>> quite popular at the time it came out, and there are probably
>> still some of those hanging around, but they came with Open
>> Firmware rather than relying on the dts files that ship with the
>> kernel.
>> 
>> Grant Likely was the original maintainer for MPC52xx until 2011,
>> Anatolij Gustschin is still listed as maintainer since then but hasn't
>> been active in it for a while either. Anatolij can probably best judge
>> which of these boards are still in going to be used with future kernels,
>> but I suspect once you start removing bits from 52xx, the newer
>> but less common 512x platform can go away as well."
>> 
>> Cc: Anatolij Gustschin <agust@denx.de>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>> Sending this out as a feeler to see if anyone cares. If anyone does, 
>> please fix the warnings.

I've sent patches to fix the warnings.
  
Thanks,

Anatolij
