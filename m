Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB5913E08
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2024 22:21:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZCw1rxvT;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5QXfW4N+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6jDY5SMHz3cWS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 06:21:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZCw1rxvT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5QXfW4N+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 359 seconds by postgrey-1.37 at boromir; Mon, 24 Jun 2024 06:21:12 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6jCr513Vz30VF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 06:21:12 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1719173691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KrIQQKdEMsIMapJpoUVOGPyFQNogkWNt13z5mBEumyw=;
	b=ZCw1rxvTdPa3WQOv8NbvOVrKO2zYENwn78OMJxz2u0Mu8ABx19xFXpA80E9TxRQh7zNr+m
	sYTZOjyU1GFSKt+GgR0QUc9UmdL+gEy46YTUgU8TGL6uPLLA8IzlNsvBCX4/6GRNPJ2wVP
	DN45M1hW1CGDH9Fol+1IdwcfCpeu3sQtQ6BF+79vGk0UchaGN84Im2egQ8zQjtd/qb5D0m
	vT1SclpEwYd0QZ0iLof7W0WkozeHarSl8LHX1WHgjJtA0FeKFC/VAvelfX3+LBre/5WiWp
	o4wFDP/Ih8ZQPMalva/u2VmkKIkvTcwaGH678dFiY8yqwTGqCibsYDhkoSIVHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1719173691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KrIQQKdEMsIMapJpoUVOGPyFQNogkWNt13z5mBEumyw=;
	b=5QXfW4N+7tXqdvaO0xlCE/I+T5ff1eBhFKQ/Wv5RvN8L8oaqVfBawylEakVVte+JTVjBev
	QYsV3aX1NVTIhVBg==
To: Michael Ellerman <mpe@ellerman.id.au>, "Nysal Jan K.A."
 <nysal@linux.ibm.com>
Subject: Re: [PATCH 0/2] Skip offline cores when enabling SMT on PowerPC
In-Reply-To: <875xudoz4d.fsf@mail.lhotse>
References: <20240612185046.1826891-1-nysal@linux.ibm.com>
 <875xudoz4d.fsf@mail.lhotse>
Date: Sun, 23 Jun 2024 22:14:51 +0200
Message-ID: <87ikxza01w.ffs@tglx>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, "Nysal Jan K.A" <nysal@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael!

On Thu, Jun 13 2024 at 21:34, Michael Ellerman wrote:
> IIUIC the regression was in the ppc64_cpu userspace tool, which switched
> to using the new kernel interface without taking into account the way it
> behaves.
>
> Or are you saying the kernel behaviour changed on x86 after the powerpc
> HOTPLUG_SMT was added?

No. The mechanism was always this way. Only offline nodes have been
skipped. x86 never checked for the core being online.

> It's only x86 and powerpc right?
>
> Having different behaviour on the only two arches that support the
> interface does not seem like a good result.
>
>> What is the expected behaviour on x86 when enabling SMT and certain cores
>> are offline? 
>
> AFAIK no one really touches SMT on x86 other than to turn it off for
> security reasons.

Right. So changing it not to online a thread when the full core is
offline should not really break stuff.

OTH, the mechanism to figure that out on x86 is definitely different and
more complicated than on power because the sibling threads are not
having consecutive CPU numbers.

So I'm not sure whether it's worth to make this consistent and I
definitely can live with the proposed patches.

Thanks,

        tglx
