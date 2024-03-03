Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4D86F4AA
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Mar 2024 13:03:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HQs1u3HZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TngSx4WzCz3dSn
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Mar 2024 23:03:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HQs1u3HZ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TngS94Knjz3cN9
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Mar 2024 23:02:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709467353;
	bh=qgsl/sTSvOxR8Cp/PtT7K82Ls/aiH3P678MkD5GzLZ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HQs1u3HZ6vX0HmLsVTYp+sYCGRVuUCg+yEoPtJfuW5AXhzW/cRR4GboPQ4Lx4RIad
	 bH7KQjs5qC5BQn4co0x2WLv87aG6titvIiPQXZHT5nIol0tOn4VE6Fqb2z7Ppk004s
	 66Y8G7FqYtEjVWVUWA0uH2sk+c0+BBDnxvrbWB4QVLVhvaSRdoYFGA7aP++CCECpUA
	 JvMMRW+iPsN15HsscbZZezXCZskbrS4uic2OWEXBSstA5mBGkr+u137NxRpEWAwgTU
	 aBc/aLTBrDXYPnHt/aoGYw4pcgcUjkeZV9ky8KOefq77nJZd4F3S/qpnnRE5emvM2C
	 IvHusXVduRfXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TngS918JSz4wc6;
	Sun,  3 Mar 2024 23:02:32 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal Hocko <mhocko@suse.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: CVE-2023-52451: powerpc/pseries/memhp: Fix access beyond end of
 drmem array
In-Reply-To: <Zd2imtvvKrHY9LAA@tiehlicka>
References: <2024022257-CVE-2023-52451-7bdb@gregkh>
 <Zdylmz28rZ-mCeiN@tiehlicka> <2024022639-wronged-grafted-6777@gregkh>
 <ZdytVTOgfvKBBvtn@tiehlicka> <2024022652-defective-fretful-3d13@gregkh>
 <Zdy-KbmSt0egNV3c@tiehlicka> <2024022750-treble-wish-b009@gregkh>
 <Zd2imtvvKrHY9LAA@tiehlicka>
Date: Sun, 03 Mar 2024 23:02:31 +1100
Message-ID: <87a5nffrqg.fsf@mail.lhotse>
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
Cc: cve@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Hocko <mhocko@suse.com> writes:
> [Let me add Michael as PPC maintainer - the thread starts with
> http://lkml.kernel.org/r/2024022257-CVE-2023-52451-7bdb@gregkh]

Sorry just saw this ...

> On Tue 27-02-24 06:14:45, Greg KH wrote:
>> On Mon, Feb 26, 2024 at 05:36:57PM +0100, Michal Hocko wrote:
> [...]
>> > All that being said I dispute the issue fixed here has any more security
>> > relevance than allowing untrusted user to control memory hotplug which
>> > could easily result in DoS of the system.
>> 
>> Ok, I traced this call back, and here is the callpath, starting with a
>> write to the the 'dlpar' sysfs file (conviently NOT documented in
>> Documentation/ABI, and it looks like it violates the "one value per
>> file" rule...)
>> 	dlpar_store()
>> 	handle_dlpar_errorlog()
>> 	dlpar_memory()
>> 	dlpar_memory_remove_by_index()
>> 
>> Yes, the kernel by default sets 'dlpar' to 0644, BUT that means that
>> root in a container can cause this use-after-free to happen, or if the
>> permissions are changed by userspace, or if you are in "lockdown mode",
>> or if you want to attempt the crazy "confidential computing" model, or
>> if you have a system which root is possible for some things by normal
>> users (there are lots of different security models out there...)
>
> This is all nice but please do realize that if you allow access to to
> memory hotremove to any untrusted entity (be it a root in container or
> by changing access permissions) then the machine is in a serious
> resource management control trouble already and that is a security
> threat already.

The standard container runtimes, eg. podman/docker, will mount /sys as
read-only by default. So at least in typical situations root in a
container will not be able to trigger this issue.

>> Yes, I will argue that making the sysfs file writable by userspace is
>> out of our control, but what is in our control is the fact that there is
>> a out-of-bounds write that is fixed here, and we don't want those to be
>> able to be triggered by anyone as that is a weakness in our codebase.
>
> Yes, and that is why the fix is good and nobody disputes that. What I am
> actually trying to drill down to is whether this is an actual security
> threat worth assigning a CVE or it is just yet-anothing-pointless-CVE we
> were so used to with the old process.
>
>> That is what has caused the CVE to be created here, not the fact that
>> root can remove memory as that's the normal expected operation to have
>> happen here.
>>
>> However if the maintainer of the code here disputes this, we are more
>> than willing to mark this invalid and reject the CVE.
>
> Michael, do you see any real security risk being addressed by
> bd68ffce69f6 ("powerpc/pseries/memhp: Fix access beyond end of drmem
> array").

No I don't think this bug on its own is a "real" security risk.

It allows root to print 8 bytes of kernel memory it's not supposed to,
but there's no way for the attacker to control what 8 bytes. So I doubt
that's actually useful for constructing an exploit.

But as Kees explained elsewhere, a CVE can be for any weakness, not just
actual vulnerabilties.

So under that definition I'm quite happy for this to be given a CVE.

cheers
