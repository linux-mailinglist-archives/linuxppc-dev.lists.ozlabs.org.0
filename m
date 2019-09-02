Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DF8A4EA7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 06:33:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MHJk0vzVzDqbs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 14:33:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MGbf6qJvzDqVr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 14:01:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46MGbf204Zz9sDQ;
 Mon,  2 Sep 2019 14:01:18 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 3/6] powerpc/perf: consolidate read_user_stack_32
In-Reply-To: <87a7bntkum.fsf@mpe.ellerman.id.au>
References: <cover.1567198491.git.msuchanek@suse.de>
 <ea3783a1640b707ef9ce4740562850ef1152829b.1567198491.git.msuchanek@suse.de>
 <87a7bntkum.fsf@mpe.ellerman.id.au>
Date: Mon, 02 Sep 2019 14:01:17 +1000
Message-ID: <877e6rtkhe.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Diana Craciun <diana.craciun@nxp.com>, Firoz Khan <firoz.khan@linaro.org>,
 Hari Bathini <hbathini@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Michal Suchanek <msuchanek@suse.de> writes:
...
>> @@ -295,6 +279,12 @@ static inline int current_is_64bit(void)
>>  }
>>  
>>  #else  /* CONFIG_PPC64 */
>> +static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
>> +{
>> +	return 0;
>> +}
>> +#endif /* CONFIG_PPC64 */
>
> Ending the PPC64 else case here, and then restarting it below with an
> ifndef means we end up with two parts of the file that define 32-bit
> code, with a common chunk in the middle, which I dislike.
>
> I'd rather you add the empty read_user_stack_slow() in the existing
> #else section and then move read_user_stack_32() below the whole ifdef
> PPC64/else/endif section.
>
> Is there some reason that doesn't work?

Gah, I missed that you split the whole file later in the series. Any
reason you did it in two steps rather than moving patch 6 earlier in the
series?

cheers
