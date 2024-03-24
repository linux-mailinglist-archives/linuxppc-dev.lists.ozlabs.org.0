Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA447887B51
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 02:20:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rRDXvXuP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V2JCR4R70z3d32
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 12:20:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V2JBY5bhTz3bsw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Mar 2024 12:19:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=wi2LTI5KP53CdNiOrYDHD4tTYnyBEg2RipTULkJ4IRM=; b=rRDXvXuPpC8yTHiw6Pqb7l8czJ
	zIS6KU5zxoaXKjRcqGyLnpkLYImkubIoRFPG5QJ02jpARz/K3nbOr59QomAZ1P9+nUjEqiTaMnHVu
	c7sb8Cm4ZOZvUdTyLln6Z91fC8snZ4LzvbEoUjPZCN8HBibknob1cCH1HxUm2WIk0cpY4FdneTzHT
	78xVgCpjpXN2NylIxDbMIBQYkwUvKoe5H9/JL3Qp+unVfmpRq/66fh2oGpxMGB9d8nlmzwxQMgEwV
	wDxkzlQzgEEKroY0OdUSobaLKpnaqBCWefobPw8oMvwK7yJSbArxJxEf8SND1DmGwvaiZB/c3TfXg
	TLFJIzEg==;
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roCW4-0000000Cwtk-1hTK;
	Sun, 24 Mar 2024 01:19:16 +0000
Message-ID: <63e4017f-dcdd-4c28-9591-1ce7f0e9b761@infradead.org>
Date: Sun, 24 Mar 2024 10:19:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: ps3: mark ps3_notification_device static for
 stack usage
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Arnd Bergmann <arnd@kernel.org>
References: <20240320180333.151043-1-arnd@kernel.org>
 <CAMuHMdW41e+DSBKBgugTkjoLy6bXfji-KWmB_d9EstEv01eC6w@mail.gmail.com>
 <87f6365f-a40e-4606-baff-170cb8fc48f3@infradead.org>
 <7f854130-e92f-488f-9c56-a65f86b95567@app.fastmail.com>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <7f854130-e92f-488f-9c56-a65f86b95567@app.fastmail.com>
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
Cc: Nathan Chancellor <nathan@kernel.org>, Kevin Hao <haokexin@gmail.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/23/24 05:24, Arnd Bergmann wrote:
> On Fri, Mar 22, 2024, at 09:34, Geoff Levand wrote:
>> On 3/21/24 17:32, Geert Uytterhoeven wrote:
>>> --- a/arch/powerpc/platforms/ps3/device-init.c
>>>> +++ b/arch/powerpc/platforms/ps3/device-init.c
>>>> @@ -770,7 +770,7 @@ static struct task_struct *probe_task;
>>>>
>>>>  static int ps3_probe_thread(void *data)
>>>>  {
>>>> -       struct ps3_notification_device dev;
>>>> +       static struct ps3_notification_device dev;
>>>>         int res;
>>>>         unsigned int irq;
>>>>         u64 lpar;
>>>
>>> Making it static increases kernel size for everyone.  So I'd rather
>>> allocate it dynamically. The thread already allocates a buffer, which
>>> can be replaced at no cost by allocating a structure containing both
>>> the ps3_notification_device and the buffer.
> 
> I didn't think it mattered much, given that you would rarely
> have a kernel with PS3 support along with other platforms.
> 
> I suppose it does increase the size for a PS3-only kernel
> as well, while your version makes it smaller.
> 
>> Here's what I came up with.  It builds for me without warnings.
>> I haven't tested it yet.  A review would be appreciated.
> 
> It seems a little complicated but looks all correct to
> me and reduces both stack and .data size, so
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd.  I also thought it was a bit too much.  I made a simpler
version that I'll post as a separate message.

-Geoff

