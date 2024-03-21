Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89736885695
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 10:33:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Oc2UNrB6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0gJ02nK8z3vXD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 20:33:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Oc2UNrB6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0gHD4NKwz3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 20:32:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=webeErP71bGrCtrnKMl3CyhYpAF0y0SlAUiPvCaWPVw=; b=Oc2UNrB6E4lFSOnZpA7d1IatjG
	W6hsUIFRGF6ZFdsUcV+Adz6oXUqJdPj+7cEAaWcSBjDWNgoRuI2o27QS02PykktSaeAZdv749sCRa
	GdhddvtLxLuV4PC7ecOpTa1Y/35qamO+DvRbrZCenbBNBj3ZolBVbDPH/6oOyDG9UQpmYYsgMTitk
	keK7SpcRac5G2tKjYbEz4qh0FgAbUW/zsobZ/WBh/npQDKa63ho3GLNifaGtQM7cc1/VHRA70bpV0
	wrvzKP3/QqHx02S0Azo0b9GZC6bYxv2ww0qOEcALXPKWsZBEKrHBF6rbKfJCMZt3IeZ48LE5HcH0T
	OTZF9h8g==;
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnEmp-00000006Qam-3O3a;
	Thu, 21 Mar 2024 09:32:36 +0000
Message-ID: <ec1b6bdf-1676-48fb-99f0-a8cc2a99dd17@infradead.org>
Date: Thu, 21 Mar 2024 18:32:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: ps3: mark ps3_notification_device static for
 stack usage
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>
References: <20240320180333.151043-1-arnd@kernel.org>
 <CAMuHMdW41e+DSBKBgugTkjoLy6bXfji-KWmB_d9EstEv01eC6w@mail.gmail.com>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <CAMuHMdW41e+DSBKBgugTkjoLy6bXfji-KWmB_d9EstEv01eC6w@mail.gmail.com>
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
Cc: llvm@lists.linux.dev, Kevin Hao <haokexin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Justin Stitt <justinstitt@google.com>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, linuxppc-dev@lists.ozlabs.org, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Geert,

On 3/21/24 17:32, Geert Uytterhoeven wrote:
>>  static int ps3_probe_thread(void *data)
>>  {
>> -       struct ps3_notification_device dev;
>> +       static struct ps3_notification_device dev;
>>         int res;
>>         unsigned int irq;
>>         u64 lpar;
> 
> Making it static increases kernel size for everyone.  So I'd rather
> allocate it dynamically. The thread already allocates a buffer, which
> can be replaced at no cost by allocating a structure containing both
> the ps3_notification_device and the buffer.

This seems like a much better solution.

-Geoff


