Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 484A64B953D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 02:08:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzcBn4f3nz3cVh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 12:08:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HCBSH5u2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzcB83Fkkz30Bc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 12:07:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HCBSH5u2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JzcB727G4z4xmx;
 Thu, 17 Feb 2022 12:07:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1645060048;
 bh=M3Ut35phld0+E35GDjG8ZRjDNzhAIehF1tUh4ZZXEOo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HCBSH5u21xyfCsdpzBgz2rms77IGPjV0GHMsEwp0/P/cdudi+g2TINjhmZGqQ8mQ+
 BH4HuXWgMWI8FJ//AQoIi0GOM+6XiOUMDx0wQvxbsWi4VgVOZHOe8ZjuKJzkBlD39I
 0RbRLh0+RaeZjjiCpFUcnQBepW381FuF9mw3G4Jd9kpawrwpGmXH+CAaTpCfktaeU8
 zrmu8JOvrHLaWGAOyYCpm0ibRXMIWWcs2iHJaVdfQDQD8hLzKFN4doU7jTb//iNrjA
 u04e5jSfRYOKQAjPfyLPiFgkP/pVNWAo4mcBfB5ylwgTr0swz59QpWHkL58PhURS5i
 AZ1neQ3L+vPHQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Paul Menzel
 <pmenzel@molgen.mpg.de>
Subject: Re: No Linux logs when doing `ppc64_cpu --smt=off/8`
In-Reply-To: <20220214135657.GM3113@kunlun.suse.cz>
References: <d141d8c3-5c72-02ab-6b31-c32cd02f8291@molgen.mpg.de>
 <20220214094327.GL3113@kunlun.suse.cz>
 <e6701fa9-a51b-3706-5aa5-bb6c7ae76cf0@molgen.mpg.de>
 <20220214135657.GM3113@kunlun.suse.cz>
Date: Thu, 17 Feb 2022 12:07:23 +1100
Message-ID: <87v8xemhbo.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Mon, Feb 14, 2022 at 01:33:24PM +0100, Paul Menzel wrote:
>> Am 14.02.22 um 10:43 schrieb Michal Such=C3=A1nek:
>> > On Mon, Feb 14, 2022 at 07:08:07AM +0100, Paul Menzel wrote:
>> > > On the POWER8 server IBM S822LC running `ppc64_cpu --smt=3Doff` or `=
ppc64_cpu
>> > > --smt=3D8`, Linux 5.17-rc4 does not log anything. I would have expec=
ted a
>> > > message about the change in number of processing units.
>> >=20
>> > IIRC it was considered too noisy for systems with many CPUs and the
>> > message was dropped. You can always check the resulting state with
>> > ppc64_cpu or examining sysfs.

One of the messages was removed because it was potentially buggy:

  ed8029d7b472 ("powerpc/pseries: Stop calling printk in rtas_stop_self()")

We may have removed some other messages, but my grepping skills can't find
anything relevant at the moment.

But in general yes, it used to be far too verbose on large systems.
=20
>> Yes, simple `nproc` suffice, but I was more thinking about, that the Lin=
ux
>> log is often used for debugging and the changes of amount of processing
>> units might be good to have. `ppc64_cpu --smt=3Doff` or `=3D8` seems to =
block
>> for quite some time, and each thread/processing unit seems to powered
>> down/on sequentially, so it takes quite some time and it blocks. So 140
>> messages would indeed be quite noise. No idea how `ppc64_cpu` works, and=
 if
>> it could log a message at the beginning and end.
>
> Yes, it enables/disables threads one by one. AFAICT the kernel cannot kno=
w that
> ppc64_cpu will enable/disable more threads later, it can either log each
> or none. Rate limiting would not show the whole picture so it's not
> great solution either.

Right, ppc64_cpu just uses the sysfs online files, so it's doing them one a=
t a
time. The kernel has no knowledge that ppc64_cpu is turning all
secondaries on/off so there's no easy way for the kernel to do a summary
message.

An easy solution would be for ppc64_cpu to log something via syslog(3).

cheers
