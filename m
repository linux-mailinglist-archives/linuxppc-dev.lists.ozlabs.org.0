Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9612338341
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 06:10:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Kpwm4RXHzDqK1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 14:10:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WHGxHbAy"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Kptx57LZzDqBX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 14:09:11 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id a186so413973pfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 21:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=R+Z70WKAnPAtAbx5vIOTBBQHVJGkjTt0H0j9hA1sc5s=;
 b=WHGxHbAyuuxNsUQ+4FvVyzrGnytrEdlVY1fMaVoDYh4AYjHQ9Qi+desFta8Ws1N3xy
 3zWVVDMxTMlHl6798MzvVFHRoogMSGEQuJnfQyKEUsTLEQLvW4Kxb+/ohJFg2hHOxMT3
 9Tp1OYM277i12owff4Ryk1J4WF2n1FmjuuAZ4EhKNwdXTOFlhBm9MelY0EVRGYgPwIMJ
 GkJ7M85kBIyIIr4SCvSi6vRbLhEhBs36MP0dVVMjsEfjiwJQxx47XjEaLTyf11+udKNA
 w+6aNbdN8w7t6RzFfZ0DX0ttNBfgYDwvfg3I2GKxF+1UC7cmv0hrbTRnpCP/2w/D9UWh
 FbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=R+Z70WKAnPAtAbx5vIOTBBQHVJGkjTt0H0j9hA1sc5s=;
 b=VITDEQ2Wy/7qtzJBHaBzSsr9I+Dqtih+ZYo981kVM1VHSiFjW+c4edOonyvA8tMtlm
 40SU+Slzc/VGPdUgbyNmlDaybny19ViEkQSbNtUbjXB7LnVAcylTb2FufglLlLUaww44
 vH4GCT8TaGOX2fnfFXg0gYachiQNFMjxzE9+zE1WcidtmJEViSXGzqblMUoQvuZATTPm
 /o1txDF03oPi3kerttB/i/1O1H18y58TLizbPxWZynXYima+D+QIcNpDy8kozsRoude8
 j+ekJt/QyomQqHGqfmP+sFWxVqHDAveFoEBZexFw4wzqxrqsmxuN9QhWlhfhuP1qhOlu
 AKaQ==
X-Gm-Message-State: APjAAAVVo6A+8jp017qjlC1whHs1okoKrSwZVpoZDhD60uNigc2WypBG
 a3C+LYVA6hH9fgi0p4SqSUk=
X-Google-Smtp-Source: APXvYqxP+9VglmSe7tmlHh65Iazdp5krFC8vPCNMH2yMP7Tg3YZM1XSgWBQal9JPPAunHe2p2g90BA==
X-Received: by 2002:a63:5457:: with SMTP id e23mr1041118pgm.307.1559880547948; 
 Thu, 06 Jun 2019 21:09:07 -0700 (PDT)
Received: from localhost (193-116-93-94.tpgi.com.au. [193.116.93.94])
 by smtp.gmail.com with ESMTPSA id a12sm660018pgq.0.2019.06.06.21.09.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 21:09:07 -0700 (PDT)
Date: Fri, 07 Jun 2019 14:07:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Fix THP PMD collapse serialisation
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20190603060531.13088-1-npiggin@gmail.com>
 <8736kmhh62.fsf@linux.ibm.com>
In-Reply-To: <8736kmhh62.fsf@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1559880348.0wirq74jve.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K.V's on June 7, 2019 1:23 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Commit 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion
>> in pte helpers") changed the actual bitwise tests in pte_access_permitte=
d
>> by using pte_write() and pte_present() helpers rather than raw bitwise
>> testing _PAGE_WRITE and _PAGE_PRESENT bits.
>>
>> The pte_present change now returns true for ptes which are !_PAGE_PRESEN=
T
>> and _PAGE_INVALID, which is the combination used by pmdp_invalidate to
>> synchronize access from lock-free lookups. pte_access_permitted is used =
by
>> pmd_access_permitted, so allowing GUP lock free access to proceed with
>> such PTEs breaks this synchronisation.
>>
>> This bug has been observed on HPT host, with random crashes and corrupti=
on
>> in guests, usually together with bad PMD messages in the host.
>>
>> Fix this by adding an explicit check in pmd_access_permitted, and
>> documenting the condition explicitly.
>>
>> The pte_write() change should be okay, and would prevent GUP from fallin=
g
>> back to the slow path when encountering savedwrite ptes, which matches
>> what x86 (that does not implement savedwrite) does.
>>
>=20
> I guess we are doing the find_linux_pte change in another patch.
>=20
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Sorry, just got delayed with re-testing. Thanks for the feedback on it
I send new patches.

Two patches yes because they fix issues introduced in different
commits so it should make backports easier.

Thanks,
Nick

=
