Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEFE7595E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 14:49:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5bHQ3CS7z3c4b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 22:49:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5bGw0RMYz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 22:48:55 +1000 (AEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qM6bn-0004pH-9s; Wed, 19 Jul 2023 14:48:47 +0200
Message-ID: <3252775c-099f-4bbe-c663-122634d5fc2f@leemhuis.info>
Date: Wed, 19 Jul 2023 14:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: Tree for Jul 13 (drivers/video/fbdev/ps3fb.c)
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>, Randy Dunlap
 <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230713123710.5d7d81e4@canb.auug.org.au>
 <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
 <ZLYHtVuS7AElXcCb@debian.me>
 <f5e6258b-ba76-001b-4942-588f4cbb0aa7@leemhuis.info>
 <5983cf9d-dc1e-75bd-3624-770951661245@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <5983cf9d-dc1e-75bd-3624-770951661245@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1689770936;e582ccce;
X-HE-SMSGID: 1qM6bn-0004pH-9s
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org, Linux Regressions <regressions@lists.linux.dev>, Helge Deller <deller@gmx.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19.07.23 14:36, Bagas Sanjaya wrote:
> On 7/18/23 17:06, Thorsten Leemhuis wrote:
>> I'm missing something here:
>>
>> * What makes you think this is caused by bdb616479eff419? I didn't see
>> anything in the thread that claims this, but I might be missing something
>> * related: if I understand Randy right, this is only happening in -next;
>> so why is bdb616479eff419 the culprit, which is also in mainline since
>> End of June?
> 
> Actually drivers/video/fbdev/ps3bf.c only had two non-merge commits during
> previous cycle: 25ec15abb06194 and bdb616479eff419. The former was simply
> adding .owner field in ps3fb_ops (hence trivial), so I inferred that the
> culprit was likely the latter (due to it was being authored by Thomas).

As you can see from Michael's reply this was misguided, as it was an
external change that broke the driver. This happens all the time, such
inferring thus is not possible at all.

Ciao, Thorsten
