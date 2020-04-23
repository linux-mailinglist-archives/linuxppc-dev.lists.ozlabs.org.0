Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3068D1B607E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 18:14:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497MnN2ZxfzDr3j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 02:14:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=YFaHmGHH; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497M803dZgzDqq8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 01:45:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 497M7s1P2Yz9v0Nw;
 Thu, 23 Apr 2020 17:45:13 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=YFaHmGHH; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kDkmbB5jbQWD; Thu, 23 Apr 2020 17:45:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 497M7r6tZpz9v0Nt;
 Thu, 23 Apr 2020 17:45:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587656713; bh=f0f9K3KFHfivMnecEyhiSVfLrfDzsy3JAGaLMYo7vpE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YFaHmGHHu5kUyhqYmyxHbNLSu4OUR1U+LNR3pDsGcrEXAkM5X820umcqXBFtsLdz+
 ZdG+D56Y8TxbXf3QI4ynmh3EKrGecV+uIS3hvnOnKs91JqDX6qCPsizxy608fP/mo1
 P5f0OH2Z8bQwkdKZl5GBT8xZ5LjgRNHg+awULzjI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 856FF8B86B;
 Thu, 23 Apr 2020 17:45:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id n9aupw3zyXjp; Thu, 23 Apr 2020 17:45:14 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 25D1A8B860;
 Thu, 23 Apr 2020 17:45:14 +0200 (CEST)
Subject: Re: [PATCH 2/3] powerpc/ftrace: Simplify error checking when patching
 instructions
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <872c5c3d9cf6db8e52b2abcdd16d7ab61fce8070.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <bc466032-857e-d808-c04f-b854ea2de924@c-s.fr>
Date: Thu, 23 Apr 2020 17:44:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <872c5c3d9cf6db8e52b2abcdd16d7ab61fce8070.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/04/2020 à 17:09, Naveen N. Rao a écrit :
> Introduce a macro PATCH_INSN() to simplify instruction patching, and to
> make the error messages more uniform and useful:
> - print an error message that includes the original return value
> - print the function name and line numbers, so that the offending
>    location is clear
> - always return -EPERM, which ftrace_bug() expects for proper error
>    handling
> 
> Also eliminate use of patch_branch() since most such uses already call
> create_branch() for error checking before patching. Instead, use the
> return value from create_branch() with PATCH_INSN().

I have the same comment here as for patch 3, this kind of macro hides 
the return action and can be dangerous.

What about implementing a macro that takes an explicit label as third 
argument and jump to that label in case of error ? On the same model as 
unsafe_put_user() ?

Christophe
