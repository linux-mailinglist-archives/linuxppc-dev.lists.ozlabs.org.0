Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD968788F33
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 21:12:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cUl7Wlkl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXV2H2JLRz3c2T
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 05:12:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cUl7Wlkl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXV1M0RZMz2ymM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 05:11:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=l+921+INTTmytbRdikj/w1XM0sYIGBKYxXwPysBHkj4=; b=cUl7Wlklv20N6NFHbMMQZ2qkxz
	iOJS50gpsdgah/UsOFg0lq7wUfqKss37dUpIZ9rF7Ee193PFH1Sp37Edkg7Cp8Iml8lJyDcndu1am
	cnn9VjGvF8i+7j/JBBOQaxwBLmAv5YUjaQRXh4mJhkO8WdJ/UmDUCVImvX5MoyZAsqXPWatMLseXu
	QZIlEQi9GudaSu6wkELrAvBFjmWOBDG1x1einQ2rLgTqv4F6cqC82Ad0pTm3uMLheNRrfQzPk+YwH
	2Nt3bG4V5pr+Iz861A6saVF7YHYI9ZKsvlrbNU0EKgwYT6NSJcs+mhkF4TcEK2AFKcsKcbVoP1do8
	cWY77RWA==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qZcDR-005vPP-1T;
	Fri, 25 Aug 2023 19:11:29 +0000
Message-ID: <a5d07fee-b950-ea48-c480-dd5a8a575969@infradead.org>
Date: Fri, 25 Aug 2023 12:11:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20230824223606.never.762-kees@kernel.org>
 <21193a52-0425-f5ae-90f0-10e4c578ae90@infradead.org>
 <202308251119.B93C95A3A7@keescook>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202308251119.B93C95A3A7@keescook>
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
Cc: linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/25/23 11:20, Kees Cook wrote:
> On Thu, Aug 24, 2023 at 05:04:02PM -0700, Randy Dunlap wrote:
>> Hi Kees,
>>
>> On 8/24/23 15:36, Kees Cook wrote:
>>> Doing a "make help" would show only hard-coded Kconfig targets and
>>> depended on the archhelp target to include ".config" targets. There was
>>> nothing showing global kernel/configs/ targets. Solve this by walking
>>> the wildcard list and include them in the output, using the first comment
>>> line as the help text.
>>>
>>> Update all Kconfig fragments to include help text and adjust archhelp
>>> targets to avoid redundancy.
>>>
>>> Adds the following section to "help" target output:
>>>
>>> Configuration fragment targets (for enabling various Kconfig items):
>>>   debug.config         - Debugging for CI systems and finding regressions
>>>   kvm_guest.config     - Bootable as a KVM guest
>>>   nopm.config          - Disable Power Management
>>>   rust.config          - Enable Rust
>>>   tiny-base.config     - Minimal options for tiny systems
>>>   tiny.config          - Smallest possible kernel image
>>>   x86_debug.config     - Debugging options for tip tree testing
>>>   xen.config           - Bootable as a Xen guest
>>>   tiny.config          - x86-specific options for a small kernel image
>>>   xen.config           - x86-specific options for a Xen virtualization guest
>>
>> ISTM that you are missing the "why" part of this change in the commit
>> description.
> 
> I want to see what fragments are available without needing to know the
> source tree layout for their locations. :)

Why?  :)

but you don't have to answer. I acquiesce (i.e., give up).

>> "make tinyconfig" is the real target here.  The other (tiny.) files are just
>> implementation details.
>> We can't put all implementation details into help messages and it's not
>> difficult to find that the (tiny.) config files are merged to make the
>> final .config file.
> 
> Yeah, this seems true for much of the ppc stuff to, as pointed out by
> mpe. I'll go answer there...
> 

-- 
~Randy
