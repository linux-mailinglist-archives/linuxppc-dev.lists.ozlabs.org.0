Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92B9344FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 01:06:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iogearbox.net header.i=@iogearbox.net header.a=rsa-sha256 header.s=default2302 header.b=FJF7XIGG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPWln25Ytz3ck9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 09:06:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=iogearbox.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=iogearbox.net header.i=@iogearbox.net header.a=rsa-sha256 header.s=default2302 header.b=FJF7XIGG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iogearbox.net (client-ip=213.133.104.62; helo=www62.your-server.de; envelope-from=daniel@iogearbox.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 1645 seconds by postgrey-1.37 at boromir; Thu, 18 Jul 2024 09:06:07 AEST
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPWl30vX1z3by2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 09:06:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=z9pdZ21hvYIwVRiPXazOclxmW+YuoQrndU0f/vyzFq4=; b=FJF7XIGGlyUGv8xIOQKc/gmeey
	WIe1tZwybuYe8Sh3hkXGe9gRuNkETTLVzccLAh8uiikbzTQG3Lpx8IgA9UYyyh0DHF0B749paMN3X
	GzkQRCd4QOK0SyP8nxt3j210BHMRIUj1tm02Q5rUG74jkeMVOduak9uyy6xKI+QTGeGM3Ua7MQ+LN
	esAAjIbbIp0AIcGumfIEojZUkpZm8XfK9JzvifnFCIEfmtfiMkP2Elh4L8RpxfRlsqqmRBOpNGvI+
	cIifep9TZC0QTfVs1OUlyRrCBiq2ukbjCqqshk0OBaXPmTuhYgsnBasEU4/rdV/9K/qJMAkD4UIGH
	3iUaRnWQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1sUDHx-000L1Q-BE; Thu, 18 Jul 2024 00:38:21 +0200
Received: from [178.197.248.43] (helo=linux.home)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1sUDHw-000Bnj-2K;
	Thu, 18 Jul 2024 00:38:20 +0200
Subject: Re: [PATCH 1/2] MAINTAINERS: Update email address of Naveen
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <fb6ef126771c70538067709af69d960da3560ce7.1720944897.git.naveen@kernel.org>
 <20240716190222.f3278a2ef0c6a35bd51cfd63@kernel.org>
 <87sew8wtxw.fsf@mail.lhotse>
 <20240718064331.834e1359f9c3f285f2dd7eb5@kernel.org>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <6f979810-4992-13ba-c154-a4b5f838844d@iogearbox.net>
Date: Thu, 18 Jul 2024 00:38:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20240718064331.834e1359f9c3f285f2dd7eb5@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27339/Wed Jul 17 10:36:14 2024)
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
Cc: Alexei Starovoitov <ast@kernel.org>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/17/24 11:43 PM, Masami Hiramatsu (Google) wrote:
> On Wed, 17 Jul 2024 13:58:35 +1000
> Michael Ellerman <mpe@ellerman.id.au> wrote:
>> Masami Hiramatsu (Google) <mhiramat@kernel.org> writes:
>>> On Sun, 14 Jul 2024 14:04:23 +0530
>>> Naveen N Rao <naveen@kernel.org> wrote:
>>>
>>>> I have switched to using my @kernel.org id for my contributions. Update
>>>> MAINTAINERS and mailmap to reflect the same.
>>>
>>> Looks good to me.
>>>
>>> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>>>
>>> Would powerpc maintainer pick this?
>>
>> Yeah I can take both.
> 
> Thank you for pick them up!

Looks like patchbot did not send a reply, but I already took them
to bpf tree.

Thanks,
Daniel
