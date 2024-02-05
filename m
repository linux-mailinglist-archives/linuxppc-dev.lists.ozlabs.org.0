Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EACA8491FA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 01:05:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lbHNT8Z1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TSmpy724cz2ytJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 11:05:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSmp434ylz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 11:04:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=3TPBEhVKkUi3MUXWKbW5M7J+VojJA4DV60zXIZ2deSk=; b=lbHNT8Z1K4U23/zJsje4Uur+Yy
	5Fpkv6IB6bHVR365sc74jef3XaAdacZeWtTkgsg7x45muIOQcDLImbE8bkdxHtLKRt4ibzsuWKON+
	c3SHV1rK0ypmNUjLoTM87vjZe4GGCD+EwIIAZv3xpny9oQySRQAZHPTEAyNNccLi3OMAILmpq1kpg
	QnlA/BJbtS4NEyb7VJv9yvTba20pWnwjncoZ2zqIUMUA8lWxKDXm29z5s3D4mhtRQnn40LeQezjn3
	7VG+UdGabOUTeDppM/jbw8s08eyEY7ljGabb7ryaX0d2w/KW/TmBoqeji5RxjWDa5QtQdpboUSbf8
	DJRld2CQ==;
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.6])
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWmT1-00000007uaG-3GPX;
	Mon, 05 Feb 2024 00:04:09 +0000
Message-ID: <04c1b434-2ae6-401d-93ff-61641e1396af@infradead.org>
Date: Mon, 5 Feb 2024 09:04:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] powerpc: ps3: make ps3_system_bus_type const
Content-Language: en-US
To: "Ricardo B. Marliere" <ricardo@marliere.net>,
 Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20240204-bus_cleanup-powerpc-v1-0-c763f0e142e9@marliere.net>
 <20240204-bus_cleanup-powerpc-v1-2-c763f0e142e9@marliere.net>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20240204-bus_cleanup-powerpc-v1-2-c763f0e142e9@marliere.net>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/4/24 23:21, Ricardo B. Marliere wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the ps3_system_bus_type variable to be a constant structure as
> well, placing it into read-only memory which can not be modified at
> runtime.

> -static struct bus_type ps3_system_bus_type = {
> +static const struct bus_type ps3_system_bus_type = {
>  	.name = "ps3_system_bus",
>  	.match = ps3_system_bus_match,
>  	.uevent = ps3_system_bus_uevent,

Seems fine.

Acked-by: Geoff Levand <geoff@infradead.org>

 

