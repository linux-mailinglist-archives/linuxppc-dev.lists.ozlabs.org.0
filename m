Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BD777F0B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 08:45:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pz9ElAba;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRFrD69mQz3cLl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 16:45:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pz9ElAba;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRFqN0B2tz2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 16:44:48 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RRFqC5H8lz4wy3; Thu, 17 Aug 2023 16:44:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692254679;
	bh=Wx3nMILiB1NeGS4OwS92O58JvJol6RuBMilPby1aexs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pz9ElAbaHeW1WlM6FirXgpjKbRPGtcW5zyN9pjls0kdL5arkLwqzNAVC2PRn8qBwa
	 H7IIeZkTzubrcVySUgmaLN+TVRI99448w/43xEZmkedXGjwkQqUrLNaZmEExYUZ3Bm
	 XYqMrfLSaC1FaZ8/j+tbrK639d5HhNFaWXxueq9xAh/P7BTLPTGv/ijFYQk9ork8Cb
	 7zE2UxOOMfQgPJPLpx84Pc0eVfEe3/KQ1eFlSzHg8H0DaTxISTWpBmNsNlo6kT5kM5
	 tD6xpCigM1TCzd9uFuB1hn9Zb+Zagh9PO32Di7yumRtEJRKfvGIKl80K3hYIMqRr7g
	 AGomz3KsKnWEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRFqC2jtTz4wZn;
	Thu, 17 Aug 2023 16:44:39 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: mahesh@linux.ibm.com
Subject: Re: [PATCH v8 1/2] powerpc/rtas: Rename rtas_error_rc to
 rtas_generic_errno
In-Reply-To: <xzsx7qc3el674iyy2lsn3adm7j2vh5xj6cjaqxgjm6lwcjiz5u@evoqbrvhqf26>
References: <169138864808.65607.6576358707894823512.stgit@jupiter>
 <877cpxdksx.fsf@mail.lhotse>
 <xzsx7qc3el674iyy2lsn3adm7j2vh5xj6cjaqxgjm6lwcjiz5u@evoqbrvhqf26>
Date: Thu, 17 Aug 2023 16:44:38 +1000
Message-ID: <87zg2q5fs9.fsf@mail.lhotse>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci <linux-pci@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh J Salgaonkar <mahesh@linux.ibm.com> writes:
> On 2023-08-15 13:52:14 Tue, Michael Ellerman wrote:
>> Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
...
>> > diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
>> > index 3abe15ac79db1..5572a0a2f6e18 100644
>> > --- a/arch/powerpc/include/asm/rtas.h
>> > +++ b/arch/powerpc/include/asm/rtas.h
>> > @@ -202,7 +202,9 @@ typedef struct {
>> >  #define RTAS_USER_REGION_SIZE (64 * 1024)
>> >  
>> >  /* RTAS return status codes */
>> > -#define RTAS_BUSY		-2    /* RTAS Busy */
>> > +#define RTAS_HARDWARE_ERROR	(-1)  /* Hardware Error */
>> > +#define RTAS_BUSY		(-2)  /* RTAS Busy */
>> 
>> Are the brackets necessary?
>
> During v5 changset I received offline review comment to add brackets,
> hence continued here as well. I can take it away if Nathan is fine with
> it.

OK. I can't think of a context where the brackets are useful, but I'm
probably just not thinking hard enough. I don't really mind adding them,
I was just curious what the justification for them was.

cheers
