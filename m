Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6651776865A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jul 2023 18:14:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDRK72kbZz3cF2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 02:14:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RDRJb15PFz2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 02:14:05 +1000 (AEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qQ93P-0001KP-KR; Sun, 30 Jul 2023 18:13:59 +0200
Message-ID: <88318723-afa1-965f-3dad-a66ab179e1fa@leemhuis.info>
Date: Sun, 30 Jul 2023 18:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel Crash Dump (kdump) broken with 6.5
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <AB3C7C5C-86FD-4D86-9330-000CB9728F48@linux.ibm.com>
 <03985866-102a-2a58-cd54-f8db3bedfebc@leemhuis.info>
In-Reply-To: <03985866-102a-2a58-cd54-f8db3bedfebc@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690733647;4e020b18;
X-HE-SMSGID: 1qQ93P-0001KP-KR
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19.07.23 18:19, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> On 17.07.23 16:45, Sachin Sant wrote:
>> Kdump seems to be broken with 6.5 for ppc64le.
>> [...]
>>
>> 6.4 was good. Git bisect points to following patch
>>
>> commit 606787fed7268feb256957872586370b56af697a
>>     powerpc/64s: Remove support for ELFv1 little endian userspace
>>
>> Reverting this patch allows a successful capture of vmcore.

Was fixed by revert:

#regzbot fix: 106ea7ffd56
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
