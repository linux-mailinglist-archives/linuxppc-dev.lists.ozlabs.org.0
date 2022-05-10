Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B455226F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 00:40:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyY0L5gg9z3drQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 08:40:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=e9qBavzt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=e9qBavzt; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyKjG0KkFz3bdY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 00:11:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vlPcmXA97Qhtkz3pBw6LdXf1X8P0UYvVzj4VthO5jgc=; b=e9qBavzt7iSXqotIL+kEfOWSDC
 iVRppT3Hb/vZk3YrAi/b/1Sks4coJ4CDDP+7PsBf/3PYaPFt1gdo8rsOdKqYQ7smquEWj28eStWqL
 CRF+oqCbuJG6ZM1a8GSMIH+b891MTAxbko/s3bV28TSILNPx0vJS6lKq9Hi1OrpvIOMJ2yAsDH+AE
 5UZLLIZnAX0XkUOFElR9JGQkkK04aCtF/juYrAyo+JJs0W0WZech05pCgMVZEF/gDbG3lXHdR+nlg
 gc7p3pNqQj2cprKtyF3OhhaP7dxC5PNGfWWqohU3giKekM5UQ60wlcwHLGqdoJfnT4tcYUBBcGgto
 etn8qzNQ==;
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1noQa0-000AUZ-9j; Tue, 10 May 2022 16:11:12 +0200
Message-ID: <58837e3d-0e2a-42ac-f198-9fe7be7aa823@igalia.com>
Date: Tue, 10 May 2022 11:10:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 08/30] powerpc/setup: Refactor/untangle panic notifiers
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
 Hari Bathini <hbathini@linux.ibm.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-9-gpiccoli@igalia.com>
 <3c34d8e2-6f84-933f-a4ed-338cd300d6b0@linux.ibm.com>
 <f9c3de3c-1709-a1aa-2ece-c9fbfd5e6d6a@igalia.com>
 <87fslh8pe3.fsf@mpe.ellerman.id.au>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <87fslh8pe3.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 11 May 2022 08:37:45 +1000
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 linux-xtensa@linux-xtensa.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org, will@kernel.org,
 tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 mikelley@microsoft.com, john.ogness@linutronix.de, bhe@redhat.com,
 corbet@lwn.net, paulmck@kernel.org, fabiomirmar@gmail.com, x86@kernel.org,
 mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org, dyoung@redhat.com, vgoyal@redhat.com,
 pmladek@suse.com, dave.hansen@linux.intel.com, keescook@chromium.org,
 arnd@arndb.de, linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 rostedt@goodmis.org, rcu@vger.kernel.org, gregkh@linuxfoundation.org,
 bp@alien8.de, Nicholas Piggin <npiggin@gmail.com>, luto@kernel.org,
 linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 andriy.shevchenko@linux.intel.com, akpm@linux-foundation.org,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/05/2022 10:53, Michael Ellerman wrote:
> "Guilherme G. Piccoli" <gpiccoli@igalia.com> writes:
>> On 05/05/2022 15:55, Hari Bathini wrote:
>>> [...] 
>>> The change looks good. I have tested it on an LPAR (ppc64).
>>>
>>> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>
>>>
>>
>> Hi Michael. do you think it's possible to add this one to powerpc/next
>> (or something like that), or do you prefer a V2 with his tag?
> 
> Ah sorry, I assumed it was going in as part of the whole series. I guess
> I misread the cover letter.
> 
> So you want me to take this patch on its own via the powerpc tree?
> 
> cheers

Hi Michael, thanks for the prompt response!

You didn't misread, that was the plan heh
But some maintainers start to take patches and merge in their trees, and
in the end, it seems to make sense - almost half of this series are
fixes or clean-ups, that are not really necessary to get merged altogether.

So, if you can take this one, I'd appreciate - it'll make V2 a bit
smaller =)

Cheers,


Guilherme
