Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2B74551A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 01:27:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hvgbv2mNSz3bfv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 11:27:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f+rNfOby;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvgbC0cV6z2yHX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 11:26:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=f+rNfOby; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hvgb94TTSz4xbs;
 Thu, 18 Nov 2021 11:26:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637195206;
 bh=5c5t52y306hykkkeadxMkH5/WAhykSrlMvplZJ1hGVI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=f+rNfObyfxi6i6EdF3TUKJx/A4F/z+Gl4p/ZZ+chMsmMhze9AYnYQgZnthgqcWyg1
 mSk7ecobUoIgOzYZ65Wr+TIjrz9CRuIRSPssxx9yahPE0DSoAscNE0auufSbNJZDIZ
 gZRhWTdkViaX+Qx9iUcMhHsHeAFc/HD9PMKVr5Unt0sPkx1pHwXGNpVsLTAJGIg0tW
 adSrO105dXGhnLN8/gWd5IqsA2HK3ubMTa62U6br6soAiE6028lQ1vtbNL7oBE+jAt
 P0KeyZ7LuVtsgenCalxFXtKazQFckyYprSrdn8Wb9xczKAkYtPOR6qyufp+4q+bx6i
 Z4WtQaH+Sb8uw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: delete scanlog
In-Reply-To: <87mtm2j0tz.fsf@linux.ibm.com>
References: <20210920173203.1800475-1-nathanl@linux.ibm.com>
 <87sfvvijjw.fsf@linux.ibm.com> <877dd7m5jd.fsf@mpe.ellerman.id.au>
 <87mtm2j0tz.fsf@linux.ibm.com>
Date: Thu, 18 Nov 2021 11:26:43 +1100
Message-ID: <87y25ml35o.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>>> Remove the pseries scanlog driver.
>>>>
>>>> This code supports functions from Power4-era servers that are not pres=
ent
>>>> on targets currently supported by arch/powerpc. System manuals from th=
is
>>>> time have this description:
>>>>
>>>>   Scan Dump data is a set of chip data that the service processor gath=
ers
>>>>   after a system malfunction. It consists of chip scan rings, chip tra=
ce
>>>>   arrays, and Scan COM (SCOM) registers. This data is stored in the
>>>>   scan-log partition of the system=E2=80=99s Nonvolatile Random Access
>>>>   Memory (NVRAM).
>>>>
>>>> PowerVM partition firmware development doesn't recognize the associated
>>>> function call or property, and they don't see any references to them in
>>>> their codebase. It seems to have been specific to non-virtualized
>>>> pseries.
>>>
>>> Just bumping this to see if there are any objections.
>>
>> Not an objection, I like nothing better than dropping old unused cruft,
>> but are we sure it's safe to remove the proc file?
>>
>> I see that rtas_errd still looks for it, have you checked that it will
>> handle the absence of the file gracefully and continue doing whatever
>> else it does?
>
> Uhh. I will stop forgetting to check ppc64_diag when making such
> changes. Thanks for pointing this out.

No worries.

>> On further inspection it looks like the code that looks for it in
>> rtas_errd is #if 0'ed out (??), so maybe it's dead.
>
> Yes it seems so. From rtas_errd's main():
>
> #if 0
> 	/*=20
> 	 * Check to see if a new scanlog dump is available;  if so, copy it to
> 	 * the filesystem and associate the dump with the first error processed.
> 	 */
> 	check_scanlog_dump();
> #endif
>
> And that's the only entry point into the code that collects the scanlog
> data. And that dead code appears to deal with the absence of
> /proc/ppc64/scan-log-dump gracefully. It has been like that since
> initial git import in 2013.

OK, I guess it came from sourceforge before that. But I'm not going to
start digging there, that's long enough ago that it shouldn't matter.

>> Anyway if you can test that rtas_errd still works that'd be good.
>
> I've verified that it starts normally and logs EPOW events associated
> with partition migration.

Awesome.

>> Presumably there's no other code that cares about the proc file.
>
> AFAIK this is right. powerpc-utils and librtas do not use it. librtas
> has a wrapper for the calling the associated RTAS function directly, but
> that's fine.
>
> I tried using GitHub's search to find instances of "scan-log-dump" that
> weren't from Linux or ppc64_diag (need to be logged in I think):
>
> https://github.com/search?q=3D%22scan-log-dump%22+-path%3Aarch%2Fpowerpc+=
-filename%3Ascanlog.c+-extension%3Apatch&type=3DCode&ref=3Dadvsearch&l=3D&l=
=3D
>
> This hasn't yielded any unexpected users. There may be better search
> terms but that's what a few minutes of fiddling with it got me.

I had a look on sourcegraph too, same story, nothing interesting:

  https://sourcegraph.com/search?q=3Dcontext:global+scan-log-dump+NOT+file:=
arch/powerpc/platforms/pseries/scanlog.c+NOT+file:arch/powerpc/kernel/rtas.=
c+NOT+file:arch/ppc64/kernel/scanlog.c+fork:yes+archived:yes&patternType=3D=
literal


So that seems OK to me, I'll pick this up.

cheers
