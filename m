Return-Path: <linuxppc-dev+bounces-14486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8DEC85DB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 17:02:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dG6sd0Jyzz2yFW;
	Wed, 26 Nov 2025 03:02:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764086564;
	cv=none; b=ZpbTAHyMsVjVBj9oW4NPyKwn6Dfff0WYOe/o+YYpjALrHDFg/SkKLTJ038G4E7FpN5U699bmUcmKMaNBryssSSmAfzrY2HF0Wtle2J68cF59/DbeAyaH3XWnZRdfiKFbZjsCZLNS6OtRDwNXAY1S55CoDMRAf9RcHGzTjRGV7VfqKZji0mnX+NoMULozuRluI/RVwzpWIslyasS+g4Q60ObtDoVA5pNneAIsFHfEglBfm6WyERUnGEBithGvtxrMqKWF+vR0OOt/EmC+grriCRvFeFMKdjJkJp+p2G9D/qAnT9WKsMhuY6fla++m3S25BLHRvciMlw+eJUxdeWomSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764086564; c=relaxed/relaxed;
	bh=kLqzBHBRZIViZfupkNR1XEVuxSan3wPvA9DhX80YEwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIoCsEI1m6Zomjp6+/0a6ZU/BIeE5k1oLJKuiMQvr7wlFZp+QrJXURqQPhEUnE0yPkITF/li5PDZ2V/mYcVcCdJIuFEX3iYJH9Bs78sAltPgvqzzvMfl20INPFRYn0NiZR/5mnE5khH8DbmYwSnq4G6lJDjRDWbw8ImRV+LYbxFipzsbp0E0AM7cYAAzrx+9S+ZMRbstqjS1vtTUdy5ztXMXk4Ck1Bp9Qt/y9YGVRL3J+VSjkGG6+Gm6ZSm3ZZCTAvt7LZWew7qFB3KkEAC2VIIxf+YI/Z2CD+8YA6qa756Qu1GVY06K81bKCm+AuS71YO8FJkOUZ24xBj+hbLD1gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=AqestlBj; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=AqestlBj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dG6sb2Zhvz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 03:02:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C776442C8;
	Tue, 25 Nov 2025 16:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9312C4CEF1;
	Tue, 25 Nov 2025 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764086560;
	bh=y98Rjj+JDR8pOd29SAXVLJq75oLKL/C8e4WzdtqSZos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AqestlBjzJ4eEIoe6mN9iTG4DLalIGw2lgMRU9xm2STnrHWGqjNHcD+6g7D1aV+uB
	 nrHIAsGL2dIgrFNic4u/mDspYAbRUN6RMDj6gZcJulNTXWd3MHZY6rUtsgAZD3CrXu
	 j6WV63zPw/7UCmTnE3lZlva6KHePZ/0ekr4DYkGA=
Date: Tue, 25 Nov 2025 11:02:38 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com, maddy@linux.ibm.com, 
	srikar@linux.ibm.com, pbonzini@redhat.com, seanjc@google.com, kprateek.nayak@amd.com, 
	vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com, 
	dietmar.eggemann@arm.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 16/17] sysfs: Provide write method for paravirt
Message-ID: <20251125-heavenly-agile-seahorse-161893@lemur>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
 <20251119124449.1149616-17-sshegde@linux.ibm.com>
 <2025112409-rockstar-shortcake-1892@gregkh>
 <20251124122459.00e86457@gandalf.local.home>
 <e20dee2b-4876-4181-8b45-dc73b61e3202@linux.ibm.com>
 <20251125105218.4a1e02ad@gandalf.local.home>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125105218.4a1e02ad@gandalf.local.home>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 25, 2025 at 10:52:18AM -0500, Steven Rostedt wrote:
> You may also want remove the [ ] and use '--' instead:
> 
>   [PATCH 16/17] -- DO NOT APPLY!!! -- sysfs: Provide write method for paravirt
> 
> Because if someone were to do a b4 pull it would strip out the text within
> the brackets. Using -- DO NOT APPLY!!! -- instead, would keep it in the
> commit message. And then seeing that in the shortlog would be a really big
> red flag ;-)

Small correction -- it's git itself that strips all content inside [], not b4
specifically.

-K

