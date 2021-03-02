Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C7F32A06F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 14:21:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dqd7W2m0vz3cK9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 00:21:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pdbP0Rvj;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PvCf8UGz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=pdbP0Rvj; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=PvCf8UGz; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqd734DNFz30MT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 00:21:03 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614691254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wODTS94r7rT1g5V5X1sVfi31G7C1dx6AeI3koBrFuog=;
 b=pdbP0RvjlLwhT6MGt3O7gZlZ1Q1Vzt4kvyP2jb11vAJTSkByIgWXRKROCs34fG3dE0AwTY
 opU3gtVisKtnKDi9H9VaqI9P0bhcuxW+ktoNqViJTmLm/vR+nRGAu3kprbB/6g5+VBDeOZ
 ISR5jMmEubi9pF4n2AWS1K7EJF6nQqOZ7mmnpB1SEorJMS5eXC6YUniwsW+o9YMWNEx/Xj
 xPN5r8bZzOsf6A9vVjHdFrwNDVoQDh1yYdiMi7tbkNI3fa/NGcpZ+fYwM9XNXow6mIJwhV
 c6N2wQQqBhJ0Qe4yqQIr91zIX6QAKM27rCmbJHH1uo6HBm2Z4utmX+gBS6ubiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614691254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wODTS94r7rT1g5V5X1sVfi31G7C1dx6AeI3koBrFuog=;
 b=PvCf8UGzPtfD1uoD5xPlqfOPLQKMHyVSQbbcSZy98K9oXrA3licqYHQYy8osgfMblhBHAa
 hvqSY9FaOO6n64Aw==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH next v3 12/15] printk: introduce a kmsg_dump iterator
In-Reply-To: <YD0tbVV+hZOFvWyB@alley>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
 <20210225202438.28985-13-john.ogness@linutronix.de> <YD0tbVV+hZOFvWyB@alley>
Date: Tue, 02 Mar 2021 14:20:51 +0100
Message-ID: <87lfb5pu8c.fsf@jogness.linutronix.de>
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
Cc: linux-hyperv@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, Wei Liu <wei.liu@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Anton Vorontsov <anton@enomsg.org>,
 Joel Stanley <joel@jms.id.au>, Jason Wessel <jason.wessel@windriver.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Colin Cross <ccross@android.com>, linux-um@lists.infradead.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Nicholas Piggin <npiggin@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jordan Niethe <jniethe5@gmail.com>, Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Richard Weinberger <richard@nod.at>, kgdb-bugreport@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-03-01, Petr Mladek <pmladek@suse.com> wrote:
>> diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
>> index 532f22637783..5a64b24a91c2 100644
>> --- a/arch/powerpc/kernel/nvram_64.c
>> +++ b/arch/powerpc/kernel/nvram_64.c
>> @@ -72,8 +72,7 @@ static const char *nvram_os_partitions[] = {
>>  	NULL
>>  };
>>  
>> -static void oops_to_nvram(struct kmsg_dumper *dumper,
>> -			  enum kmsg_dump_reason reason);
>> +static void oops_to_nvram(enum kmsg_dump_reason reason);
>>  
>>  static struct kmsg_dumper nvram_kmsg_dumper = {
>>  	.dump = oops_to_nvram
>> @@ -642,11 +641,11 @@ void __init nvram_init_oops_partition(int rtas_partition_exists)
>>   * that we think will compress sufficiently to fit in the lnx,oops-log
>>   * partition.  If that's too much, go back and capture uncompressed text.
>>   */
>> -static void oops_to_nvram(struct kmsg_dumper *dumper,
>> -			  enum kmsg_dump_reason reason)
>> +static void oops_to_nvram(enum kmsg_dump_reason reason)
>>  {
>>  	struct oops_log_info *oops_hdr = (struct oops_log_info *)oops_buf;
>>  	static unsigned int oops_count = 0;
>> +	static struct kmsg_dump_iter iter;
>>  	static bool panicking = false;
>>  	static DEFINE_SPINLOCK(lock);
>>  	unsigned long flags;
>> @@ -681,13 +680,14 @@ static void oops_to_nvram(struct kmsg_dumper *dumper,
>>  		return;
>>  
>>  	if (big_oops_buf) {
>> -		kmsg_dump_get_buffer(dumper, false,
>> +		kmsg_dump_rewind(&iter);
>
> It would be nice to get rid of the kmsg_dump_rewind(&iter) calls
> in all callers.
>
> A solution might be to create the following in include/linux/kmsg_dump.h
>
> #define KMSG_DUMP_ITER_INIT(iter) {	\
> 	.cur_seq = 0,			\
> 	.next_seq = U64_MAX,		\
> 	}
>
> #define DEFINE_KMSG_DUMP_ITER(iter)	\
> 	struct kmsg_dump_iter iter = KMSG_DUMP_ITER_INIT(iter)

For this caller (arch/powerpc/kernel/nvram_64.c) and for
(kernel/debug/kdb/kdb_main.c), kmsg_dump_rewind() is called twice within
the dumper. So rewind will still be used there.

> Then we could do the following at the beginning of both
> kmsg_dump_get_buffer() and kmsg_dump_get_line():
>
> 	u64 clear_seq = latched_seq_read_nolock(&clear_seq);
>
> 	if (iter->cur_seq < clear_seq)
> 		cur_seq = clear_seq;

I suppose we need to add this part anyway, if we want to enforce that
records before @clear_seq are not to be available for dumpers.

> I am not completely sure about next_seq:
>
>    + kmsg_dump_get_buffer() will set it for the next call anyway.
>      It reads the blocks of messages from the newest.
>
>    + kmsg_dump_get_line() wants to read the entire buffer anyway.
>      But there is a small risk of an infinite loop when new messages
>      are printed when dumping each line.
>
> It might be better to avoid the infinite loop. We could do the following:
>
> static void check_and_set_iter(struct kmsg_dump_iter)
> {
> 	if (iter->cur_seq == 0 && iter->next_seq == U64_MAX) {
> 		kmsg_dump_rewind(iter);
> }
>
> and call this at the beginning of both kmsg_dump_get_buffer()
> and kmsg_dump_get_line()
>
> What do you think?

On a technical level, it does not make any difference. It is pure
cosmetic.

Personally, I prefer the rewind directly before the kmsg_dump_get calls
because it puts the initializer directly next to the user.

As an example to illustrate my view, I prefer:

    for (i = 0; i < n; i++)
        ...;

instead of:

    int i = 0;

    ...

    for (; i < n; i++)
        ...;

Also, I do not really like the special use of 0/U64_MAX to identify
special actions of the kmsg_dump_get functions.

> Note that I do not resist on it. But it might make the API easier to
> use from my POV.

Since you do not resist, I will keep the API the same for v4. But I will
add the @clear_seq check to the kmsg_dump_get functions.

John Ogness
