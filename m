Return-Path: <linuxppc-dev+bounces-2653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 425749B3BA5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 21:31:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XclRL6stsz2xjQ;
	Tue, 29 Oct 2024 07:31:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730147502;
	cv=none; b=hFkQMSNj7VQWtbuMh3ScMNx8Qr3fTz6+1kQ8lZFVtvGW9C+EEcv/x1rEHxtpDkipajysE9u6yNhjHZGA5tw0JQbaZJMSVtefp//NWh3TfsGChn8xTEFIhpr25yXQhj9/7pZYOzftAo2wevYMeGviKFJAcPTNCOjE1IrdVJutv+vrmjFZk3id0COLmoOYvTBLfu+NsMLzJ1YKh1tsfJz/8/ECpu0yl4ji+n7orgBJXuChaWEKzXKYMBJflp+1AQxPc53WgVcIJvSF1vdaj7xdHQyNF/9YfpsDnGYm0OpvK+ZYPq72SneXA/uwfs5/GuQiql/LhY9fN0CYV+ffNixgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730147502; c=relaxed/relaxed;
	bh=An75GVegrI8NPvgSd/v10fA74PDEyFK0dBpJmwNLNss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXlsyQw5E1xSJNrhjV/r1XNzM3NsweyLt2CE77TICcEJP0pT5Vs/Q5tSJge+xQe4DGjvoR/NdfUTSB8MTb7x12uKHxE45mXLxMblHYpJ+rV6hcgc6WOdGLQwHyGyrqCKlqsFOzxGaTcTA3TdYHml/hUSmyaihmMa67uHy42DnprRI4G/xQJT0aNr/cfFz8IQ4hpGVBxcLBTR4x63NRf2KwyTP9ihrWqI10tNQsvpQnJ5CyMYup9ARVp+Cr8s2i487/zY47a0EG3qI4bsqBu/yVJzvZ/iWmyz8f7Atpvlmv04ua44k2QYLDC9n2iwC7fdLgdfpW9ttdz465qB2MsyTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name; dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=enu7oobt; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZO1oheY8; dkim-atps=neutral; spf=pass (client-ip=103.168.172.151; helo=fout-a8-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org) smtp.mailfrom=shutemov.name
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=enu7oobt;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZO1oheY8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shutemov.name (client-ip=103.168.172.151; helo=fout-a8-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XclRH27DBz2xBx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 07:31:38 +1100 (AEDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id EC20E13801BB;
	Mon, 28 Oct 2024 16:31:35 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 28 Oct 2024 16:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1730147495; x=
	1730233895; bh=An75GVegrI8NPvgSd/v10fA74PDEyFK0dBpJmwNLNss=; b=e
	nu7oobtSV36ckIVsIu0Gvab7458iU8Uyrj8EiW92iPzL+oy5+TDT5TsKbGAsI0pZ
	+kL308HyyRRnFx5/xZh+XegBZpiAM1dELrsbKYM9H9YAxzv3SDc4b84Yj6W8SHtM
	xn7IfOebe6KNK79M5klYkzKNSl7y6oq1QiyOQFl8nBX+a2YONIOY44VWo35rvx1a
	YJabkQIxPj6KMIQNAVczcOKO0NoDGUuOMQ1kIg8b0qZVgPsf15970IoVF/h8WIqw
	z3LIepE/03CUoauxX3ITHSNcCagI/EQE11KuIwtW3bTPWZNbUWJ/Bs3iuyM0V5O/
	CV4vP5eiKNfoiG3ybb3Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1730147495; x=1730233895; bh=An75GVegrI8NPvgSd/v10fA74PDE
	yFK0dBpJmwNLNss=; b=ZO1oheY8zFQVIO+KKg3tvz/NLIt5cgW9CRTccLnehpN5
	/daufVCoMDCDpz6qUq5lI3OZYn20UJ8920BUpklqQ/p777UEVtPFMAJelmc8IlAA
	Y8Kt/k3SpL7oOHv7hyTnL4+HvpZ7xIf2YmLl/OPD9l23z7fKZLxpTr65oOw5DfbV
	hbnn5Bkt/AtV4f5mvfhSGTWKvMiHqAKpUC57voQIimH3SiaN4BiB1H2+qk8AKTJU
	Qee9Xs4GHhRgxPENKBneVTefBhCl0BUnLs+llRC5p9WiulfHvADaROgq92rkvYsK
	sLlbpIecXDvPvNwuL/V/JkQbg4ikla08ZmtvL5tnuw==
X-ME-Sender: <xms:pvQfZ37oKiifkcOrUxguPuf_MRCutfd7fNEFPsnJNqd3qR9GTigSQQ>
    <xme:pvQfZ85NRIdV2mBVQcTtr0QbooTI3iLIFBjHt0vq6KyJ0L6GRp15we5_80Q-BC1JQ
    sazD7W6IHxPfdchWXE>
X-ME-Received: <xmr:pvQfZ-eMREvZAtnSenAydw1XSj551hKTFwQvtd7cwi_uC_Qj2oQqhhHGSndDnF_ZXLsq1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejledgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdfstddttddv
    necuhfhrohhmpedfmfhirhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllh
    esshhhuhhtvghmohhvrdhnrghmvgeqnecuggftrfgrthhtvghrnhepffdvveeuteduhffh
    ffevlefhteefveevkeelveejudduvedvuddvleetudevhfeknecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhho
    vhdrnhgrmhgvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdp
    rhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtg
    hpthhtohepjhhpohhimhgsohgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeei
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrd
    guvgdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehpvghtvghr
    iiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehprgifrghnrdhkuhhmrghrrd
    hguhhpthgrsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhonhhgmhgr
    nhesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:pvQfZ4L0nh6_7E0Pxam5g97tHcE7bL5PBw5SK5CcThOI7qd5VFC_JQ>
    <xmx:pvQfZ7KrdjniO8_RUW8Yo1U3pfyMYGQ3RxtNzEqO5jScag2vY845BQ>
    <xmx:pvQfZxyjxzqdTbtj6GZi1Gej-sCGeC7GtIJyB3zuBcD-wHKPplqhuQ>
    <xmx:pvQfZ3Is-Xtjk3utavyr9lABwnwzahLAdDtlAbl2Q6f8-cikbvq8Lw>
    <xmx:p_QfZ9iZFODWhhr6leKBVCLUgeYA1M5_EQv3Ki7SLQDxZ7LxqR8-DVGA>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Oct 2024 16:31:29 -0400 (EDT)
Date: Mon, 28 Oct 2024 22:31:25 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <jor77iq2gudlv2iaflnw7vknvi5z5zswgcho73yq4trbnevnm2@cwnkb76pxtsx>
References: <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <CAHk-=wj8v4BcD7f3pObq1wav_mJO_naisYGg6HQUcphSc-U0zA@mail.gmail.com>
 <CAHk-=wiVE1QCwnP98Hw0GfjrEKiZsvsaqgzC02zJj-BYp4-khg@mail.gmail.com>
 <81444391-9e59-4744-bbf0-2220a3042da6@citrix.com>
 <p6jzuqlphu5va5rroybfmofxaxcveyj6mc724xunzdm6ocwk23@jv7bemzdczg2>
 <CAHk-=wh-PjG_cF7ujBFmG7G6qGL3hzC-6ged+mbSECkp72wHVw@mail.gmail.com>
 <rjjwtpbxal4glznnkp6a65rtbynn3plrrcgwdg2ucaacmjrnqd@5otngejwtuzu>
 <CAHk-=whhLqN9SQ++JbLWbWv+oaWYtwrikbUGD0W7sq=BfasZrw@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whhLqN9SQ++JbLWbWv+oaWYtwrikbUGD0W7sq=BfasZrw@mail.gmail.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 28, 2024 at 08:44:10AM -1000, Linus Torvalds wrote:
> I The *hardware* presumably uses either bit 47/56 because that's the
> actual hardware width of the TLB / cache matching.

It is a guess, right?

The bug makes more sense to me if the bit number depends on the active
paging mode: this bit naturally used for indexing in top level page table.
The mistake is more understandable this way.

> So no. We're not replacing one simple microarchitectural assumption
> (sign bit is sufficient for safety) with another more complicated one
> (bit X is sufficient for safety).

Okay, fair enough.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

