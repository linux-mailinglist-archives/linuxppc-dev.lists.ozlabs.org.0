Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AADAEC9F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 16:08:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SRgw1WGTzF0mJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 00:07:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SRdH1GX6zDrgZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 00:05:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="i4n+P7f2"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 46SRdG70zWz9sNw; Wed, 11 Sep 2019 00:05:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46SRdF43Nvz9s00;
 Wed, 11 Sep 2019 00:05:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568124338;
 bh=c8qB+nRRVjRXO6den8f0jR1eA4P+qVVoUeC0w3d8+rw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=i4n+P7f2JlfbsRr/wqZwY2njA/MEjkMQ+HtkPGUPKEAKBHtuih4vX7C0r/3hx1T1n
 TUHYpJYj1NWoHxKI3V3mPSoozl1wngpIYVcoO1izmzKmont/VZZBHYyeDinpwG0l6k
 EdadyeK/62omMALx2CMeB8QmtiDvTwgUB8N4fc+UGGGXYZ/yEgEcOrvBJhuQXlGy3q
 juKn3IVfrFix7y/flyDHBOlwE+6TB0iPmhmugOcMbLeb+WdBhtNmW06TijnxVfkn7R
 VYOpXQpKd+fOX9PW/1T/CTRPDcp8wlMuI1q4sJCVjYWDQgm296XcvduR+ki39jao2G
 nJOCBt1+yF8Aw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH v5 21/31] powernv/fadump: process architected register
 state data provided by firmware
In-Reply-To: <af1c8b69-7340-005e-12b1-5e7228b9ea3a@linux.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630280239.8896.11769233860624935762.stgit@hbathini.in.ibm.com>
 <87sgpcp80n.fsf@mpe.ellerman.id.au>
 <b7c46267-92d8-9202-b657-7cb8e37451fe@linux.ibm.com>
 <CAOSf1CHjV5PM-rYJ_5-XHmZyBNO_H=Nw8X7+HoOZnL+D7pM-sg@mail.gmail.com>
 <af1c8b69-7340-005e-12b1-5e7228b9ea3a@linux.ibm.com>
Date: Wed, 11 Sep 2019 00:05:36 +1000
Message-ID: <87sgp4z1ov.fsf@mpe.ellerman.id.au>
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> On 09/09/19 9:03 PM, Oliver O'Halloran wrote:
>> On Mon, Sep 9, 2019 at 11:23 PM Hari Bathini <hbathini@linux.ibm.com> wrote:
>>> On 04/09/19 5:50 PM, Michael Ellerman wrote:
>>>> Hari Bathini <hbathini@linux.ibm.com> writes:
>>> [...]
>>>
>>>>> +/*
>>>>> + * CPU state data is provided by f/w. Below are the definitions
>>>>> + * provided in HDAT spec. Refer to latest HDAT specification for
>>>>> + * any update to this format.
>>>>> + */
>>>>
>>>> How is this meant to work? If HDAT ever changes the format they will
>>>> break all existing kernels in the field.
>>>>
>>>>> +#define HDAT_FADUMP_CPU_DATA_VERSION                1
>>>
>>> Changes are not expected here. But this is just to cover for such scenario,
>>> if that ever happens.
>> 
>> The HDAT spec doesn't define the SPR numbers for NIA, MSR and the CR.
>> As far as I can tell the values you've assumed here are chip-specific,
>> non-architected SPR numbers that come from an array buried somewhere
>> in the SBE codebase. I don't believe you for a second when you say
>> that this will never change.
>
> At least, the understanding is that this numbers not change across processor
> generations. If something changes, it is supposed to be handled in SBE. Also,
> I am told this numbers would be listed in the HDAT Spec. Not sure if that
> happened yet though. Vasant, you have anything to add?

That doesn't help much because the HDAT spec is not public.

The point is with the code written the way it is, these values *must
not* change, or else all existing kernels will be broken, which is not
acceptable.

>>> Also, I think it is a bit far-fetched to error out if versions mismatch.
>>> Warning and proceeding sounds worthier because the changes are usually
>>> backward compatible, if and when there are any. Will update accordingly...
>> 
>> Literally the only reason I didn't drop the CPU DATA parts of the OPAL
>> MPIPL series was because I assumed the kernel would do the sensible
>> thing and reject or ignore the structure if it did not know how to
>> parse the data.
>
> I think, the changes if any, would have to be backward compatible for the sake
> of sanity.

People need to understand that this is an ABI between firmware and
in-the-field distribution kernels which are only updated at customer
discretion, or possibly never.

Any changes *must be* backward compatible.

Looking at the header struct:

+struct hdat_fadump_thread_hdr {
+	__be32  pir;
+	/* 0x00 - 0x0F - The corresponding stop state of the core */
+	u8      core_state;
+	u8      reserved[3];

You have those 3 reserved bytes, so a future revision could repurpose
one of those as a flag to indicate a new format. And/or the hdr could be
made bigger and new kernels could be taught to look for new things in
the space after the hdr but before the reg entries.

So I think there is a reasonable mechanism for extending the format in
future, but my point is people must understand that this is an ABI and
changes must be made accordingly.

> Even if they are not, we are better off exporting the /proc/vmcore
> with a warning and some crazy CPU register data (if parsing goes alright) than
> no dump at all? 

If it's just a case of reg entries that we don't recognise then yes I
think it would be OK to just skip them and continue exporting. But if
there's any deeper misunderstanding of the format then we should bail
out.

I notice now that you don't do anything in opal_fadump_set_regval_regnum()
if you are passed a register we don't understand, so that probably needs
fixing.

cheers
