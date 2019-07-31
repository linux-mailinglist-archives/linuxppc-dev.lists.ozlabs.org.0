Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5037C31A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 15:17:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zDV20J1FzDqfJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 23:16:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zBHT5FpQzDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 21:37:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45zBHT1rz4z9s00;
 Wed, 31 Jul 2019 21:37:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/5] powerpc/powernv: Move SCOM access code into
 powernv platform
In-Reply-To: <166d8f54-50b8-648d-f839-bee788e68abf@linux.ibm.com>
References: <20190509051119.7694-1-ajd@linux.ibm.com>
 <166d8f54-50b8-648d-f839-bee788e68abf@linux.ibm.com>
Date: Wed, 31 Jul 2019 21:37:36 +1000
Message-ID: <87k1byqvsv.fsf@concordia.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On 9/5/19 3:11 pm, Andrew Donnellan wrote:
>> The powernv platform is the only one that directly accesses SCOMs. Move the
>> support code to platforms/powernv, and get rid of the PPC_SCOM Kconfig
>> option, as SCOM support is always selected when compiling for powernv.
>> 
>> This also means that the Kconfig item for CONFIG_SCOM_DEBUGFS will actually
>> show up in menuconfig, as previously it was the only labelled option in
>> sysdev/Kconfig and wasn't actually in a menu.
>
> As I've just realised, this isn't actually correct - the option does 
> indeed show up... in the root menu, where I've just been trained to 
> ignore it, and where you won't get a menu location if you try to search 
> for it using / in menuconfig.
>
> I think moving it to the platform menu is obviously a better location. 
> mpe would you be able to fix up the commit message in merge?

Yes, done.

cheers
