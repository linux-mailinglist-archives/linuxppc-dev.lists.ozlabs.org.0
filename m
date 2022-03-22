Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A374E46D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 20:38:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNMGj2XMnz30Hr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 06:38:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MdScEsmN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=MdScEsmN; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNMG15Vchz2xrk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 06:37:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=GNyzORUx4GXTT7/hj1mCmOnIXmKv2J5yosWB9fpbDWg=; b=MdScEsmNUv8CYjaq6xyKA/QxN9
 99HtzcD8C5Luv02SuH8KKYzNXG2/z9eoPR6F+Of7b2lajNndvnQgTFYcmirKYEOKIl7Se9JldmMm5
 E/263AwsHbY1LjLCfck+kKyE6/+BtsVrjFp+MPte5dcSxYvDzYluqVmur6voqTxcLZcU/xVskTKBX
 Rnv8nuDMz3n95ftN044wXbdf+9PPcPf2/ifZZPTxINFS9hvFes7ZlPcS7C7k6pCnwJElIJDlz3crP
 egdH6e1Il32660Qsnf7ExebqC9Kk7y4mHrwW7K5cop+zlkCe1y9/jFjb5XLJZ52VLs82F0v5GP/LB
 LQ5sxRaA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWkJR-003Y0z-FU; Tue, 22 Mar 2022 19:37:01 +0000
Message-ID: <adfeb8bb-50b3-7ff3-a55f-19fc23cd1121@infradead.org>
Date: Tue, 22 Mar 2022 12:36:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] Docs: admin/kernel-parameters: edit a few boot options
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20220321012216.23724-1-rdunlap@infradead.org>
 <CAJZ5v0jBFOWZZrGuBb0GyJa3rKRwSYXrMFOtGu8jLnQ+OPtXHw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAJZ5v0jBFOWZZrGuBb0GyJa3rKRwSYXrMFOtGu8jLnQ+OPtXHw@mail.gmail.com>
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
Cc: linux-ia64@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Len Brown <lenb@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Linux PM <linux-pm@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/22/22 10:41, Rafael J. Wysocki wrote:
> On Mon, Mar 21, 2022 at 2:22 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>> Clean up some of admin-guide/kernel-parameters.txt:
>>
>> a. "smt" should be "smt=" (S390)
>> b. add "smt-enabled" for POWERPC
>> c. Sparc supports the vdso= boot option
>> d. make the tp_printk options (2) formatting similar to other options
>>    by adding spacing
>> e. add "trace_clock=" with a reference to Documentation/trace/ftrace.rst
>> f. use [IA-64] as documented instead of [ia64]
>> g. fix formatting and text for test_suspend=
> This ->
> 
>> h. fix formatting for swapaccount=
>> i. fix formatting and grammar for video.brightness_switch_enabled=
> -> and the last one are fine with me, but I suppose that there will be a v2?

Yes, there will be a v2.

thanks.

-- 
~Randy
