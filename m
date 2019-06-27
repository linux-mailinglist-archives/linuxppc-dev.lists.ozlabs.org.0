Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF34057B15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 07:04:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z79S0rKmzDqZk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 15:04:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z76N3qYGzDqZP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 15:01:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Z76N2RfCz9sCJ;
 Thu, 27 Jun 2019 15:01:48 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Juliet Kim <julietk@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: retry when cpu offline races with
 suspend/migration
In-Reply-To: <5614fafb-43c3-1dca-1853-51ff0940fb74@linux.vnet.ibm.com>
References: <20190621060518.29616-1-nathanl@linux.ibm.com>
 <f3b54ef4394bdbf4887d2185bb951c80@linux.vnet.ibm.com>
 <87h88eucbn.fsf@linux.ibm.com>
 <5a825cec-234a-ee8a-a776-8ba305f9cb26@linux.vnet.ibm.com>
 <877e99ts5f.fsf@linux.ibm.com>
 <5614fafb-43c3-1dca-1853-51ff0940fb74@linux.vnet.ibm.com>
Date: Thu, 27 Jun 2019 15:01:47 +1000
Message-ID: <875zortydg.fsf@concordia.ellerman.id.au>
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
Cc: ego@linux.vnet.ibm.com, mmc <mmc@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Juliet Kim <julietk@linux.vnet.ibm.com> writes:
> On 6/25/19 1:51 PM, Nathan Lynch wrote:
>> Juliet Kim <julietk@linux.vnet.ibm.com> writes:
>>
>>> There's some concern this could retry forever, resulting in live lock.
>> First of all the system will make progress in other areas even if there
>> are repeated retries; we're not indefinitely holding locks or anything
>> like that.
>
> For instance, system admin runs a script that picks and offlines CPUs in a
> loop to keep a certain rate of onlined CPUs for energy saving. If LPM kee=
ps
> putting CPUs back online, that would never finish, and would keepgenerati=
ng
> new offline requests
>
>> Second, Linux checks the H_VASI_STATE result on every retry. If the
>> platform wants to terminate the migration (say, if it imposes a
>> timeout), Linux will abandon it when H_VASI_STATE fails to return
>> H_VASI_SUSPENDING. And it seems incorrect to bail out before that
>> happens, absent hard errors on the Linux side such as allocation
>> failures.
> I confirmed with the PHYP and HMC folks that they wouldn't time out the L=
PM
> request including H_VASI_STATE, so if the LPM retries were unlucky enough=
 to
> encounter repeated CPU offline attempts (maybe some customer code retrying
> that), then the retries could continue indefinitely, or until some manual
> intervention.=C2=A0 And in the mean time, the LPM delay here would cause =
PHYP to
> block other operations.

That sounds like a PHYP bug to me.

cheers
