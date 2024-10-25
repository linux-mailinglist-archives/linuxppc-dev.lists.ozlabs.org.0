Return-Path: <linuxppc-dev+bounces-2563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C12F9AF768
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 04:32:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZRd01mDTz2xY0;
	Fri, 25 Oct 2024 13:32:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729823524;
	cv=none; b=es8ohsZTI6covSmH2qOPkRVV27VkO8h8VJvDtZ1eRulHvKMxupFgckAxRc/Ch2sBibsrRq4M3pXVtsN814RhGmQDtGi1o0tIqK9sS1Bu80fp06J1Ekxv6mqad9Uke0/TetmP5bVmtdlSWPFNA0MH+CdKlSelxazBLhiMHEyBOWFn+f207xyv9CKfNyFS7ewcS1w2P1pTy/Hy7SYkhxQLBdIlgt1fZhOEHRIlgzJilNGMn31H5XEKjFwfhKl22nKbpZjN6/3JlhX/hjcp7w678sJQY+bEl2BKnzDpx5a8MNnXkawBxgqxfVcXqKEXmB+LS+guBLNawgIghN0D35dX4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729823524; c=relaxed/relaxed;
	bh=DLqU6vLdekjlRZZCwD9gnIJ2B6/IvBjWioyusl6prfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IfbtNI0r3I9lhYHXmbgZVYzCXvj+ZAv5QfSZXpUCu3FRC3ayViMHe30eoY4qJnsOpY586vRvZzW9DLf5VjjXbwTRyx438mPnj5OamN1E6V2qw6je/OZ1faT060V2y/mqei5YLQTMjMJlOXC1raLCcXnY8T71SZjR4vXvvIW/PNqzdnZTQnTaKQjacjkChEeqCipdXZ4KwQWQ72qAnjtDCIICTU+cyWkHIgWIo7WvHrTN9xUvIyVrqyfKunZBGwb/io+/c1oay4Wa/iSXrHvvs1A1HJN6jOqmJnXkYc173CvGO6mwgMXrpJkwmFeGkQEoPq6/yGoTODQ3+KjL8+nv6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qwZfTYwt; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qwZfTYwt;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZRcx164bz2xXL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 13:32:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1729823519;
	bh=DLqU6vLdekjlRZZCwD9gnIJ2B6/IvBjWioyusl6prfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qwZfTYwt5+TDD7JV1w1VeSXVFG4at6tB2CJKZfLFDHiuL+8Tj/HdLd3uvgNl2lUjb
	 qNdvLa+SjqmKhoN/dZwYs5ioQ2nbPg7CAm07MX6k/f8e+tfKYJJnZ2+72P9HvFpw3Z
	 l1vY6FuN0zooFJdb24eKQ1OpGUI1DspLYEnqMrGjTFR1JrHtV0gAsOIveR6maiCxQh
	 DssoSvCHTOdb/SkSscMzA2YlyfnX8HFR5jU69Q2GV98bQVQuYhUAedqrA+yGtWfy7I
	 rdZaNIuG95vmcEHAjVKbB+QYR2xqpFZdifpMZuSloLYs4i2GFegjHmUrsVy3e5yZHj
	 uRV4nKHCoMZ2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZRcv1wQGz4wb1;
	Fri, 25 Oct 2024 13:31:59 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, peterx@redhat.com, groug@kaod.org,
 sshegde@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/xmon: symbol lookup length fixed
In-Reply-To: <zkm6fcxaef4gnvvsvykv7po7joytakyhqnmt2j72ej3r4wffn2@j5p6h6h2bwnw>
References: <20241023212225.1306609-2-mchauras@linux.ibm.com>
 <878que2u2i.fsf@mail.lhotse>
 <nxdkjwqtd7s3fcxebwod6lrfu7rngrj7fa4kk433hgypha66w5@6ahbuz7o2qmu>
 <zkm6fcxaef4gnvvsvykv7po7joytakyhqnmt2j72ej3r4wffn2@j5p6h6h2bwnw>
Date: Fri, 25 Oct 2024 13:32:00 +1100
Message-ID: <87a5eskj4v.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com> writes:
> On Thu, Oct 24, 2024 at 10:42:12AM +0530, Mukesh Kumar Chaurasiya wrote:
>> On Thu, Oct 24, 2024 at 12:00:53PM +1100, Michael Ellerman wrote:
>> > Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com> writes:
>> > > Currently xmon cannot lookup symbol beyond 64 characters in some cases.
>> > 
>> > Can you mention which commands? It looks like it's "ls" and "lp".
>> Sure.
>> > 
>> > > Fix this by using KSYM_NAME_LEN instead of fixed 64 characters.
>> > >
>> > > Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
>> > > ---
>> > >  arch/powerpc/xmon/xmon.c | 6 +++---
>> > >  1 file changed, 3 insertions(+), 3 deletions(-)
>> > >
>> > > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
>> > > index e6cddbb2305f..22b8b5cc4df0 100644
>> > > --- a/arch/powerpc/xmon/xmon.c
>> > > +++ b/arch/powerpc/xmon/xmon.c
>> > > @@ -3662,7 +3662,7 @@ symbol_lookup(void)
>> > >  	int type = inchar();
>> > >  	unsigned long addr, cpu;
>> > >  	void __percpu *ptr = NULL;
>> > > -	static char tmp[64];
>> > > +	static char tmp[KSYM_NAME_LEN];
>> >   
>> > I think you could use the existing tmpstr buffer.
>> > 
>> > It is global so it's a little hard to track down all the users, but I
>> > think it's only used briefly in get_function_bounds(),
>> > xmon_print_symbol() and scanhex(). ie. none of the uses persist across
>> > function calls.
>> > 
>> > We don't want to have two 512 byte static arrays lying around if we can
>> > get by with one.
>> > 
>> > cheers
>> Sure.

> For now i don't think so we can get by with only one. There is a lookup being
> done when the scanhex is using the tmpstr for another lookup.

Yeah I see it, when handling `lp <symbol> <cpu>`.

That's a bit annoying because for that command the CPU number is only
meant to be a number, it never makes sense to do a $symbol lookup there.

But I agree with the way the code is structured it's best not to reuse
tmpstr there.

cheers

