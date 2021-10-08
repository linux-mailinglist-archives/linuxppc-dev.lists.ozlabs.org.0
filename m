Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE3E426462
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 07:59:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQcw00dtwz3blF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 16:59:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Krzc57H5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQcvM0lh1z2ypj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Oct 2021 16:58:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Krzc57H5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQcvK1BvHz4xb7;
 Fri,  8 Oct 2021 16:58:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633672733;
 bh=k79ijaB4BqLWGRtaqOBdgCz9I0VTG7U32BBiPeHoJn8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Krzc57H5WA7NgIj5Zp7UIu3GkPW9T1PBRW/USYC6Eksmv3E5nFvSl5XmAs7KEeHE+
 UtYzEZqv1rua6HIyyjtKDZHcFpVTmaFXxnrojZoxhxzoKqNc1du1sCC8F/9cicai0Z
 M6FFf74e9Q3Jhrdq8AmFdlDLbSaz6TqaobVAK4Ci+izH7H6RJ7QidGcf+wNDu7oRml
 4oxINve8Ffhy1uWipPXezdwx1Koz+64mPVBXmVEQJCSmGlOb+rhHJrFKDwsRqwtiGO
 z/v93fQEiBD3vTCyuZ6ePLPtedp3ztzFZlQBA86lWP0Ya/NgyeKF34+3ayQyj7EwEN
 OpDtRq4cyFhTQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>, "Paul A. Clarke"
 <pc@us.ibm.com>
Subject: Re: [PATCH] perf vendor events power10: Add metric events json file
 for power10 platform
In-Reply-To: <20211007184337.GN10333@gate.crashing.org>
References: <20211006073119.276340-1-kjain@linux.ibm.com>
 <20211006173248.GA7389@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
 <20211007134750.GA243632@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
 <20211007184337.GN10333@gate.crashing.org>
Date: Fri, 08 Oct 2021 16:58:52 +1100
Message-ID: <875yu8njkz.fsf@mpe.ellerman.id.au>
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 Kajol Jain <kjain@linux.ibm.com>, jolsa@redhat.com,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Thu, Oct 07, 2021 at 08:47:50AM -0500, Paul A. Clarke wrote:
>> On Wed, Oct 06, 2021 at 12:32:48PM -0500, Paul A. Clarke wrote:
>> > > +    {
>> > > +        "BriefDescription": "Average cycles per instruction when the instruction finishes at dispatch",
>> > 
>> > I'm not sure what that means.
>> 
>> After doing a bit of research, I think it might be a bit more clear as:
>> "Average cycles per instruction when the NTF instruction finishes at dispatch"
>
> Is "next to finish" some defined and/or sensible term in this context?
> Or do you mean NTC here?  Or what :-)

Yeah I am also more familiar with NTC.

But those descriptions originally come from a spreadsheet we're given,
and they do include NTF as an acronym.

eg. search for NTF in here:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/pmu-events/arch/powerpc/power9/metrics.json

From the context it does presumably mean "next to finish".

cheers
