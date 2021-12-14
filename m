Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D4A473DB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 08:35:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCqtC0bXNz30Qv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 18:35:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCqsp0pnZz2yNw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 18:35:20 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4JCqsb0W8Dz9sSY;
 Tue, 14 Dec 2021 08:35:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p2_EyWN4FEUC; Tue, 14 Dec 2021 08:35:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4JCqsZ6qRcz9sSF;
 Tue, 14 Dec 2021 08:35:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D90C38B7B6;
 Tue, 14 Dec 2021 08:35:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DouCIgz7vKoZ; Tue, 14 Dec 2021 08:35:14 +0100 (CET)
Received: from [192.168.233.42] (po13561.idsi0.si.c-s.fr [192.168.233.42])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F38E8B76C;
 Tue, 14 Dec 2021 08:35:14 +0100 (CET)
Message-ID: <aac75717-a3ac-c0b4-3e79-dc6eb9c26d8c@csgroup.eu>
Date: Tue, 14 Dec 2021 08:35:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 0/5] Implement livepatch on PPC32
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
 <20211028093547.48c69dfe@gandalf.local.home>
 <6209682d-0caa-b779-8763-376a984d8ed8@csgroup.eu>
 <20211213121536.25e5488d@gandalf.local.home>
 <5511f43c-192a-622b-7c72-52e07f0032c2@csgroup.eu>
 <20211213123338.65eda5a0@gandalf.local.home>
 <fc3099b8-9f12-3e47-08a0-05abc37a0482@csgroup.eu>
 <20211213135410.12642d8f@gandalf.local.home>
 <8df90f94-9939-0178-b92b-6ae6ea81784c@csgroup.eu>
 <20211213144603.47d7c908@gandalf.local.home>
 <76ce2dd7-691e-df73-727c-110713c07cda@csgroup.eu>
In-Reply-To: <76ce2dd7-691e-df73-727c-110713c07cda@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/12/2021 à 07:09, Christophe Leroy a écrit :
> 
> 
> Le 13/12/2021 à 20:46, Steven Rostedt a écrit :
>> On Mon, 13 Dec 2021 19:33:47 +0000
>> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>
>>> STill the same Oops, below
>>
>> Unfortunately, I don't have a PPC machine (32 nor 64 bit) to help debug
>> this.
>>
>>
>>> I will look more closely tomorrow.
>>
>> OK, thanks.
>>
> 
> The Oops was due to ftrace_caller() setting the regs argument to NULL.
> 
> After fixing that, I'm back into a situation where I get "Testing tracer 
> function_graph: FAILED!"
> 
> Will continue investigating.
> 

trace_selftest_startup_function_graph() calls register_ftrace_direct() 
which returns -ENOSUPP because powerpc doesn't select 
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS.

Should TEST_DIRECT_TRAMP depend on CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS ?

Christophe
