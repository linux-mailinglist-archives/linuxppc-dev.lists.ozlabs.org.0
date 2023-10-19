Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C127CF8A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 14:23:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kILPIOWQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB6Ln3zK2z3cnZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 23:23:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kILPIOWQ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB6Ky29mnz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 23:22:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697718150;
	bh=HLdF5+iRS16V2LnewyEPDHcCGuf4XKcDvsdDlHMTKMg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kILPIOWQASmoPxMG9KgzwSELmJKaoB58CEji73tRv4pjHD+HGwfdEDEK/b3RGROzZ
	 dexNxfmbOtVIuzU/rumzQ6Q1MaUvaYINHEzB6pg9rCXakzMIHQoVWTvPd0Mwee+xZR
	 plz0s7qr7Qe8MAffNy3CcN2RPQebLwTgxdFNuNjTdperVUGJ8SsD5McsW6YoQ8gRr2
	 x2giqVQ0/BnkhTfnGuTYT/QTIlaWPgeW/3Q8EKKgyxr9LsKvTRKBfpSgP4Gk+12lbT
	 TTK3v2Y1Qgl2bGOFXzCmIaKX1+IPRo/4ObLpMI/ukn9d/FoTUN3LW+ORPT5VLjv2xI
	 Hlw8ZtCUOny1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SB6Ky0wksz4xcF;
	Thu, 19 Oct 2023 23:22:30 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: Re: [PATCH] powerpc/perf: Optimize find_alternatives_list() using
 binary search
In-Reply-To: <20231019035630.GC576715@sivslab-System-Product-Name>
References: <20231013175714.2142775-1-visitorckw@gmail.com>
 <871qdr75ie.fsf@mail.lhotse>
 <20231019035630.GC576715@sivslab-System-Product-Name>
Date: Thu, 19 Oct 2023 23:22:26 +1100
Message-ID: <87edhq6bul.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kuan-Wei Chiu <visitorckw@gmail.com> writes:
> On Thu, Oct 19, 2023 at 12:41:45PM +1100, Michael Ellerman wrote:
>> Kuan-Wei Chiu <visitorckw@gmail.com> writes:
>> > This patch improves the performance of event alternative lookup by
>> > replacing the previous linear search with a more efficient binary
>> > search. This change reduces the time complexity for the search process
>> > from O(n) to O(log(n)). A pre-sorted table of event values and their
>> > corresponding indices has been introduced to expedite the search
>> > process.
>> 
>> Thanks for the patch.
>> 
>> How did you test this? I assume you don't have a Power6 machine lying
>> around? :)
>
> I indeed do not have a Power6 machine for testing. Therefore, I designed
> a simple unit test [1] to verify the functionality of the patch. In this
> test, I ran a loop from 0 to UINT_MAX, using these values as inputs to
> compare the return values of the original function with the new function
> I implemented, which utilizes binary search. If you have any suggestions
> for a more suitable testing method, please let me know. I would greatly
> appreciate your feedback.

That's an excellent technique :)

The other option would be to test it using qemu.

You can't actually emulate a Power6 with qemu, but you can emulate a
Power7 which is similar. The code in power7-pmu.c is similar enough that
you could copy this code into there and test it that way.

But I don't expect you to do all that. I have an actual Power6 I can
give it a quick test on, and your unit test should have found any bugs
anyway.

For future reference you can add extra detail about testing and so on
below the "---" line in your patch, ie. below the diffstat but above the
diff. Content in there will not appear in the final commit, so it's good
for information you want to tell the maintainer, but is a bit verbose to
be in the permanant change log - like for example how you tested
something.

My only other comment would be to change the name of
"presort_event_table" to "presorted_event_table" - but I can do that
when applying.

I'll pick this up for v6.7.

cheers

> [1]:
> /* return 0 on success and return non-zero on failure */
> int test()
> {
>     u64 event = 0;
>     for (u64 event = 0; event <= UINT_MAX; event++) {
>         /* result of the current function in the linux kernel */
> 	int result_old = find_alternatives_list(event);
> 	/* result of the new function using binary search */
> 	int result_new = find_alternatives_list_new(event);
>
> 	if (result_old != result_new)
> 	    return 1;
>     }
>     return 0;
> }
>
>
>> > diff --git a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c
>> > index 5729b6e059de..b6030ea130eb 100644
>> > --- a/arch/powerpc/perf/power6-pmu.c
>> > +++ b/arch/powerpc/perf/power6-pmu.c
>> > @@ -335,25 +335,34 @@ static const unsigned int event_alternatives[][MAX_ALT] = {
>> >  	{ 0x3000fe, 0x400056 },			/* PM_DATA_FROM_L3MISS */
>> >  };
>> >  
>> > -/*
>> > - * This could be made more efficient with a binary search on
>> > - * a presorted list, if necessary
>> > - */
>> >  static int find_alternatives_list(u64 event)
>> >  {
>> > -	int i, j;
>> > -	unsigned int alt;
>> > -
>> > -	for (i = 0; i < ARRAY_SIZE(event_alternatives); ++i) {
>> > -		if (event < event_alternatives[i][0])
>> > -			return -1;
>> > -		for (j = 0; j < MAX_ALT; ++j) {
>> > -			alt = event_alternatives[i][j];
>> > -			if (!alt || event < alt)
>> > -				break;
>> > -			if (event == alt)
>> > -				return i;
>> > -		}
>> > +	const unsigned int presort_event_table[] = {
>> > +		0x0130e8, 0x080080, 0x080088, 0x10000a, 0x10000b, 0x10000d, 0x10000e,
>> > +		0x100010, 0x10001a, 0x100026, 0x100054, 0x100056, 0x1000f0, 0x1000f8,
>> > +		0x1000fc, 0x200008, 0x20000e, 0x200010, 0x200012, 0x200054, 0x2000f0,
>> > +		0x2000f2, 0x2000f4, 0x2000f5, 0x2000f6, 0x2000f8, 0x2000fc, 0x2000fe,
>> > +		0x2d0030, 0x30000a, 0x30000c, 0x300010, 0x300012, 0x30001a, 0x300056,
>> > +		0x3000f0, 0x3000f2, 0x3000f6, 0x3000f8, 0x3000fc, 0x3000fe, 0x400006,
>> > +		0x400007, 0x40000a, 0x40000e, 0x400010, 0x400018, 0x400056, 0x4000f0,
>> > +		0x4000f8, 0x600005};
>> > +	const unsigned int event_index_table[] = {
>> > +		0,  1,  2,  3,  4,  1, 5,  6,  7,  8,  9,  10, 11, 12, 13, 12, 14,
>> > +		7,  15, 2,  9,  16, 3, 4,  0,  17, 10, 18, 19, 20, 1,  17, 15, 19,
>> > +		18, 2,  16, 21, 8,  0, 22, 13, 14, 11, 21, 5,  20, 22, 1,  6,  3};
>> > +	int lo = 0;
>> > +	int hi = ARRAY_SIZE(presort_event_table) - 1;
>> > +
>> > +	while (lo <= hi) {
>> > +		int mid = lo + (hi - lo) / 2;
>> > +		unsigned int alt = presort_event_table[mid];
>> > +
>> > +		if (alt < event)
>> > +			lo = mid + 1;
>> > +		else if (alt > event)
>> > +			hi = mid - 1;
>> > +		else
>> > +			return event_index_table[mid];
>> >  	}
>> >  	return -1;
>> >  }
>> > -- 
>> > 2.25.1
