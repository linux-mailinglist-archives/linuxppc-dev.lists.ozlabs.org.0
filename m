Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF18A374EBA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 06:58:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbLtr01FRz30Jw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 14:58:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JA3h4nik;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JA3h4nik; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbLtJ58Qfz2yRS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 14:57:43 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id v191so4217068pfc.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 21:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=NEErII2JPNmwZ0HM+qC85+Da9iM7biQE5PAgq2GlWcs=;
 b=JA3h4nikL5S3GcOofHtGGkkumWS55GMNpSLX3kR/+V2hQ7Csxx9yLw/NMFXfBtt4mr
 J0KNe/BmiTuEuULmIEOIQFGojW+xFqdzxUohljV8OFMJWlPFlEuJlYhjliaEk898Y55q
 IYxBu10dhE3V8WS+zVimLsQ4jOHGHqFVAnw/tRRNJUnWyM6jIv53sDqdppXRNg6h5C83
 yaHSOolDi/4VnsgfV7oZvt/03j/U5xsQoKq8nIbCzmygSaL5/dotB/iK7nyFp8xU+OJK
 ykkLCL2e1XJwio+4lwhLkgsdaKRvQMtIT/rTPmi+f80KBnnCNPAf570+xz/W8dzjUMoB
 VMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=NEErII2JPNmwZ0HM+qC85+Da9iM7biQE5PAgq2GlWcs=;
 b=VMVs/PxoB52z/CDtsHDQds2qRiW4K98+uExiOay10hejWlarBhjJc4IjJYLW+SLmgP
 rAUOzRq9RsgpIa36fHAlhTb3HGtAm2TJmOBfQc/aHdN8wneeS9N7yamRJlgGuLTO/TXN
 PiTpkjESjiYNJlHwibZ25NlD30AdYp1b5r8OPkWI8GyrzHFcOs1SkVYJp7R0EvB5yXlI
 i02uKYBFPe52c+ffVYUxhh839h2q9zQ1PKXrE544ejmaUK6hPdZZ+CNDsrqJVfWFnZpQ
 K7P3lkR4sVBdP8lTIONHVHjv6RDBqHm6ekf8q3Yt/wGdoyNAuUta7SDHe37jGDZ8U2SO
 11kA==
X-Gm-Message-State: AOAM530zM+6blzXDPC4r2HlwNosrangvmosaALzoUXvmHsxZk7dBxv53
 p1k7TxEqUczyL3ZUwxSMDXU=
X-Google-Smtp-Source: ABdhPJz9NL4N4fHdHeuCc9+RFXATcTPpEI3bqGMMAw7XOGgVt24XScWDkVdRIznhxdvFnlT25I9+/g==
X-Received: by 2002:a65:4185:: with SMTP id a5mr2355473pgq.388.1620277060476; 
 Wed, 05 May 2021 21:57:40 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id c6sm8565221pjs.11.2021.05.05.21.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 21:57:40 -0700 (PDT)
Date: Thu, 06 May 2021 14:57:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix conversion to gfn-based MMU
 notifier callbacks
To: Sean Christopherson <seanjc@google.com>
References: <20210505121509.1470207-1-npiggin@gmail.com>
 <YJK/KDCV5CvTNhoo@google.com>
In-Reply-To: <YJK/KDCV5CvTNhoo@google.com>
MIME-Version: 1.0
Message-Id: <1620276952.ug51qrzrc1.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: kvm@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Sean Christopherson's message of May 6, 2021 1:52 am:
> On Wed, May 05, 2021, Nicholas Piggin wrote:
>> Commit b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU notifier
>> callbacks") causes unmap_gfn_range and age_gfn callbacks to only work
>> on the first gfn in the range. It also makes the aging callbacks call
>> into both radix and hash aging functions for radix guests. Fix this.
>=20
> Ugh, the rest of kvm_handle_hva_range() was so similar to the x86 code th=
at I
> glossed right over the for-loop.  My apologies :-/

No problem, we should have noticed it here in testing earlier too.

>=20
>> Add warnings for the single-gfn calls that have been converted to range
>> callbacks, in case they ever receieve ranges greater than 1.
>>=20
>> Fixes: b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU notifier ca=
llbacks")
>> Reported-by: Bharata B Rao <bharata@linux.ibm.com>
>> Tested-by: Bharata B Rao <bharata@linux.ibm.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> The e500 change in that commit also looks suspicious, why is it okay
>> to remove kvm_flush_remote_tlbs() there? Also is the the change from
>> returning false to true intended?
>=20
> The common code interprets a return of "true" as "do kvm_flush_remote_tlb=
s()".
> There is technically a functional change, as the deferring the flush to c=
ommon
> code will batch flushes if the invalidation spans multiple memslots.  But=
 the
> mmu_lock is held the entire time, so batching is a good thing unless e500=
 has
> wildly different MMU semantics.

Ah okay that explains it. That sounds good, but I don't know the e500=20
KVM code or have a way to test it myself.

Thanks,
Nick
