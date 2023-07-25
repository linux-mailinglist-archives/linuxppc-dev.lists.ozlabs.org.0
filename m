Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 158B27623F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 22:52:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kBoM0QDD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9TkG06n1z3cXL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 06:52:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kBoM0QDD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9TjG0YxNz3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 06:51:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=BI6vld8daiZZqGCYXywTiEB06qS0pOcYQzPLq+kIgpA=; b=kBoM0QDDYWvRihqO9OYZiObhMj
	GlyRzTCZ7/WdvW06YOS6WhtEsgXu4P1dKW10wb/QbeKXBO9YvNSYtgD9VbSTzkwB612KtZK3+NKZL
	PUCberLDUcsiNFgFwoVPx1l3HnofLB9hYRk0dGE1wJYC/WBqIRrlZGzJxeCWlpE/oM/6a8jfZLd2g
	A20JUg5vvH4JUfv17i+QZRPSFeyFT74AQc8YT84WpVzZ3L4JbMNVTsJtZRXTSqPKDs3fi93vJfSuq
	p0PQYB8/Rg0lTnL28cf9yteCsl9N6+X6L1vjKxXoTcp+pM4nbyjbr8AEp1iNmusW8JYUFcNJaqS+G
	ryDERQsA==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qOP0M-008Te2-2y;
	Tue, 25 Jul 2023 20:51:40 +0000
Message-ID: <10fbf60c-f7fe-d2ca-3d16-488453a88889@infradead.org>
Date: Tue, 25 Jul 2023 13:51:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Documentation: devices.txt: reconcile serial/ucc_uart
 minor numers
Content-Language: en-US
To: Timur Tabi <timur@kernel.org>
References: <20230724063341.28198-1-rdunlap@infradead.org>
 <CAOZdJXVuvVNzbyTLSiqRoSNdU0aprHoxozZzBahFUghqLvL2kw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAOZdJXVuvVNzbyTLSiqRoSNdU0aprHoxozZzBahFUghqLvL2kw@mail.gmail.com>
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
Cc: Jiri Slaby <jirislaby@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/25/23 13:38, Timur Tabi wrote:
> On Mon, Jul 24, 2023 at 1:33 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
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
> 
> Acked-by: Timur Tabi <timur@kernel.org>
> 
> One thing does concern me.  The UCC UART driver piggy-backs on the CPM
> driver's layout (see cpm_uart.h), but apparently CPM UART supports 6
> devices, not four:
> 
> #define UART_NR        fs_uart_nr
> 
> where fs_uart_nr is defined in enum fs_uart_id.
> 
> Unfortunately, it's been so long since I've touched this code, I'm not
> sure whether this means anything.

If CPM UART code ever worked with > 4 ports, it probably just used minor devnums
that were not allocated to it.

Also, it looks like the CPU UART part of Documentation/admin-guide/devices.txt
needs to be updated:

		 46 = /dev/cucpm0		Callout device for ttyCPM0
		    ...
		 49 = /dev/cucpm5		Callout device for ttyCPM5

The driver must use some tricks to get 6 ports into 4 devnums. :)


-- 
~Randy
