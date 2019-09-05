Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16489A9927
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 06:01:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P6SX4GqkzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 14:01:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P6QH5RP4zDqxq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 13:59:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46P6QG1gGtz9sN1; Thu,  5 Sep 2019 13:59:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46P6QF30c0z9s7T;
 Thu,  5 Sep 2019 13:59:33 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: Re: [PATCH v3 3/4] x86/efi: move common keyring handler functions to
 new file
In-Reply-To: <1567551071.4937.5.camel@linux.ibm.com>
References: <1566825818-9731-1-git-send-email-nayna@linux.ibm.com>
 <1566825818-9731-4-git-send-email-nayna@linux.ibm.com>
 <87pnkisyiv.fsf@mpe.ellerman.id.au> <1567551071.4937.5.camel@linux.ibm.com>
Date: Thu, 05 Sep 2019 13:59:33 +1000
Message-ID: <87blvzpf4q.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
Cc: David Howells <dhowells@redhat.com>, Josh Boyer <jwboyer@fedoraproject.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver O'Halloran <oohall@gmail.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mimi Zohar <zohar@linux.ibm.com> writes:
> (Cc'ing Josh Boyer, David Howells)
>
> On Mon, 2019-09-02 at 21:55 +1000, Michael Ellerman wrote:
>> Nayna Jain <nayna@linux.ibm.com> writes:
>>=20
>> > The handlers to add the keys to the .platform keyring and blacklisted
>> > hashes to the .blacklist keyring is common for both the uefi and power=
pc
>> > mechanisms of loading the keys/hashes from the firmware.
>> >
>> > This patch moves the common code from load_uefi.c to keyring_handler.c
>> >
>> > Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
>
> Acked-by: Mimi Zohar <zohar@linux.ibm.com>
>
>> > ---
>> >  security/integrity/Makefile                   |  3 +-
>> >  .../platform_certs/keyring_handler.c          | 80 +++++++++++++++++++
>> >  .../platform_certs/keyring_handler.h          | 32 ++++++++
>> >  security/integrity/platform_certs/load_uefi.c | 67 +---------------
>> >  4 files changed, 115 insertions(+), 67 deletions(-)
>> >  create mode 100644 security/integrity/platform_certs/keyring_handler.c
>> >  create mode 100644 security/integrity/platform_certs/keyring_handler.h
>>=20
>> This has no acks from security folks, though I'm not really clear on who
>> maintains those files.
>
> I upstreamed David's, Josh's, and Nayna's patches, so that's probably
> me.
>
>> Do I take it because it's mostly just code movement people are OK with
>> it going in via the powerpc tree?
>
> Yes, the only reason for splitting load_uefi.c is for powerpc. =C2=A0These
> patches should be upstreamed together. =C2=A0

Thanks.

cheers
