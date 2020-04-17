Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F322A1AD8B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 10:37:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493Twd2mftzDrbv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 18:37:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=deneb.enyo.de (client-ip=37.24.231.21; helo=albireo.enyo.de;
 envelope-from=fw@deneb.enyo.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=deneb.enyo.de
Received: from albireo.enyo.de (albireo.enyo.de [37.24.231.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493TtV1NGKzDrTy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 18:35:12 +1000 (AEST)
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jPMSf-0008BN-TZ; Fri, 17 Apr 2020 08:34:57 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jPMSf-0006yC-Pp; Fri, 17 Apr 2020 10:34:57 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <87k12gf32r.fsf@mid.deneb.enyo.de>
 <20200416153509.GT11469@brightrain.aerifal.cx>
 <87sgh3e613.fsf@mid.deneb.enyo.de>
 <20200416165257.GY11469@brightrain.aerifal.cx>
 <87ftd3e1vg.fsf@mid.deneb.enyo.de>
 <20200416230235.GG26902@gate.crashing.org>
 <20200417003442.GD11469@brightrain.aerifal.cx>
 <20200417014831.GL26902@gate.crashing.org>
Date: Fri, 17 Apr 2020 10:34:57 +0200
In-Reply-To: <20200417014831.GL26902@gate.crashing.org> (Segher Boessenkool's
 message of "Thu, 16 Apr 2020 20:48:31 -0500")
Message-ID: <87d086cxxq.fsf@mid.deneb.enyo.de>
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
Cc: Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org,
 musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>,
 libc-dev@lists.llvm.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Segher Boessenkool:

> On Thu, Apr 16, 2020 at 08:34:42PM -0400, Rich Felker wrote:
>> On Thu, Apr 16, 2020 at 06:02:35PM -0500, Segher Boessenkool wrote:
>> > On Thu, Apr 16, 2020 at 08:12:19PM +0200, Florian Weimer wrote:
>> > > > I think my choice would be just making the inline syscall be a single
>> > > > call insn to an asm source file that out-of-lines the loading of TOC
>> > > > pointer and call through it or branch based on hwcap so that it's not
>> > > > repeated all over the place.
>> > > 
>> > > I don't know how problematic control flow out of an inline asm is on
>> > > POWER.  But this is basically the -moutline-atomics approach.
>> > 
>> > Control flow out of inline asm (other than with "asm goto") is not
>> > allowed at all, just like on any other target (and will not work in
>> > practice, either -- just like on any other target).  But the suggestion
>> > was to use actual assembler code, not inline asm?
>> 
>> Calling it control flow out of inline asm is something of a misnomer.
>> The enclosing state is not discarded or altered; the asm statement
>> exits normally, reaching the next instruction in the enclosing
>> block/function as soon as the call from the asm statement returns,
>> with all register/clobber constraints satisfied.
>
> Ah.  That should always Just Work, then -- our ABIs guarantee you can.

After thinking about it, I agree: GCC will handle spilling of the link
register.  Branch-and-link instructions do not clobber the protected
zone, so no stack adjustment is needed (which would be problematic to
reflect in the unwind information).

Of course, the target function has to be written in assembler because
it must not use a regular stack frame.
