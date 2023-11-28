Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6454E7FBE69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 16:47:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ruUp70sA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sfmzy6GhPz3dT5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 02:47:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ruUp70sA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sfmz51Wykz3cV1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 02:46:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 17CEFCE0FC9;
	Tue, 28 Nov 2023 15:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7B0C433C7;
	Tue, 28 Nov 2023 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701186397;
	bh=liZDpRm33WKKlnUByECstEDbtck2PnC+njmJDlLi4jI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ruUp70sAN7QU5FcHm4DnVECBMMQMxnx9JgQzDhmTW3dOEPwhqZJjtuQ1JwgMVhZLP
	 RotjPm4F09oKd4odOVE98wHUWcw/dgf4bj1/urXatTtVdbbyju/SASa+Tug/Yf+vRY
	 nfFdu5dJqEP9/fxs3n7jQbQu42HT/aL5c8rgtTk7ImZiDGT0sRds6+C9u7Wytnf5NR
	 5oznx9ZDC9UTWDbVp0783FHex5pzE6Mko23JZDPtB3FRcEhTo1Z6U+vg7gz2fXPh6a
	 S4MW8M8GMCsFaBsq6zXPco7QatkNxHwpAEnl8f0RIEe6N1gVCobbKgueEv3MxwNgrh
	 Q5zjvX8LMKoPg==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Nathan Lynch <nathanl@linux.ibm.com>,
	Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 06/13] powerpc/rtas: Serialize firmware activation
 sequences
In-Reply-To: <87zfyx28rf.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-6-b794d8cb8502@linux.ibm.com>
 <874jhglu6x.fsf@kernel.org>
 <87zfyx28rf.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Date: Tue, 28 Nov 2023 21:16:30 +0530
Message-ID: <875y1lev8p.fsf@kernel.org>
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
Cc: tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:

> "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org> writes:
>> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
>> writes:
>>
>>>
>>> Use the function lock API to prevent interleaving call sequences of
>>> the ibm,activate-firmware RTAS function, which typically requires
>>> multiple calls to complete the update. While the spec does not
>>> specifically prohibit interleaved sequences, there's almost certainly
>>> no advantage to allowing them.
>>>
>>
>> Can we document what is the equivalent thing the userspace does?
>
> I'm not sure what we would document.
>
> As best I can tell, the activate_firmware command in powerpc-utils does
> not make any effort to protect its use of the ibm,activate-firmware RTAS
> function. The command is not intended to be run manually and I guess
> it's relying on the platform's management console to serialize its
> invocations.
>
> drmgr (also from powerpc-utils) has some dead code for LPM that calls
> ibm,activate-firmware; it should probably be removed. The command uses a
> lock file to serialize all of its executions.
>
> Something that could happen with interleaved ibm,activate-firmware
> sequences is something like this:
>
> 1. Process A initiates an ibm,activate-firmware sequence and receives a
>    "retry" status (-2/990x).
> 2. Process B calls ibm,activate-firmware and receives the "done" status
>    (0), concluding the sequence A began.
> 3. Process A, unaware of B, calls ibm,activate-firmware again,
>    inadvertently beginning a new sequence.
>

So this patch won't protect us against a parallel userspace invocation.
We can add static bool call_in_progress to track the ongoing
ibm,activate-firmware call from userspace? My only concern is we are
adding locks to protect against parallel calls in the kernel, but at the
same time, we ignore any userspace call regarding the same. We should at
least document this if this is not important to be fixed.

-aneesh
