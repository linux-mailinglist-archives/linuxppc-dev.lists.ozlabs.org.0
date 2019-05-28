Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D447B2BCC9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 03:18:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CbZq3NxDzDqN7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 11:18:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CbXG2y7VzDqKS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 11:16:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45CbXG1YsPz9s3Z;
 Tue, 28 May 2019 11:16:30 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH v2] powerpc/power: Expose pfn_is_nosave prototype
In-Reply-To: <1929721.iDiXxTFbjN@kreacher>
References: <20190523114736.30268-1-malat@debian.org>
 <20190524104418.17194-1-malat@debian.org> <1929721.iDiXxTFbjN@kreacher>
Date: Tue, 28 May 2019 11:16:30 +1000
Message-ID: <875zpvqsy9.fsf@concordia.ellerman.id.au>
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
Cc: Len Brown <len.brown@intel.com>, linux-s390@vger.kernel.org,
 linux-pm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Rafael J. Wysocki" <rjw@rjwysocki.net> writes:
> On Friday, May 24, 2019 12:44:18 PM CEST Mathieu Malaterre wrote:
>> The declaration for pfn_is_nosave is only available in
>> kernel/power/power.h. Since this function can be override in arch,
>> expose it globally. Having a prototype will make sure to avoid warning
>> (sometime treated as error with W=1) such as:
>> 
>>   arch/powerpc/kernel/suspend.c:18:5: error: no previous prototype for 'pfn_is_nosave' [-Werror=missing-prototypes]
>> 
>> This moves the declaration into a globally visible header file and add
>> missing include to avoid a warning on powerpc. Also remove the
>> duplicated prototypes since not required anymore.
>> 
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Signed-off-by: Mathieu Malaterre <malat@debian.org>
>> ---
>> v2: As suggestion by christophe remove duplicates prototypes
>> 
>>  arch/powerpc/kernel/suspend.c | 1 +
>>  arch/s390/kernel/entry.h      | 1 -
>>  include/linux/suspend.h       | 1 +
>>  kernel/power/power.h          | 2 --
>>  4 files changed, 2 insertions(+), 3 deletions(-)
>> 
>> diff --git a/kernel/power/power.h b/kernel/power/power.h
>> index 9e58bdc8a562..44bee462ff57 100644
>> --- a/kernel/power/power.h
>> +++ b/kernel/power/power.h
>> @@ -75,8 +75,6 @@ static inline void hibernate_reserved_size_init(void) {}
>>  static inline void hibernate_image_size_init(void) {}
>>  #endif /* !CONFIG_HIBERNATION */
>>  
>> -extern int pfn_is_nosave(unsigned long);
>> -
>>  #define power_attr(_name) \
>>  static struct kobj_attribute _name##_attr = {	\
>>  	.attr	= {				\
>> 
>
> With an ACK from the powerpc maintainers, I could apply this one.

Sent.

cheers
