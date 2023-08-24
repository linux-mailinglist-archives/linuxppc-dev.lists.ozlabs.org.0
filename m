Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D34A786C85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 12:02:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q4HceFOr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWdtj6xf0z3cQ7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 20:02:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q4HceFOr;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWdsq0m7Pz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 20:02:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692871324;
	bh=ciGmiIolHCnAQyFcYpbufDaahcvMN51OXWhXpSIkE6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q4HceFOrZ7+m6TyjsyJ3rDfCK52b4MIc2aT8l+X+yUvlWYRf39yRjfZdGAwHCZMAg
	 NUphmEmlqJOJjyD5VkHAvQOUS8MQDQZvmQdVu/i0VvEQHTll4KPiIA+XAfhRjMJ5mA
	 FkB6H/UySU59YAJMmhPZaemYc9BLXnNhcaatIPOLUc3YmXEklC0daTy8e9Nthc+fy5
	 iz87H4ASXtMU25zumNjszPJVD4dOgJo9iEH63Pan5aFft5nrldHayBDAJuWLyjlNAg
	 goFUV4cKdol53/DokEaZqudtUYsIRUZbEzZCKOA4kQ415cypsUB7gwHpqjEdoNBabQ
	 ncB1lLxcuUqKA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RWdsg2wYyz4wy7;
	Thu, 24 Aug 2023 20:01:59 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Dr. David Alan Gilbert" <linux@treblig.org>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, sam@ravnborg.org, benh@kernel.crashing.org
Subject: Re: [PATCH v3] powerpc: Use shared font data
In-Reply-To: <ZOY0dANP4s3L3VyX@gallifrey>
References: <20230812010241.529173-1-linux@treblig.org>
 <ZOY0dANP4s3L3VyX@gallifrey>
Date: Thu, 24 Aug 2023 20:01:53 +1000
Message-ID: <87msygvjvy.fsf@mail.lhotse>
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
Cc: rdunlap@infradead.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Dr. David Alan Gilbert" <linux@treblig.org> writes:
> * linux@treblig.org (linux@treblig.org) wrote:
>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>> 
>> PowerPC has a 'btext' font used for the console which is almost identical
>> to the shared font_sun8x16, so use it rather than duplicating the data.
>> 
>> They were actually identical until about a decade ago when
>>    commit bcfbeecea11c ("drivers: console: font_: Change a glyph from
>>                         "broken bar" to "vertical line"")
>> 
>> which changed the | in the shared font to be a solid
>> bar rather than a broken bar.  That's the only difference.
>> 
>> This was originally spotted by the PMF source code analyser, which
>> noticed that sparc does the same thing with the same data, and they
>> also share a bunch of functions to manipulate the data.  I've previously
>> posted a near identical patch for sparc.
>> 
>> Tested very lightly with a boot without FS in qemu.
>> 
>> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>
> Hi Michael,
>   Just checking, is there anything else I need to do here?
   
I felt like the lib/fonts/Kconfig change could be cleaner, but the
existing Kconfig is not well structured for what we want to do.

I think at least it could be simplified to:

config FONT_SUN8x16
	bool "Sparc console 8x16 font"
	depends on (FRAMEBUFFER_CONSOLE && (FONTS || SPARC)) || BOOTX_TEXT


cheers


>> diff --git a/lib/fonts/Kconfig b/lib/fonts/Kconfig
>> index c035fde66aebe..1804abe08ffe4 100644
>> --- a/lib/fonts/Kconfig
>> +++ b/lib/fonts/Kconfig
>> @@ -98,7 +98,8 @@ config FONT_10x18
>>  
>>  config FONT_SUN8x16
>>  	bool "Sparc console 8x16 font"
>> -	depends on FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)
>> +	depends on (FRAMEBUFFER_CONSOLE || BOOTX_TEXT) &&\
>> +	           (!SPARC && FONTS || SPARC || PPC)
>>  	help
>>  	  This is the high resolution console font for Sun machines. Say Y.
>>  
