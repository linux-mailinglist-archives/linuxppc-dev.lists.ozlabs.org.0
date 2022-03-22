Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E635B4E3615
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 02:43:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMvQ86LpCz300Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 12:43:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KOTzp/yp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=KOTzp/yp; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMvPQ0SyBz2xF8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 12:42:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=nVKhBCI4fMEjs9snfx8gEi1XWAYrextgE1D2YFOqA+E=; b=KOTzp/ypUL84dSmnhYdBK64S3e
 cjIoXkT4/g9vCeDQ1hpbdVsWfS0il7vI5bQ30uMNd/GFbaMpcNWHgC3ktL3luZ3qBChTbP/DG+zZk
 hGR6Y5f7gZv2YxUCHy5X1oWwNrRtcDELBA1erJfr8Qqb75te3FBRcD8d/g5jupI2wrjvVKnhwtkG+
 YwvPfwzYmMVD2T0JOtB99sv+7tKCcWfjfodnRtBqAoXgxtEhBxJat9hNXhAP90vMva4qmjHTmpoKB
 Fk0X6NMFFvRJSjiweo47aZywVhCyTolZrQxtbsVQlNdwalbJHp5BU1KGAtW13hK4F5P68m4bSHpDW
 84hhJD6w==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWTX4-00B9cV-TB; Tue, 22 Mar 2022 01:41:59 +0000
Message-ID: <ffe0183c-7e48-2ac7-9c69-ca87d98c442a@infradead.org>
Date: Mon, 21 Mar 2022 18:41:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] Docs: admin/kernel-parameters: edit a few boot options
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
References: <20220321012216.23724-1-rdunlap@infradead.org>
 <87ils6hl1z.fsf@mpe.ellerman.id.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87ils6hl1z.fsf@mpe.ellerman.id.au>
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
Cc: linux-ia64@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Len Brown <lenb@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-pm@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sven Schnelle <svens@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/21/22 17:45, Michael Ellerman wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
>> Clean up some of admin-guide/kernel-parameters.txt:
>>
>> a. "smt" should be "smt=" (S390)
>> b. add "smt-enabled" for POWERPC
> 
> I'd rather you didn't. It's not well tested and we ignore it entirely on
> some platforms because it causes bugs. Eventually I'd like to remove it.
> 
> If we ever get time we'd want to support the generic `nosmt` argument
> instead.

No problem. Thanks for replying.

-- 
~Randy
