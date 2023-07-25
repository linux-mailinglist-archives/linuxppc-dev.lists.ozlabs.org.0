Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D434976203B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 19:32:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XGd4cWPy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9PHY5S8Wz3cYS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 03:32:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XGd4cWPy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9PGh50fcz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 03:31:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=huYoQw/VsEdrryOXoPwzfkMHdWCe1iNxFEa9sxkfcOM=; b=XGd4cWPy+ck0qamKi1HoaQ3V4J
	cAg8PCJdLaOAS8I1hdDZlIms71DvfnTT2+K0iXzmhCE8z1d3x6xAalmEOG2NLbjOmoEQCf3LVg/Br
	qhkqDMeC7h6og0JHEzpU79ZvSSSQJXBRpKHCXC81i7DrB9yCaTYJRl7dn4Y/GMQ7068cbKfAMOsU5
	jCG4WDwx9ZQEg6JHiRy9Wu1fw2LSs86Gnc+UYHa16LcDk9ybV9kY0aI3va9Ab7JTrP5uLJWAEEOyf
	8aY5DVnk7YcRgJ5V8hTRugrH9D1/HSsOS2GLeyny/sxp+cTkpNAo8qxEloL9KJe0fax+soT4WDnbz
	S0hNStOw==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qOLt2-008AIf-0R;
	Tue, 25 Jul 2023 17:31:52 +0000
Message-ID: <5da2379c-4ec1-9bbf-bc94-2e1dbb7344f2@infradead.org>
Date: Tue, 25 Jul 2023 10:31:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Documentation: devices.txt: reconcile serial/ucc_uart
 minor numers
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230724063341.28198-1-rdunlap@infradead.org>
 <2023072544-cloning-footsie-65e0@gregkh>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2023072544-cloning-footsie-65e0@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Timur Tabi <timur@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/25/23 10:27, Greg Kroah-Hartman wrote:
> On Sun, Jul 23, 2023 at 11:33:41PM -0700, Randy Dunlap wrote:
>> Reconcile devices.txt with serial/ucc_uart.c regarding device number
>> assignments. ucc_uart.c supports 4 ports and uses minor devnums
>> 46-49, so update devices.txt with that info.
>> Then update ucc_uart.c's reference to the location of the devices.txt
>> list in the kernel source tree.
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
>>  Documentation/admin-guide/devices.txt |    2 +-
>>  drivers/tty/serial/ucc_uart.c         |    2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Very nice, thanks for catching this, I'll go queue it up.
> 
> Actually, how did you notice this?  I don't think the devices.txt file
> is up to date at all anymore, and odds are, other things are wrong in it
> too.

I accidentally! saw some reference to lanana.org in the kernel source code
and just grepped for that and saw this...

-- 
~Randy
