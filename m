Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BA130EC54
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 07:11:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWSq05RZFzDqRv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 17:11:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWSn60ThszDqT3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 17:09:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=CSbD8NRk; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWSn51G6lz9sXk;
 Thu,  4 Feb 2021 17:09:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612418969;
 bh=ffeb9aFuQlj+8kU0ibij1jUKEOCTa6rcwuJPDgwfno8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=CSbD8NRkawEAL+BIgoOOzH5GkjgXeo1kStmWAFUFagwz5IusmxBU2JYS1ystkd0Tm
 sL/2A41jpsvbDHdYHrcFnxjqPqG1GLA321U/fFvZqYmbS4wdvQ8W95iUOcfrJprTYD
 LWyEUTDDOHbGu/pyWxjt5UNQBVHN0hoJZrRby8SzTYYeK199Es9nv5YB16OHSy9h4b
 fTh6JMIfoU+pJFHJT9gCp2wumFw6zOdoVQGJZlXxw3IcHpreH/ziBk8tuSljdh9V6z
 RcOPEQStjUWHvvAkCiL0gEsN2x37JPTS4gwC/5ZAc2W6SdozKbzesBr+PEmBXtxlmg
 Fy0IyTBHjvKIg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Christopher M. Riedl" <cmr@codefail.de>, Gabriel Paubert <paubert@iram.es>
Subject: Re: [PATCH v4 02/10] powerpc/signal: Add unsafe_copy_{vsx,
 fpr}_from_user()
In-Reply-To: <C8YHSKQ99VC4.M9Y0WOFVUTBQ@geist>
References: <C8YHSKQ99VC4.M9Y0WOFVUTBQ@geist>
Date: Thu, 04 Feb 2021 17:09:24 +1100
Message-ID: <87mtwkpdnv.fsf@mpe.ellerman.id.au>
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
Cc: David Laight <David.Laight@ACULAB.COM>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Christopher M. Riedl" <cmr@codefail.de> writes:
> On Mon Feb 1, 2021 at 10:54 AM CST, Gabriel Paubert wrote:
>> On Mon, Feb 01, 2021 at 09:55:44AM -0600, Christopher M. Riedl wrote:
>> > On Thu Jan 28, 2021 at 4:38 AM CST, David Laight wrote:
>> > > From: Christopher M. Riedl
>> > > > Sent: 28 January 2021 04:04
>> > > > 
>> > > > Reuse the "safe" implementation from signal.c except for calling
>> > > > unsafe_copy_from_user() to copy into a local buffer.
>> > > > 
>> > > > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
>> > > > ---
>> > > >  arch/powerpc/kernel/signal.h | 33 +++++++++++++++++++++++++++++++++
>> > > >  1 file changed, 33 insertions(+)
>> > > > 
>> > > > diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
>> > > > index 2559a681536e..c18402d625f1 100644
>> > > > --- a/arch/powerpc/kernel/signal.h
>> > > > +++ b/arch/powerpc/kernel/signal.h
>> > > > @@ -53,6 +53,33 @@ unsigned long copy_ckfpr_from_user(struct task_struct *task, void __user *from);
>> > > >  				&buf[i], label);\
>> > > >  } while (0)
>> > > > 
>> > > > +#define unsafe_copy_fpr_from_user(task, from, label)	do {		\
>> > > > +	struct task_struct *__t = task;					\
>> > > > +	u64 __user *__f = (u64 __user *)from;				\
>> > > > +	u64 buf[ELF_NFPREG];						\
>> > >
>> > > How big is that buffer?
>> > > Isn't is likely to be reasonably large compared to a reasonable
>> > > kernel stack frame.
>> > > Especially since this isn't even a leaf function.
>> > >
>> > 
>> > I think Christophe answered this - I don't really have an opinion either
>> > way. What would be a 'reasonable' kernel stack frame for reference?
>>
>> See include/linux/poll.h, where the limit is of the order of 800 bytes
>> and the number of entries in an on stack array is chosen at compile time
>> (different between 32 and 64 bit for example).
>>
>> The values are used in do_sys_poll, which, with almost 1000 bytes of
>> stack footprint, appears close to the top of "make checkstack". In
>> addition do_sys_poll has to call the ->poll function of every file
>> descriptor in its table, so it is not a tail function.
>>
>> This 264 bytes array looks reasonable, but please use 'make checkstack'
>> to verify that the function's total stack usage stays within reason.
>
> Neat, looks like total usage is a bit larger but still reasonable and
> less than half of 800B:
>
> 0xc000000000017e900 __unsafe_restore_sigcontext.constprop.0 [vmlinux]:352

We warn for frames larger than 2KB on 64-bit, see FRAME_WARN in
lib/Kconfig.debug.

So 264 bytes is entirely reasonable IMHO.

cheers

