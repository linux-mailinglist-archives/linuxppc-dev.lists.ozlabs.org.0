Return-Path: <linuxppc-dev+bounces-14485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D84B0C85D6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 16:51:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dG6d11h80z2yFW;
	Wed, 26 Nov 2025 02:51:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764085909;
	cv=none; b=SM1PxoSpilIu/cTtn3k1fE7v848kVvHKcB2WoX+gMBM4mm6VIvGcQub7pqNT9Whgk6TSZgbicYNWg1gESISmA8l/wTu7gTUNdp6KezZ66y6CcNrdCLmBixZuvLVF4tOV8yuSMY75/5W7kaG0uTUgEZgzv4fe9G20AlgBf2NllHH4BRbu9cTwM4yMxEGYueZeXOzqMLuhHl45Kl4bQe86fQ8jLAbHUmc4Seg8yRvIk5fRlcHPvHo6MZ9zZGVxnlZNphoh4gvSmLj96VkrfkkoblCvBqt3V3CaLIWDo3eqv0XZEiHlNK/93l2GXEZ1d2eh1W61wTfBSjaYKYj4HZPHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764085909; c=relaxed/relaxed;
	bh=wM07m2/nPQw9koEwooqtmdW+7keaf2b0EdhYswO2eCo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zs2aO1WttdfB8GFHmKoC9kVO3ULrGwmasA6Y1QWm4KBo3JpEsuAuGeUE0sOcfI/PQHsShGeMdv9HQXGrUu+Czp2tHqApx0otBMakBv6lJXliKnUAfzmbaQp+CeZRNo+cHSaVnI/7TG0cwtjc5o2yD0kp5k/x/K6qO1dXq8LLgQkQmDZbOkjBdSDV5FNguEHQAFY0A7I4sqarJ0UVbBSDa8HHQMuE3UYFJY3jJD2zU6y8eBXgE9rs9sBabGExq8X6qRGkb869ftmlL+Os4AHDECjY55t57lddrJJQHhOOwOIXIx8MZjATbS3IAxGQjO+g5T0gGUuCq77r/J6VPHmQzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=216.40.44.11; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org) smtp.mailfrom=goodmis.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=goodmis.org (client-ip=216.40.44.11; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org)
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dG6cz5Vj6z2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 02:51:46 +1100 (AEDT)
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 9910E160255;
	Tue, 25 Nov 2025 15:51:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 847991A;
	Tue, 25 Nov 2025 15:51:36 +0000 (UTC)
Date: Tue, 25 Nov 2025 10:52:18 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
 yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
 pbonzini@redhat.com, seanjc@google.com, kprateek.nayak@amd.com,
 vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
 dietmar.eggemann@arm.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 16/17] sysfs: Provide write method for paravirt
Message-ID: <20251125105218.4a1e02ad@gandalf.local.home>
In-Reply-To: <e20dee2b-4876-4181-8b45-dc73b61e3202@linux.ibm.com>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
	<20251119124449.1149616-17-sshegde@linux.ibm.com>
	<2025112409-rockstar-shortcake-1892@gregkh>
	<20251124122459.00e86457@gandalf.local.home>
	<e20dee2b-4876-4181-8b45-dc73b61e3202@linux.ibm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 3w1k9cj453gms59zo6acwh84jmz3x3xt
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 847991A
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18vKqSwXHiifm+LzwJIE/LNyT+yqGBGavU=
X-HE-Tag: 1764085896-39560
X-HE-Meta: U2FsdGVkX1+aJdcNXT2FPGLUIAUeiWFuMICDtO+Uu52qKbWo787Nnzlwsjkf5IdvKeMtEiiOwCxOotXLI+7o4rbFOjspiYF+9/cMaxnA+4pxXX3ZbQSmBhOu9MUqMfpF/SRfp9qe58MrlSRjjtfWxNMvpjyFTD2psylv65qXd5GjdOcpmE9khFeGKZ8NBBmLUe714oRrqTNBBe1BV8C5E7L+9qxT+G2JGEr2n9gmp3VmPBlfTLFR/MZA20gi24x8ZsGBj1xQAjQCwlvdzDEX3L8vQIahZVlwgnn9PNx+ST+MtcMjiv6aACouvL/nGbs/U8zkLSiG4N1wUKcWKKRDkR5tT6A+HxCf
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 25 Nov 2025 08:19:45 +0530
Shrikanth Hegde <sshegde@linux.ibm.com> wrote:

> >    [PATCH 16/17][DO NOT APPLY!!!] sysfs: Provide write method for paravirt
> > 
> > in order to make it stand out, and not a footnote after the tags.
> > 
> > -- Steve
> >   
> 
> I can follow this.
> 
> PS: I was skeptical after last series mistake.

You may also want remove the [ ] and use '--' instead:

  [PATCH 16/17] -- DO NOT APPLY!!! -- sysfs: Provide write method for paravirt

Because if someone were to do a b4 pull it would strip out the text within
the brackets. Using -- DO NOT APPLY!!! -- instead, would keep it in the
commit message. And then seeing that in the shortlog would be a really big
red flag ;-)

-- Steve

PS. I plan on changing my usages to use '--' instead of '[' ']'

